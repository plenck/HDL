//written by timothee kocev

module fpga_4lut (
  input   logic [15:0]  data_in_i,
  input   logic         data_we_i,
  input   logic [3:0]   in_i,

  input   logic         reset_ni,

  output  logic         out_o
  );

  logic [15:0]    data;

  //////////
  //4 LUT //
  //////////
  always_comb begin
    if (!reset_ni) begin
      data = '0;
    end else if (data_we_i) begin
      data = data_in_i;
    end else begin
      out_o = data[in_i];
    end
  end

endmodule
