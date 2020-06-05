
module fpga_4lut ( data_in_i, data_we_i, in_i, reset_ni, out_o );
  input [15:0] data_in_i;
  input [3:0] in_i;
  input data_we_i, reset_ni;
  output out_o;
  wire   N1, N2, N3, N4, N8, N9, N10, N11, N12, N13, N14, N15, N16, N17, N18,
         N19, N20, N21, N22, N23, N24, N25, N26, n28, n29, n30, n31, n32, n33,
         n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46;
  wire   [15:0] data;
  assign N1 = in_i[0];
  assign N2 = in_i[1];
  assign N3 = in_i[2];
  assign N4 = in_i[3];

  C12T28SOI_LL_LDHQX8_P0 \data_reg[12]  ( .G(N9), .D(N22), .Q(data[12]) );
  C12T28SOI_LL_LDHQX8_P0 \data_reg[8]  ( .G(N9), .D(N18), .Q(data[8]) );
  C12T28SOI_LL_LDHQX8_P0 \data_reg[4]  ( .G(N9), .D(N14), .Q(data[4]) );
  C12T28SOI_LL_LDHQX8_P0 \data_reg[0]  ( .G(N9), .D(N10), .Q(data[0]) );
  C12T28SOI_LL_LDHQX8_P0 \data_reg[14]  ( .G(N9), .D(N24), .Q(data[14]) );
  C12T28SOI_LL_LDHQX8_P0 \data_reg[10]  ( .G(N9), .D(N20), .Q(data[10]) );
  C12T28SOI_LL_LDHQX8_P0 \data_reg[6]  ( .G(N9), .D(N16), .Q(data[6]) );
  C12T28SOI_LL_LDHQX8_P0 \data_reg[2]  ( .G(N9), .D(N12), .Q(data[2]) );
  C12T28SOI_LL_LDHQX8_P0 \data_reg[15]  ( .G(N9), .D(N25), .Q(data[15]) );
  C12T28SOI_LL_LDHQX8_P0 \data_reg[11]  ( .G(N9), .D(N21), .Q(data[11]) );
  C12T28SOI_LL_LDHQX8_P0 \data_reg[7]  ( .G(N9), .D(N17), .Q(data[7]) );
  C12T28SOI_LL_LDHQX8_P0 \data_reg[3]  ( .G(N9), .D(N13), .Q(data[3]) );
  C12T28SOI_LL_LDHQX8_P0 \data_reg[13]  ( .G(N9), .D(N23), .Q(data[13]) );
  C12T28SOI_LL_LDHQX8_P0 \data_reg[9]  ( .G(N9), .D(N19), .Q(data[9]) );
  C12T28SOI_LL_LDHQX8_P0 \data_reg[5]  ( .G(N9), .D(N15), .Q(data[5]) );
  C12T28SOI_LL_LDHQX8_P0 \data_reg[1]  ( .G(N9), .D(N11), .Q(data[1]) );
  C12T28SOI_LL_LDHQX8_P0 out_o_reg ( .G(N26), .D(N8), .Q(out_o) );
  C12T28SOI_LL_NAND2X3_P0 U56 ( .A(reset_ni), .B(n28), .Z(N9) );
  C12T28SOI_LL_MUX41X8_P0 U57 ( .D0(n29), .D1(n30), .D2(n31), .D3(n32), .S0(N4), .S1(N3), .Z(N8) );
  C12T28SOI_LL_NOR2X3_P0 U58 ( .A(n33), .B(n34), .Z(n32) );
  C12T28SOI_LL_OAI22X5_P0 U59 ( .A(data[15]), .B(n35), .C(data[14]), .D(n36), 
        .Z(n34) );
  C12T28SOI_LL_OAI22X5_P0 U60 ( .A(data[13]), .B(n37), .C(data[12]), .D(n38), 
        .Z(n33) );
  C12T28SOI_LL_NOR2X3_P0 U61 ( .A(n39), .B(n40), .Z(n31) );
  C12T28SOI_LL_OAI22X5_P0 U62 ( .A(data[7]), .B(n35), .C(data[6]), .D(n36), 
        .Z(n40) );
  C12T28SOI_LL_OAI22X5_P0 U63 ( .A(data[5]), .B(n37), .C(data[4]), .D(n38), 
        .Z(n39) );
  C12T28SOI_LL_NOR2X3_P0 U64 ( .A(n41), .B(n42), .Z(n30) );
  C12T28SOI_LL_OAI22X5_P0 U65 ( .A(data[11]), .B(n35), .C(data[10]), .D(n36), 
        .Z(n42) );
  C12T28SOI_LL_OAI22X5_P0 U66 ( .A(data[9]), .B(n37), .C(data[8]), .D(n38), 
        .Z(n41) );
  C12T28SOI_LL_NOR2X3_P0 U67 ( .A(n43), .B(n44), .Z(n29) );
  C12T28SOI_LL_OAI22X5_P0 U68 ( .A(data[3]), .B(n35), .C(data[2]), .D(n36), 
        .Z(n44) );
  C12T28SOI_LL_NAND2X3_P0 U69 ( .A(N2), .B(n45), .Z(n36) );
  C12T28SOI_LL_NAND2X3_P0 U70 ( .A(N2), .B(N1), .Z(n35) );
  C12T28SOI_LL_OAI22X5_P0 U71 ( .A(data[1]), .B(n37), .C(data[0]), .D(n38), 
        .Z(n43) );
  C12T28SOI_LL_NAND2X3_P0 U72 ( .A(n45), .B(n46), .Z(n38) );
  C12T28SOI_LL_IVX4_P0 U73 ( .A(N1), .Z(n45) );
  C12T28SOI_LL_NAND2X3_P0 U74 ( .A(N1), .B(n46), .Z(n37) );
  C12T28SOI_LL_IVX4_P0 U75 ( .A(N2), .Z(n46) );
  C12T28SOI_LL_NOR2AX3_P0 U76 ( .A(reset_ni), .B(data_we_i), .Z(N26) );
  C12T28SOI_LL_NOR2AX3_P0 U77 ( .A(data_in_i[15]), .B(n28), .Z(N25) );
  C12T28SOI_LL_NOR2AX3_P0 U78 ( .A(data_in_i[14]), .B(n28), .Z(N24) );
  C12T28SOI_LL_NOR2AX3_P0 U79 ( .A(data_in_i[13]), .B(n28), .Z(N23) );
  C12T28SOI_LL_NOR2AX3_P0 U80 ( .A(data_in_i[12]), .B(n28), .Z(N22) );
  C12T28SOI_LL_NOR2AX3_P0 U81 ( .A(data_in_i[11]), .B(n28), .Z(N21) );
  C12T28SOI_LL_NOR2AX3_P0 U82 ( .A(data_in_i[10]), .B(n28), .Z(N20) );
  C12T28SOI_LL_NOR2AX3_P0 U83 ( .A(data_in_i[9]), .B(n28), .Z(N19) );
  C12T28SOI_LL_NOR2AX3_P0 U84 ( .A(data_in_i[8]), .B(n28), .Z(N18) );
  C12T28SOI_LL_NOR2AX3_P0 U85 ( .A(data_in_i[7]), .B(n28), .Z(N17) );
  C12T28SOI_LL_NOR2AX3_P0 U86 ( .A(data_in_i[6]), .B(n28), .Z(N16) );
  C12T28SOI_LL_NOR2AX3_P0 U87 ( .A(data_in_i[5]), .B(n28), .Z(N15) );
  C12T28SOI_LL_NOR2AX3_P0 U88 ( .A(data_in_i[4]), .B(n28), .Z(N14) );
  C12T28SOI_LL_NOR2AX3_P0 U89 ( .A(data_in_i[3]), .B(n28), .Z(N13) );
  C12T28SOI_LL_NOR2AX3_P0 U90 ( .A(data_in_i[2]), .B(n28), .Z(N12) );
  C12T28SOI_LL_NOR2AX3_P0 U91 ( .A(data_in_i[1]), .B(n28), .Z(N11) );
  C12T28SOI_LL_NOR2AX3_P0 U92 ( .A(data_in_i[0]), .B(n28), .Z(N10) );
  C12T28SOI_LL_NAND2X3_P0 U93 ( .A(reset_ni), .B(data_we_i), .Z(n28) );
endmodule

