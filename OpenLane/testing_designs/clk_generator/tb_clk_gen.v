// tb_clk_gen.v
module tb;
    wire clk1,clk2,clk3,clk4,clk5,clk6,clk7,clk8;

    reg enable;
    reg [7:0] dly;

    // Instancias del generador de reloj
    clk_gen u1( .enable(enable), .clk(clk1));
    clk_gen #(.FREQ(200000)) u2(.enable(enable), .clk(clk2));
    clk_gen #(.FREQ(400000)) u3(.enable(enable), .clk(clk3));
    clk_gen #(.FREQ(60000)) u4(.enable(enable), .clk(clk4));
    clk_gen #(.FREQ(50000)) u5(.enable(enable), .clk(clk5));
    clk_gen #(.FREQ(50000), .PHASE(45)) u6(.enable(enable), .clk(clk6));
    clk_gen #(.FREQ(50000), .PHASE(90)) u7(.enable(enable), .clk(clk7));
    clk_gen #(.FREQ(50000), .PHASE(180)) u8(.enable(enable), .clk(clk8));

    initial begin 
        $dumpfile("wf_clk_gen.vcd");
        $dumpvars(0, tb);
        enable <= 0;

        for (integer i = 0; i < 10; i = i + 1) begin
            dly = $random;
            #(dly) enable <= ~enable;
            $display("i=%0d dly=%0d", i, dly);
            #50;
        end

        #50 $finish;
    end
endmodule
