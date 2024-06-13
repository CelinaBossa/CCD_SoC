`timescale 1ns/1ps


module squared_wave_gen(
    input enable,
    output reg clk);

    parameter FREQ = 100000;    // in kHz
    parameter PHASE = 0;        // in degrees
    parameter DUTY = 50;        // in percentage

    real clk_pd;
    real clk_on;
    real clk_off;
    real quarter;
    real start_dly;

    reg start_clk;

    always @ (FREQ, DUTY, PHASE) begin
        clk_pd = 1.0/(FREQ * 1e3) * 1e9;   // convert to ns
        clk_on = DUTY/100.0 * clk_pd;
        clk_off = (100.0 - DUTY)/100.0 * clk_pd;
        quarter = clk_pd / 4 ;
        start_dly = quarter * PHASE / 90;
    end

    initial begin
        $display("FREQ      = %0d kHz", FREQ);
        $display("PHASE     = %0d deg", PHASE);
        $display("DUTY      = %0d %%", DUTY);

        $display("PERIOD    = %0.3f ns", clk_pd);
        $display("CLK_ON    = %0.3f ns", clk_on);
        $display("CLK_OFF   = %0.3f ns", clk_off);
        $display("QUARTER   = %0.3f ns", quarter);
        $display("START_DLY = %0.3f ns", start_dly);
    end

    // Inicializar variables en cero
    initial begin
        clk <= 0;
        start_clk <= 0;
    end

    // When clock is enabled, delay driving the clock to one 
    // in order to achieve the phase effect. start_dly is configured 
    // to the correct delay for the configured phase. 
    // When enable is 0, allow enough time to complete the current clock period.
    always @(posedge enable or negedge enable) begin
        if (enable) begin
            #(start_dly) start_clk = 1;
        end else begin
            #(start_dly) start_clk = 0;
        end
    end

    // Achieve duty cycle by a skewed clock on/off time and let this run as 
    // long as the clocks are turned off
    always @(posedge start_clk) begin
        if (start_clk) begin
            clk = 1;
            while (start_clk) begin
                #(clk_on) clk = 0;
                #(clk_off) clk = 1;
            end        
            clk = 0;
        end
    end

endmodule


module pulse_generator(
    input clk,
    input rst,
    input [15:0] DIVIDE_BY_N,
    output comb_out, 
    output reg sync_out
);

reg [15:0] count = 0; // Corregir la declaración del vector

always @(posedge clk) begin
    if (rst) begin
        count <= 0;
    end else if (count < DIVIDE_BY_N-1) begin
        count <= count + 1;
    end else begin
        count <= 0;
    end
end

// Salida combinacional
assign comb_out = (count == DIVIDE_BY_N-1) ? 1'b1 : 1'b0;

// Salida sincrónica
always @(posedge clk) begin
    sync_out <= (count == DIVIDE_BY_N-1) ? 1'b1 : 1'b0;
end

endmodule


module digital_cs(
    input reg enable,
    input reg clk,
    input [3:0] f_select,
    output  phi_p,
    output  phi_l2,
    output  phi_l1,
    output  phi_r);

    //Variables a utilizar 

    //Generamos las señales requeridas con el modulo squared_wave_gen
    // Phi_L1
    squared_wave_gen #(.FREQ(250), .PHASE(180), .DUTY(50)) gen_phi_l1(.enable(enable), .clk(phi_l1));
    // Phi_L2
    squared_wave_gen #(.FREQ(250), .PHASE(0), .DUTY(50)) gen_phi_l2(.enable(enable), .clk(phi_l2));
    // Phi_r
    squared_wave_gen #(.FREQ(250), .PHASE(0), .DUTY(25)) gen_phi_r(.enable(enable), .clk(phi_r));
    // Phi_p es generado con el pulso debido a que se debe generar un unico pulso
    assign phi_p =0;
    
    always @(posedge clk)begin  
        if (enable) begin
            phi_l1 <= gen_phi_l1;
            phi_l2 <= gen_phi_l2;
            phi_r <= gen_phi_r;
        end else begin
            phi_l1 <= 0;
            phi_l2 <= 0;
            phi_r <= 0; 
        end
    end 




endmodule