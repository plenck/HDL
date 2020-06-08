//timothee
module carry_logic_tb ();
  logic i0;
  logic i1;
  logic ci;

  fpga_carry_logic carry_logic (
    .carry_in_i(ci),
    .carry_out_o(),
    .i0_i(i0),
    .i1_i(i1)
  );

  logic [4:0] c_tot   = 0;
  logic [4:0] c_fail  = 0;
  logic [4:0] c_ok    = 0;

  task xpect( input logic expected );
    c_tot += 1;
    if (carry_out_o == expected) begin
      c_ok += 1;
      $display ("test vector %b PASSED ", {i0, i1, ci} );
    end else begin
      c_fail += 1;
      $display ("test vector %b FAILED",  {i0, i1, ci} );
    end
  endtask : xpect

  ////////////////
  //TEST VECTORS//
  ////////////////

  initial begin
    #10 {i0, i1, ci} = 3'b000;  #5 xpect(1'b0);
    #5  {i0, i1, ci} = 3'b001;  #5 xpect(1'b0);

    #5  {i0, i1, ci} = 3'b010;  #5 xpect(1'b0);
    #5  {i0, i1, ci} = 3'b011;  #5 xpect(1'b1);

    #5  {i0, i1, ci} = 3'b100;  #5 xpect(1'b0);
    #5  {i0, i1, ci} = 3'b101;  #5 xpect(1'b1);

    #5  {i0, i1, ci} = 3'b110;  #5 xpect(1'b1);
    #5  {i0, i1, ci} = 3'b111;  #5 xpect(1'b1);

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
