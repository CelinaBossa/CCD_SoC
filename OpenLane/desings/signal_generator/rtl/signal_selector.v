module signal_selector (
    input   wire        i_phi_r,
    input   wire        i_phi_p,
    input   wire        i_selector,
    output  wire        o_salida
);

assign o_salida = i_selector ? i_phi_r : i_phi_p ;

endmodule