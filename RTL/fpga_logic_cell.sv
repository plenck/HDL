//timothee kocev
module fpga_logic_cell (
  input   logic         reset_ni        , //reset (on low level)
  input   logic         clk_i           , //clock

  //dffer
  input   logic         fcin_i          , //carry logic in
  output  logic         fcout_o         , //carry logic out
  input   logic         dffe_i          , //dff enable

  //LUT
  input   logic [3:0]   lut_i           , // {I0, I1, I2,I3}
  input   logic [15:0]  config_lut_i    , //configuration memory lines
  input   logic         config_lut_we_i , //write enable for configuration

  output  logic         logic_cell_o    , // logic cell output

  //mux ctrl (staticaly defined at configuration)
  input   logic         mux_sync_i      , //synchrone/asychrone
  input   logic         mux_carry_i       //carry in mux
  );

  ///////////////
  //carry logic//
  ///////////////
  fpga_carry_logic carry_logic(
    .i0_i     (lut_i[1]   ),
    .i1_i     (lut_i[2]   ),
    .fcin_i   (fcin_i     ),
    .fcout_o  (fcout_o    )
  );

  logic i3;
  //mux carry_logic
  always_comb begin
    unique case (mux_carry_i )
      1'b0 : i3  = lut_i[3] ;
      1'b1 : i3  = fcin_i   ;
      default:;
    endcase
  end


  ////////
  //LUT //
  ////////
  logic lut_o;

  fpga_4lut lut (
    .config_i     (config_lut_i     ),
    .config_we_i  (config_lut_we_i  ),
    .lut_i        (lut_i            ),
    .lut_o        (lut_o            )
  );

  /////////
  //DFFER//
  /////////
  logic Q_o;

  fpga_dffer  dffer(
    .Q_o      (Q_o      ),
    .E_i      (dffe_i   ),
    .clk_i    (clk_i    ),
    .reset_ni (reset_ni ),
    .D_i      (lut_o    )
  );

  //mux for synchronous/asynchronous behaviour
  always_comb begin
    unique case (mux_sync_i)
      1'b0 : logic_cell_o = Q_o;
      1'b1 : logic_cell_o = lut_o;
      default : ;
    endcase
  end

endmodule
