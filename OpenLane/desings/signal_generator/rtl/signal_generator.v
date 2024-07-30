// SPDX-FileCopyrightText: 2020 Efabless Corporation
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
// SPDX-License-Identifier: Apache-2.0

/*
 * I/O mapping for analog
 *
 * mprj_io[37]  io_in/out/oeb/in_3v3[26]  ---                    ---
 * mprj_io[36]  io_in/out/oeb/in_3v3[25]  ---                    ---
 * mprj_io[35]  io_in/out/oeb/in_3v3[24]  gpio_analog/noesd[17]  ---
 * mprj_io[34]  io_in/out/oeb/in_3v3[23]  gpio_analog/noesd[16]  ---
 * mprj_io[33]  io_in/out/oeb/in_3v3[22]  gpio_analog/noesd[15]  ---
 * mprj_io[32]  io_in/out/oeb/in_3v3[21]  gpio_analog/noesd[14]  ---
 * mprj_io[31]  io_in/out/oeb/in_3v3[20]  gpio_analog/noesd[13]  ---
 * mprj_io[30]  io_in/out/oeb/in_3v3[19]  gpio_analog/noesd[12]  ---
 * mprj_io[29]  io_in/out/oeb/in_3v3[18]  gpio_analog/noesd[11]  ---
 * mprj_io[28]  io_in/out/oeb/in_3v3[17]  gpio_analog/noesd[10]  ---
 * mprj_io[27]  io_in/out/oeb/in_3v3[16]  gpio_analog/noesd[9]   ---
 * mprj_io[26]  io_in/out/oeb/in_3v3[15]  gpio_analog/noesd[8]   ---
 * mprj_io[25]  io_in/out/oeb/in_3v3[14]  gpio_analog/noesd[7]   ---
 * mprj_io[24]  ---                       ---                    user_analog[10]
 * mprj_io[23]  ---                       ---                    user_analog[9]
 * mprj_io[22]  ---                       ---                    user_analog[8]
 * mprj_io[21]  ---                       ---                    user_analog[7]
 * mprj_io[20]  ---                       ---                    user_analog[6]  clamp[2]
 * mprj_io[19]  ---                       ---                    user_analog[5]  clamp[1]
 * mprj_io[18]  ---                       ---                    user_analog[4]  clamp[0]
 * mprj_io[17]  ---                       ---                    user_analog[3]
 * mprj_io[16]  ---                       ---                    user_analog[2]
 * mprj_io[15]  ---                       ---                    user_analog[1]
 * mprj_io[14]  ---                       ---                    user_analog[0]
 * mprj_io[13]  io_in/out/oeb/in_3v3[13]  gpio_analog/noesd[6]   ---
 * mprj_io[12]  io_in/out/oeb/in_3v3[12]  gpio_analog/noesd[5]   ---
 * mprj_io[11]  io_in/out/oeb/in_3v3[11]  gpio_analog/noesd[4]   ---
 * mprj_io[10]  io_in/out/oeb/in_3v3[10]  gpio_analog/noesd[3]   ---
 * mprj_io[9]   io_in/out/oeb/in_3v3[9]   gpio_analog/noesd[2]   ---
 * mprj_io[8]   io_in/out/oeb/in_3v3[8]   gpio_analog/noesd[1]   ---
 * mprj_io[7]   io_in/out/oeb/in_3v3[7]   gpio_analog/noesd[0]   ---
 * mprj_io[6]   io_in/out/oeb/in_3v3[6]   ---                    ---
 * mprj_io[5]   io_in/out/oeb/in_3v3[5]   ---                    ---
 * mprj_io[4]   io_in/out/oeb/in_3v3[4]   ---                    ---
 * mprj_io[3]   io_in/out/oeb/in_3v3[3]   ---                    ---
 * mprj_io[2]   io_in/out/oeb/in_3v3[2]   ---                    ---
 * mprj_io[1]   io_in/out/oeb/in_3v3[1]   ---                    ---
 * mprj_io[0]   io_in/out/oeb/in_3v3[0]   ---                    ---
 *
 */

/*
 *----------------------------------------------------------------
 *
 * user_analog_proj_example
 *
 * This is an example of a (trivially simple) analog user project,
 * showing how the user project can connect to the I/O pads, both
 * the digital pads, the analog connection on the digital pads,
 * and the dedicated analog pins used as an additional power supply
 * input, with a connected ESD clamp.
 *
 * See the testbench in directory "mprj_por" for the example
 * program that drives this user project.
 *
 *----------------------------------------------------------------
 */
 `default_nettype none
 `timescale 1ns/1ps
 
 module signal_generator #(
    parameter PASO_DEF = 32'h5FA4
 )(
     input  wire         i_enable,
     input  wire   [3:0] i_f_select,
     input  wire         i_clk,
     output reg          o_phi_p,
     output reg          o_phi_l1,
     output reg          o_phi_l2,
     output reg          o_phi_r
 );

localparam [31:0] MIN_TIEMPO_REQ =   32'h2012;


reg [31:0]  contador;
reg [13:0]  contador_waves;
reg [3:0]   f_selected;
reg [1:0]   estado, sig_estado, ciclos;
 

// DECODIFICACION DE LOS ESTADOS
localparam  [1:0] INITIAL_SETUP   = 2'b00;
localparam  [1:0] SHIFT_CHARGES   = 2'b01;
localparam  [1:0] HOLD_CAPTURE    = 2'b10;
localparam  [1:0] PULSE_HPND      = 2'b11;

//INICIALIZACION DE REGISTROS
initial begin
    o_phi_r = 0;
    o_phi_l2 = 0;
    o_phi_l1 = 0;
    o_phi_p = 0;
    contador = 0;
    contador_waves = 0;
    f_selected = 0;
    estado = 0;
    sig_estado = 0;
    ciclos = 0;
end

//ACTUALIZAR EL VALOR DE F_SELECTED
always @(posedge i_clk) begin
    if (~i_enable )
        f_selected <= 0;
    else if (estado == PULSE_HPND  && sig_estado == SHIFT_CHARGES)
        f_selected <= i_f_select;
end

//CONTADOR PRICIPAL
always @(posedge i_clk) begin
    if (~i_enable )
        contador <= 0;
    else if (estado == PULSE_HPND  && sig_estado == SHIFT_CHARGES)
        contador <= 0;
    else if (contador <= 32'hF00000)
        contador <= contador + 1;
end
//CONTADOR DE CILCOS DE RELOJ PARA GENERAR LAS WF
always @(posedge i_clk ) begin
    if (~i_enable )
        ciclos <= 0;
    else if ((ciclos < 2'b11) && (estado == SHIFT_CHARGES) )
        ciclos <= ciclos + 1; 
    else  
        ciclos <= 0;
end
//CONTADOR DE VECES QUE SE GENERARON LAS ONDAS PHI_L1, PHI_L2 Y PHI_R
always @(posedge i_clk ) begin
    if (~i_enable )
        contador_waves <= 0;
    else if (estado == PULSE_HPND)
        contador_waves <= 0;
    else if (ciclos == 2'b11  )
        contador_waves <= contador_waves + 1;
    
end

// TRANSCICION SINCRONICA DE ESTADO
always @(posedge i_clk) begin
    if ( ~i_enable )
    	estado <= INITIAL_SETUP;
    else 
    	estado <= sig_estado;
end

//DECODIFICACION DEL SIGUIENTE ESTADO
always @(*) begin
    case (estado)
    INITIAL_SETUP: begin
        if ( ~i_enable )
    	    sig_estado = INITIAL_SETUP;
        else 
    	    sig_estado = SHIFT_CHARGES;   
    end
    SHIFT_CHARGES: begin
        if ( contador_waves <= 14'd2051 )
            sig_estado = SHIFT_CHARGES;
        else 
            sig_estado = HOLD_CAPTURE;   
    end
    HOLD_CAPTURE: begin
        if ( contador <= (MIN_TIEMPO_REQ + (f_selected * PASO_DEF )))
            sig_estado = HOLD_CAPTURE;
        else 
            sig_estado = PULSE_HPND;  
    end
    PULSE_HPND: begin
        if ( contador <= (MIN_TIEMPO_REQ + (f_selected * PASO_DEF ) + 18 )) //los 18 ciclos son para los 700ns
            sig_estado = PULSE_HPND;
        else 
            sig_estado = SHIFT_CHARGES;  
    end
    endcase
end

//DECODIFICACION DE LAS SALIDAS
always @(*) begin
    case (estado)
    INITIAL_SETUP: begin
        o_phi_r = 0; // por definición del datasheet cuando phi_p = 1 -> phi_l1 = 0, phi_l2 = phi_r = 1
        o_phi_l2 = 0;
        o_phi_l1 = 0;
        o_phi_p  = 0;     
    end
    SHIFT_CHARGES: begin
        o_phi_p  = 0;
        case (ciclos)
            2'b00: begin 
                o_phi_r = 1; 
                o_phi_l2 = 1;
                o_phi_l1 = 0; 
            end
            2'b01: begin  
                o_phi_r = 0; 
                o_phi_l2 = 1;
                o_phi_l1 = 0; 
            end
            2'b10: begin
                o_phi_r = 0; 
                o_phi_l2 = 0;
                o_phi_l1 = 1; 
            end
            2'b11: begin
                o_phi_r = 0;
                o_phi_l2 = 0;
                o_phi_l1 = 1; 
            end
        endcase
    end
    HOLD_CAPTURE: begin
        o_phi_p  = 0;  
        o_phi_r = 0; 
        o_phi_l2 = 0;
        o_phi_l1 = 0; 
    end
    PULSE_HPND: begin
        o_phi_p  = 1;  
        o_phi_r = 1;
        o_phi_l2 = 1;
        o_phi_l1 = 0;
    end
    endcase
end



endmodule