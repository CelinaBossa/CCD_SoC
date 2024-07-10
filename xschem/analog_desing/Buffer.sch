v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 420 190 470 190 {
lab=VidBuf}
N 230 160 230 210 {
lab=#net1}
N 230 190 360 190 {
lab=#net1}
N 230 80 230 100 {
lab=#net2}
N 230 -10 230 20 {
lab=VDD}
N 70 130 190 130 {
lab=#net3}
N -50 130 10 130 {
lab=#net4}
N 230 270 230 340 {
lab=GND}
N -150 130 -110 130 {
lab=Vin}
C {/usr/local/share/pdk/sky130B/libs.tech/xschem/sky130_fd_pr/npn_05v5.sym} 210 130 0 0 {name=Q1
model=npn_05v5_w1p00l2p00 m=1
spiceprefix=X
}
C {vdd.sym} 230 -10 0 0 {name=l1 lab=VDD}
C {gnd.sym} 230 340 0 0 {name=l2 lab=GND}
C {/usr/local/share/pdk/sky130B/libs.tech/xschem/sky130_fd_pr/cap_mim_m3_1.sym} 390 190 3 0 {name=C1 model=cap_mim_m3_1 W=1 L=1 MF=1 spiceprefix=X}
C {iopin.sym} 470 190 0 0 {name=p1 lab=VidBuf}
C {/usr/local/share/pdk/sky130B/libs.tech/xschem/sky130_fd_pr/res_generic_l1.sym} 230 240 0 0 {name=Re
W=1
L=1
model=res_generic_l1
mult=1}
C {/usr/local/share/pdk/sky130B/libs.tech/xschem/sky130_fd_pr/res_generic_l1.sym} 230 50 0 0 {name=Rc
W=1
L=1
model=res_generic_l1
mult=1}
C {/usr/local/share/pdk/sky130B/libs.tech/xschem/sky130_fd_pr/cap_mim_m3_1.sym} 40 130 3 0 {name=C2 model=cap_mim_m3_1 W=1 L=1 MF=1 spiceprefix=X}
C {/usr/local/share/pdk/sky130B/libs.tech/xschem/sky130_fd_pr/res_generic_l1.sym} -80 130 1 0 {name=Rs
W=0.96
L=17.7
model=res_generic_l1
mult=1}
C {ipin.sym} -150 130 0 0 {name=p2 lab=Vin}
