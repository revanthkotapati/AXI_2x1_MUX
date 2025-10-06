module axi_stream_mux_2to1 (
    input wire clk,
    input wire rst_n,
    input wire sel, // Select signal

    // AXI Stream input 1
    input wire [31:0] tdata_0,
    input wire        tvalid_0,
    output reg       tready_0,

    // AXI Stream input 2
    input wire [31:0] tdata_1,
    input wire        tvalid_1,
    output reg       tready_1,

    // AXI Stream output
    output reg [31:0] tdata_out,
    output reg        tvalid_out,
    input wire         tready_out
);

    wire w1;
    assign w1 = tready_out && tvalid_out;
  
    always @(*) begin
        case (sel)
            1'b0: begin
                tdata_out  = (w1) ? tdata_0 : 32'h0;
                tvalid_out = tvalid_0;
                tready_0   = tready_out;
                tready_1   = 1'b0;
            end
            1'b1: begin
                tdata_out  = (w1) ? tdata_1 : 32'h0;
                tvalid_out = tvalid_1;
                tready_0   = 1'b0;
                tready_1   = tready_out;
            end
        endcase
    end

endmodule
