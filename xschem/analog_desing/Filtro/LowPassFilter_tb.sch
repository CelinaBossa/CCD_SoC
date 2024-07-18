v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N -20 130 30 130 {
lab=in}
C {/home/celina/Tesis/xschem/analog_desing/Filtro/LowPassFilter.sym} 170 -40 0 0 {name=x1}
C {vsource.sym} -20 160 0 0 {name=Vin value=0}
C {lab_pin.sym} -20 130 0 0 {name=p1 sig_type=std_logic lab=in}
C {lab_pin.sym} 290 130 2 0 {name=p2 sig_type=std_logic lab=out}
C {gnd.sym} -20 190 0 0 {name=l1 lab=GND}
C {code_shown.sym} 210 260 0 0 {name=AC_simulation only_toplevel=false value=".lib /usr/local/share/pdk/sky130A/libs.tech/ngspice/sky130.lib.spice tt
Vin in GND dc 0 ac 1
.ac Vin 10 1Hz 10MHz
.save all
.end"}
