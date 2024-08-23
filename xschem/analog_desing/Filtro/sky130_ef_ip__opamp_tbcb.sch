v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
T {Instrumentation Amplifier as follower Testbench} 560 -1570 0 0 0.6 0.6 {}
N 1180 -1300 1260 -1300 {
lab=out}
N 1350 -1300 1420 -1300 {
lab=out}
N 530 -1280 530 -1260 {
lab=in}
N 780 -1210 780 -1170 {
lab=ena}
N 850 -1260 880 -1260 {
lab=out}
N 470 -1430 880 -1430 {
lab=vdd3v3}
N 780 -1210 880 -1210 {
lab=ena}
N 470 -1430 470 -1300 {
lab=vdd3v3}
N 530 -1340 530 -1280 {
lab=in}
N 850 -1110 1200 -1110 {
lab=out}
N 1200 -1300 1200 -1110 {
lab=out}
N 850 -1260 850 -1110 {
lab=out}
N 880 -1170 880 -1070 {
lab=GND}
N 470 -1070 1260 -1070 {
lab=GND}
N 470 -1240 470 -1070 {
lab=GND}
N 780 -1110 780 -1070 {
lab=GND}
N 530 -1200 530 -1070 {
lab=GND}
N 530 -1340 550 -1340 {
lab=in}
N 610 -1340 670 -1340 {
lab=#net1}
N 650 -1490 840 -1490 {
lab=#net1}
N 650 -1490 650 -1340 {
lab=#net1}
N 900 -1490 1190 -1490 {
lab=out}
N 1200 -1490 1200 -1300 {
lab=out}
N 1190 -1490 1200 -1490 {
lab=out}
N 1330 -1300 1350 -1300 {
lab=out}
N 1260 -1300 1330 -1300 {
lab=out}
N 540 -1360 580 -1360 {
lab=in}
N 540 -1360 540 -1340 {
lab=in}
N 690 -1240 690 -1170 {
lab=#net2}
N 690 -1240 790 -1240 {
lab=#net2}
N 790 -1340 790 -1240 {
lab=#net2}
N 730 -1340 790 -1340 {
lab=#net2}
N 790 -1340 880 -1340 {
lab=#net2}
N 690 -1110 690 -1070 {
lab=GND}
N 650 -1360 700 -1360 {
lab=#net1}
C {vsource.sym} 470 -1270 0 0 {name=V1 value=1.8}
C {opin.sym} 1420 -1300 0 0 {name=p1 lab=out}
C {vsource.sym} 530 -1230 0 0 {name=V2 value="ac 0.6"}
C {devices/title-2.sym} -700 -190 0 0 {name=l2 author="Tim Edwards" rev=1.0}
C {code.sym} 560 -970 0 0 {name=s1 only_toplevel=false value=".lib /usr/local/share/pdk/sky130A/libs.tech/combined/sky130.lib.spice tt"}
C {code.sym} 790 -970 0 0 {name=s2 only_toplevel=false value=".control
ac lin 10000 1 5MEG
plot db(V(out)/V(in))
.endc"}
C {lab_pin.sym} 470 -1300 0 0 {name=p3 sig_type=std_logic lab=vdd3v3}
C {lab_pin.sym} 530 -1280 0 0 {name=p5 sig_type=std_logic lab=in}
C {sky130_ef_ip__opamp.sym} 1030 -1300 0 0 {name=x1}
C {vsource.sym} 780 -1140 0 0 {name=V3 value=1.8}
C {gnd.sym} 740 -1070 0 0 {name=l4 lab=GND}
C {lab_pin.sym} 780 -1210 0 0 {name=p2 sig_type=std_logic lab=ena}
C {/usr/local/share/pdk/sky130A/libs.tech/xschem/sky130_fd_pr/cap_mim_m3_1.sym} 870 -1490 1 0 {name=C2 model=cap_mim_m3_1 W=2.64 L=0.1 MF=1 spiceprefix=X}
C {/usr/local/share/pdk/sky130A/libs.tech/xschem/sky130_fd_pr/res_xhigh_po_0p35.sym} 580 -1340 1 0 {name=R1
L=1
model=res_xhigh_po_0p35
spiceprefix=X
mult=1}
C {/usr/local/share/pdk/sky130A/libs.tech/xschem/sky130_fd_pr/res_xhigh_po_0p35.sym} 700 -1340 1 0 {name=R2
L=0.35
model=res_xhigh_po_0p35
spiceprefix=X
mult=1}
C {/usr/local/share/pdk/sky130A/libs.tech/xschem/sky130_fd_pr/cap_mim_m3_1.sym} 690 -1140 2 0 {name=C1 model=cap_mim_m3_1 W=1 L=1 MF=1 spiceprefix=X}
