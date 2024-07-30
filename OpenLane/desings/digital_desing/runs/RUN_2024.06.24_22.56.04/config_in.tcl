# Configuración del diseño digital
set ::env(DESIGN_NAME) "pulse_generator"
set ::env(VERILOG_FILES) "designs/digital_desing/src/digital_designs.v"
set ::env(CLOCK_PORT) "clk"
set ::env(CLOCK_NET) "pll_clk"
set ::env(CLOCK_PERIOD) 5.0
set ::env(FP_PDN_MULTILAYER) false
set ::env(SIGNOFF_SDC_FILE) "designs/digital_desing/src/digital_designs.sdc"
set ::env(PNR_SDC_FILE) "designs/digital_desing/src/digital_designs.sdc"


# Configuración del PLL
set ::env(PLL_ENABLE) 1
set ::env(PLL_FREQ) 200000000  ; # Frecuencia objetivo del PLL en Hz
set ::env(PLL_SOURCE) "clk_in"  ; # Fuente del reloj (puede ser "clk_in" o "clk_core")
