// Copyright 2023 Efabless Corporation
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

// (Parameterized) Unsigned Serial/Parallel Multiplier:
// - Multiplicand x (Input bit-serially)
// - Multiplier a (All bits at the same time/Parallel)
// - Product y (Output bit-serial)
`timescale 1ns/1ps

module digital_cs(
    input wire enable,
    input wire clk,
    input wire [3:0] f_select,
    output reg phi_p,
    output reg phi_l2,
    output reg phi_l1,
    output reg phi_r
);
    parameter t_min = 24'hF43B70; //16.006.000 ns -> 62.4765712858 Hz
    parameter t_waves = 24'hF439E0; // 16.005.600 ns -> 62.4781326536 Hz
    parameter t_step = 24'hF4378; //1.000.312 ns ->  999.688097314 Hz // -> fmax = 0.99 MHz

    integer delay;
    reg [12:0] count = 13'h804; // 2052 en decimal
    reg gral_enable = 1'b0;

    // Inicialización de señales
    initial begin
        phi_r = 0;
        phi_l2 = 0;
        phi_l1 = 0;
        phi_p = 0;
    end

    // Generación de funciones controlada por gral_enable
    always @(posedge clk) begin
        if (enable) begin
            phi_r <= 1;
            phi_l2 <= 1;
            phi_l1 <= 0;
            phi_p <= 1;
            #400; // Delay de 556us
            phi_p <= 0;
            generate_functions();
            phi_r <= 0;
            phi_l2 <= 0;
            phi_l1 <= 0;
            delay = t_min - 400 - t_waves + f_select*t_step;
            #delay;
        end else begin
            phi_r <= 0;
            phi_l2 <= 0;
            phi_l1 <= 0;
        end
    end

    // Task para generar funciones
    task generate_functions;
        begin
            repeat (2052) begin // Repetir 2052 veces
                if (enable) begin
                    if (count > 0) begin
                        phi_r <= 0;
                        phi_l2 <= 0;
                        phi_l1 <= 1;
                        #3900; // 3.89us -> mitad de frecuencia mínima
                        phi_r <= 1;
                        phi_l2 <= 1;
                        phi_l1 <= 0;
                        #1949; // 1.94us -> debería ser 18.64 1/4 de frecuencia mínima
                        phi_r <= 0;
                        phi_l2 <= 1;
                        phi_l1 <= 0;
                        #1950; // 1.94us -> debería ser 18.64 1/4 de frecuencia mínima
                        count <= count - 1;
                    end
                end
            end
            count <= 13'h804; // Reiniciar count al valor inicial
        end
    endtask

endmodule
