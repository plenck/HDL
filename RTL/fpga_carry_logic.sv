//timothee kocev

module fpga_carry_logic (
  input   logic   i0_i        ,
  input   logic   i1_i        ,
  input   logic   fcin_i      ,
  output  logic   fcout_o
  );

  always_comb begin
      //truth table
      casex ({i0_i, i1_i, fcin_i})
        3'b00x : fcout_o = '0   ;
        3'b0x0 : fcout_o = '0   ;
        3'bx11 : fcout_o = 1'b1 ;
        3'bx00 : fcout_o = '0   ;
        3'b1x1 : fcout_o = 1'b1 ;
        3'b11x : fcout_o = 1'b1 ;
      endcase
  end

endmodule
