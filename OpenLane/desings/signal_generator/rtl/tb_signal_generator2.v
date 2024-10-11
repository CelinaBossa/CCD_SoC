`timescale 10ns/1ps

module tb_signal_generator#(
    parameter [31:0] ENABLE_ADDRESS     = 32'h3000_0000, // read
    parameter [31:0] FREQUENCY_ADDRESS  = 32'h3000_0004, // read
    parameter [31:0] PHI_P_ADDRESS      = 32'h3000_0008, // write
    parameter [31:0] PHI_L1_ADDRESS     = 32'h3000_000C, // write
    parameter [31:0] PHI_L2_ADDRESS     = 32'h3000_0010, // write
    parameter [31:0] PHI_R_ADDRESS      = 32'h3000_0014, // write
    parameter [31:0] CLOCK_ADDRESS      = 32'h3000_0018, // read
    parameter [31:0] RETURN_ADDRESS     = 32'h3000_001C // read
 )();

    // Parámetros
    parameter PASO_DEF = 32'h5FA4;
    
    // Señales de entrada
    reg i_enable;
    reg [3:0] i_f_select;
    reg i_clk_gpio;
    
    // Señales de salida
    wire o_phi_p;
    wire o_phi_l1;
    wire o_phi_l2;
    wire o_phi_r;

    // Señales de wishbone
    reg          i_wb_clk;
    reg          i_wb_rst;
    reg          i_wb_cyc;      // wishbone transaction
    reg          i_wb_stb;      // strobe - data valid and accepted
    reg          i_wb_we;       // write enable
    reg  [31:0]  i_wb_addr;     // address
    reg  [31:0]  i_wb_data;     // incoming data
    wire         o_wb_ack;       // request is completed 
    wire [31:0] o_wb_data;      // output data

    // Señales de testeo
    reg         i_test;
    wire [4:0]  o_test;


    // Instanciación del DUT (Device Under Test)
    signal_generator #(
        .PASO_DEF(PASO_DEF)
    ) dut (
        .i_wb_clk(i_wb_clk),
        .i_wb_rst(i_wb_rst),
        .i_wb_cyc(i_wb_cyc),     
        .i_wb_stb(i_wb_stb),      
        .i_wb_we(i_wb_we),       
        .i_wb_addr(i_wb_addr),     
        .i_wb_data(i_wb_data),     
        .o_wb_ack(o_wb_ack),        
        .o_wb_data(o_wb_data), 
        .i_test(i_test),
        .o_test(o_test),
        .i_enable_gpio(i_enable),
        .i_f_select_gpio(i_f_select),
        .i_clk_gpio(i_clk_gpio),
        .o_phi_p(o_phi_p),
        .o_phi_l1(o_phi_l1),
        .o_phi_l2(o_phi_l2),
        .o_phi_r(o_phi_r)
    );
    
    // Generación del reloj
    initial begin
        i_wb_clk = 0;
        i_clk_gpio = 0;
        forever #2 i_wb_clk = ~i_wb_clk; // Periodo de 1us (1us/2 = 0.5us para cada flanco)
        forever #2 i_clk_gpio = ~i_clk_gpio; // Periodo de 1us (1us/2 = 0.5us para cada flanco)
    end

    initial begin
        i_clk_gpio = 0;
        forever #2 i_clk_gpio = ~i_clk_gpio; // Periodo de 1us (1us/2 = 0.5us para cada flanco)
    end
    
    // Inicialización de las señales
    initial begin
        // Inicializa las señales
        i_enable = 0;
        i_f_select = 4'b0000;
        i_test = 0;
        i_wb_rst = 0;
        i_wb_cyc = 1;
        i_wb_stb = 1;
        i_wb_we = 1;
        i_wb_addr = ENABLE_ADDRESS;
        i_wb_data = 0;
        
        // Estimulación de la FSM
        #10;
        i_enable = 1;
        i_f_select = 4'b0000; // Valor fijo para i_f_select
        
        // Deja correr la simulación por un tiempo
        #40000;

        i_f_select = 4'b1000;

        #1500000;
        #40000;
        #40000;
        // Deshabilita la FSM
        i_enable = 0;
        
        // Fin de la simulación
        #100;
        $finish;
    end
    
    // Monitoreo de señales
    initial begin
        $dumpfile("wf_signal_generator.vcd");
        $dumpvars(0, tb_signal_generator);
        $monitor("Time: %0t | enable: %b | f_select: %b | phi_p: %b | phi_l1: %b | phi_l2: %b | phi_r: %b",
                 $time, i_enable, i_f_select, o_phi_p, o_phi_l1, o_phi_l2, o_phi_r);
    end

endmodule
