module my_clk(
	output reg clk //señal de salida de reloj
);
	initial clk = 0;
	//se genera un reloj que tiene periodo 10 unidades de tiempo
	forever #5 clk = ~clk;  //altenar el valor del clock cada 5 unidades de tiempo
	end
endmodule



