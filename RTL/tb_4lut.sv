//////////////////////////
//4 LUT MODULE TESTBENCH//
//////////////////////////

module tb_4lut ();
  logic [3:0]   in      = '0    ;
  logic [15:0]  data_in = '0    ;
  logic         data_we = '0    ;
  logic         out             ;

  fpga_4lut lut(
    .config_i     (data_in  ),
    .config_we_i  (data_we  ),
    .lut_i        (in       ),
    .lut_o        (out      )
  );

  task xpect(input logic expected);
    if (out == expected) begin
      $display("test vector %b PASSED", in);
    end else begin
      $display ("test vector %b FAILED", in);
    end
  endtask

  initial begin
          data_we = 1'b0    ;
          data_in = 16'hF0F0;
    #15   data_we = 1'b1    ;
    #5    data_we = 1'b0    ; data_in = '0;

          in      = 4'h0 ;  #1 xpect (1'b0);
    #5    in      = 4'h1 ;  #1 xpect (1'b0);
    #5    in      = 4'h2 ;  #1 xpect (1'b0);
    #5    in      = 4'h3 ;  #1 xpect (1'b0);
    #5    in      = 4'h4 ;  #1 xpect (1'b1);
    #5    in      = 4'h5 ;  #1 xpect (1'b1);
    #5    in      = 4'h6 ;  #1 xpect (1'b1);
    #5    in      = 4'h7 ;  #1 xpect (1'b1);
    #5    in      = 4'h8 ;  #1 xpect (1'b0);
    #5    in      = 4'h9 ;  #1 xpect (1'b0);
    #5    in      = 4'hA ;  #1 xpect (1'b0);
    #5    in      = 4'hB ;  #1 xpect (1'b0);
    #5    in      = 4'hC ;  #1 xpect (1'b1);
    #5    in      = 4'hD ;  #1 xpect (1'b1);
    #5    in      = 4'hE ;  #1 xpect (1'b1);
    #5    in      = 4'hF ;  #1 xpect (1'b1);

          data_in = 16'hABCD ;
    #5    data_we = 1'b1     ;
    #5    data_we = 1'b0     ;  data_in = 16'h0;

  end


endmodule
