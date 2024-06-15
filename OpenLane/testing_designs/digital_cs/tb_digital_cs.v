`timescale 1ns/1ps
module tb;

    // Señales de prueba
    reg clk;
    reg enable;
    reg [7:0] f_select = 8'h00;
    wire phi_p,phi_l1,phi_l2,phi_r;

    // Instanciar el módulo principal
    digital_cs uut (
        .enable(enable),
        .clk(clk),
        .f_select(f_select),
        .phi_p(phi_p),
        .phi_l2(phi_l2),
        .phi_l1(phi_l1),
        .phi_r(phi_r)    
    );

    // Generar reloj
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Generar señal de reset
    initial begin
        $dumpfile("wf_digital_cs.vcd");
        $dumpvars(0, tb);
        enable =0;
    end

    // Proceso de prueba
    initial begin
        enable =0;
        #50;
        enable = 1;
        #50;

        //#50;
        //enable = 1;
        //#250;
        //f_select = 16'h0a;
        //#250;
        //f_select = 16'h08;
        //#750;
        //#50;
        //enable = 1;
        f_select = 8'h08;
        #18000000;
        f_select = 8'h80;
        #18000000;
        f_select = 8'h01;
        #18000000;
        f_select = 8'h00;


        
        enable = 0;
        $finish;
    end

endmodule
