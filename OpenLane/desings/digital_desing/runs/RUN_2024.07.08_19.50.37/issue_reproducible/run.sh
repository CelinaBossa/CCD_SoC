#!/bin/sh
dir=$(cd -P -- "$(dirname -- "$0")" && pwd -P)
cd $dir;
export CURRENT_DEF='./tmp/floorplan/5-tapcell.def';
export CURRENT_NETLIST='./results/synthesis/digital_cs.v';
export CURRENT_ODB='./tmp/floorplan/5-tapcell.odb';
export CURRENT_POWERED_NETLIST='0';
export CURRENT_SDC='./tmp/floorplan/3-initial_fp.sdc';
export DESIGN_IS_CORE='1';
export DESIGN_NAME='digital_cs';
export FP_PDN_CFG='openlane/scripts/openroad/common/pdn_cfg.tcl';
export FP_PDN_CHECK_NODES='1';
export FP_PDN_CORE_RING='0';
export FP_PDN_CORE_RING_HOFFSET='6';
export FP_PDN_CORE_RING_HSPACING='1.7';
export FP_PDN_CORE_RING_HWIDTH='1.6';
export FP_PDN_CORE_RING_VOFFSET='6';
export FP_PDN_CORE_RING_VSPACING='1.7';
export FP_PDN_CORE_RING_VWIDTH='1.6';
export FP_PDN_ENABLE_GLOBAL_CONNECTIONS='1';
export FP_PDN_ENABLE_MACROS_GRID='1';
export FP_PDN_ENABLE_RAILS='1';
export FP_PDN_HOFFSET='0';
export FP_PDN_HORIZONTAL_HALO='10';
export FP_PDN_HORIZONTAL_LAYER='met5';
export FP_PDN_HPITCH='7.0';
export FP_PDN_HSPACING='1.7';
export FP_PDN_HWIDTH='3';
export FP_PDN_RAIL_LAYER='met1';
export FP_PDN_RAIL_WIDTH='0.48';
export FP_PDN_SKIPTRIM='0';
export FP_PDN_VERTICAL_HALO='10';
export FP_PDN_VERTICAL_LAYER='met4';
export FP_PDN_VOFFSET='0';
export FP_PDN_VPITCH='7.0';
export FP_PDN_VSPACING='1.7';
export FP_PDN_VWIDTH='3';
export GND_NET='VGND';
export GND_NETS='VGND';
export LIB_TYPICAL='pdk/sky130A/libs.ref/sky130_fd_sc_hd/lib/sky130_fd_sc_hd__tt_025C_1v80.lib';
export MAX_FANOUT_CONSTRAINT='10';
export MAX_TRANSITION_CONSTRAINT='0.75';
export MERGED_LEF='./tmp/merged.nom.lef';
export OUTPUT_CAP_LOAD='33.442';
export PACKAGED_SCRIPT_0='openlane/scripts/openroad/pdn.tcl';
export PACKAGED_SCRIPT_1='openlane/scripts/openroad/common/pdn_cfg.tcl';
export PACKAGED_SCRIPT_2='openlane/scripts/openroad/common/io.tcl';
export PACKAGED_SCRIPT_3='openlane/scripts/openroad/common/set_global_connections.tcl';
export PACKAGED_SCRIPT_4='./tmp/floorplan/3-initial_fp.sdc';
export PROCESS_CORNER='nom';
export SAVE_DEF='./results/floorplan/digital_cs.def';
export SAVE_NETLIST='./out.v';
export SAVE_ODB='./results/floorplan/digital_cs.odb';
export SCRIPTS_DIR='openlane/scripts';
export STA_PRE_CTS='1';
export STD_CELL_GROUND_PINS='VGND VNB';
export STD_CELL_POWER_PINS='VPWR VPB';
export VDD_NET='VPWR';
export VDD_NETS='VPWR';
TOOL_BIN=${TOOL_BIN:-openroad}
$TOOL_BIN -exit $PACKAGED_SCRIPT_0