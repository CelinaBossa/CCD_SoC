v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N -80 30 -50 30 {
lab=Vref}
N -50 30 -50 120 {
lab=Vref}
N -50 180 -50 250 {
lab=#net1}
N -50 310 -50 390 {
lab=#net2}
N -50 450 -50 520 {
lab=#net3}
N -50 580 -50 650 {
lab=#net4}
N -50 710 -50 780 {
lab=#net5}
N -50 90 170 90 {
lab=Vref}
N -50 220 170 220 {
lab=#net1}
N -50 340 170 340 {
lab=#net2}
N -50 470 170 470 {
lab=#net3}
N -50 600 170 600 {
lab=#net4}
N -50 730 170 730 {
lab=#net5}
N -50 850 170 850 {
lab=#net6}
N -50 980 170 980 {
lab=#net7}
N -50 1110 170 1110 {
lab=#net8}
N -50 1240 170 1240 {
lab=#net9}
N -50 1370 170 1370 {
lab=#net10}
N -50 1490 170 1490 {
lab=#net11}
N -50 1620 170 1620 {
lab=GND}
N -50 1600 -50 1730 {
lab=GND}
N -50 1470 -50 1540 {
lab=#net11}
N -50 1350 -50 1410 {
lab=#net10}
N -50 1220 -50 1290 {
lab=#net9}
N -50 1090 -50 1160 {
lab=#net8}
N -50 960 -50 1030 {
lab=#net7}
N -50 840 -50 900 {
lab=#net6}
C {comp3.sym} 230 60 0 0 {name=x1}
C {ipin.sym} 170 30 0 0 {name=p1 lab=Vin}
C {iopin.sym} 290 60 0 0 {name=p2 lab=adc[12]}
C {comp3.sym} 230 190 0 0 {name=x2}
C {ipin.sym} 170 160 0 0 {name=p3 lab=Vin}
C {iopin.sym} 290 190 0 0 {name=p4 lab=adc[11]}
C {comp3.sym} 230 310 0 0 {name=x3}
C {ipin.sym} 170 280 0 0 {name=p5 lab=Vin}
C {iopin.sym} 290 310 0 0 {name=p6 lab=adc[10]}
C {comp3.sym} 230 440 0 0 {name=x4}
C {ipin.sym} 170 410 0 0 {name=p7 lab=Vin}
C {iopin.sym} 290 440 0 0 {name=p8 lab=adc[9]}
C {comp3.sym} 230 570 0 0 {name=x5}
C {ipin.sym} 170 540 0 0 {name=p9 lab=Vin}
C {iopin.sym} 290 570 0 0 {name=p10 lab=adc[8]}
C {comp3.sym} 230 700 0 0 {name=x6}
C {ipin.sym} 170 670 0 0 {name=p11 lab=Vin}
C {iopin.sym} 290 700 0 0 {name=p12 lab=adc[7]}
C {comp3.sym} 230 820 0 0 {name=x7}
C {ipin.sym} 170 790 0 0 {name=p13 lab=Vin}
C {iopin.sym} 290 820 0 0 {name=p14 lab=adc[6]}
C {comp3.sym} 230 950 0 0 {name=x8}
C {ipin.sym} 170 920 0 0 {name=p15 lab=Vin}
C {iopin.sym} 290 950 0 0 {name=p16 lab=adc[5]}
C {comp3.sym} 230 1080 0 0 {name=x9}
C {ipin.sym} 170 1050 0 0 {name=p17 lab=Vin}
C {iopin.sym} 290 1080 0 0 {name=p18 lab=adc[4]}
C {comp3.sym} 230 1210 0 0 {name=x10}
C {ipin.sym} 170 1180 0 0 {name=p19 lab=Vin}
C {iopin.sym} 290 1210 0 0 {name=p20 lab=adc[3]}
C {comp3.sym} 230 1340 0 0 {name=x11}
C {ipin.sym} 170 1310 0 0 {name=p21 lab=Vin}
C {iopin.sym} 290 1340 0 0 {name=p22 lab=adc[2]}
C {comp3.sym} 230 1460 0 0 {name=x12}
C {ipin.sym} 170 1430 0 0 {name=p23 lab=Vin}
C {iopin.sym} 290 1460 0 0 {name=p24 lab=adc[1]}
C {comp3.sym} 230 1590 0 0 {name=x13}
C {ipin.sym} 170 1560 0 0 {name=p25 lab=Vin}
C {iopin.sym} 290 1590 0 0 {name=p26 lab=adc[0]}
C {gnd.sym} -50 1730 0 0 {name=l1 lab=GND}
C {ipin.sym} -80 30 0 0 {name=p27 lab=Vref}
C {/usr/local/share/pdk/sky130B/libs.tech/xschem/sky130_fd_pr/res_generic_po.sym} -50 150 0 0 {name=R1
W=0.482
L=1
model=res_generic_po
spiceprefix=X
mult=1}
C {/usr/local/share/pdk/sky130B/libs.tech/xschem/sky130_fd_pr/res_generic_po.sym} -50 280 0 0 {name=R2
W=0.482
L=1
model=res_generic_po
spiceprefix=X
mult=1}
C {/usr/local/share/pdk/sky130B/libs.tech/xschem/sky130_fd_pr/res_generic_po.sym} -50 420 0 0 {name=R3
W=0.482
L=1
model=res_generic_po
spiceprefix=X
mult=1}
C {/usr/local/share/pdk/sky130B/libs.tech/xschem/sky130_fd_pr/res_generic_po.sym} -50 550 0 0 {name=R4
W=0.482
L=1
model=res_generic_po
spiceprefix=X
mult=1}
C {/usr/local/share/pdk/sky130B/libs.tech/xschem/sky130_fd_pr/res_generic_po.sym} -50 680 0 0 {name=R5
W=0.482
L=1
model=res_generic_po
spiceprefix=X
mult=1}
C {/usr/local/share/pdk/sky130B/libs.tech/xschem/sky130_fd_pr/res_generic_po.sym} -50 810 0 0 {name=R6
W=0.482
L=1
model=res_generic_po
spiceprefix=X
mult=1}
C {/usr/local/share/pdk/sky130B/libs.tech/xschem/sky130_fd_pr/res_generic_po.sym} -50 930 0 0 {name=R7
W=0.482
L=1
model=res_generic_po
spiceprefix=X
mult=1}
C {/usr/local/share/pdk/sky130B/libs.tech/xschem/sky130_fd_pr/res_generic_po.sym} -50 1060 0 0 {name=R8
W=0.482
L=1
model=res_generic_po
spiceprefix=X
mult=1}
C {/usr/local/share/pdk/sky130B/libs.tech/xschem/sky130_fd_pr/res_generic_po.sym} -50 1190 0 0 {name=R9
W=0.482
L=1
model=res_generic_po
spiceprefix=X
mult=1}
C {/usr/local/share/pdk/sky130B/libs.tech/xschem/sky130_fd_pr/res_generic_po.sym} -50 1320 0 0 {name=R10
W=0.482
L=1
model=res_generic_po
spiceprefix=X
mult=1}
C {/usr/local/share/pdk/sky130B/libs.tech/xschem/sky130_fd_pr/res_generic_po.sym} -50 1440 0 0 {name=R11
W=0.482
L=1
model=res_generic_po
spiceprefix=X
mult=1}
C {/usr/local/share/pdk/sky130B/libs.tech/xschem/sky130_fd_pr/res_generic_po.sym} -50 1570 0 0 {name=R12
W=0.482
L=1
model=res_generic_po
spiceprefix=X
mult=1}
