module testbench;
    reg clk;
    reg [3:0] max_val;
    wire phi_p;
    wire phi_l1;
    wire phi_l2;
    wire phi_r;

    // Instancia del módulo signal_generator
    control_signals uut (
        .clk(clk),
        .max_val(max_val),
        .phi_p(phi_p),
        .phi_l1(phi_l1),
        .phi_l2(phi_l2),
        .phi_r(phi_r)
    );

    // Generación del reloj
    initial begin
        clk = 0;
        forever #2 clk = ~clk; // Período de 10 unidades de tiempo
    end

    // Proceso de inicialización
    initial begin
        // Abrir el archivo de salida y habilitar el rastreo
        $dumpfile("wf_control_signals.vcd");
        $dumpvars(0, testbench);

        // Inicializar señales
        max_val = 4'b1111; // Ejemplo de valor máximo
        #1000;

        max_val = 4'b0011; // Cambiar el valor máximo
        #50;

        max_val = 4'b1001; // Cambiar el valor máximo
        #50;

        $finish; // Terminar la simulación
    end

    // Mostrar resultados en cada cambio de reloj
    always @(posedge clk) begin
        $display("Time: %d, max_val: %b, count: %d, phi_p: %b, phi_l1: %b, phi_l2: %b, phi_r: %b",
                 $time, max_val, uut.count, phi_p, phi_l1, phi_l2, phi_r);
    end

endmodule
