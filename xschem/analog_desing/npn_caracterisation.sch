v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 260 50 280 50 {
lab=GND}
N 200 50 200 80 {
lab=vce}
N 200 140 200 170 {
lab=GND}
N 200 110 220 110 {
lab=GND}
N 220 110 220 140 {
lab=GND}
N 200 140 220 140 {
lab=GND}
N 80 110 160 110 {
lab=vbe}
N 80 170 80 200 {
lab=GND}
C {/usr/local/share/pdk/sky130B/libs.tech/xschem/sky130_fd_pr/npn_05v5.sym} 180 110 0 0 {name=Q1
model=npn_05v5_w1p00l2p00 m=1
spiceprefix=X
}
C {gnd.sym} 200 170 0 0 {name=l1 lab=GND}
C {vsource.sym} 80 140 0 0 {name=Vbe value=0 savecurrent=false}
C {vsource.sym} 230 50 3 0 {name=Vce value=5 savecurrent=false}
C {gnd.sym} 80 200 0 0 {name=l2 lab=GND}
C {gnd.sym} 280 50 3 0 {name=l3 lab=GND}
C {code_shown.sym} 300 220 0 0 {name=DC_simulation only_toplevel=false value=".lib /usr/local/share/pdk/sky130A/libs.tech/ngspice/sky130.lib.spice tt
.dc Vbe 0 5 5m
.save all
.end"}
C {lab_pin.sym} 80 110 0 0 {name=p1 sig_type=std_logic lab=vbe}
C {lab_pin.sym} 200 50 0 0 {name=p2 sig_type=std_logic lab=vce}
