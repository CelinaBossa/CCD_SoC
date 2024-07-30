module signal_generator (
    input wire clk,          // Reloj principal
    input wire [3:0] sel,    // Entrada de 4 bits para seleccionar el periodo de phi_p
    output reg phi_l1,       // Señal phi_l1
    output reg phi_l2,       // Señal phi_l2
    output reg phi_p,        // Señal phi_p
    output reg phi_r         // Señal phi_r
);

// Contadores
reg [5:0] l_counter = 0;      // Contador para phi_l1 y phi_l2 (6 ciclos)
reg [13:0] p_counter = 0;     // Contador para phi_p (mínimo 1048 ciclos)
reg [5:0] r_counter = 0;      // Contador para phi_r (mitad del duty cycle de phi_l2)

// Constantes
parameter MIN_P_CYCLES = 1048;  // Mínimo de ciclos para phi_p

always @(posedge clk) begin
    // Generar phi_l1 y phi_l2
    if (l_counter == 6) begin
        phi_l1 <= ~phi_l1;
        phi_l2 <= ~phi_l2;
        l_counter <= 0;
    end else begin
        l_counter <= l_counter + 1;
    end

    // Generar phi_p
    if (phi_l1 == 1'b1) begin
        if (p_counter >= (MIN_P_CYCLES + sel)) begin
            phi_p <= 1'b1;
            p_counter <= 0;
        end else begin
            phi_p <= 1'b0;
            p_counter <= p_counter + 1;
        end
    end

    // Generar phi_r (mitad del duty cycle de phi_l2)
    if (r_counter >= 3) begin
        phi_r <= ~phi_r;
        r_counter <= 0;
    end else begin
        r_counter <= r_counter + 1;
    end
end

endmodule
