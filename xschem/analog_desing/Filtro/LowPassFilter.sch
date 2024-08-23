v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 280 90 330 90 {
lab=out}
N 170 90 220 90 {
lab=in}
N 170 150 330 150 {
lab=GND}
N 210 110 250 110 {
lab=in}
N 210 90 210 110 {
lab=in}
C {/usr/local/share/pdk/sky130B/libs.tech/xschem/sky130_fd_pr/cap_mim_m3_1.sym} 330 120 0 0 {name=C1 model=cap_mim_m3_1 W=13 L=13 MF=1 spiceprefix=X}
C {gnd.sym} 330 150 0 0 {name=l1 lab=GND}
C {vsource.sym} 170 120 0 0 {name=Vin value="ac 0.5"}
C {lab_pin.sym} 170 90 0 0 {name=p1 sig_type=std_logic lab=in}
C {code_shown.sym} 80 560 0 0 {name=AC_simulation only_toplevel=false value=".lib /usr/local/share/pdk/sky130B/libs.tech/ngspice/sky130.lib.spice tt
.ac lin 100 1 10MEG
.save all
.end"}
C {/usr/local/share/pdk/sky130B/libs.tech/xschem/sky130_fd_pr/res_xhigh_po_0p35.sym} 250 90 3 0 {name=R2
L=15
model=res_xhigh_po_0p35
spiceprefix=X
mult=1}
C {lab_pin.sym} 330 90 2 0 {name=p3 sig_type=std_logic lab=out}
