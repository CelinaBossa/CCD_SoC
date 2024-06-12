module pulse_generator(
    input clk,
    input rst,
    input [3:0] DIVIDE_BY_N,
    output comb_out, 
    output reg sync_out
);

reg [10:0] count = 0; // Corregir la declaración del vector

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
