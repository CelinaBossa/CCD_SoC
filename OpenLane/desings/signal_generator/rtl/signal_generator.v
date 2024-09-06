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

 
 `default_nettype none

 
 module signal_generator #(
    parameter [31:0] PASO_DEF = 32'h5FA4
 )(
     input  wire         i_enable,
     input  wire   [3:0] i_f_select,
     input  wire         i_clk,
     output reg          o_phi_p,
     output reg          o_phi_l1,
     output reg          o_phi_l2,
     output reg          o_phi_r
 );

localparam [31:0] MIN_TIEMPO_REQ =   32'h1009;

// REGISTROS INTERNOS
reg [31:0]  contador;
reg [13:0]  contador_waves;
reg [3:0]   f_selected;
reg [1:0]   estado, sig_estado, ciclos;
reg pulse_ended;

 

// DECODIFICACION DE LOS ESTADOS
localparam  [1:0] INITIAL_SETUP   = 2'b00;
localparam  [1:0] SHIFT_CHARGES   = 2'b01;
localparam  [1:0] HOLD_CAPTURE    = 2'b10;
localparam  [1:0] PULSE_HPND      = 2'b11;
localparam  PHI_P_WIDTH		  = 18;	

//INICIALIZACION DE REGISTROS
/*
initial begin
    o_phi_r = 0;
    o_phi_l2 = 0;
    o_phi_l1 = 0;
    phi_p = 0;
    contador = 0;
    contador_waves = 0;
    f_selected = 0;
    estado = 0;
    sig_estado = 0;
    ciclos = 0;
end
*/

//ACTUALIZAR EL VALOR DE F_SELECTED
always @(posedge i_clk) begin
    if (~i_enable )
        f_selected <= 0;
    else if (estado == PULSE_HPND  && sig_estado == SHIFT_CHARGES)
        f_selected <= i_f_select;
end

//FLAG PARA CONTROLAR EL FINAL DEL PULSO
always @(posedge i_clk) begin
    if (~i_enable )
        pulse_ended <= 0;
    else if (estado == PULSE_HPND  & sig_estado == SHIFT_CHARGES)
        pulse_ended <= ~pulse_ended;
    else
        pulse_ended <= 0;    
end
//CONTADOR PRICIPAL
always @(posedge i_clk) begin
    if (~i_enable )
        contador <= 0;
    else if (pulse_ended)
        contador <= 0;
    else
        contador <= contador + 1;
end
//CONTADOR DE CILCOS DE RELOJ PARA GENERAR LAS WF
always @( posedge i_clk ) begin
    if (~i_enable )
        ciclos <= 0;
    else if ((ciclos < 3) & (estado == SHIFT_CHARGES) )
        ciclos <= ciclos + 1; 
    else  
        ciclos <= 0;
end
//CONTADOR DE VECES QUE SE GENERARON LAS ONDAS PHI_L1, PHI_L2 Y PHI_R
always @(posedge i_clk) begin
    if (~i_enable )
        contador_waves <= 0;
    else if (estado == PULSE_HPND)
        contador_waves <= 0;
    else if (ciclos == 3)
        contador_waves <= contador_waves + 1;
    else 
        contador_waves <= contador_waves;
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
        if(( contador > PHI_P_WIDTH) && (contador_waves == 0))
    	    sig_estado = SHIFT_CHARGES;   
        else 
            sig_estado = INITIAL_SETUP; 
	
    end
    SHIFT_CHARGES: begin
        if ( contador_waves <= 2051 )
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
        if ( contador <= (MIN_TIEMPO_REQ + (f_selected * PASO_DEF ) + 4*PHI_P_WIDTH )) // PHI_P_WIDTH  >  320ns
            sig_estado = PULSE_HPND;
        else 
            sig_estado = SHIFT_CHARGES;  
    end
    endcase
end

//DECODIFICACION DE LAS SALIDAS
/*
assign o_phi_r = ((estado==SHIFT_CHARGES && ciclos==1) || (estado==PULSE_HPND));

assign o_phi_l1 = ((estado==SHIFT_CHARGES) && (ciclos==3 || ciclos==4)) ; 

assign o_phi_l2 = ((estado==SHIFT_CHARGES && (ciclos==1 || ciclos==2)) | (estado==PULSE_HPND));

assign o_phi_p = ((estado==PULSE_HPND));
*/


always @(*) begin
    if ((estado==SHIFT_CHARGES && ciclos==0) || (estado==PULSE_HPND))
        o_phi_r =1;
    else 
        o_phi_r =0;    
end

always @(*) begin
    if ((estado==SHIFT_CHARGES && (ciclos==0 || ciclos==1)) | (estado==PULSE_HPND))
        o_phi_l2 =1;
    else 
        o_phi_l2 =0;    
end

always @(*) begin
    if ((estado==SHIFT_CHARGES && (ciclos==2 || ciclos==3)) )
        o_phi_l1 =1;
    else 
        o_phi_l1 =0;    
end

always @(*) begin
    if ((estado==PULSE_HPND) ||(estado==INITIAL_SETUP) )
        o_phi_p =1;
    else 
        o_phi_p =0;    
end
/*
always @ begin
    case (estado)
    INITIAL_SETUP: begin
        o_phi_r = 0; // por definición del datasheet cuando phi_p = 1 -> phi_l1 = 0, phi_l2 = phi_r = 1
        o_phi_l2 = 0;
        o_phi_l1 = 0;
        o_phi_p  = 0;     
    end
    SHIFT_CHARGES: begin
        
        case (ciclos)
            2'b00: begin 
                o_phi_p  = 0;
                o_phi_r = 1; 
                o_phi_l2 = 1;
                o_phi_l1 = 0; 
            end
            2'b01: begin
                o_phi_p  = 0;  
                o_phi_r = 0; 
                o_phi_l2 = 1;
                o_phi_l1 = 0; 
            end
            2'b10: begin
                o_phi_p  = 0;
                o_phi_r = 0; 
                o_phi_l2 = 0;
                o_phi_l1 = 1; 
            end
            2'b11: begin
                o_phi_p  = 0;
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
*/

endmodule


