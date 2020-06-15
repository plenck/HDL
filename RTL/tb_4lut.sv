//////////////////////////
//4 LUT MODULE TESTBENCH//
//////////////////////////

module tb_4lut ();
  logic         i0      = '0    ;
  logic         i1      = '0    ;
  logic         i2      = '0    ;
  logic         i3      = '0    ;
  logic [15:0]  data_in = '0    ;
  logic         data_we = '0    ;
  logic         out             ;

  fpga_4lut lut(
    .config_i     (data_in  ),
    .config_we_i  (data_we  ),
    .i0_i         (i0       ),
    .i1_i         (i1       ),
    .i2_i         (i2       ),
    .i3_i         (i3       ),
    .lut_o        (out      )
  );

  task xpect(input logic expected);
    if (out == expected) begin
      $display("test vector %b PASSED", {i0, i1, i2, i3});
    end else begin
      $display ("test vector %b FAILED", {i0, i1, i2, i3});
    end
  endtask

  initial begin
          data_we = 1'b0    ;
          data_in = 16'hF0F0;
    #15   data_we = 1'b1    ;
    #5    data_we = 1'b0    ; data_in = '0;

          {i0, i1, i2, i3} = 4'h0 ;  #1 xpect (1'b0);
    #5    {i0, i1, i2, i3} = 4'h1 ;  #1 xpect (1'b0);
    #5    {i0, i1, i2, i3} = 4'h2 ;  #1 xpect (1'b0);
    #5    {i0, i1, i2, i3} = 4'h3 ;  #1 xpect (1'b0);
    #5    {i0, i1, i2, i3} = 4'h4 ;  #1 xpect (1'b1);
    #5    {i0, i1, i2, i3} = 4'h5 ;  #1 xpect (1'b1);
    #5    {i0, i1, i2, i3} = 4'h6 ;  #1 xpect (1'b1);
    #5    {i0, i1, i2, i3} = 4'h7 ;  #1 xpect (1'b1);
    #5    {i0, i1, i2, i3} = 4'h8 ;  #1 xpect (1'b0);
    #5    {i0, i1, i2, i3} = 4'h9 ;  #1 xpect (1'b0);
    #5    {i0, i1, i2, i3} = 4'hA ;  #1 xpect (1'b0);
    #5    {i0, i1, i2, i3} = 4'hB ;  #1 xpect (1'b0);
    #5    {i0, i1, i2, i3} = 4'hC ;  #1 xpect (1'b1);
    #5    {i0, i1, i2, i3} = 4'hD ;  #1 xpect (1'b1);
    #5    {i0, i1, i2, i3} = 4'hE ;  #1 xpect (1'b1);
    #5    {i0, i1, i2, i3} = 4'hF ;  #1 xpect (1'b1);

          data_in = 16'hABCD ;
    #5    data_we = 1'b1     ;
    #5    data_we = 1'b0     ;  data_in = 16'h0;

  end


endmodule
