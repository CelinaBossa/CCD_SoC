`timescale 1ns / 1ps

module tb_pulse_generator;

    // Entradas
    reg clk;
    reg rst;
    reg [3:0] DIVIDE_BY_N;

    // Salidas
    wire comb_out;
    wire sync_out;

    // Instancia del módulo a probar
    pulse_generator uut (
        .clk(clk), 
        .rst(rst), 
        .DIVIDE_BY_N(DIVIDE_BY_N), 
        .comb_out(comb_out), 
        .sync_out(sync_out)
    );

    // Generación del reloj
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // Periodo del reloj de 10 unidades de tiempo
    end

    // Proceso de prueba
    initial begin
        // Inicialización
        rst = 1;
        DIVIDE_BY_N = 4'b1010; // DIVIDE_BY_N = 10
        #10;
        
        // Liberación del reset
        rst = 0;
        
        // Esperar un tiempo para observar las salidas
        #200;

        DIVIDE_BY_N = 4'b0010; // DIVIDE_BY_N = 2
        #200;

        DIVIDE_BY_N = 4'b0100; // DIVIDE_BY_N = 4
        #200;

        DIVIDE_BY_N = 4'b0111; // DIVIDE_BY_N = 7
        #200;
        
        // Terminar la simulación
        $finish;
    end

    // Monitoreo de señales
    initial begin
        $monitor("Time = %0t: clk = %b, rst = %b, DIVIDE_BY_N = %d, comb_out = %b, sync_out = %b", 
                 $time, clk, rst, DIVIDE_BY_N, comb_out, sync_out);
        $dumpfile("pulse_generator_wf.vcd");
        $dumpvars(0, tb_pulse_generator);
    end

endmodule
