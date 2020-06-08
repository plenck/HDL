// Timothee kocev

////////////////////////////////////////
//DFF Clock Enable, asynchronous Reset//
////////////////////////////////////////

module fpga_dffer (
  output logic Q_o,         //registered output
  input  logic E_i,         //clock enable
  input  logic clk_i,       //clock
  input  logic reset_ni,    //asynchronous reset (on low level)
  input  logic D_i          //Data
  );

  always_ff (posedge (clk_i) or negedge(reset_ni)) begin
    if (!reset_ni) begin
      Q_o <= '0;
    end else begin
      casex ( {reset_ni, E_i, D_i} )
        3'b10x : ; //previous Q
        3'b110 : Q_o <= '0;
        3'b111 : Q_o <= 1'b1;
        default:;
      endcase
    end
endmodule
