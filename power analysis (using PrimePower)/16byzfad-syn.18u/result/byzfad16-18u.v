
module evRst_Latch_cell_1 ( din, unlock, reset_n, dout );
  input din, unlock, reset_n;
  output dout;


  TLATRX4 dout_reg ( .G(unlock), .D(din), .RN(reset_n), .Q(dout) );
endmodule


module evRst_Latch_cell_0 ( din, unlock, reset_n, dout );
  input din, unlock, reset_n;
  output dout;


  TLATRX4 dout_reg ( .G(unlock), .D(din), .RN(reset_n), .Q(dout) );
endmodule


module evCINV_14 ( a, a_not );
  input a;
  output a_not;


  CLKINVX1 U7 ( .A(a), .Y(a_not) );
endmodule


module evCINV_13 ( a, a_not );
  input a;
  output a_not;


  CLKINVX1 U7 ( .A(a), .Y(a_not) );
endmodule


module evCINV_12 ( a, a_not );
  input a;
  output a_not;


  CLKINVX1 U7 ( .A(a), .Y(a_not) );
endmodule


module evCINV_11 ( a, a_not );
  input a;
  output a_not;


  CLKINVX1 U7 ( .A(a), .Y(a_not) );
endmodule


module evCINV_10 ( a, a_not );
  input a;
  output a_not;


  CLKINVX1 U7 ( .A(a), .Y(a_not) );
endmodule


module evCINV_9 ( a, a_not );
  input a;
  output a_not;


  CLKINVX1 U7 ( .A(a), .Y(a_not) );
endmodule


module evCINV_8 ( a, a_not );
  input a;
  output a_not;


  CLKINVX1 U7 ( .A(a), .Y(a_not) );
endmodule


module evCINV_7 ( a, a_not );
  input a;
  output a_not;


  CLKINVX1 U7 ( .A(a), .Y(a_not) );
endmodule


module evCINV_6 ( a, a_not );
  input a;
  output a_not;


  CLKINVX1 U7 ( .A(a), .Y(a_not) );
endmodule


module evCINV_5 ( a, a_not );
  input a;
  output a_not;


  CLKINVX1 U7 ( .A(a), .Y(a_not) );
endmodule


module evCINV_4 ( a, a_not );
  input a;
  output a_not;


  CLKINVX1 U7 ( .A(a), .Y(a_not) );
endmodule


module evCINV_3 ( a, a_not );
  input a;
  output a_not;


  CLKINVX1 U7 ( .A(a), .Y(a_not) );
endmodule


module evCINV_2 ( a, a_not );
  input a;
  output a_not;


  CLKINVX1 U7 ( .A(a), .Y(a_not) );
endmodule


module evCINV_1 ( a, a_not );
  input a;
  output a_not;


  CLKINVX1 U7 ( .A(a), .Y(a_not) );
endmodule


module evCINV_0 ( a, a_not );
  input a;
  output a_not;


  CLKINVX1 U7 ( .A(a), .Y(a_not) );
endmodule


module evLatch_cell_14 ( din, unlock, dout );
  input din, unlock;
  output dout;
  wire   n_12;
  assign n_12 = unlock;

  TLATX1 dout_reg ( .G(n_12), .D(din), .Q(dout) );
endmodule


module evLatch_cell_13 ( din, unlock, dout );
  input din, unlock;
  output dout;
  wire   n_12;
  assign n_12 = unlock;

  TLATX1 dout_reg ( .G(n_12), .D(din), .Q(dout) );
endmodule


module evLatch_cell_12 ( din, unlock, dout );
  input din, unlock;
  output dout;
  wire   n_12;
  assign n_12 = unlock;

  TLATX1 dout_reg ( .G(n_12), .D(din), .Q(dout) );
endmodule


module evLatch_cell_11 ( din, unlock, dout );
  input din, unlock;
  output dout;
  wire   n_12;
  assign n_12 = unlock;

  TLATX1 dout_reg ( .G(n_12), .D(din), .Q(dout) );
endmodule


module evLatch_cell_10 ( din, unlock, dout );
  input din, unlock;
  output dout;
  wire   n_12;
  assign n_12 = unlock;

  TLATX1 dout_reg ( .G(n_12), .D(din), .Q(dout) );
endmodule


module evLatch_cell_9 ( din, unlock, dout );
  input din, unlock;
  output dout;
  wire   n_12;
  assign n_12 = unlock;

  TLATX1 dout_reg ( .G(n_12), .D(din), .Q(dout) );
endmodule


module evLatch_cell_8 ( din, unlock, dout );
  input din, unlock;
  output dout;
  wire   n_12;
  assign n_12 = unlock;

  TLATX1 dout_reg ( .G(n_12), .D(din), .Q(dout) );
endmodule


module evLatch_cell_7 ( din, unlock, dout );
  input din, unlock;
  output dout;
  wire   n_12;
  assign n_12 = unlock;

  TLATX1 dout_reg ( .G(n_12), .D(din), .Q(dout) );
endmodule


module evLatch_cell_6 ( din, unlock, dout );
  input din, unlock;
  output dout;
  wire   n_12;
  assign n_12 = unlock;

  TLATX1 dout_reg ( .G(n_12), .D(din), .Q(dout) );
endmodule


module evLatch_cell_5 ( din, unlock, dout );
  input din, unlock;
  output dout;
  wire   n_12;
  assign n_12 = unlock;

  TLATX1 dout_reg ( .G(n_12), .D(din), .Q(dout) );
endmodule


module evLatch_cell_4 ( din, unlock, dout );
  input din, unlock;
  output dout;
  wire   n_12;
  assign n_12 = unlock;

  TLATX1 dout_reg ( .G(n_12), .D(din), .Q(dout) );
endmodule


module evLatch_cell_3 ( din, unlock, dout );
  input din, unlock;
  output dout;
  wire   n_12;
  assign n_12 = unlock;

  TLATX1 dout_reg ( .G(n_12), .D(din), .Q(dout) );
endmodule


module evLatch_cell_2 ( din, unlock, dout );
  input din, unlock;
  output dout;
  wire   n_12;
  assign n_12 = unlock;

  TLATX1 dout_reg ( .G(n_12), .D(din), .Q(dout) );
endmodule


module evLatch_cell_1 ( din, unlock, dout );
  input din, unlock;
  output dout;
  wire   n_12, n8;
  assign n_12 = unlock;

  TLATX1 dout_reg ( .G(n_12), .D(n8), .Q(dout) );
  BUFX1 U6 ( .A(din), .Y(n8) );
endmodule


module evLatch_cell_0 ( din, unlock, dout );
  input din, unlock;
  output dout;
  wire   n_12;
  assign n_12 = unlock;

  TLATX1 dout_reg ( .G(n_12), .D(din), .Q(dout) );
endmodule


module evClockGator_RngCntrR_1 ( entr, leave, clk_in_n, rst, clk_ot );
  input entr, leave, clk_in_n, rst;
  output clk_ot;
  wire   clock_allowed, sel_lin;

  evMUX2_1_1 line_selector ( .inp1(entr), .inp2(leave), .sel(clock_allowed), 
        .mx_out(sel_lin) );
  evRst_Latch_cell_1 rlatch ( .din(entr), .unlock(sel_lin), .reset_n(rst), 
        .dout(clock_allowed) );
  NAND2X1 U7 ( .A(clock_allowed), .B(clk_in_n), .Y(clk_ot) );
endmodule


module evClockGator_RngCntrR_0 ( entr, leave, clk_in_n, rst, clk_ot );
  input entr, leave, clk_in_n, rst;
  output clk_ot;
  wire   clock_allowed, sel_lin;

  evMUX2_1_0 line_selector ( .inp1(entr), .inp2(leave), .sel(clock_allowed), 
        .mx_out(sel_lin) );
  evRst_Latch_cell_0 rlatch ( .din(entr), .unlock(sel_lin), .reset_n(rst), 
        .dout(clock_allowed) );
  NAND2X1 U7 ( .A(clock_allowed), .B(clk_in_n), .Y(clk_ot) );
endmodule


module evMS_Rstbl_FlipFlop_45 ( din, clock, reset_n, dout );
  input din, clock, reset_n;
  output dout;


  DFFRHQXL dout_reg ( .D(din), .CK(clock), .RN(reset_n), .Q(dout) );
endmodule


module evMS_Rstbl_FlipFlop_44 ( din, clock, reset_n, dout );
  input din, clock, reset_n;
  output dout;


  DFFRHQXL dout_reg ( .D(din), .CK(clock), .RN(reset_n), .Q(dout) );
endmodule


module evMS_Rstbl_FlipFlop_43 ( din, clock, reset_n, dout );
  input din, clock, reset_n;
  output dout;


  DFFRHQXL dout_reg ( .D(din), .CK(clock), .RN(reset_n), .Q(dout) );
endmodule


module evMS_Rstbl_FlipFlop_42 ( din, clock, reset_n, dout );
  input din, clock, reset_n;
  output dout;


  DFFRHQXL dout_reg ( .D(din), .CK(clock), .RN(reset_n), .Q(dout) );
endmodule


module evMS_Rstbl_FlipFlop_41 ( din, clock, reset_n, dout );
  input din, clock, reset_n;
  output dout;


  DFFRHQXL dout_reg ( .D(din), .CK(clock), .RN(reset_n), .Q(dout) );
endmodule


module evMS_Rstbl_FlipFlop_40 ( din, clock, reset_n, dout );
  input din, clock, reset_n;
  output dout;


  DFFRHQXL dout_reg ( .D(din), .CK(clock), .RN(reset_n), .Q(dout) );
endmodule


module evMS_Rstbl_FlipFlop_39 ( din, clock, reset_n, dout );
  input din, clock, reset_n;
  output dout;


  DFFRHQXL dout_reg ( .D(din), .CK(clock), .RN(reset_n), .Q(dout) );
endmodule


module evMS_Rstbl_FlipFlop_38 ( din, clock, reset_n, dout );
  input din, clock, reset_n;
  output dout;


  DFFRHQXL dout_reg ( .D(din), .CK(clock), .RN(reset_n), .Q(dout) );
endmodule


module evMS_Rstbl_FlipFlop_37 ( din, clock, reset_n, dout );
  input din, clock, reset_n;
  output dout;


  DFFRHQXL dout_reg ( .D(din), .CK(clock), .RN(reset_n), .Q(dout) );
endmodule


module evMS_Rstbl_FlipFlop_36 ( din, clock, reset_n, dout );
  input din, clock, reset_n;
  output dout;


  DFFRHQXL dout_reg ( .D(din), .CK(clock), .RN(reset_n), .Q(dout) );
endmodule


module evMS_Rstbl_FlipFlop_35 ( din, clock, reset_n, dout );
  input din, clock, reset_n;
  output dout;


  DFFRHQXL dout_reg ( .D(din), .CK(clock), .RN(reset_n), .Q(dout) );
endmodule


module evMS_Rstbl_FlipFlop_34 ( din, clock, reset_n, dout );
  input din, clock, reset_n;
  output dout;


  DFFRHQXL dout_reg ( .D(din), .CK(clock), .RN(reset_n), .Q(dout) );
endmodule


module evMS_Rstbl_FlipFlop_33 ( din, clock, reset_n, dout );
  input din, clock, reset_n;
  output dout;


  DFFRHQXL dout_reg ( .D(din), .CK(clock), .RN(reset_n), .Q(dout) );
endmodule


module evMS_Rstbl_FlipFlop_32 ( din, clock, reset_n, dout );
  input din, clock, reset_n;
  output dout;


  DFFRHQXL dout_reg ( .D(din), .CK(clock), .RN(reset_n), .Q(dout) );
endmodule


module evMS_Rstbl_FlipFlop_31 ( din, clock, reset_n, dout );
  input din, clock, reset_n;
  output dout;


  DFFRHQXL dout_reg ( .D(din), .CK(clock), .RN(reset_n), .Q(dout) );
endmodule


module evMS_Rstbl_FlipFlop_30 ( din, clock, reset_n, dout );
  input din, clock, reset_n;
  output dout;


  DFFRHQXL dout_reg ( .D(din), .CK(clock), .RN(reset_n), .Q(dout) );
endmodule


module evMS_Rstbl_FlipFlop_29 ( din, clock, reset_n, dout );
  input din, clock, reset_n;
  output dout;


  DFFRHQXL dout_reg ( .D(din), .CK(clock), .RN(reset_n), .Q(dout) );
endmodule


module evMS_Rstbl_FlipFlop_28 ( din, clock, reset_n, dout );
  input din, clock, reset_n;
  output dout;


  DFFRHQXL dout_reg ( .D(din), .CK(clock), .RN(reset_n), .Q(dout) );
endmodule


module evMS_Rstbl_FlipFlop_27 ( din, clock, reset_n, dout );
  input din, clock, reset_n;
  output dout;


  DFFRHQXL dout_reg ( .D(din), .CK(clock), .RN(reset_n), .Q(dout) );
endmodule


module evMS_Rstbl_FlipFlop_26 ( din, clock, reset_n, dout );
  input din, clock, reset_n;
  output dout;


  DFFRHQXL dout_reg ( .D(din), .CK(clock), .RN(reset_n), .Q(dout) );
endmodule


module evMS_Rstbl_FlipFlop_25 ( din, clock, reset_n, dout );
  input din, clock, reset_n;
  output dout;


  DFFRHQXL dout_reg ( .D(din), .CK(clock), .RN(reset_n), .Q(dout) );
endmodule


module evMS_Rstbl_FlipFlop_24 ( din, clock, reset_n, dout );
  input din, clock, reset_n;
  output dout;


  DFFRHQXL dout_reg ( .D(din), .CK(clock), .RN(reset_n), .Q(dout) );
endmodule


module evMS_Rstbl_FlipFlop_23 ( din, clock, reset_n, dout );
  input din, clock, reset_n;
  output dout;


  DFFRHQXL dout_reg ( .D(din), .CK(clock), .RN(reset_n), .Q(dout) );
endmodule


module evMS_Rstbl_FlipFlop_22 ( din, clock, reset_n, dout );
  input din, clock, reset_n;
  output dout;


  DFFRHQXL dout_reg ( .D(din), .CK(clock), .RN(reset_n), .Q(dout) );
endmodule


module evMS_Rstbl_FlipFlop_21 ( din, clock, reset_n, dout );
  input din, clock, reset_n;
  output dout;


  DFFRHQXL dout_reg ( .D(din), .CK(clock), .RN(reset_n), .Q(dout) );
endmodule


module evMS_Rstbl_FlipFlop_20 ( din, clock, reset_n, dout );
  input din, clock, reset_n;
  output dout;


  DFFRHQXL dout_reg ( .D(din), .CK(clock), .RN(reset_n), .Q(dout) );
endmodule


module evMS_Rstbl_FlipFlop_19 ( din, clock, reset_n, dout );
  input din, clock, reset_n;
  output dout;


  DFFRHQXL dout_reg ( .D(din), .CK(clock), .RN(reset_n), .Q(dout) );
endmodule


module evMS_Rstbl_FlipFlop_18 ( din, clock, reset_n, dout );
  input din, clock, reset_n;
  output dout;


  DFFRHQXL dout_reg ( .D(din), .CK(clock), .RN(reset_n), .Q(dout) );
endmodule


module evMS_Rstbl_FlipFlop_17 ( din, clock, reset_n, dout );
  input din, clock, reset_n;
  output dout;


  DFFRHQXL dout_reg ( .D(din), .CK(clock), .RN(reset_n), .Q(dout) );
endmodule


module evMS_Rstbl_FlipFlop_16 ( din, clock, reset_n, dout );
  input din, clock, reset_n;
  output dout;


  DFFRHQXL dout_reg ( .D(din), .CK(clock), .RN(reset_n), .Q(dout) );
endmodule


module evMS_Rstbl_FlipFlop_15 ( din, clock, reset_n, dout );
  input din, clock, reset_n;
  output dout;


  DFFRHQXL dout_reg ( .D(din), .CK(clock), .RN(reset_n), .Q(dout) );
endmodule


module evMS_Rstbl_FlipFlop_14 ( din, clock, reset_n, dout );
  input din, clock, reset_n;
  output dout;


  DFFRHQXL dout_reg ( .D(din), .CK(clock), .RN(reset_n), .Q(dout) );
endmodule


module evMS_Rstbl_FlipFlop_13 ( din, clock, reset_n, dout );
  input din, clock, reset_n;
  output dout;


  DFFRHQXL dout_reg ( .D(din), .CK(clock), .RN(reset_n), .Q(dout) );
endmodule


module evMS_Rstbl_FlipFlop_12 ( din, clock, reset_n, dout );
  input din, clock, reset_n;
  output dout;


  DFFRHQX4 dout_reg ( .D(din), .CK(clock), .RN(reset_n), .Q(dout) );
endmodule


module evMS_Rstbl_FlipFlop_11 ( din, clock, reset_n, dout );
  input din, clock, reset_n;
  output dout;


  DFFRHQXL dout_reg ( .D(din), .CK(clock), .RN(reset_n), .Q(dout) );
endmodule


module evMS_Rstbl_FlipFlop_10 ( din, clock, reset_n, dout );
  input din, clock, reset_n;
  output dout;


  DFFRHQXL dout_reg ( .D(din), .CK(clock), .RN(reset_n), .Q(dout) );
endmodule


module evMS_Rstbl_FlipFlop_9 ( din, clock, reset_n, dout );
  input din, clock, reset_n;
  output dout;


  DFFRHQXL dout_reg ( .D(din), .CK(clock), .RN(reset_n), .Q(dout) );
endmodule


module evMS_Rstbl_FlipFlop_8 ( din, clock, reset_n, dout );
  input din, clock, reset_n;
  output dout;


  DFFRHQX4 dout_reg ( .D(din), .CK(clock), .RN(reset_n), .Q(dout) );
endmodule


module evMS_Rstbl_FlipFlop_7 ( din, clock, reset_n, dout );
  input din, clock, reset_n;
  output dout;


  DFFRHQXL dout_reg ( .D(din), .CK(clock), .RN(reset_n), .Q(dout) );
endmodule


module evMS_Rstbl_FlipFlop_6 ( din, clock, reset_n, dout );
  input din, clock, reset_n;
  output dout;


  DFFRHQXL dout_reg ( .D(din), .CK(clock), .RN(reset_n), .Q(dout) );
endmodule


module evMS_Rstbl_FlipFlop_5 ( din, clock, reset_n, dout );
  input din, clock, reset_n;
  output dout;


  DFFRHQXL dout_reg ( .D(din), .CK(clock), .RN(reset_n), .Q(dout) );
endmodule


module evMS_Rstbl_FlipFlop_4 ( din, clock, reset_n, dout );
  input din, clock, reset_n;
  output dout;


  DFFRHQX4 dout_reg ( .D(din), .CK(clock), .RN(reset_n), .Q(dout) );
endmodule


module evMS_Rstbl_FlipFlop_3 ( din, clock, reset_n, dout );
  input din, clock, reset_n;
  output dout;


  DFFRHQXL dout_reg ( .D(din), .CK(clock), .RN(reset_n), .Q(dout) );
endmodule


module evMS_Rstbl_FlipFlop_2 ( din, clock, reset_n, dout );
  input din, clock, reset_n;
  output dout;


  DFFRHQXL dout_reg ( .D(din), .CK(clock), .RN(reset_n), .Q(dout) );
endmodule


module evMS_Rstbl_FlipFlop_1 ( din, clock, reset_n, dout );
  input din, clock, reset_n;
  output dout;


  DFFRHQXL dout_reg ( .D(din), .CK(clock), .RN(reset_n), .Q(dout) );
endmodule


module evMS_Rstbl_FlipFlop_0 ( din, clock, reset_n, dout );
  input din, clock, reset_n;
  output dout;


  DFFRHQXL dout_reg ( .D(din), .CK(clock), .RN(reset_n), .Q(dout) );
endmodule


module evNMOS_14 ( src, gat, drn );
  input src, gat;
  output drn;
  wire   n11;
  tri   drn;

  TBUFIX2 drn_tri ( .A(n11), .OE(gat), .Y(drn) );
  CLKINVX1 U6 ( .A(src), .Y(n11) );
endmodule


module evNMOS_13 ( src, gat, drn );
  input src, gat;
  output drn;
  wire   n11;
  tri   drn;

  TBUFIX2 drn_tri ( .A(n11), .OE(gat), .Y(drn) );
  CLKINVX1 U6 ( .A(src), .Y(n11) );
endmodule


module evNMOS_12 ( src, gat, drn );
  input src, gat;
  output drn;
  wire   n11;
  tri   drn;

  TBUFIX2 drn_tri ( .A(n11), .OE(gat), .Y(drn) );
  CLKINVX1 U6 ( .A(src), .Y(n11) );
endmodule


module evNMOS_11 ( src, gat, drn );
  input src, gat;
  output drn;
  wire   n11;
  tri   drn;

  TBUFIX2 drn_tri ( .A(n11), .OE(gat), .Y(drn) );
  CLKINVX1 U6 ( .A(src), .Y(n11) );
endmodule


module evNMOS_10 ( src, gat, drn );
  input src, gat;
  output drn;
  wire   n11;
  tri   drn;

  TBUFIX2 drn_tri ( .A(n11), .OE(gat), .Y(drn) );
  CLKINVX1 U6 ( .A(src), .Y(n11) );
endmodule


module evNMOS_9 ( src, gat, drn );
  input src, gat;
  output drn;
  wire   n11;
  tri   drn;

  TBUFIX2 drn_tri ( .A(n11), .OE(gat), .Y(drn) );
  CLKINVX1 U6 ( .A(src), .Y(n11) );
endmodule


module evNMOS_8 ( src, gat, drn );
  input src, gat;
  output drn;
  wire   n11;
  tri   drn;

  TBUFIX2 drn_tri ( .A(n11), .OE(gat), .Y(drn) );
  CLKINVX1 U6 ( .A(src), .Y(n11) );
endmodule


module evNMOS_7 ( src, gat, drn );
  input src, gat;
  output drn;
  wire   n11;
  tri   drn;

  TBUFIX2 drn_tri ( .A(n11), .OE(gat), .Y(drn) );
  CLKINVX1 U6 ( .A(src), .Y(n11) );
endmodule


module evNMOS_6 ( src, gat, drn );
  input src, gat;
  output drn;
  wire   n11;
  tri   drn;

  TBUFIX2 drn_tri ( .A(n11), .OE(gat), .Y(drn) );
  CLKINVX1 U6 ( .A(src), .Y(n11) );
endmodule


module evNMOS_5 ( src, gat, drn );
  input src, gat;
  output drn;
  wire   n11;
  tri   drn;

  TBUFIX2 drn_tri ( .A(n11), .OE(gat), .Y(drn) );
  CLKINVX1 U6 ( .A(src), .Y(n11) );
endmodule


module evNMOS_4 ( src, gat, drn );
  input src, gat;
  output drn;
  wire   n11;
  tri   drn;

  TBUFIX2 drn_tri ( .A(n11), .OE(gat), .Y(drn) );
  CLKINVX1 U6 ( .A(src), .Y(n11) );
endmodule


module evNMOS_3 ( src, gat, drn );
  input src, gat;
  output drn;
  wire   n11;
  tri   drn;

  TBUFIX2 drn_tri ( .A(n11), .OE(gat), .Y(drn) );
  CLKINVX1 U6 ( .A(src), .Y(n11) );
endmodule


module evNMOS_2 ( src, gat, drn );
  input src, gat;
  output drn;
  wire   n11;
  tri   drn;

  TBUFIX2 drn_tri ( .A(n11), .OE(gat), .Y(drn) );
  CLKINVX1 U6 ( .A(src), .Y(n11) );
endmodule


module evNMOS_1 ( src, gat, drn );
  input src, gat;
  output drn;
  wire   n11;
  tri   drn;

  TBUFIX2 drn_tri ( .A(n11), .OE(gat), .Y(drn) );
  CLKINVX1 U6 ( .A(src), .Y(n11) );
endmodule


module evNMOS_0 ( src, gat, drn );
  input src, gat;
  output drn;
  wire   n11;
  tri   drn;

  TBUFIX2 drn_tri ( .A(n11), .OE(gat), .Y(drn) );
  CLKINVX1 U6 ( .A(src), .Y(n11) );
endmodule


module evLPFA_14 ( a, b, cin, sum, cout );
  input a, b, cin;
  output sum, cout;
  wire   a_not, a_xor_b, a_xnor_b;

  evCINV_14 inv ( .a(a), .a_not(a_not) );
  evMUX2_1_63 mx1 ( .inp1(a), .inp2(a_not), .sel(b), .mx_out(a_xor_b) );
  evMUX2_1_62 mx2 ( .inp1(a_not), .inp2(a), .sel(b), .mx_out(a_xnor_b) );
  evMUX2_1_61 mx3 ( .inp1(a_xor_b), .inp2(a_xnor_b), .sel(cin), .mx_out(sum)
         );
  evMUX2_1_60 mx4 ( .inp1(b), .inp2(cin), .sel(a_xor_b), .mx_out(cout) );
endmodule


module evLPFA_13 ( a, b, cin, sum, cout );
  input a, b, cin;
  output sum, cout;
  wire   a_not, a_xor_b, a_xnor_b;

  evCINV_13 inv ( .a(a), .a_not(a_not) );
  evMUX2_1_59 mx1 ( .inp1(a), .inp2(a_not), .sel(b), .mx_out(a_xor_b) );
  evMUX2_1_58 mx2 ( .inp1(a_not), .inp2(a), .sel(b), .mx_out(a_xnor_b) );
  evMUX2_1_57 mx3 ( .inp1(a_xor_b), .inp2(a_xnor_b), .sel(cin), .mx_out(sum)
         );
  evMUX2_1_56 mx4 ( .inp1(b), .inp2(cin), .sel(a_xor_b), .mx_out(cout) );
endmodule


module evLPFA_12 ( a, b, cin, sum, cout );
  input a, b, cin;
  output sum, cout;
  wire   a_not, a_xor_b, a_xnor_b;

  evCINV_12 inv ( .a(a), .a_not(a_not) );
  evMUX2_1_55 mx1 ( .inp1(a), .inp2(a_not), .sel(b), .mx_out(a_xor_b) );
  evMUX2_1_54 mx2 ( .inp1(a_not), .inp2(a), .sel(b), .mx_out(a_xnor_b) );
  evMUX2_1_53 mx3 ( .inp1(a_xor_b), .inp2(a_xnor_b), .sel(cin), .mx_out(sum)
         );
  evMUX2_1_52 mx4 ( .inp1(b), .inp2(cin), .sel(a_xor_b), .mx_out(cout) );
endmodule


module evLPFA_11 ( a, b, cin, sum, cout );
  input a, b, cin;
  output sum, cout;
  wire   a_not, a_xor_b, a_xnor_b;

  evCINV_11 inv ( .a(a), .a_not(a_not) );
  evMUX2_1_51 mx1 ( .inp1(a), .inp2(a_not), .sel(b), .mx_out(a_xor_b) );
  evMUX2_1_50 mx2 ( .inp1(a_not), .inp2(a), .sel(b), .mx_out(a_xnor_b) );
  evMUX2_1_49 mx3 ( .inp1(a_xor_b), .inp2(a_xnor_b), .sel(cin), .mx_out(sum)
         );
  evMUX2_1_48 mx4 ( .inp1(b), .inp2(cin), .sel(a_xor_b), .mx_out(cout) );
endmodule


module evLPFA_10 ( a, b, cin, sum, cout );
  input a, b, cin;
  output sum, cout;
  wire   a_not, a_xor_b, a_xnor_b;

  evCINV_10 inv ( .a(a), .a_not(a_not) );
  evMUX2_1_47 mx1 ( .inp1(a), .inp2(a_not), .sel(b), .mx_out(a_xor_b) );
  evMUX2_1_46 mx2 ( .inp1(a_not), .inp2(a), .sel(b), .mx_out(a_xnor_b) );
  evMUX2_1_45 mx3 ( .inp1(a_xor_b), .inp2(a_xnor_b), .sel(cin), .mx_out(sum)
         );
  evMUX2_1_44 mx4 ( .inp1(b), .inp2(cin), .sel(a_xor_b), .mx_out(cout) );
endmodule


module evLPFA_9 ( a, b, cin, sum, cout );
  input a, b, cin;
  output sum, cout;
  wire   a_not, a_xor_b, a_xnor_b;

  evCINV_9 inv ( .a(a), .a_not(a_not) );
  evMUX2_1_43 mx1 ( .inp1(a), .inp2(a_not), .sel(b), .mx_out(a_xor_b) );
  evMUX2_1_42 mx2 ( .inp1(a_not), .inp2(a), .sel(b), .mx_out(a_xnor_b) );
  evMUX2_1_41 mx3 ( .inp1(a_xor_b), .inp2(a_xnor_b), .sel(cin), .mx_out(sum)
         );
  evMUX2_1_40 mx4 ( .inp1(b), .inp2(cin), .sel(a_xor_b), .mx_out(cout) );
endmodule


module evLPFA_8 ( a, b, cin, sum, cout );
  input a, b, cin;
  output sum, cout;
  wire   a_not, a_xor_b, a_xnor_b;

  evCINV_8 inv ( .a(a), .a_not(a_not) );
  evMUX2_1_39 mx1 ( .inp1(a), .inp2(a_not), .sel(b), .mx_out(a_xor_b) );
  evMUX2_1_38 mx2 ( .inp1(a_not), .inp2(a), .sel(b), .mx_out(a_xnor_b) );
  evMUX2_1_37 mx3 ( .inp1(a_xor_b), .inp2(a_xnor_b), .sel(cin), .mx_out(sum)
         );
  evMUX2_1_36 mx4 ( .inp1(b), .inp2(cin), .sel(a_xor_b), .mx_out(cout) );
endmodule


module evLPFA_7 ( a, b, cin, sum, cout );
  input a, b, cin;
  output sum, cout;
  wire   a_not, a_xor_b, a_xnor_b;

  evCINV_7 inv ( .a(a), .a_not(a_not) );
  evMUX2_1_35 mx1 ( .inp1(a), .inp2(a_not), .sel(b), .mx_out(a_xor_b) );
  evMUX2_1_34 mx2 ( .inp1(a_not), .inp2(a), .sel(b), .mx_out(a_xnor_b) );
  evMUX2_1_33 mx3 ( .inp1(a_xor_b), .inp2(a_xnor_b), .sel(cin), .mx_out(sum)
         );
  evMUX2_1_32 mx4 ( .inp1(b), .inp2(cin), .sel(a_xor_b), .mx_out(cout) );
endmodule


module evLPFA_6 ( a, b, cin, sum, cout );
  input a, b, cin;
  output sum, cout;
  wire   a_not, a_xor_b, a_xnor_b;

  evCINV_6 inv ( .a(a), .a_not(a_not) );
  evMUX2_1_31 mx1 ( .inp1(a), .inp2(a_not), .sel(b), .mx_out(a_xor_b) );
  evMUX2_1_30 mx2 ( .inp1(a_not), .inp2(a), .sel(b), .mx_out(a_xnor_b) );
  evMUX2_1_29 mx3 ( .inp1(a_xor_b), .inp2(a_xnor_b), .sel(cin), .mx_out(sum)
         );
  evMUX2_1_28 mx4 ( .inp1(b), .inp2(cin), .sel(a_xor_b), .mx_out(cout) );
endmodule


module evLPFA_5 ( a, b, cin, sum, cout );
  input a, b, cin;
  output sum, cout;
  wire   a_not, a_xor_b, a_xnor_b;

  evCINV_5 inv ( .a(a), .a_not(a_not) );
  evMUX2_1_27 mx1 ( .inp1(a), .inp2(a_not), .sel(b), .mx_out(a_xor_b) );
  evMUX2_1_26 mx2 ( .inp1(a_not), .inp2(a), .sel(b), .mx_out(a_xnor_b) );
  evMUX2_1_25 mx3 ( .inp1(a_xor_b), .inp2(a_xnor_b), .sel(cin), .mx_out(sum)
         );
  evMUX2_1_24 mx4 ( .inp1(b), .inp2(cin), .sel(a_xor_b), .mx_out(cout) );
endmodule


module evLPFA_4 ( a, b, cin, sum, cout );
  input a, b, cin;
  output sum, cout;
  wire   a_not, a_xor_b, a_xnor_b;

  evCINV_4 inv ( .a(a), .a_not(a_not) );
  evMUX2_1_23 mx1 ( .inp1(a), .inp2(a_not), .sel(b), .mx_out(a_xor_b) );
  evMUX2_1_22 mx2 ( .inp1(a_not), .inp2(a), .sel(b), .mx_out(a_xnor_b) );
  evMUX2_1_21 mx3 ( .inp1(a_xor_b), .inp2(a_xnor_b), .sel(cin), .mx_out(sum)
         );
  evMUX2_1_20 mx4 ( .inp1(b), .inp2(cin), .sel(a_xor_b), .mx_out(cout) );
endmodule


module evLPFA_3 ( a, b, cin, sum, cout );
  input a, b, cin;
  output sum, cout;
  wire   a_not, a_xor_b, a_xnor_b;

  evCINV_3 inv ( .a(a), .a_not(a_not) );
  evMUX2_1_19 mx1 ( .inp1(a), .inp2(a_not), .sel(b), .mx_out(a_xor_b) );
  evMUX2_1_18 mx2 ( .inp1(a_not), .inp2(a), .sel(b), .mx_out(a_xnor_b) );
  evMUX2_1_17 mx3 ( .inp1(a_xor_b), .inp2(a_xnor_b), .sel(cin), .mx_out(sum)
         );
  evMUX2_1_16 mx4 ( .inp1(b), .inp2(cin), .sel(a_xor_b), .mx_out(cout) );
endmodule


module evLPFA_2 ( a, b, cin, sum, cout );
  input a, b, cin;
  output sum, cout;
  wire   a_not, a_xor_b, a_xnor_b;

  evCINV_2 inv ( .a(a), .a_not(a_not) );
  evMUX2_1_15 mx1 ( .inp1(a), .inp2(a_not), .sel(b), .mx_out(a_xor_b) );
  evMUX2_1_14 mx2 ( .inp1(a_not), .inp2(a), .sel(b), .mx_out(a_xnor_b) );
  evMUX2_1_13 mx3 ( .inp1(a_xor_b), .inp2(a_xnor_b), .sel(cin), .mx_out(sum)
         );
  evMUX2_1_12 mx4 ( .inp1(b), .inp2(cin), .sel(a_xor_b), .mx_out(cout) );
endmodule


module evLPFA_1 ( a, b, cin, sum, cout );
  input a, b, cin;
  output sum, cout;
  wire   a_not, a_xor_b, a_xnor_b;

  evCINV_1 inv ( .a(a), .a_not(a_not) );
  evMUX2_1_11 mx1 ( .inp1(a), .inp2(a_not), .sel(b), .mx_out(a_xor_b) );
  evMUX2_1_10 mx2 ( .inp1(a_not), .inp2(a), .sel(b), .mx_out(a_xnor_b) );
  evMUX2_1_9 mx3 ( .inp1(a_xor_b), .inp2(a_xnor_b), .sel(cin), .mx_out(sum) );
  evMUX2_1_8 mx4 ( .inp1(b), .inp2(cin), .sel(a_xor_b), .mx_out(cout) );
endmodule


module evLPFA_0 ( a, b, cin, sum, cout );
  input a, b, cin;
  output sum, cout;
  wire   a_not, a_xor_b, a_xnor_b;

  evCINV_0 inv ( .a(a), .a_not(a_not) );
  evMUX2_1_7 mx1 ( .inp1(a), .inp2(a_not), .sel(b), .mx_out(a_xor_b) );
  evMUX2_1_6 mx2 ( .inp1(a_not), .inp2(a), .sel(b), .mx_out(a_xnor_b) );
  evMUX2_1_5 mx3 ( .inp1(a_xor_b), .inp2(a_xnor_b), .sel(cin), .mx_out(sum) );
  evMUX2_1_4 mx4 ( .inp1(b), .inp2(cin), .sel(a_xor_b), .mx_out(cout) );
endmodule


module evlpRegister_wdt16_0 ( din, clock, reset_n, dout );
  input [15:0] din;
  output [15:0] dout;
  input clock, reset_n;


  evMS_Rstbl_FlipFlop_30 ff_0 ( .din(din[0]), .clock(clock), .reset_n(reset_n), 
        .dout(dout[0]) );
  evMS_Rstbl_FlipFlop_29 ff_1 ( .din(din[1]), .clock(clock), .reset_n(reset_n), 
        .dout(dout[1]) );
  evMS_Rstbl_FlipFlop_28 ff_2 ( .din(din[2]), .clock(clock), .reset_n(reset_n), 
        .dout(dout[2]) );
  evMS_Rstbl_FlipFlop_27 ff_3 ( .din(din[3]), .clock(clock), .reset_n(reset_n), 
        .dout(dout[3]) );
  evMS_Rstbl_FlipFlop_26 ff_4 ( .din(din[4]), .clock(clock), .reset_n(reset_n), 
        .dout(dout[4]) );
  evMS_Rstbl_FlipFlop_25 ff_5 ( .din(din[5]), .clock(clock), .reset_n(reset_n), 
        .dout(dout[5]) );
  evMS_Rstbl_FlipFlop_24 ff_6 ( .din(din[6]), .clock(clock), .reset_n(reset_n), 
        .dout(dout[6]) );
  evMS_Rstbl_FlipFlop_23 ff_7 ( .din(din[7]), .clock(clock), .reset_n(reset_n), 
        .dout(dout[7]) );
  evMS_Rstbl_FlipFlop_22 ff_8 ( .din(din[8]), .clock(clock), .reset_n(reset_n), 
        .dout(dout[8]) );
  evMS_Rstbl_FlipFlop_21 ff_9 ( .din(din[9]), .clock(clock), .reset_n(reset_n), 
        .dout(dout[9]) );
  evMS_Rstbl_FlipFlop_20 ff_10 ( .din(din[10]), .clock(clock), .reset_n(
        reset_n), .dout(dout[10]) );
  evMS_Rstbl_FlipFlop_19 ff_11 ( .din(din[11]), .clock(clock), .reset_n(
        reset_n), .dout(dout[11]) );
  evMS_Rstbl_FlipFlop_18 ff_12 ( .din(din[12]), .clock(clock), .reset_n(
        reset_n), .dout(dout[12]) );
  evMS_Rstbl_FlipFlop_17 ff_13 ( .din(din[13]), .clock(clock), .reset_n(
        reset_n), .dout(dout[13]) );
  evMS_Rstbl_FlipFlop_16 ff_14 ( .din(din[14]), .clock(clock), .reset_n(
        reset_n), .dout(dout[14]) );
  evMS_Rstbl_FlipFlop_15 ff_15 ( .din(din[15]), .clock(clock), .reset_n(
        reset_n), .dout(dout[15]) );
endmodule


module evMUX2_1_84 ( inp1, inp2, sel, mx_out );
  input inp1, inp2, sel;
  output mx_out;
  wire   n8, n9, n10, n11, n12;

  NOR2X1 U10 ( .A(sel), .B(n10), .Y(n12) );
  OR2X1 U11 ( .A(n11), .B(n12), .Y(mx_out) );
  CLKINVX1 U12 ( .A(inp2), .Y(n8) );
  CLKINVXL U13 ( .A(sel), .Y(n9) );
  CLKINVX1 U14 ( .A(inp1), .Y(n10) );
  NOR2X1 U15 ( .A(n8), .B(n9), .Y(n11) );
endmodule


module evMUX2_1_83 ( inp1, inp2, sel, mx_out );
  input inp1, inp2, sel;
  output mx_out;


  MX2X2 U10 ( .A(inp1), .B(inp2), .S0(sel), .Y(mx_out) );
endmodule


module evMUX2_1_82 ( inp1, inp2, sel, mx_out );
  input inp1, inp2, sel;
  output mx_out;


  MX2X2 U10 ( .A(inp1), .B(inp2), .S0(sel), .Y(mx_out) );
endmodule


module evMUX2_1_81 ( inp1, inp2, sel, mx_out );
  input inp1, inp2, sel;
  output mx_out;


  MX2X2 U10 ( .A(inp1), .B(inp2), .S0(sel), .Y(mx_out) );
endmodule


module evMUX2_1_80 ( inp1, inp2, sel, mx_out );
  input inp1, inp2, sel;
  output mx_out;


  MX2X2 U10 ( .A(inp1), .B(inp2), .S0(sel), .Y(mx_out) );
endmodule


module evMUX2_1_79 ( inp1, inp2, sel, mx_out );
  input inp1, inp2, sel;
  output mx_out;


  MX2X2 U10 ( .A(inp1), .B(inp2), .S0(sel), .Y(mx_out) );
endmodule


module evMUX2_1_78 ( inp1, inp2, sel, mx_out );
  input inp1, inp2, sel;
  output mx_out;


  MX2X2 U10 ( .A(inp1), .B(inp2), .S0(sel), .Y(mx_out) );
endmodule


module evMUX2_1_77 ( inp1, inp2, sel, mx_out );
  input inp1, inp2, sel;
  output mx_out;


  MX2X2 U10 ( .A(inp1), .B(inp2), .S0(sel), .Y(mx_out) );
endmodule


module evMUX2_1_76 ( inp1, inp2, sel, mx_out );
  input inp1, inp2, sel;
  output mx_out;


  MX2X2 U10 ( .A(inp1), .B(inp2), .S0(sel), .Y(mx_out) );
endmodule


module evMUX2_1_75 ( inp1, inp2, sel, mx_out );
  input inp1, inp2, sel;
  output mx_out;


  MX2X2 U10 ( .A(inp1), .B(inp2), .S0(sel), .Y(mx_out) );
endmodule


module evMUX2_1_74 ( inp1, inp2, sel, mx_out );
  input inp1, inp2, sel;
  output mx_out;


  MX2X2 U10 ( .A(inp1), .B(inp2), .S0(sel), .Y(mx_out) );
endmodule


module evMUX2_1_73 ( inp1, inp2, sel, mx_out );
  input inp1, inp2, sel;
  output mx_out;


  MX2X2 U10 ( .A(inp1), .B(inp2), .S0(sel), .Y(mx_out) );
endmodule


module evMUX2_1_72 ( inp1, inp2, sel, mx_out );
  input inp1, inp2, sel;
  output mx_out;


  MX2X2 U10 ( .A(inp1), .B(inp2), .S0(sel), .Y(mx_out) );
endmodule


module evMUX2_1_71 ( inp1, inp2, sel, mx_out );
  input inp1, inp2, sel;
  output mx_out;


  MX2X2 U10 ( .A(inp1), .B(inp2), .S0(sel), .Y(mx_out) );
endmodule


module evMUX2_1_70 ( inp1, inp2, sel, mx_out );
  input inp1, inp2, sel;
  output mx_out;


  MX2X2 U10 ( .A(inp1), .B(inp2), .S0(sel), .Y(mx_out) );
endmodule


module evMUX2_1_69 ( inp1, inp2, sel, mx_out );
  input inp1, inp2, sel;
  output mx_out;


  MX2X2 U10 ( .A(inp1), .B(inp2), .S0(sel), .Y(mx_out) );
endmodule


module evMUX2_1_68 ( inp1, inp2, sel, mx_out );
  input inp1, inp2, sel;
  output mx_out;


  MX2X2 U10 ( .A(inp1), .B(inp2), .S0(sel), .Y(mx_out) );
endmodule


module evMUX2_1_67 ( inp1, inp2, sel, mx_out );
  input inp1, inp2, sel;
  output mx_out;


  MX2X1 U10 ( .A(inp1), .B(inp2), .S0(sel), .Y(mx_out) );
endmodule


module evMUX2_1_66 ( inp1, inp2, sel, mx_out );
  input inp1, inp2, sel;
  output mx_out;


  MX2X1 U10 ( .A(inp1), .B(inp2), .S0(sel), .Y(mx_out) );
endmodule


module evMUX2_1_65 ( inp1, inp2, sel, mx_out );
  input inp1, inp2, sel;
  output mx_out;


  MX2X1 U10 ( .A(inp1), .B(inp2), .S0(sel), .Y(mx_out) );
endmodule


module evMUX2_1_64 ( inp1, inp2, sel, mx_out );
  input inp1, inp2, sel;
  output mx_out;


  MX2X1 U10 ( .A(inp1), .B(inp2), .S0(sel), .Y(mx_out) );
endmodule


module evMUX2_1_63 ( inp1, inp2, sel, mx_out );
  input inp1, inp2, sel;
  output mx_out;


  MX2X1 U10 ( .A(inp1), .B(inp2), .S0(sel), .Y(mx_out) );
endmodule


module evMUX2_1_62 ( inp1, inp2, sel, mx_out );
  input inp1, inp2, sel;
  output mx_out;


  MX2X1 U10 ( .A(inp1), .B(inp2), .S0(sel), .Y(mx_out) );
endmodule


module evMUX2_1_61 ( inp1, inp2, sel, mx_out );
  input inp1, inp2, sel;
  output mx_out;


  MX2X1 U10 ( .A(inp1), .B(inp2), .S0(sel), .Y(mx_out) );
endmodule


module evMUX2_1_60 ( inp1, inp2, sel, mx_out );
  input inp1, inp2, sel;
  output mx_out;


  MX2X1 U10 ( .A(inp1), .B(inp2), .S0(sel), .Y(mx_out) );
endmodule


module evMUX2_1_59 ( inp1, inp2, sel, mx_out );
  input inp1, inp2, sel;
  output mx_out;


  MX2X1 U10 ( .A(inp1), .B(inp2), .S0(sel), .Y(mx_out) );
endmodule


module evMUX2_1_58 ( inp1, inp2, sel, mx_out );
  input inp1, inp2, sel;
  output mx_out;


  MX2X1 U10 ( .A(inp1), .B(inp2), .S0(sel), .Y(mx_out) );
endmodule


module evMUX2_1_57 ( inp1, inp2, sel, mx_out );
  input inp1, inp2, sel;
  output mx_out;


  MX2X1 U10 ( .A(inp1), .B(inp2), .S0(sel), .Y(mx_out) );
endmodule


module evMUX2_1_56 ( inp1, inp2, sel, mx_out );
  input inp1, inp2, sel;
  output mx_out;


  MX2X1 U10 ( .A(inp1), .B(inp2), .S0(sel), .Y(mx_out) );
endmodule


module evMUX2_1_55 ( inp1, inp2, sel, mx_out );
  input inp1, inp2, sel;
  output mx_out;


  MX2X1 U10 ( .A(inp1), .B(inp2), .S0(sel), .Y(mx_out) );
endmodule


module evMUX2_1_54 ( inp1, inp2, sel, mx_out );
  input inp1, inp2, sel;
  output mx_out;


  MX2X1 U10 ( .A(inp1), .B(inp2), .S0(sel), .Y(mx_out) );
endmodule


module evMUX2_1_53 ( inp1, inp2, sel, mx_out );
  input inp1, inp2, sel;
  output mx_out;


  MX2X1 U10 ( .A(inp1), .B(inp2), .S0(sel), .Y(mx_out) );
endmodule


module evMUX2_1_52 ( inp1, inp2, sel, mx_out );
  input inp1, inp2, sel;
  output mx_out;


  MX2X1 U10 ( .A(inp1), .B(inp2), .S0(sel), .Y(mx_out) );
endmodule


module evMUX2_1_51 ( inp1, inp2, sel, mx_out );
  input inp1, inp2, sel;
  output mx_out;


  MX2X1 U10 ( .A(inp1), .B(inp2), .S0(sel), .Y(mx_out) );
endmodule


module evMUX2_1_50 ( inp1, inp2, sel, mx_out );
  input inp1, inp2, sel;
  output mx_out;


  MX2X1 U10 ( .A(inp1), .B(inp2), .S0(sel), .Y(mx_out) );
endmodule


module evMUX2_1_49 ( inp1, inp2, sel, mx_out );
  input inp1, inp2, sel;
  output mx_out;


  MX2X1 U10 ( .A(inp1), .B(inp2), .S0(sel), .Y(mx_out) );
endmodule


module evMUX2_1_48 ( inp1, inp2, sel, mx_out );
  input inp1, inp2, sel;
  output mx_out;


  MX2X1 U10 ( .A(inp1), .B(inp2), .S0(sel), .Y(mx_out) );
endmodule


module evMUX2_1_47 ( inp1, inp2, sel, mx_out );
  input inp1, inp2, sel;
  output mx_out;


  MX2X1 U10 ( .A(inp1), .B(inp2), .S0(sel), .Y(mx_out) );
endmodule


module evMUX2_1_46 ( inp1, inp2, sel, mx_out );
  input inp1, inp2, sel;
  output mx_out;


  MX2X1 U10 ( .A(inp1), .B(inp2), .S0(sel), .Y(mx_out) );
endmodule


module evMUX2_1_45 ( inp1, inp2, sel, mx_out );
  input inp1, inp2, sel;
  output mx_out;


  MX2X1 U10 ( .A(inp1), .B(inp2), .S0(sel), .Y(mx_out) );
endmodule


module evMUX2_1_44 ( inp1, inp2, sel, mx_out );
  input inp1, inp2, sel;
  output mx_out;


  MX2X1 U10 ( .A(inp1), .B(inp2), .S0(sel), .Y(mx_out) );
endmodule


module evMUX2_1_43 ( inp1, inp2, sel, mx_out );
  input inp1, inp2, sel;
  output mx_out;


  MX2X1 U10 ( .A(inp1), .B(inp2), .S0(sel), .Y(mx_out) );
endmodule


module evMUX2_1_42 ( inp1, inp2, sel, mx_out );
  input inp1, inp2, sel;
  output mx_out;


  MX2X1 U10 ( .A(inp1), .B(inp2), .S0(sel), .Y(mx_out) );
endmodule


module evMUX2_1_41 ( inp1, inp2, sel, mx_out );
  input inp1, inp2, sel;
  output mx_out;


  MX2X1 U10 ( .A(inp1), .B(inp2), .S0(sel), .Y(mx_out) );
endmodule


module evMUX2_1_40 ( inp1, inp2, sel, mx_out );
  input inp1, inp2, sel;
  output mx_out;


  MX2X1 U10 ( .A(inp1), .B(inp2), .S0(sel), .Y(mx_out) );
endmodule


module evMUX2_1_39 ( inp1, inp2, sel, mx_out );
  input inp1, inp2, sel;
  output mx_out;


  MX2X1 U10 ( .A(inp1), .B(inp2), .S0(sel), .Y(mx_out) );
endmodule


module evMUX2_1_38 ( inp1, inp2, sel, mx_out );
  input inp1, inp2, sel;
  output mx_out;


  MX2X1 U10 ( .A(inp1), .B(inp2), .S0(sel), .Y(mx_out) );
endmodule


module evMUX2_1_37 ( inp1, inp2, sel, mx_out );
  input inp1, inp2, sel;
  output mx_out;


  MX2X1 U10 ( .A(inp1), .B(inp2), .S0(sel), .Y(mx_out) );
endmodule


module evMUX2_1_36 ( inp1, inp2, sel, mx_out );
  input inp1, inp2, sel;
  output mx_out;


  MX2X1 U10 ( .A(inp1), .B(inp2), .S0(sel), .Y(mx_out) );
endmodule


module evMUX2_1_35 ( inp1, inp2, sel, mx_out );
  input inp1, inp2, sel;
  output mx_out;


  MX2X1 U10 ( .A(inp1), .B(inp2), .S0(sel), .Y(mx_out) );
endmodule


module evMUX2_1_34 ( inp1, inp2, sel, mx_out );
  input inp1, inp2, sel;
  output mx_out;


  MX2X1 U10 ( .A(inp1), .B(inp2), .S0(sel), .Y(mx_out) );
endmodule


module evMUX2_1_33 ( inp1, inp2, sel, mx_out );
  input inp1, inp2, sel;
  output mx_out;


  MX2X1 U10 ( .A(inp1), .B(inp2), .S0(sel), .Y(mx_out) );
endmodule


module evMUX2_1_32 ( inp1, inp2, sel, mx_out );
  input inp1, inp2, sel;
  output mx_out;


  MX2X1 U10 ( .A(inp1), .B(inp2), .S0(sel), .Y(mx_out) );
endmodule


module evMUX2_1_31 ( inp1, inp2, sel, mx_out );
  input inp1, inp2, sel;
  output mx_out;


  MX2X1 U10 ( .A(inp1), .B(inp2), .S0(sel), .Y(mx_out) );
endmodule


module evMUX2_1_30 ( inp1, inp2, sel, mx_out );
  input inp1, inp2, sel;
  output mx_out;


  MX2X1 U10 ( .A(inp1), .B(inp2), .S0(sel), .Y(mx_out) );
endmodule


module evMUX2_1_29 ( inp1, inp2, sel, mx_out );
  input inp1, inp2, sel;
  output mx_out;


  MX2X1 U10 ( .A(inp1), .B(inp2), .S0(sel), .Y(mx_out) );
endmodule


module evMUX2_1_28 ( inp1, inp2, sel, mx_out );
  input inp1, inp2, sel;
  output mx_out;


  MX2X1 U10 ( .A(inp1), .B(inp2), .S0(sel), .Y(mx_out) );
endmodule


module evMUX2_1_27 ( inp1, inp2, sel, mx_out );
  input inp1, inp2, sel;
  output mx_out;


  MX2X1 U10 ( .A(inp1), .B(inp2), .S0(sel), .Y(mx_out) );
endmodule


module evMUX2_1_26 ( inp1, inp2, sel, mx_out );
  input inp1, inp2, sel;
  output mx_out;


  MX2X1 U10 ( .A(inp1), .B(inp2), .S0(sel), .Y(mx_out) );
endmodule


module evMUX2_1_25 ( inp1, inp2, sel, mx_out );
  input inp1, inp2, sel;
  output mx_out;


  MX2X1 U10 ( .A(inp1), .B(inp2), .S0(sel), .Y(mx_out) );
endmodule


module evMUX2_1_24 ( inp1, inp2, sel, mx_out );
  input inp1, inp2, sel;
  output mx_out;


  MX2X1 U10 ( .A(inp1), .B(inp2), .S0(sel), .Y(mx_out) );
endmodule


module evMUX2_1_23 ( inp1, inp2, sel, mx_out );
  input inp1, inp2, sel;
  output mx_out;


  MX2X1 U10 ( .A(inp1), .B(inp2), .S0(sel), .Y(mx_out) );
endmodule


module evMUX2_1_22 ( inp1, inp2, sel, mx_out );
  input inp1, inp2, sel;
  output mx_out;


  MX2X1 U10 ( .A(inp1), .B(inp2), .S0(sel), .Y(mx_out) );
endmodule


module evMUX2_1_21 ( inp1, inp2, sel, mx_out );
  input inp1, inp2, sel;
  output mx_out;


  MX2X1 U10 ( .A(inp1), .B(inp2), .S0(sel), .Y(mx_out) );
endmodule


module evMUX2_1_20 ( inp1, inp2, sel, mx_out );
  input inp1, inp2, sel;
  output mx_out;


  MX2X1 U10 ( .A(inp1), .B(inp2), .S0(sel), .Y(mx_out) );
endmodule


module evMUX2_1_19 ( inp1, inp2, sel, mx_out );
  input inp1, inp2, sel;
  output mx_out;


  MX2X1 U10 ( .A(inp1), .B(inp2), .S0(sel), .Y(mx_out) );
endmodule


module evMUX2_1_18 ( inp1, inp2, sel, mx_out );
  input inp1, inp2, sel;
  output mx_out;


  MX2X1 U10 ( .A(inp1), .B(inp2), .S0(sel), .Y(mx_out) );
endmodule


module evMUX2_1_17 ( inp1, inp2, sel, mx_out );
  input inp1, inp2, sel;
  output mx_out;


  MX2X1 U10 ( .A(inp1), .B(inp2), .S0(sel), .Y(mx_out) );
endmodule


module evMUX2_1_16 ( inp1, inp2, sel, mx_out );
  input inp1, inp2, sel;
  output mx_out;


  MX2X1 U10 ( .A(inp1), .B(inp2), .S0(sel), .Y(mx_out) );
endmodule


module evMUX2_1_15 ( inp1, inp2, sel, mx_out );
  input inp1, inp2, sel;
  output mx_out;


  MX2X1 U10 ( .A(inp1), .B(inp2), .S0(sel), .Y(mx_out) );
endmodule


module evMUX2_1_14 ( inp1, inp2, sel, mx_out );
  input inp1, inp2, sel;
  output mx_out;


  MX2X1 U10 ( .A(inp1), .B(inp2), .S0(sel), .Y(mx_out) );
endmodule


module evMUX2_1_13 ( inp1, inp2, sel, mx_out );
  input inp1, inp2, sel;
  output mx_out;


  MX2X1 U10 ( .A(inp1), .B(inp2), .S0(sel), .Y(mx_out) );
endmodule


module evMUX2_1_12 ( inp1, inp2, sel, mx_out );
  input inp1, inp2, sel;
  output mx_out;


  MX2X1 U10 ( .A(inp1), .B(inp2), .S0(sel), .Y(mx_out) );
endmodule


module evMUX2_1_11 ( inp1, inp2, sel, mx_out );
  input inp1, inp2, sel;
  output mx_out;


  MX2X1 U10 ( .A(inp1), .B(inp2), .S0(sel), .Y(mx_out) );
endmodule


module evMUX2_1_10 ( inp1, inp2, sel, mx_out );
  input inp1, inp2, sel;
  output mx_out;


  MX2X1 U10 ( .A(inp1), .B(inp2), .S0(sel), .Y(mx_out) );
endmodule


module evMUX2_1_9 ( inp1, inp2, sel, mx_out );
  input inp1, inp2, sel;
  output mx_out;


  MX2X1 U10 ( .A(inp1), .B(inp2), .S0(sel), .Y(mx_out) );
endmodule


module evMUX2_1_8 ( inp1, inp2, sel, mx_out );
  input inp1, inp2, sel;
  output mx_out;


  MX2X1 U10 ( .A(inp1), .B(inp2), .S0(sel), .Y(mx_out) );
endmodule


module evMUX2_1_7 ( inp1, inp2, sel, mx_out );
  input inp1, inp2, sel;
  output mx_out;


  MX2X1 U10 ( .A(inp1), .B(inp2), .S0(sel), .Y(mx_out) );
endmodule


module evMUX2_1_6 ( inp1, inp2, sel, mx_out );
  input inp1, inp2, sel;
  output mx_out;


  MX2X1 U10 ( .A(inp1), .B(inp2), .S0(sel), .Y(mx_out) );
endmodule


module evMUX2_1_5 ( inp1, inp2, sel, mx_out );
  input inp1, inp2, sel;
  output mx_out;


  MX2X1 U10 ( .A(inp1), .B(inp2), .S0(sel), .Y(mx_out) );
endmodule


module evMUX2_1_4 ( inp1, inp2, sel, mx_out );
  input inp1, inp2, sel;
  output mx_out;


  MX2X1 U10 ( .A(inp1), .B(inp2), .S0(sel), .Y(mx_out) );
endmodule


module evMUX2_1_3 ( inp1, inp2, sel, mx_out );
  input inp1, inp2, sel;
  output mx_out;


  MX2X1 U10 ( .A(inp1), .B(inp2), .S0(sel), .Y(mx_out) );
endmodule


module evMUX2_1_2 ( inp1, inp2, sel, mx_out );
  input inp1, inp2, sel;
  output mx_out;


  MX2X1 U10 ( .A(inp1), .B(inp2), .S0(sel), .Y(mx_out) );
endmodule


module evMUX2_1_1 ( inp1, inp2, sel, mx_out );
  input inp1, inp2, sel;
  output mx_out;


  MX2X1 U10 ( .A(inp1), .B(inp2), .S0(sel), .Y(mx_out) );
endmodule


module evMUX2_1_0 ( inp1, inp2, sel, mx_out );
  input inp1, inp2, sel;
  output mx_out;


  MX2X1 U10 ( .A(inp1), .B(inp2), .S0(sel), .Y(mx_out) );
endmodule


module evRst_Latch_cell_2 ( din, unlock, reset_n, dout );
  input din, unlock, reset_n;
  output dout;


  TLATRX4 dout_reg ( .G(unlock), .D(din), .RN(reset_n), .Q(dout) );
endmodule


module evPrst_Latch_cell ( din, unlock, reset_n, dout );
  input din, unlock, reset_n;
  output dout;


  TLATSX4 dout_reg ( .G(unlock), .SN(reset_n), .D(din), .Q(dout) );
endmodule


module evCINV_15 ( a, a_not );
  input a;
  output a_not;


  CLKINVX1 U7 ( .A(a), .Y(a_not) );
endmodule


module evLatch_cell_15 ( din, unlock, dout );
  input din, unlock;
  output dout;
  wire   n_12;
  assign n_12 = unlock;

  TLATX1 dout_reg ( .G(n_12), .D(din), .Q(dout) );
endmodule


module evMS_Prstbl_FlipFlop ( din, clock, reset_n, dout );
  input din, clock, reset_n;
  output dout;


  DFFSHQXL dout_reg ( .D(din), .CK(clock), .SN(reset_n), .Q(dout) );
endmodule


module evClockGator_RngCntrR_2 ( entr, leave, clk_in_n, rst, clk_ot );
  input entr, leave, clk_in_n, rst;
  output clk_ot;
  wire   clock_allowed, sel_lin;

  evMUX2_1_2 line_selector ( .inp1(entr), .inp2(leave), .sel(clock_allowed), 
        .mx_out(sel_lin) );
  evRst_Latch_cell_2 rlatch ( .din(entr), .unlock(sel_lin), .reset_n(rst), 
        .dout(clock_allowed) );
  NAND2X1 U7 ( .A(clock_allowed), .B(clk_in_n), .Y(clk_ot) );
endmodule


module evClockGator_RngCntrP ( entr, leave, clk_in_n, rst, clk_ot );
  input entr, leave, clk_in_n, rst;
  output clk_ot;
  wire   clock_allowed, sel_lin;

  evMUX2_1_3 line_selector ( .inp1(entr), .inp2(leave), .sel(clock_allowed), 
        .mx_out(sel_lin) );
  evPrst_Latch_cell prlatch ( .din(entr), .unlock(sel_lin), .reset_n(rst), 
        .dout(clock_allowed) );
  NAND2X1 U7 ( .A(clock_allowed), .B(clk_in_n), .Y(clk_ot) );
endmodule


module evMS_Rstbl_FlipFlop_46 ( din, clock, reset_n, dout );
  input din, clock, reset_n;
  output dout;


  DFFRHQX1 dout_reg ( .D(din), .CK(clock), .RN(reset_n), .Q(dout) );
endmodule


module evNMOS_15 ( src, gat, drn );
  input src, gat;
  output drn;
  wire   n13;
  tri   drn;

  TBUFIX2 drn_tri ( .A(n13), .OE(gat), .Y(drn) );
  CLKINVX1 U6 ( .A(src), .Y(n13) );
endmodule


module evLPFA_15 ( a, b, cin, sum, cout );
  input a, b, cin;
  output sum, cout;
  wire   a_not, a_xor_b, a_xnor_b;

  evCINV_15 inv ( .a(a), .a_not(a_not) );
  evMUX2_1_67 mx1 ( .inp1(a), .inp2(a_not), .sel(b), .mx_out(a_xor_b) );
  evMUX2_1_66 mx2 ( .inp1(a_not), .inp2(a), .sel(b), .mx_out(a_xnor_b) );
  evMUX2_1_65 mx3 ( .inp1(a_xor_b), .inp2(a_xnor_b), .sel(cin), .mx_out(sum)
         );
  evMUX2_1_64 mx4 ( .inp1(b), .inp2(cin), .sel(a_xor_b), .mx_out(cout) );
endmodule


module evInpDemuxLatch_wdt16 ( din, sel, dout );
  input [15:0] sel;
  output [15:0] dout;
  input din;


  evLatch_cell_15 latch_0 ( .din(din), .unlock(sel[0]), .dout(dout[0]) );
  evLatch_cell_14 latch_1 ( .din(din), .unlock(sel[1]), .dout(dout[1]) );
  evLatch_cell_13 latch_2 ( .din(din), .unlock(sel[2]), .dout(dout[2]) );
  evLatch_cell_12 latch_3 ( .din(din), .unlock(sel[3]), .dout(dout[3]) );
  evLatch_cell_11 latch_4 ( .din(din), .unlock(sel[4]), .dout(dout[4]) );
  evLatch_cell_10 latch_5 ( .din(din), .unlock(sel[5]), .dout(dout[5]) );
  evLatch_cell_9 latch_6 ( .din(din), .unlock(sel[6]), .dout(dout[6]) );
  evLatch_cell_8 latch_7 ( .din(din), .unlock(sel[7]), .dout(dout[7]) );
  evLatch_cell_7 latch_8 ( .din(din), .unlock(sel[8]), .dout(dout[8]) );
  evLatch_cell_6 latch_9 ( .din(din), .unlock(sel[9]), .dout(dout[9]) );
  evLatch_cell_5 latch_10 ( .din(din), .unlock(sel[10]), .dout(dout[10]) );
  evLatch_cell_4 latch_11 ( .din(din), .unlock(sel[11]), .dout(dout[11]) );
  evLatch_cell_3 latch_12 ( .din(din), .unlock(sel[12]), .dout(dout[12]) );
  evLatch_cell_2 latch_13 ( .din(din), .unlock(sel[13]), .dout(dout[13]) );
  evLatch_cell_1 latch_14 ( .din(din), .unlock(sel[14]), .dout(dout[14]) );
  evLatch_cell_0 latch_15 ( .din(din), .unlock(sel[15]), .dout(dout[15]) );
endmodule


module evRingCounter_GtdClk_wdt16_block_size4 ( reset_n, clock_n, dout );
  output [15:0] dout;
  input reset_n, clock_n;
  wire   \gated_clock[3] , \gated_clock[2] , \gated_clock[1] ,
         \gated_clock[0] ;

  evClockGator_RngCntrP first_gator ( .entr(dout[15]), .leave(dout[4]), 
        .clk_in_n(clock_n), .rst(reset_n), .clk_ot(\gated_clock[0] ) );
  evClockGator_RngCntrR_2 gator_1 ( .entr(dout[3]), .leave(dout[8]), 
        .clk_in_n(clock_n), .rst(reset_n), .clk_ot(\gated_clock[1] ) );
  evClockGator_RngCntrR_1 gator_2 ( .entr(dout[7]), .leave(dout[12]), 
        .clk_in_n(clock_n), .rst(reset_n), .clk_ot(\gated_clock[2] ) );
  evClockGator_RngCntrR_0 last_gator_3 ( .entr(dout[11]), .leave(dout[0]), 
        .clk_in_n(clock_n), .rst(reset_n), .clk_ot(\gated_clock[3] ) );
  evMS_Prstbl_FlipFlop first_ff ( .din(dout[15]), .clock(\gated_clock[0] ), 
        .reset_n(reset_n), .dout(dout[0]) );
  evMS_Rstbl_FlipFlop_14 ff_1 ( .din(dout[0]), .clock(\gated_clock[0] ), 
        .reset_n(reset_n), .dout(dout[1]) );
  evMS_Rstbl_FlipFlop_13 ff_2 ( .din(dout[1]), .clock(\gated_clock[0] ), 
        .reset_n(reset_n), .dout(dout[2]) );
  evMS_Rstbl_FlipFlop_12 ff_3 ( .din(dout[2]), .clock(\gated_clock[0] ), 
        .reset_n(reset_n), .dout(dout[3]) );
  evMS_Rstbl_FlipFlop_11 ff_4 ( .din(dout[3]), .clock(\gated_clock[1] ), 
        .reset_n(reset_n), .dout(dout[4]) );
  evMS_Rstbl_FlipFlop_10 ff_5 ( .din(dout[4]), .clock(\gated_clock[1] ), 
        .reset_n(reset_n), .dout(dout[5]) );
  evMS_Rstbl_FlipFlop_9 ff_6 ( .din(dout[5]), .clock(\gated_clock[1] ), 
        .reset_n(reset_n), .dout(dout[6]) );
  evMS_Rstbl_FlipFlop_8 ff_7 ( .din(dout[6]), .clock(\gated_clock[1] ), 
        .reset_n(reset_n), .dout(dout[7]) );
  evMS_Rstbl_FlipFlop_7 ff_8 ( .din(dout[7]), .clock(\gated_clock[2] ), 
        .reset_n(reset_n), .dout(dout[8]) );
  evMS_Rstbl_FlipFlop_6 ff_9 ( .din(dout[8]), .clock(\gated_clock[2] ), 
        .reset_n(reset_n), .dout(dout[9]) );
  evMS_Rstbl_FlipFlop_5 ff_10 ( .din(dout[9]), .clock(\gated_clock[2] ), 
        .reset_n(reset_n), .dout(dout[10]) );
  evMS_Rstbl_FlipFlop_4 ff_11 ( .din(dout[10]), .clock(\gated_clock[2] ), 
        .reset_n(reset_n), .dout(dout[11]) );
  evMS_Rstbl_FlipFlop_3 ff_12 ( .din(dout[11]), .clock(\gated_clock[3] ), 
        .reset_n(reset_n), .dout(dout[12]) );
  evMS_Rstbl_FlipFlop_2 ff_13 ( .din(dout[12]), .clock(\gated_clock[3] ), 
        .reset_n(reset_n), .dout(dout[13]) );
  evMS_Rstbl_FlipFlop_1 ff_14 ( .din(dout[13]), .clock(\gated_clock[3] ), 
        .reset_n(reset_n), .dout(dout[14]) );
  evMS_Rstbl_FlipFlop_0 ff_15 ( .din(dout[14]), .clock(\gated_clock[3] ), 
        .reset_n(reset_n), .dout(dout[15]) );
endmodule


module evlpMux2_1_wdt17 ( inp1, inp2, sel, mx_out );
  input [16:0] inp1;
  input [16:0] inp2;
  output [16:0] mx_out;
  input sel;


  evMUX2_1_84 mux_0 ( .inp1(inp1[0]), .inp2(inp2[0]), .sel(sel), .mx_out(
        mx_out[0]) );
  evMUX2_1_83 mux_1 ( .inp1(inp1[1]), .inp2(inp2[1]), .sel(sel), .mx_out(
        mx_out[1]) );
  evMUX2_1_82 mux_2 ( .inp1(inp1[2]), .inp2(inp2[2]), .sel(sel), .mx_out(
        mx_out[2]) );
  evMUX2_1_81 mux_3 ( .inp1(inp1[3]), .inp2(inp2[3]), .sel(sel), .mx_out(
        mx_out[3]) );
  evMUX2_1_80 mux_4 ( .inp1(inp1[4]), .inp2(inp2[4]), .sel(sel), .mx_out(
        mx_out[4]) );
  evMUX2_1_79 mux_5 ( .inp1(inp1[5]), .inp2(inp2[5]), .sel(sel), .mx_out(
        mx_out[5]) );
  evMUX2_1_78 mux_6 ( .inp1(inp1[6]), .inp2(inp2[6]), .sel(sel), .mx_out(
        mx_out[6]) );
  evMUX2_1_77 mux_7 ( .inp1(inp1[7]), .inp2(inp2[7]), .sel(sel), .mx_out(
        mx_out[7]) );
  evMUX2_1_76 mux_8 ( .inp1(inp1[8]), .inp2(inp2[8]), .sel(sel), .mx_out(
        mx_out[8]) );
  evMUX2_1_75 mux_9 ( .inp1(inp1[9]), .inp2(inp2[9]), .sel(sel), .mx_out(
        mx_out[9]) );
  evMUX2_1_74 mux_10 ( .inp1(inp1[10]), .inp2(inp2[10]), .sel(sel), .mx_out(
        mx_out[10]) );
  evMUX2_1_73 mux_11 ( .inp1(inp1[11]), .inp2(inp2[11]), .sel(sel), .mx_out(
        mx_out[11]) );
  evMUX2_1_72 mux_12 ( .inp1(inp1[12]), .inp2(inp2[12]), .sel(sel), .mx_out(
        mx_out[12]) );
  evMUX2_1_71 mux_13 ( .inp1(inp1[13]), .inp2(inp2[13]), .sel(sel), .mx_out(
        mx_out[13]) );
  evMUX2_1_70 mux_14 ( .inp1(inp1[14]), .inp2(inp2[14]), .sel(sel), .mx_out(
        mx_out[14]) );
  evMUX2_1_69 mux_15 ( .inp1(inp1[15]), .inp2(inp2[15]), .sel(sel), .mx_out(
        mx_out[15]) );
  evMUX2_1_68 mux_16 ( .inp1(inp1[16]), .inp2(inp2[16]), .sel(sel), .mx_out(
        mx_out[16]) );
endmodule


module evlpRegister_wdt16_1 ( din, clock, reset_n, dout );
  input [15:0] din;
  output [15:0] dout;
  input clock, reset_n;


  evMS_Rstbl_FlipFlop_46 ff_0 ( .din(din[0]), .clock(clock), .reset_n(reset_n), 
        .dout(dout[0]) );
  evMS_Rstbl_FlipFlop_45 ff_1 ( .din(din[1]), .clock(clock), .reset_n(reset_n), 
        .dout(dout[1]) );
  evMS_Rstbl_FlipFlop_44 ff_2 ( .din(din[2]), .clock(clock), .reset_n(reset_n), 
        .dout(dout[2]) );
  evMS_Rstbl_FlipFlop_43 ff_3 ( .din(din[3]), .clock(clock), .reset_n(reset_n), 
        .dout(dout[3]) );
  evMS_Rstbl_FlipFlop_42 ff_4 ( .din(din[4]), .clock(clock), .reset_n(reset_n), 
        .dout(dout[4]) );
  evMS_Rstbl_FlipFlop_41 ff_5 ( .din(din[5]), .clock(clock), .reset_n(reset_n), 
        .dout(dout[5]) );
  evMS_Rstbl_FlipFlop_40 ff_6 ( .din(din[6]), .clock(clock), .reset_n(reset_n), 
        .dout(dout[6]) );
  evMS_Rstbl_FlipFlop_39 ff_7 ( .din(din[7]), .clock(clock), .reset_n(reset_n), 
        .dout(dout[7]) );
  evMS_Rstbl_FlipFlop_38 ff_8 ( .din(din[8]), .clock(clock), .reset_n(reset_n), 
        .dout(dout[8]) );
  evMS_Rstbl_FlipFlop_37 ff_9 ( .din(din[9]), .clock(clock), .reset_n(reset_n), 
        .dout(dout[9]) );
  evMS_Rstbl_FlipFlop_36 ff_10 ( .din(din[10]), .clock(clock), .reset_n(
        reset_n), .dout(dout[10]) );
  evMS_Rstbl_FlipFlop_35 ff_11 ( .din(din[11]), .clock(clock), .reset_n(
        reset_n), .dout(dout[11]) );
  evMS_Rstbl_FlipFlop_34 ff_12 ( .din(din[12]), .clock(clock), .reset_n(
        reset_n), .dout(dout[12]) );
  evMS_Rstbl_FlipFlop_33 ff_13 ( .din(din[13]), .clock(clock), .reset_n(
        reset_n), .dout(dout[13]) );
  evMS_Rstbl_FlipFlop_32 ff_14 ( .din(din[14]), .clock(clock), .reset_n(
        reset_n), .dout(dout[14]) );
  evMS_Rstbl_FlipFlop_31 ff_15 ( .din(din[15]), .clock(clock), .reset_n(
        reset_n), .dout(dout[15]) );
endmodule


module evNonEncodedMux_wdt16 ( din, sel, dout );
  input [15:0] din;
  input [15:0] sel;
  output dout;

  tri   dout;

  evNMOS_15 nms_0 ( .src(din[0]), .gat(sel[0]), .drn(dout) );
  evNMOS_14 nms_1 ( .src(din[1]), .gat(sel[1]), .drn(dout) );
  evNMOS_13 nms_2 ( .src(din[2]), .gat(sel[2]), .drn(dout) );
  evNMOS_12 nms_3 ( .src(din[3]), .gat(sel[3]), .drn(dout) );
  evNMOS_11 nms_4 ( .src(din[4]), .gat(sel[4]), .drn(dout) );
  evNMOS_10 nms_5 ( .src(din[5]), .gat(sel[5]), .drn(dout) );
  evNMOS_9 nms_6 ( .src(din[6]), .gat(sel[6]), .drn(dout) );
  evNMOS_8 nms_7 ( .src(din[7]), .gat(sel[7]), .drn(dout) );
  evNMOS_7 nms_8 ( .src(din[8]), .gat(sel[8]), .drn(dout) );
  evNMOS_6 nms_9 ( .src(din[9]), .gat(sel[9]), .drn(dout) );
  evNMOS_5 nms_10 ( .src(din[10]), .gat(sel[10]), .drn(dout) );
  evNMOS_4 nms_11 ( .src(din[11]), .gat(sel[11]), .drn(dout) );
  evNMOS_3 nms_12 ( .src(din[12]), .gat(sel[12]), .drn(dout) );
  evNMOS_2 nms_13 ( .src(din[13]), .gat(sel[13]), .drn(dout) );
  evNMOS_1 nms_14 ( .src(din[14]), .gat(sel[14]), .drn(dout) );
  evNMOS_0 nms_15 ( .src(din[15]), .gat(sel[15]), .drn(dout) );
endmodule


module evlpRCAdder_wdt16 ( a, b, cin, sum, cout );
  input [15:0] a;
  input [15:0] b;
  output [15:0] sum;
  input cin;
  output cout;
  wire   \imsg[15] , \imsg[14] , \imsg[13] , \imsg[12] , \imsg[11] ,
         \imsg[10] , \imsg[9] , \imsg[8] , \imsg[7] , \imsg[6] , \imsg[5] ,
         \imsg[4] , \imsg[3] , \imsg[2] , \imsg[1] ;

  evLPFA_15 adder_0 ( .a(a[0]), .b(b[0]), .cin(cin), .sum(sum[0]), .cout(
        \imsg[1] ) );
  evLPFA_14 adder_1 ( .a(a[1]), .b(b[1]), .cin(\imsg[1] ), .sum(sum[1]), 
        .cout(\imsg[2] ) );
  evLPFA_13 adder_2 ( .a(a[2]), .b(b[2]), .cin(\imsg[2] ), .sum(sum[2]), 
        .cout(\imsg[3] ) );
  evLPFA_12 adder_3 ( .a(a[3]), .b(b[3]), .cin(\imsg[3] ), .sum(sum[3]), 
        .cout(\imsg[4] ) );
  evLPFA_11 adder_4 ( .a(a[4]), .b(b[4]), .cin(\imsg[4] ), .sum(sum[4]), 
        .cout(\imsg[5] ) );
  evLPFA_10 adder_5 ( .a(a[5]), .b(b[5]), .cin(\imsg[5] ), .sum(sum[5]), 
        .cout(\imsg[6] ) );
  evLPFA_9 adder_6 ( .a(a[6]), .b(b[6]), .cin(\imsg[6] ), .sum(sum[6]), .cout(
        \imsg[7] ) );
  evLPFA_8 adder_7 ( .a(a[7]), .b(b[7]), .cin(\imsg[7] ), .sum(sum[7]), .cout(
        \imsg[8] ) );
  evLPFA_7 adder_8 ( .a(a[8]), .b(b[8]), .cin(\imsg[8] ), .sum(sum[8]), .cout(
        \imsg[9] ) );
  evLPFA_6 adder_9 ( .a(a[9]), .b(b[9]), .cin(\imsg[9] ), .sum(sum[9]), .cout(
        \imsg[10] ) );
  evLPFA_5 adder_10 ( .a(a[10]), .b(b[10]), .cin(\imsg[10] ), .sum(sum[10]), 
        .cout(\imsg[11] ) );
  evLPFA_4 adder_11 ( .a(a[11]), .b(b[11]), .cin(\imsg[11] ), .sum(sum[11]), 
        .cout(\imsg[12] ) );
  evLPFA_3 adder_12 ( .a(a[12]), .b(b[12]), .cin(\imsg[12] ), .sum(sum[12]), 
        .cout(\imsg[13] ) );
  evLPFA_2 adder_13 ( .a(a[13]), .b(b[13]), .cin(\imsg[13] ), .sum(sum[13]), 
        .cout(\imsg[14] ) );
  evLPFA_1 adder_14 ( .a(a[14]), .b(b[14]), .cin(\imsg[14] ), .sum(sum[14]), 
        .cout(\imsg[15] ) );
  evLPFA_0 adder_15 ( .a(a[15]), .b(b[15]), .cin(\imsg[15] ), .sum(sum[15]), 
        .cout(cout) );
endmodule


module evMUX2_1_85 ( inp1, inp2, sel, mx_out );
  input inp1, inp2, sel;
  output mx_out;


  MX2X2 U10 ( .A(inp1), .B(inp2), .S0(sel), .Y(mx_out) );
endmodule


module evMS_FlipFlop ( din, clock, dout );
  input din, clock;
  output dout;

  tri   din;

  DFFX1 dout_reg ( .D(din), .CK(clock), .Q(dout) );
endmodule


module evlpMultiplier16 ( a, b, rst, clk, clk_n, res );
  input [15:0] a;
  input [15:0] b;
  output [31:0] res;
  input rst, clk, clk_n;
  wire   bypreg_clk, fedreg_clk, cout, \this_cycle_result[0] , hot_B_bit,
         data_source_selector, n7, n8;
  wire   [15:0] adder_out;
  wire   [15:0] bypassed_operand;
  wire   [15:0] hot_bit_selector;
  wire   [15:0] adder_2nd_inp;
  tri   next_hot_B_bit;

  evMS_FlipFlop src_sel_ff ( .din(next_hot_B_bit), .clock(clk_n), .dout(
        hot_B_bit) );
  evMUX2_1_85 src_sel_mux ( .inp1(hot_B_bit), .inp2(b[0]), .sel(
        hot_bit_selector[0]), .mx_out(data_source_selector) );
  evlpRCAdder_wdt16 adder ( .a(a), .b(adder_2nd_inp), .cin(1'b0), .sum(
        adder_out), .cout(cout) );
  evNonEncodedMux_wdt16 nxt_hot_bit_mux ( .din({1'b0, b[15:1]}), .sel(
        hot_bit_selector), .dout(next_hot_B_bit) );
  evlpRegister_wdt16_1 bypass_reg ( .din(res[31:16]), .clock(bypreg_clk), 
        .reset_n(n8), .dout(bypassed_operand) );
  evlpRegister_wdt16_0 feeder_reg ( .din(res[31:16]), .clock(fedreg_clk), 
        .reset_n(n8), .dout(adder_2nd_inp) );
  evlpMux2_1_wdt17 mux ( .inp1({1'b0, bypassed_operand}), .inp2({cout, 
        adder_out}), .sel(data_source_selector), .mx_out({res[31:16], 
        \this_cycle_result[0] }) );
  evRingCounter_GtdClk_wdt16_block_size4 counter ( .reset_n(n8), .clock_n(
        clk_n), .dout(hot_bit_selector) );
  evInpDemuxLatch_wdt16 low_res_latch ( .din(n7), .sel(hot_bit_selector), 
        .dout(res[15:0]) );
  BUFX1 U8 ( .A(\this_cycle_result[0] ), .Y(n7) );
  BUFX4 U9 ( .A(rst), .Y(n8) );
  NOR2X2 U10 ( .A(next_hot_B_bit), .B(clk_n), .Y(bypreg_clk) );
  NAND2X1 U11 ( .A(next_hot_B_bit), .B(clk_n), .Y(fedreg_clk) );
endmodule

