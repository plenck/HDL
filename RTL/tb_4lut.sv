//////////////////////////
//4 LUT MODULE TESTBENCH//
//////////////////////////

module fpga_4lut_tb ();
  logic         reset_n = 1'b1  ;
  logic         in      = '0    ;
  logic [15:0]  data_in = '0    ;
  logic         data_we = '0    ;

  fpga_4lut lut(
    .reset_ni   (reset_n  ),
    .data_in_i  (data_in  ),
    .data_we_i  (data_we  ),
    .in_i       (in       ),
    .out_o      ()
  );


  initial begin
          data_in = 16'hF0;
    #15   data_we = 1'b1;
    #5    data_we = 1'b0;
    #5    in      = 4'b0000;
    #5    in      = 4'b0001;
    #5    in      = 4'b0010;

    #4    in      = 4'b1111;
  end

endmodule
