module fpga_plb (
  input   logic             clk_i           ,
  input   logic             reset_ni        ,

  input   logic             fcin0_i         ,
  output  logic             fcout7_o        ,
  input   logic             dffe_i          ,

  //staticaly defined on startup
  input   wire              plb_mux_sync_i  ,
  input   wire              plb_mux_carry_i ,
  input   wire [7:0] [15:0] plb_config_i    ,
  input   wire              plb_config_we_i ,


  input   wire [7:0] [3:0]  plb_lut_i       ,

  output  logic [7:0]       plb_lcs_o        //output of all LC (logic cells)
);

   logic fcout0_o, fcout1_o, fcout2_o, fcout3_o;
   logic fcout4_o, fcout5_o, fcout6_o;


  fpga_logic_cell lc0 (
    .reset_ni       (reset_ni         ),
    .clk_i          (clk_i            ),

    .fcin_i         (fcin0_i          ),
    .fcout_o        (fcout0_o         ),
    .dffe_i         (dffe_i           ),

    .lut_i          (plb_lut_i[0]     ),
    .config_lut_i   (plb_config_i[0]  ),
    .config_lut_we_i(plb_config_we_i  ),
    .logic_cell_o   (plb_lcs_o[0]     ),

    .mux_sync_i      (plb_mux_sync_i  ), //if == 0 synchrone
    .mux_carry_i     (plb_mux_carry_i )
  );

  fpga_logic_cell lc1 (
    .reset_ni       (reset_ni         ),
    .clk_i          (clk_i            ),

    .fcin_i         (fcout0_o         ),
    .fcout_o        (fcout1_o         ),

    .dffe_i         (dffe_i           ),

    .lut_i          (plb_lut_i[1]     ),
    .config_lut_i   (plb_config_i[1]  ),
    .config_lut_we_i(plb_config_we_i  ),
    .logic_cell_o   (plb_lcs_o[1]     ),

    .mux_sync_i      (plb_mux_sync_i  ), //if == 0 synchrone
    .mux_carry_i     (plb_mux_carry_i )
  );

  fpga_logic_cell lc2 (
    .reset_ni       (reset_ni         ),
    .clk_i          (clk_i            ),

    .fcin_i         (fcout1_o        ),
    .fcout_o        (fcout2_o         ),

    .dffe_i         (dffe_i           ),

    .lut_i          (plb_lut_i[2]     ),
    .config_lut_i   (plb_config_i[2]  ),
    .config_lut_we_i(plb_config_we_i  ),
    .logic_cell_o   (plb_lcs_o[2]     ),

    .mux_sync_i      (plb_mux_sync_i  ), //if == 0 synchrone
    .mux_carry_i     (plb_mux_carry_i )
  );

  fpga_logic_cell lc3 (
    .reset_ni       (reset_ni         ),
    .clk_i          (clk_i            ),

    .fcin_i         (fcout2_o         ),
    .fcout_o        (fcout3_o         ),

    .dffe_i         (dffe_i           ),

    .lut_i          (plb_lut_i[3]     ),
    .config_lut_i   (plb_config_i[3]  ),
    .config_lut_we_i(plb_config_we_i  ),
    .logic_cell_o   (plb_lcs_o[3]     ),

    .mux_sync_i      (plb_mux_sync_i  ), //if == 0 synchrone
    .mux_carry_i     (plb_mux_carry_i )
  );

  fpga_logic_cell lc4 (
    .reset_ni       (reset_ni         ),
    .clk_i          (clk_i            ),

    .fcin_i         (fcout3_o         ),
    .fcout_o        (fcout4_o         ),

    .dffe_i         (dffe_i           ),

    .lut_i          (plb_lut_i[4]     ),
    .config_lut_i   (plb_config_i[4]  ),
    .config_lut_we_i(plb_config_we_i  ),
    .logic_cell_o   (plb_lcs_o[4]     ),

    .mux_sync_i      (plb_mux_sync_i  ), //if == 0 synchrone
    .mux_carry_i     (plb_mux_carry_i )
  );

  fpga_logic_cell lc5 (
    .reset_ni       (reset_ni         ),
    .clk_i          (clk_i            ),

    .fcin_i         (fcout4_o         ),
    .fcout_o        (fcout5_o         ),

    .dffe_i         (dffe_i           ),

    .lut_i          (plb_lut_i[5]     ),
    .config_lut_i   (plb_config_i[5]  ),
    .config_lut_we_i(plb_config_we_i  ),
    .logic_cell_o   (plb_lcs_o[5]     ),

    .mux_sync_i      (plb_mux_sync_i  ), //if == 0 synchrone
    .mux_carry_i     (plb_mux_carry_i )
  );

  fpga_logic_cell lc6 (
    .reset_ni       (reset_ni         ),
    .clk_i          (clk_i            ),

    .fcin_i         (fcout5_o         ),
    .fcout_o        (fcout6_o         ),

    .dffe_i         (dffe_i           ),

    .lut_i          (plb_lut_i[6]     ),
    .config_lut_i   (plb_config_i[6]  ),
    .config_lut_we_i(plb_config_we_i  ),
    .logic_cell_o   (plb_lcs_o[6]     ),

    .mux_sync_i      (plb_mux_sync_i  ), //if == 0 synchrone
    .mux_carry_i     (plb_mux_carry_i )
  );

  fpga_logic_cell lc7 (
    .reset_ni       (reset_ni         ),
    .clk_i          (clk_i            ),

    .fcin_i         (fcout6_o         ),
    .fcout_o        (fcout7_o         ),

    .dffe_i         (dffe_i           ),

    .lut_i          (plb_lut_i[7]     ),
    .config_lut_i   (plb_config_i[7]  ),
    .config_lut_we_i(plb_config_we_i  ),
    .logic_cell_o   (plb_lcs_o[7]     ),

    .mux_sync_i      (plb_mux_sync_i  ), //if == 0 synchrone
    .mux_carry_i     (plb_mux_carry_i )
  );


endmodule
