module tb;
    wire clk1;
    wire clk2;
    wire clk3;
    wire clk4;
    reg enable;
    reg[7:0] dly;

    clock_gen u0(enable, clk1);
    clock_gen #(.FREQ(200000)) u1(enable, clk2);
    clock_gen #(.FREQ(400000)) u2(enable, clk3);
    clock_gen #(.FREQ(800000)) u3(enable, clk4);
    
    //clock_gen #(.FREQ(50000), .PHASE(45)) u4(enable, clk2);
    //clock_gen #(.FREQ(50000), .PHASE(90)) u5(enable, clk5);

    initial begin 
        $dumpfile("clk_wf.vcd");
        enable <= 0;

        for(int i = 0; i < 10; i= i+1) begin
            dly = $random;
            #(dly) enable <= ~enable;
            $display("i=%0d dly=%0d", i, dly);
            #50;
        end

        #50 $finish;
    end
endmodule