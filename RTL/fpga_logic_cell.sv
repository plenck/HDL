//timothee kocev
module logic_cell (
  input   logic       fcin_i        , //carry logic in
  output  logic       fcout_o       , //carry logic out
  input   logic       dffe_i        , //dff enable
  input   logic       reset_ni      , //reset (on low level)
  input   logic       clk_i         , //clock
  input   logic [3:0] lut_i         , // {I0, I1, I2,I3}
  output  logic       logic_cell_o    // logic cell output

  //mux ctrl (staticaly defined at configuration)
  input   logic       mux_sync_i      //synchrone/asychrone
  input   logic       mux_carry       //carry in mux
  );

  ///////////////
  //carry logic//
  ///////////////
  fpga_carry_logic carry_logic(
    .i0_i     (lut_i[1]   ),
    .i1_i     (lut_i[2]   ),
    .fcin_i   (fcin_i     ),
    .reset_ni (reset_ni)  ),
    .fcout_o  (fcout_o    )
  );

  logic i3;
  //mux
  always_comb begin
    unique case (mux_carry )
      1'b0 : i3  = lut_i[3] ;
      1'b1 : i3  = fcin_i   ;
      default:;
    endcase
  end

  ////////
  //LUT //
  ////////
  fpga_4lut lut (

  );

  fpga_dffer  dffer(

  );

  //mux 

endmodule
