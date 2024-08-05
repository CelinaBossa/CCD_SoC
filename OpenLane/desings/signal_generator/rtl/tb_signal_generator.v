`timescale 10ns/1ps

module tb_signal_generator();

    // Parámetros
    parameter PASO_DEF = 32'h5FA4;
    
    // Señales de entrada
    reg i_enable;
    reg [3:0] i_f_select;
    reg i_clk;
    
    // Señales de salida
    wire o_phi_p;
    wire o_phi_l1;
    wire o_phi_l2;
    wire o_phi_r;
    
    // Instanciación del DUT (Device Under Test)
    signal_generator #(
        .PASO_DEF(PASO_DEF)
    ) dut (
        .i_enable(i_enable),
        .i_f_select(i_f_select),
        .i_clk(i_clk),
        .o_phi_p(o_phi_p),
        .o_phi_l1(o_phi_l1),
        .o_phi_l2(o_phi_l2),
        .o_phi_r(o_phi_r)
    );
    
    // Generación del reloj
    initial begin
        i_clk = 0;
        forever #2 i_clk = ~i_clk; // Periodo de 1us (1us/2 = 0.5us para cada flanco)
    end
    
    // Inicialización de las señales
    initial begin
        // Inicializa las señales
        i_enable = 0;
        i_f_select = 4'b0000;
        
        // Estimulación de la FSM
        #10;
        i_enable = 1;
        i_f_select = 4'b0000; // Valor fijo para i_f_select
        
        // Deja correr la simulación por un tiempo
        #40000;

        i_f_select = 4'b1000;

        #1500000;
        i_f_select = 4'b1000;
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
