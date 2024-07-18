v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 280 90 330 90 {
lab=Vout}
N 330 90 440 90 {
lab=Vout}
N 170 90 220 90 {
lab=Vin}
C {/usr/local/share/pdk/sky130B/libs.tech/xschem/sky130_fd_pr/cap_mim_m3_1.sym} 330 120 0 0 {name=C1 model=cap_mim_m3_1 W=1 L=1 MF=1 spiceprefix=X}
C {/usr/local/share/pdk/sky130B/libs.tech/xschem/sky130_fd_pr/res_generic_po.sym} 250 90 3 0 {name=R1
W=0.0482
L=10
model=res_generic_po
spiceprefix=X
mult=1}
C {ipin.sym} 170 90 0 0 {name=p1 lab=Vin}
C {iopin.sym} 440 90 0 0 {name=p2 lab=Vout}
C {gnd.sym} 330 150 0 0 {name=l1 lab=GND}
