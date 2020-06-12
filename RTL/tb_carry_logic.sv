//timothee
module tb_carry_logic ();
  logic i0;
  logic i1;
  logic fcin;
  logic fcout;

  fpga_carry_logic carry_logic (
    .fcin_i   (fcin   ),
    .fcout_o  (fcout  ),
    .i0_i     (i0     ),
    .i1_i     (i1     )
  );

  logic [4:0] c_tot   = 0;
  logic [4:0] c_fail  = 0;
  logic [4:0] c_ok    = 0;

  task xpect( input logic expected );
    c_tot += 1;
    if (fcout == expected) begin
      c_ok += 1;
      $display ("test vector %b PASSED ", {i0, i1, fcin} );
    end else begin
      c_fail += 1;
      $display ("test vector %b FAILED",  {i0, i1, fcin} );
    end
  endtask : xpect

  ////////////////
  //TEST VECTORS//
  ////////////////

  initial begin
    #10 {i0, i1, fcin} = 3'b000;  #5 xpect(1'b0);
    #5  {i0, i1, fcin} = 3'b001;  #5 xpect(1'b0);

    #5  {i0, i1, fcin} = 3'b010;  #5 xpect(1'b0);
    #5  {i0, i1, fcin} = 3'b011;  #5 xpect(1'b1);

    #5  {i0, i1, fcin} = 3'b100;  #5 xpect(1'b0);
    #5  {i0, i1, fcin} = 3'b101;  #5 xpect(1'b1);

    #5  {i0, i1, fcin} = 3'b110;  #5 xpect(1'b1);
    #5  {i0, i1, fcin} = 3'b111;  #5 xpect(1'b1);
    
    #5  {i0, i1, fcin} = 3'b00x;  #5 xpect(1'b0);
    #5  {i0, i1, fcin} = 3'b1x1;  #5 xpect(1'b1);

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
