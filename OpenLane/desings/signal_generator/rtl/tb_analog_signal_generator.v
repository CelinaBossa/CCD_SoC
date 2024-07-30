`timescale 1ns/1ps

module tb_analog_signal_generator;

    // Inputs
    reg i_enable;
    reg i_phi_l2;
    reg i_phi_l1;
    reg i_phi_p;

    // Outputs
    wire pixel_flag;
    wire ADC_frame;

    // Instantiate the Unit Under Test (UUT)
    analog_signal_generator uut (
        .i_enable(i_enable),
        .i_phi_l2(i_phi_l2),
        .i_phi_l1(i_phi_l1),
        .i_phi_p(i_phi_p),
        .o_pixel_flag(pixel_flag),
        .o_ADC_frame(ADC_frame)
    );

    // Clock generation
    initial begin
        i_phi_l2 = 0;
        i_phi_l1 = 1;
        i_phi_p = 0;
        forever #5 i_phi_l2 = ~i_phi_l2; // 10ns period clock
    end

    // Generate i_phi_l1 and i_phi_p signals
    always #5 i_phi_l1 = ~i_phi_l1; // 20ns period clock


    // Stimulus process
    initial begin
        // Initialize Inputs
        i_enable = 0;
        #15; // wait for some time

        // Apply test vectors
        i_enable = 1; #150;
        i_phi_p =1; #15;
        i_phi_p =0; #150;
        i_enable = 0; #20;
        i_enable = 1; #40;

        // Finish simulation after some time
        #200;
        $finish;
    end

    // Monitor the outputs
    initial begin
        $dumpfile("wf_analog_signal_generator.vcd");
        $dumpvars(0, tb_analog_signal_generator);
        $monitor("At time %t, i_enable = %b, i_phi_l2 = %b, i_phi_l1 = %b, i_phi_p = %b, pixel_flag = %b, ADC_frame = %b",
                 $time, i_enable, i_phi_l2, i_phi_l1, i_phi_p, pixel_flag, ADC_frame);
    end

endmodule
