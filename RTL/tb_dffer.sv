//timothee kocev
module tb_dffer ();

  logic Q_o, E_i, D_i;

  //define clock
  logic clk = 1'b1;
  always #5 clk = ~clk;

  //dffer (dff clock enable, asychronous reset)
  fpga_dffer dffer (
    .Q_o (Q_o), //registered output
    .E_i      (E_i    ), //clock enable
    .clk_i    (clk    ), //clock
    .reset_ni (reset_n), //reset on low level
    .D_i      (D_i    )  //data
  );

  /////////////////////
  //test task routine//
  /////////////////////

  //counters
  logic [4:0] c_tot, [4:0] c_fail, [4:0] c_ok;

  task xpect(input logic Q_o) ;
    if (Q_o == expected) begin
      c_ok    += 1;
      $display ("test vector %b PASSED", {reset_n, E_i, D_i} );
    end else begin
      c_fail  += 1;
      $display ("test vector %b FAILED", {reset_n, E_i, D_i});
    end
  endtask : xpect

  initial begin
        reset_n   = 0;
    #12 reset_n   = 1;
    #3  {reset_n, E_i, D_i} = 3'b111; #10 xpect(1)
    #10 {reset_n, E_i, D_i} = 3'b110; #10 xpect(0)
    #10 {reset_n, E_i, D_i} = 3'b101; #10 xpect(0)
    #10 {reset_n, E_i, D_i} = 3'b111; #10 xpect(1)
    #10 {reset_n, E_i, D_i} = 3'b101; #10 xpect(0)

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
