`timescale 1ns / 1ps

module test_signal_generator;

    // Declaring the signals
    reg clk;
    reg [3:0] sel;
    wire phi_l1, phi_l2, phi_p, phi_r;

    // Instantiate the Unit Under Test (UUT)
    signal_generator uut (
        .clk(clk), 
        .sel(sel), 
        .phi_l1(phi_l1), 
        .phi_l2(phi_l2), 
        .phi_p(phi_p), 
        .phi_r(phi_r)
    );

    initial begin
            $dumpfile("signal_generatir_wf.vcd");
        $dumpvars(0, testbench_2);
        // Initialize Inputs
        clk = 0;
        sel = 4'b0000;

        // Wait 100 ns for global reset to finish
        #100;
        
        // Add stimulus here
        sel = 4'b1010;
        #100;
        sel = 4'b0101;
        #100;
    $finish; // Terminar la simulación
    end

    // Mostrar resultados en cada cambio de reloj
    always @(posedge clk) begin
        $display("Time: %d, max_val: %b, count: %d, phi_p: %b, phi_l1: %b, phi_l2: %b, phi_r: %b",
        $time, max_val, uut.count, phi_p, phi_l1, phi_l2, phi_r);
    end
      
    // Clock Generation
    always #10 clk = ~clk;

endmodule
