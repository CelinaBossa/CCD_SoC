v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 1150 110 1150 150 {
lab=VidBuf}
N 1010 110 1010 150 {
lab=#net1}
N 1010 20 1010 50 {
lab=Vdd}
N 1150 20 1150 50 {
lab=Vdd}
N 1010 210 1010 240 {
lab=gnd}
N 1150 210 1150 240 {
lab=gnd}
N 1150 130 1180 130 {
lab=VidBuf}
N 1110 80 1110 180 {
lab=#net1}
N 1010 20 1150 20 {
lab=Vdd}
N 1010 240 1150 240 {
lab=gnd}
N 1010 130 1110 130 {
lab=#net1}
N 1010 180 1020 180 {
lab=gnd}
N 1020 180 1020 210 {
lab=gnd}
N 1010 210 1020 210 {
lab=gnd}
N 1150 180 1160 180 {
lab=gnd}
N 1160 180 1160 210 {
lab=gnd}
N 1150 210 1160 210 {
lab=gnd}
N 1150 80 1160 80 {
lab=Vdd}
N 1160 50 1160 80 {
lab=Vdd}
N 1150 50 1160 50 {
lab=Vdd}
N 1010 80 1020 80 {
lab=Vdd}
N 1020 50 1020 80 {
lab=Vdd}
N 1010 50 1020 50 {
lab=Vdd}
N 910 80 910 130 {
lab=Vin}
N 910 80 970 80 {
lab=Vin}
N 910 130 910 180 {
lab=Vin}
N 910 180 970 180 {
lab=Vin}
C {iopin.sym} 1180 130 0 0 {name=p1 lab=VidBuf}
C {ipin.sym} 910 130 0 0 {name=p2 lab=Vin}
C {/usr/local/share/pdk/sky130B/libs.tech/xschem/sky130_fd_pr/nfet_01v8.sym} 990 180 0 0 {name=M1
W=1
L=0.85
nf=1 
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {/usr/local/share/pdk/sky130B/libs.tech/xschem/sky130_fd_pr/pfet_01v8.sym} 990 80 0 0 {name=M2
W=1
L=0.85
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {/usr/local/share/pdk/sky130B/libs.tech/xschem/sky130_fd_pr/nfet_01v8.sym} 1130 180 0 0 {name=M3
W=1
L=0.85
nf=1 
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {/usr/local/share/pdk/sky130B/libs.tech/xschem/sky130_fd_pr/pfet_01v8.sym} 1130 80 0 0 {name=M4
W=1
L=0.85
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {ipin.sym} 1080 20 1 0 {name=p3 lab=Vdd}
C {ipin.sym} 1080 240 3 0 {name=p4 lab=gnd}
