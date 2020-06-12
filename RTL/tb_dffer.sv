//timothee kocev
module tb_dffer ();

  logic Q_o, E_i, D_i, reset_n;

  //define clock
  logic clk = 1'b1;
  always #5 clk = ~clk;

  //dffer (dff clock enable, asychronous reset)
  fpga_dffer dffer (
      .Q_o    (Q_o  ), //registered output
    .E_i      (E_i  ), //clock enable
    .clk_i    (clk  ), //clock
    .D_i      (D_i  ),  //data
    .reset_ni (reset_n)
  );

  /////////////////////
  //test task routine//
  /////////////////////

  //counters
  logic [4:0] c_tot   = '0 ;
  logic [4:0] c_fail  = '0 ;
  logic [4:0] c_ok    = '0 ;



  task xpect(input logic expected) ;
    c_tot  +=1;
    if (Q_o == expected) begin
      c_ok    += 1;
      $display ("test vector %b PASSED", {E_i, D_i} );
    end else begin
      c_fail  += 1;
      $display ("test vector %b FAILED", {E_i, D_i});
    end
  endtask : xpect

  initial begin
    #5 reset_n     = 1'b1 ;
    #5 reset_n     = 1'b0 ;
    #5 reset_n     = 1'b1 ;

    #10 {E_i, D_i} = 3'b11; #10 xpect(1);
    #10 {E_i, D_i} = 3'b10; #10 xpect(0);
    #10 {E_i, D_i} = 3'b01; #10 xpect(0);
    #10 {E_i, D_i} = 3'b11; #10 xpect(1);
    #10 {E_i, D_i} = 3'b01; #10 xpect(1);

    #5  reset_n     = 1'b0 ;
    #10 reset_n     = 1'b1 ;

    if (c_fail !== 0) begin
      $display( "\n%d VECTORS OUT OF %d FAILED", c_fail, c_tot);
      $display( "%d VECTORS OUT OF %d PASSED", c_ok, c_tot);
      $display( "TEST FAILED");
    end else begin
      $display( "\n%d VECTORS OUT OF %d PASSED", c_ok, c_tot);
      $display( "TEST SUCCESS");
    end
    $finish;
  end
endmodule
