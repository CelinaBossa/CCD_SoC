module control_signals(
    input wire clk,
    input wire [3:0] max_val,
    output reg phi_p,
    output reg phi_l1,
    output reg phi_l2,
    output reg phi_r 
);
  	
	//Definimos los contadores a utilizar 
    reg [10:0] count = 0;
  	reg [10:0] count_main = 0;
    reg [12:0]count_phir=0;
    reg [3:0] max_count = 0;
  	//Seteamos parametros fijos del simulador
  	parameter N = 2;
  	parameter C = 8;
  	parameter P = 64;

    always @(posedge clk) begin
      count <= (count + 1 ) % (C*2); // el contador que se encarga de generar phi_l1 phi_l2 y phi_r se incrementa hasta 16 y leugo se reseta a 0
      count_main <= (count_main + 1) ; // este contador es para llevar la cuenta de cuando debe activarse phi_p
      
      	//en este codigo nos aseguramos que phi_r tenga la misma frecuencia que phi_l2 pero distinto DC
        if((count < C / N)) begin
       		phi_r <= 1'b1; 	
        	count_phir = count_phir +1; // contamos cuantas trasnferencias se realizaron
       	end else begin 
       		phi_r <= 1'b0;
       	end
      	
      	// En este bloque se asignan valores para crear phi_l1 y phi_l2
      	if (count < C) begin
            phi_l1 <= 0;
            phi_l2 <= 1;
        end else begin
          	phi_l1 <= 1;
            phi_l2 <= 0;
        end
		
      // En este bloque se asignan valores para crear phi_lp
      if(count_main == (P)) begin
            phi_p <= 1;
	    	count_phir <= 0;
            count_main <= 0;
        	#55; // este delay es para que todas las señales se queden en el valor que tienen miesntras phi_p funcione 
        end else begin
            phi_p <= 0;
        end
		
    end

endmodule
