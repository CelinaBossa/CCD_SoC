
module tb;

    // Señales de prueba
    reg clk;
    reg enable;
    reg phi_p,phi_l1,phi_l2,phi_r;

    // Instanciar el módulo principal
    digital_cs uut (
        .enable(enable),
        .clk(clk),
        .f_select(0),
        .phi_l1(phi_l1),
        .phi_l2(phi_l2),
        .phi_r(phi_r),
        .phi_p(phi_p)    
    );

    // Generar reloj
    initial begin
        clk = 0;
        forever #1 clk = ~clk;
    end

    // Generar señal de reset
    initial begin
        $dumpfile("wf_digital_cs.vcd");
        $dumpvars(0, tb);
        enable <=0;
    end

    // Proceso de prueba
    initial begin
        enable = 1;
        #500
        enable = 0;
        #100
        enable = 1;
        #500
        $finish;
    end

endmodule
