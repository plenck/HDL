module lut_verilog (
  data_in_i,
  data_we_i,
  in_i,
  reset_ni,
  out_o
  );
  input [15:0] data_in_i;
  input        data_we_i;
  input [3:0]  in_i;
  input        reset_ni;
  output reg    out_o;

  reg [15:0]    data;

  //////////
  //4 LUT //
  //////////
  always @* begin
    if (!reset_ni) begin
      data <= 16'h0000;
    end else if (data_we_i) begin
      data <= data_in_i;
    end else begin
      out_o = data[in_i];
    end
  end

endmodule
