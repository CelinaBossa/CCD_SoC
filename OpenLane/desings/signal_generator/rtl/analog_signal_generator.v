module analog_signal_generator (
    input wire      i_enable,
    input wire      i_phi_l2,
    input wire      i_phi_l1,
    input wire      i_phi_p,
    output wire     o_pixel_flag,
    output wire     o_ADC_frame
);

reg [2:0] contador_flancos;


always @(posedge i_phi_l2 or posedge i_phi_p)begin
    if (~i_enable)
        contador_flancos <= 0;
    else if (i_phi_p)
        contador_flancos <= 0;
    else if (contador_flancos <= 4)
        contador_flancos <= contador_flancos + 1;
end

assign o_pixel_flag = i_phi_l1 && ( contador_flancos == 5 );

assign o_ADC_frame = i_phi_p && i_enable;


endmodule