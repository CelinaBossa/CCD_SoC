module my_divider (
  input wire clk_in,     // Señal de reloj de entrada
  input wire reset,      // Señal de reset
  input wire [31:0] div, // Valor del divisor
  output reg clk_out     // Señal de reloj de salida dividida
);

  reg [31:0] counter;

  always @(posedge clk_in or posedge reset) begin
    if (reset) begin
      counter <= 0;
      clk_out <= 0;
    end else begin
      if (counter >= (div - 1)) begin
        counter <= 0;
        clk_out <= ~clk_out; // Cambiar el estado de clk_out
      end else begin
        counter <= counter + 1;
      end
    end
  end

endmodule
