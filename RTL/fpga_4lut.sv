//written by timothee kocev

module fpga_4lut (
  input   logic [15:0]  config_i,
  input   logic         config_we_i,
  input   logic [3:0]   lut_i,

  output  logic         lut_o
  );

  logic [15:0]    data;

  //////////
  //4 LUT //
  //////////
  always_comb begin
    if (config_we_i == 1'b1) begin
      data = config_i;
    end
    lut_o = data[lut_i];
  end

endmodule
