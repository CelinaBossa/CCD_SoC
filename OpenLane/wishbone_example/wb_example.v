 `timescale 1ns/1ps

  
module wb_example #(
    parameter   [31:0]  BASE_ADDRESS    = 32'h3000_0000,        // base address
    parameter   [31:0]  ENABLE     = BASE_ADDRESS,
    parameter   [31:0]  FRECUENCY  = BASE_ADDRESS + 4,
    parameter   [31:0]  PHI_P  = BASE_ADDRESS + 8,
    parameter   [31:0]  PHI_L1  = BASE_ADDRESS + 12,
    parameter   [31:0]  PHI_L2  = BASE_ADDRESS + 16,
    parameter   [31:0]  PHI_R  = BASE_ADDRESS + 20
    )(
    input wire          wb_clk_i,
    input wire          wb_rst_i,

    // wb interface
    input wire          wbs_cyc_i,       // wishbone transaction
    input wire          wbs_stb_i,       // strobe - data valid and accepted as long as !wbs_sta_o
    input wire          wbs_we_i,        // write enable
    input wire  [31:0]  wbs_adr_i,      // address
    input wire  [31:0]  wbs_dat_i,      // incoming data
    output reg          wbs_ack_o,       // request is completed 
    output wire         wbs_sta_o,     // cannot accept req
    output reg  [31:0]  wbs_dat_o,      // output data



     input  wire         i_enable,
     input  wire   [3:0] i_f_select,
     output reg          o_phi_p,
     output reg          o_phi_l1,
     output reg          o_phi_l2,
     output reg          o_phi_r
 );

    assign wbs_sta_o = 0;
    assign oeb = 16'b0000000011111111;

    // writes
    always @(posedge wb_clk_i) begin
        if(wb_rst_i)
            o_phi_p <= 8'b0;
            o_phi_l1 <= 1'b0;
            o_phi_l2 <= 1'b0;
            o_phi_r <= 1'b0;
        else if(wbs_stb_i && wbs_cyc_i && wbs_we_i && !wbs_sta_o && (wbs_adr_i == PHI_P || wbs_adr_i == PHI_L1 || wbs_adr_i == PHI_L2 || wbs_adr_i == PHI_R)) begin
            if enable
                {o_phi_p,o_phi_l1,o_phi_l2,o_phi_r} <= wbs_dat_i[3:0];
        end
    end

    // reads
    always @(posedge wb_clk_i) begin
        if(wbs_stb_i && wbs_cyc_i && !wbs_we_i && !wbs_sta_o)
            case(wbs_adr_i)
                ENABLE: 
                    wbs_dat_o <= {31'b0, i_enable};
                FRECUENCY: 
                    wbs_dat_o <= {28'b0, i_f_select};
                default:
                    wbs_dat_o <= 32'b0;
            endcase
    end
    
    // acks
        always @(posedge wb_clk_i) begin
            if(wb_rst_i)
                wbs_ack_o <= 0;
            else
                // return ack immediately
                wbs_ack_o <= (wbs_stb_i && !wbs_sta_o && (wbs_adr_i == LED_ADDRESS || wbs_adr_i == BUTTON_ADDRESS));
        end

    `ifdef FORMAL
        default clocking @(posedge wb_clk_i); endclocking
        default disable iff (wb_rst_i);

        cyc:    assume property (wbs_cyc_i |=> wbs_cyc_i && wbs_ack_o);
        write:  cover property (##1 $rose(wbs_stb_i) |-> ##[+] wbs_dat_o[3:0] == 4'b1010);
        read:   cover property (##1 $rose(wbs_stb_i) |-> ##[+] leds[7:0] == 8'b11110000);
    `endif
endmodule