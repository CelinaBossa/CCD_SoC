// Code your testbench here
// or browse Examples
module testbench;
  reg clk_in;
  reg reset;
  reg [31:0] div;
  wire clk_out;

  // Instanciar el divisor de frecuencia
  my_divider uut (
    .clk_in(clk_in),
    .reset(reset),
    .div(div),
    .clk_out(clk_out)
  );

  // instanciar el reloj de entrada con un periodo de 10 unidades de tiempo
    
	initial begin
	  $dumpfile("wf_my_divider.vcd");
          $dumpvars(0, testbench);  // Dump todas las señales de este módulo

    	  clk_in = 0;
        forever #5 clk_in = ~clk_in;
  	end

  initial begin
    // Inicializar las señales
    reset = 1'b1;
    div = 32'd4;  // Valor del divisor

    // Desactivar el reset después de 20 unidades de tiempo
    #20 reset = 0;
    
    // Cambiar el valor de div para probar diferentes divisores
    #100 div = 32'd8;  // División por 8
    #100 div = 32'd16; // División por 16
    #100 div = 32'd32; // División por 32

    // Terminar simulación
    #500 $finish;
  end

  initial begin
    // Monitor para observar los valores
    //$monitor("Time = %0t, clk_in = %b, reset = %b, div = %d, clk_out = %b", 
    //         $time, clk_in, reset, div, clk_out);
  end

endmodule




