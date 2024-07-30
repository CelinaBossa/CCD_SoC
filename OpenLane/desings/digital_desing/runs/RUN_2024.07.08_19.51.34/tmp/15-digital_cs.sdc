###############################################################################
# Created by write_sdc
# Mon Jul  8 19:53:22 2024
###############################################################################
current_design digital_cs
###############################################################################
# Timing Constraints
###############################################################################
create_clock -name clk -period 10.0000 [get_ports {clk}]
set_clock_transition 0.1500 [get_clocks {clk}]
set_clock_uncertainty 0.2500 clk
set_propagated_clock [get_clocks {clk}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {enable}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {f_select[0]}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {f_select[1]}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {f_select[2]}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {f_select[3]}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {f_select[4]}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {f_select[5]}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {f_select[6]}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {f_select[7]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {phi_l1}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {phi_l2}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {phi_p}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {phi_r}]
###############################################################################
# Environment
###############################################################################
set_load -pin_load 0.0334 [get_ports {phi_l1}]
set_load -pin_load 0.0334 [get_ports {phi_l2}]
set_load -pin_load 0.0334 [get_ports {phi_p}]
set_load -pin_load 0.0334 [get_ports {phi_r}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {clk}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {enable}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {f_select[7]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {f_select[6]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {f_select[5]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {f_select[4]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {f_select[3]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {f_select[2]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {f_select[1]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {f_select[0]}]
set_timing_derate -early 0.9500
set_timing_derate -late 1.0500
###############################################################################
# Design Rules
###############################################################################
set_max_transition 0.7500 [current_design]
set_max_fanout 10.0000 [current_design]
