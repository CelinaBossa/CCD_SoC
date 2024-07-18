v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 260 -70 260 -40 {
lab=GND}
N 260 20 260 50 {
lab=#net1}
N 260 180 260 210 {
lab=GND}
N 60 110 60 120 {
lab=Vin}
N 60 110 160 110 {
lab=Vin}
N 60 180 60 210 {
lab=GND}
C {/home/celina/Tesis/xschem/analog_desing/Buffer.sym} 280 -40 0 0 {name=x1}
C {vsource.sym} 60 150 0 0 {name=Vin value=0 savecurrent=false}
C {vsource.sym} 260 -10 2 0 {name=V2 value=1.8 savecurrent=false}
C {gnd.sym} 260 210 0 0 {name=l1 lab=GND}
C {gnd.sym} 60 210 0 0 {name=l2 lab=GND}
C {gnd.sym} 260 -70 2 0 {name=l3 lab=GND}
C {lab_pin.sym} 390 110 2 0 {name=p1 sig_type=std_logic lab=Vout}
C {lab_pin.sym} 60 110 0 0 {name=p2 sig_type=std_logic lab=Vin}
C {code_shown.sym} 130 320 0 0 {name=DC_simulation only_toplevel=false value=".lib /usr/local/share/pdk/sky130A/libs.tech/ngspice/sky130.lib.spice tt
.dc Vin 0 1.8 1m
.save all
.end"}
