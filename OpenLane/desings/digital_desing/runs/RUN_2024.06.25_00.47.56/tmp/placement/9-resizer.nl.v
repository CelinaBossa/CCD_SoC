module pulse_generator (clk,
    comb_out,
    rst,
    sync_out,
    DIVIDE_BY_N);
 input clk;
 output comb_out;
 input rst;
 output sync_out;
 input [3:0] DIVIDE_BY_N;

 wire _000_;
 wire _001_;
 wire _002_;
 wire _003_;
 wire _004_;
 wire _005_;
 wire _006_;
 wire _007_;
 wire _008_;
 wire _009_;
 wire _010_;
 wire _011_;
 wire _012_;
 wire _013_;
 wire _014_;
 wire _015_;
 wire _016_;
 wire _017_;
 wire _018_;
 wire _019_;
 wire _020_;
 wire _021_;
 wire _022_;
 wire _023_;
 wire _024_;
 wire _025_;
 wire _026_;
 wire _027_;
 wire _028_;
 wire _029_;
 wire _030_;
 wire _031_;
 wire _032_;
 wire _033_;
 wire _034_;
 wire _035_;
 wire _036_;
 wire _037_;
 wire _038_;
 wire _039_;
 wire _040_;
 wire _041_;
 wire _042_;
 wire _043_;
 wire _044_;
 wire _045_;
 wire _046_;
 wire _047_;
 wire _048_;
 wire _049_;
 wire _050_;
 wire _051_;
 wire _052_;
 wire _053_;
 wire _054_;
 wire _055_;
 wire _056_;
 wire _057_;
 wire _058_;
 wire _059_;
 wire _060_;
 wire _061_;
 wire \count[0] ;
 wire \count[10] ;
 wire \count[1] ;
 wire \count[2] ;
 wire \count[3] ;
 wire \count[4] ;
 wire \count[5] ;
 wire \count[6] ;
 wire \count[7] ;
 wire \count[8] ;
 wire \count[9] ;
 wire net1;
 wire net2;
 wire net3;
 wire net4;
 wire net5;
 wire net6;
 wire net7;

 sky130_fd_sc_hd__o21ai_1 _062_ (.A1(net1),
    .A2(net2),
    .B1(net3),
    .Y(_015_));
 sky130_fd_sc_hd__and3_1 _063_ (.A(\count[2] ),
    .B(_014_),
    .C(_015_),
    .X(_016_));
 sky130_fd_sc_hd__a21oi_1 _064_ (.A1(_011_),
    .A2(_012_),
    .B1(\count[3] ),
    .Y(_017_));
 sky130_fd_sc_hd__a21oi_1 _065_ (.A1(_014_),
    .A2(_015_),
    .B1(\count[2] ),
    .Y(_018_));
 sky130_fd_sc_hd__or4_1 _066_ (.A(_013_),
    .B(_016_),
    .C(_017_),
    .D(_018_),
    .X(_019_));
 sky130_fd_sc_hd__xor2_1 _067_ (.A(net1),
    .B(net2),
    .X(_020_));
 sky130_fd_sc_hd__nor2_1 _068_ (.A(\count[1] ),
    .B(_020_),
    .Y(_021_));
 sky130_fd_sc_hd__a2bb2o_1 _069_ (.A1_N(net1),
    .A2_N(\count[0] ),
    .B1(\count[1] ),
    .B2(_020_),
    .X(_022_));
 sky130_fd_sc_hd__nor2_1 _070_ (.A(_021_),
    .B(_022_),
    .Y(_023_));
 sky130_fd_sc_hd__nor2_1 _071_ (.A(net4),
    .B(_014_),
    .Y(_024_));
 sky130_fd_sc_hd__or4_1 _072_ (.A(\count[7] ),
    .B(\count[6] ),
    .C(\count[5] ),
    .D(\count[4] ),
    .X(_025_));
 sky130_fd_sc_hd__or4_1 _073_ (.A(\count[10] ),
    .B(\count[9] ),
    .C(\count[8] ),
    .D(_025_),
    .X(_026_));
 sky130_fd_sc_hd__nor2_1 _074_ (.A(_024_),
    .B(_026_),
    .Y(_027_));
 sky130_fd_sc_hd__nand2_1 _075_ (.A(net1),
    .B(\count[0] ),
    .Y(_028_));
 sky130_fd_sc_hd__and4b_1 _076_ (.A_N(_019_),
    .B(_023_),
    .C(_027_),
    .D(_028_),
    .X(_029_));
 sky130_fd_sc_hd__buf_1 _077_ (.A(_029_),
    .X(net6));
 sky130_fd_sc_hd__buf_2 _078_ (.A(_024_),
    .X(_030_));
 sky130_fd_sc_hd__nand2_1 _079_ (.A(\count[1] ),
    .B(_020_),
    .Y(_031_));
 sky130_fd_sc_hd__o21a_1 _080_ (.A1(_021_),
    .A2(_022_),
    .B1(_031_),
    .X(_032_));
 sky130_fd_sc_hd__o21bai_1 _081_ (.A1(_013_),
    .A2(_016_),
    .B1_N(_017_),
    .Y(_033_));
 sky130_fd_sc_hd__o211a_1 _082_ (.A1(_019_),
    .A2(_032_),
    .B1(_033_),
    .C1(_027_),
    .X(_034_));
 sky130_fd_sc_hd__buf_2 _083_ (.A(_034_),
    .X(_035_));
 sky130_fd_sc_hd__inv_2 _084_ (.A(\count[0] ),
    .Y(_036_));
 sky130_fd_sc_hd__inv_2 _085_ (.A(net5),
    .Y(_037_));
 sky130_fd_sc_hd__buf_2 _086_ (.A(_037_),
    .X(_038_));
 sky130_fd_sc_hd__o211a_1 _087_ (.A1(_030_),
    .A2(_035_),
    .B1(_036_),
    .C1(_038_),
    .X(_000_));
 sky130_fd_sc_hd__nand2_1 _088_ (.A(\count[0] ),
    .B(\count[1] ),
    .Y(_039_));
 sky130_fd_sc_hd__or2_1 _089_ (.A(\count[0] ),
    .B(\count[1] ),
    .X(_040_));
 sky130_fd_sc_hd__o2111a_1 _090_ (.A1(_030_),
    .A2(_035_),
    .B1(_039_),
    .C1(_040_),
    .D1(_038_),
    .X(_001_));
 sky130_fd_sc_hd__and3_1 _091_ (.A(\count[0] ),
    .B(\count[1] ),
    .C(\count[2] ),
    .X(_041_));
 sky130_fd_sc_hd__a21oi_1 _092_ (.A1(\count[0] ),
    .A2(\count[1] ),
    .B1(\count[2] ),
    .Y(_042_));
 sky130_fd_sc_hd__nor2_1 _093_ (.A(_041_),
    .B(_042_),
    .Y(_043_));
 sky130_fd_sc_hd__o211a_1 _094_ (.A1(_030_),
    .A2(_035_),
    .B1(_043_),
    .C1(_038_),
    .X(_002_));
 sky130_fd_sc_hd__and4_1 _095_ (.A(\count[0] ),
    .B(\count[1] ),
    .C(\count[3] ),
    .D(\count[2] ),
    .X(_044_));
 sky130_fd_sc_hd__nor2_1 _096_ (.A(\count[3] ),
    .B(_041_),
    .Y(_045_));
 sky130_fd_sc_hd__nor2_1 _097_ (.A(_044_),
    .B(_045_),
    .Y(_046_));
 sky130_fd_sc_hd__o211a_1 _098_ (.A1(_030_),
    .A2(_035_),
    .B1(_046_),
    .C1(_038_),
    .X(_003_));
 sky130_fd_sc_hd__nand2_1 _099_ (.A(\count[4] ),
    .B(_044_),
    .Y(_047_));
 sky130_fd_sc_hd__or2_1 _100_ (.A(\count[4] ),
    .B(_044_),
    .X(_048_));
 sky130_fd_sc_hd__o2111a_1 _101_ (.A1(_030_),
    .A2(_035_),
    .B1(_047_),
    .C1(_048_),
    .D1(_038_),
    .X(_004_));
 sky130_fd_sc_hd__and3_1 _102_ (.A(\count[5] ),
    .B(\count[4] ),
    .C(_044_),
    .X(_049_));
 sky130_fd_sc_hd__a21oi_1 _103_ (.A1(\count[4] ),
    .A2(_044_),
    .B1(\count[5] ),
    .Y(_050_));
 sky130_fd_sc_hd__nor2_1 _104_ (.A(_049_),
    .B(_050_),
    .Y(_051_));
 sky130_fd_sc_hd__o211a_1 _105_ (.A1(_030_),
    .A2(_035_),
    .B1(_051_),
    .C1(_038_),
    .X(_005_));
 sky130_fd_sc_hd__and4_1 _106_ (.A(\count[6] ),
    .B(\count[5] ),
    .C(\count[4] ),
    .D(_044_),
    .X(_052_));
 sky130_fd_sc_hd__nor2_1 _107_ (.A(\count[6] ),
    .B(_049_),
    .Y(_053_));
 sky130_fd_sc_hd__nor2_1 _108_ (.A(_052_),
    .B(_053_),
    .Y(_054_));
 sky130_fd_sc_hd__o211a_1 _109_ (.A1(_030_),
    .A2(_035_),
    .B1(_054_),
    .C1(_038_),
    .X(_006_));
 sky130_fd_sc_hd__nand2_1 _110_ (.A(\count[7] ),
    .B(_052_),
    .Y(_055_));
 sky130_fd_sc_hd__or2_1 _111_ (.A(\count[7] ),
    .B(_052_),
    .X(_056_));
 sky130_fd_sc_hd__o2111a_1 _112_ (.A1(_024_),
    .A2(_034_),
    .B1(_055_),
    .C1(_056_),
    .D1(_037_),
    .X(_007_));
 sky130_fd_sc_hd__xnor2_1 _113_ (.A(\count[8] ),
    .B(_055_),
    .Y(_057_));
 sky130_fd_sc_hd__o211a_1 _114_ (.A1(_030_),
    .A2(_035_),
    .B1(_057_),
    .C1(_038_),
    .X(_008_));
 sky130_fd_sc_hd__and4_1 _115_ (.A(\count[7] ),
    .B(\count[9] ),
    .C(\count[8] ),
    .D(_052_),
    .X(_058_));
 sky130_fd_sc_hd__a31o_1 _116_ (.A1(\count[7] ),
    .A2(\count[8] ),
    .A3(_052_),
    .B1(\count[9] ),
    .X(_059_));
 sky130_fd_sc_hd__and2b_1 _117_ (.A_N(_058_),
    .B(_059_),
    .X(_060_));
 sky130_fd_sc_hd__o211a_1 _118_ (.A1(_030_),
    .A2(_035_),
    .B1(_060_),
    .C1(_038_),
    .X(_009_));
 sky130_fd_sc_hd__xor2_1 _119_ (.A(\count[10] ),
    .B(_058_),
    .X(_061_));
 sky130_fd_sc_hd__o211a_1 _120_ (.A1(_030_),
    .A2(_035_),
    .B1(_061_),
    .C1(_038_),
    .X(_010_));
 sky130_fd_sc_hd__or4_1 _121_ (.A(net4),
    .B(net3),
    .C(net1),
    .D(net2),
    .X(_011_));
 sky130_fd_sc_hd__o31ai_1 _122_ (.A1(net3),
    .A2(net1),
    .A3(net2),
    .B1(net4),
    .Y(_012_));
 sky130_fd_sc_hd__and3_1 _123_ (.A(\count[3] ),
    .B(_011_),
    .C(_012_),
    .X(_013_));
 sky130_fd_sc_hd__or3_1 _124_ (.A(net3),
    .B(net1),
    .C(net2),
    .X(_014_));
 sky130_fd_sc_hd__dfxtp_1 _125_ (.CLK(clk),
    .D(_000_),
    .Q(\count[0] ));
 sky130_fd_sc_hd__dfxtp_1 _126_ (.CLK(clk),
    .D(_001_),
    .Q(\count[1] ));
 sky130_fd_sc_hd__dfxtp_1 _127_ (.CLK(clk),
    .D(_002_),
    .Q(\count[2] ));
 sky130_fd_sc_hd__dfxtp_1 _128_ (.CLK(clk),
    .D(_003_),
    .Q(\count[3] ));
 sky130_fd_sc_hd__dfxtp_1 _129_ (.CLK(clk),
    .D(_004_),
    .Q(\count[4] ));
 sky130_fd_sc_hd__dfxtp_1 _130_ (.CLK(clk),
    .D(_005_),
    .Q(\count[5] ));
 sky130_fd_sc_hd__dfxtp_1 _131_ (.CLK(clk),
    .D(_006_),
    .Q(\count[6] ));
 sky130_fd_sc_hd__dfxtp_1 _132_ (.CLK(clk),
    .D(_007_),
    .Q(\count[7] ));
 sky130_fd_sc_hd__dfxtp_1 _133_ (.CLK(clk),
    .D(_008_),
    .Q(\count[8] ));
 sky130_fd_sc_hd__dfxtp_1 _134_ (.CLK(clk),
    .D(_009_),
    .Q(\count[9] ));
 sky130_fd_sc_hd__dfxtp_1 _135_ (.CLK(clk),
    .D(_010_),
    .Q(\count[10] ));
 sky130_fd_sc_hd__dfxtp_1 _136_ (.CLK(clk),
    .D(net6),
    .Q(net7));
 sky130_fd_sc_hd__decap_3 PHY_0 ();
 sky130_fd_sc_hd__decap_3 PHY_1 ();
 sky130_fd_sc_hd__decap_3 PHY_2 ();
 sky130_fd_sc_hd__decap_3 PHY_3 ();
 sky130_fd_sc_hd__decap_3 PHY_4 ();
 sky130_fd_sc_hd__decap_3 PHY_5 ();
 sky130_fd_sc_hd__decap_3 PHY_6 ();
 sky130_fd_sc_hd__decap_3 PHY_7 ();
 sky130_fd_sc_hd__decap_3 PHY_8 ();
 sky130_fd_sc_hd__decap_3 PHY_9 ();
 sky130_fd_sc_hd__decap_3 PHY_10 ();
 sky130_fd_sc_hd__decap_3 PHY_11 ();
 sky130_fd_sc_hd__decap_3 PHY_12 ();
 sky130_fd_sc_hd__decap_3 PHY_13 ();
 sky130_fd_sc_hd__decap_3 PHY_14 ();
 sky130_fd_sc_hd__decap_3 PHY_15 ();
 sky130_fd_sc_hd__decap_3 PHY_16 ();
 sky130_fd_sc_hd__decap_3 PHY_17 ();
 sky130_fd_sc_hd__decap_3 PHY_18 ();
 sky130_fd_sc_hd__decap_3 PHY_19 ();
 sky130_fd_sc_hd__decap_3 PHY_20 ();
 sky130_fd_sc_hd__decap_3 PHY_21 ();
 sky130_fd_sc_hd__decap_3 PHY_22 ();
 sky130_fd_sc_hd__decap_3 PHY_23 ();
 sky130_fd_sc_hd__decap_3 PHY_24 ();
 sky130_fd_sc_hd__decap_3 PHY_25 ();
 sky130_fd_sc_hd__decap_3 PHY_26 ();
 sky130_fd_sc_hd__decap_3 PHY_27 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_28 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_29 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_30 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_31 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_32 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_33 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_34 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_35 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_36 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_37 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_38 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_39 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_40 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_41 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_42 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_43 ();
 sky130_fd_sc_hd__clkbuf_2 input1 (.A(DIVIDE_BY_N[0]),
    .X(net1));
 sky130_fd_sc_hd__dlymetal6s2s_1 input2 (.A(DIVIDE_BY_N[1]),
    .X(net2));
 sky130_fd_sc_hd__buf_1 input3 (.A(DIVIDE_BY_N[2]),
    .X(net3));
 sky130_fd_sc_hd__buf_1 input4 (.A(DIVIDE_BY_N[3]),
    .X(net4));
 sky130_fd_sc_hd__clkbuf_1 input5 (.A(rst),
    .X(net5));
 sky130_fd_sc_hd__clkbuf_4 output6 (.A(net6),
    .X(comb_out));
 sky130_fd_sc_hd__clkbuf_4 output7 (.A(net7),
    .X(sync_out));
endmodule
