# Configuración del diseño digital
set ::env(DESIGN_NAME) "digital_cs"
set ::env(VERILOG_FILES) "designs/digital_desing/src/digital_designs.v"
set ::env(CLOCK_PORT) "clk"
set ::env(CLOCK_NET) "clk_core"
set ::env(CLOCK_PERIOD) 10.0
set ::env(FP_PDN_MULTILAYER) false
set ::env(SIGNOFF_SDC_FILE) "designs/digital_desing/src/digital_designs.sdc"
set ::env(PNR_SDC_FILE) "designs/digital_desing/src/digital_designs.sdc"
set ::env(FP_CORE_UTIL) 1

set ::env(FP_PDN_VWIDTH) 3
set ::env(FP_PDN_HWIDTH) 3
set ::env(FP_PDN_VOFFSET) 0
set ::env(FP_PDN_HOFFSET) $::env(FP_PDN_VOFFSET)
set ::env(FP_PDN_VPITCH) 10.0
set ::env(FP_PDN_HPITCH) $::env(FP_PDN_VPITCH)
