// This is the unpowered netlist.
/* Generated by Yosys 0.30+48 (git sha1 14d50a176d5, gcc 8.3.1 -fPIC -Os) */

module digital_cs(enable, clk, f_select, phi_p, phi_l2, phi_l1, phi_r);
  input clk;
  wire clk;
  input enable;
  wire enable;
  input [7:0] f_select;
  wire [7:0] f_select;
  output phi_l1;
  wire phi_l1;
  output phi_l2;
  wire phi_l2;
  output phi_p;
  wire phi_p;
  output phi_r;
  wire phi_r;
  sky130_fd_sc_hd__conb_1 _0_ (
    .LO(phi_l1)
  );
  sky130_fd_sc_hd__conb_1 _1_ (
    .LO(phi_l2)
  );
  sky130_fd_sc_hd__conb_1 _2_ (
    .LO(phi_p)
  );
  sky130_fd_sc_hd__conb_1 _3_ (
    .LO(phi_r)
  );
endmodule

