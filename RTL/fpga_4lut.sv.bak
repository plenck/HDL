//written by timothee kocev

module fpga_4lut (
  input   logic [15:0]  config_i,
  input   logic         config_we_i,
  input   logic    	i0_i,
  input   logic    	i1_i,
  input   logic    	i2_i,
  input   logic    	i3_i,
  output  logic         lut_o
  );

  logic [15:0]    data;

  //////////
  //4 LUT //
  //////////
  always_latch begin
    if (config_we_i == 1'b1) begin
      data = config_i;
    end
  end

  always_comb begin
    unique case ({i0_i, i1_i, i2_i, i3_i})
      4'h0 : data[0];
      4'h1 : data[1];
      4'h2 : data[2];
      4'h3 : data[3];
      4'h4 : data[4];
      4'h5 : data[5];
      4'h6 : data[6];
      4'h7 : data[7];
      4'h8 : data[8];
      4'h9 : data[9];
      4'hA : data[10];
      4'hB : data[11];
      4'hC : data[12];
      4'hD : data[13];
      4'hE : data[14];
      4'hF : data[15];
    endcase
  end

endmodule
