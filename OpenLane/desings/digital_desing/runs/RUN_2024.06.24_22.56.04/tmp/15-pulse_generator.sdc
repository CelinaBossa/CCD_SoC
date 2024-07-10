###############################################################################
# Created by write_sdc
# Mon Jun 24 22:57:36 2024
###############################################################################
current_design pulse_generator
###############################################################################
# Timing Constraints
###############################################################################
create_clock -name clk -period 5.0000 [get_ports {clk}]
set_clock_transition 0.1500 [get_clocks {clk}]
set_clock_uncertainty 0.2500 clk
set_propagated_clock [get_clocks {clk}]
set_input_delay 1.0000 -clock [get_clocks {clk}] -add_delay [get_ports {DIVIDE_BY_N[0]}]
set_input_delay 1.0000 -clock [get_clocks {clk}] -add_delay [get_ports {DIVIDE_BY_N[1]}]
set_input_delay 1.0000 -clock [get_clocks {clk}] -add_delay [get_ports {DIVIDE_BY_N[2]}]
set_input_delay 1.0000 -clock [get_clocks {clk}] -add_delay [get_ports {DIVIDE_BY_N[3]}]
set_input_delay 1.0000 -clock [get_clocks {clk}] -add_delay [get_ports {rst}]
set_output_delay 1.0000 -clock [get_clocks {clk}] -add_delay [get_ports {comb_out}]
set_output_delay 1.0000 -clock [get_clocks {clk}] -add_delay [get_ports {sync_out}]
###############################################################################
# Environment
###############################################################################
set_load -pin_load 0.0334 [get_ports {comb_out}]
set_load -pin_load 0.0334 [get_ports {sync_out}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {clk}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {rst}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {DIVIDE_BY_N[3]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {DIVIDE_BY_N[2]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {DIVIDE_BY_N[1]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {DIVIDE_BY_N[0]}]
set_timing_derate -early 0.9500
set_timing_derate -late 1.0500
###############################################################################
# Design Rules
###############################################################################
set_max_transition 0.7500 [current_design]
set_max_fanout 10.0000 [current_design]
