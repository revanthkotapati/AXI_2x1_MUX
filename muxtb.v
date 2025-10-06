`timescale 1ns/1ps

module axi_stream_mux_tb;
    // Clock and reset
    reg clk;
    reg rst_n;

    // Select signal
    reg sel;

    // AXI Stream input 1
    reg [31:0] tdata_0;
    reg        tvalid_0;
    wire       tready_0;

    // AXI Stream input 2
    reg [31:0] tdata_1;
    reg        tvalid_1;
    wire       tready_1;

    // AXI Stream output
    wire [31:0] tdata_out;
    wire        tvalid_out;
    reg         tready_out;

    // Instantiate the DUT (Design Under Test)
    axi_stream_mux_2to1 dut (
        .clk(clk),
        .rst_n(rst_n),
        .sel(sel),
        .tdata_0(tdata_0),
        .tvalid_0(tvalid_0),
        .tready_0(tready_0),
        .tdata_1(tdata_1),
        .tvalid_1(tvalid_1),
        .tready_1(tready_1),
        .tdata_out(tdata_out),
        .tvalid_out(tvalid_out),
        .tready_out(tready_out)
    );

    // Clock generation
    always #5 clk = ~clk;

    // Test sequence
    initial begin
        // Initialize signals
        clk = 0;
        rst_n = 0;
        sel = 0;
        tdata_0 = 32'h0;
        tvalid_0 = 1'b0;
        tdata_1 = 32'h0;
        tvalid_1 = 1'b0;
        tready_out = 1'b0;

        // Reset pulse
        #10 rst_n = 1;

        // Test case 1: Select stream 0
        #20 sel = 0;
        tdata_0 = 32'h45;
        tvalid_0 = 1'b0;
        tdata_1 = 32'h56;
        tvalid_1 = 1'b0;
        tready_out = 1'b0;
         //if (tdata_out !== tdata_0) $display("Error: Expected %h, got %h", tdata_0, tdata_out);

        // Test case 2: Select stream 1
        #20 sel = 1;
        tdata_0 = 32'h78;
        tvalid_0 = 1'b1;
        tdata_1 = 32'h96;
        tvalid_1 = 1'b1;
        tready_out = 1'b1;
         //if (tdata_out !== tdata_1) $display("Error: Expected %h, got %h", tdata_1, tdata_out);

        // Test case 3: Select stream 0
        #20 sel = 0;
        tdata_0 = 32'h85;
        tvalid_0 = 1'b0;
        tdata_1 = 32'h46;
        tvalid_1 = 1'b0;
        tready_out = 1'b0;
        
        // Test case 4: Select stream 1
        #20 sel = 1;
        tdata_0 = 32'h85;
        tvalid_0 = 1'b1;
        tdata_1 = 32'h46;
        tvalid_1 = 1'b1;
        tready_out = 1'b1;
        
        // Test case 5: Select stream 0
        #20 sel = 0;
        tdata_0 = 32'h85;
        tvalid_0 = 1'b0;
        tdata_1 = 32'h46;
        tvalid_1 = 1'b0;
        tready_out = 1'b0;
        
        // Test case 6: Select stream 1
        #20 sel = 1;
        tdata_0 = 32'h85;
        tvalid_0 = 1'b0;
        tdata_1 = 32'h46;
        tvalid_1 = 1'b0;
        tready_out = 1'b0;
        
        // Test case 7: Select stream 0
        #20 sel = 0;
        tdata_0 = 32'h124;
        tvalid_0 = 1'b1;
        tdata_1 = 32'h245;
        tvalid_1 = 1'b1;
        tready_out = 1'b1;
        
        // Test case 8: Select stream 1
        #20 sel = 1;
        tdata_0 = 32'h85;
        tvalid_0 = 1'b0;
        tdata_1 = 32'h46;
        tvalid_1 = 1'b0;
        tready_out = 1'b0;
        
        // Test case 9: Select stream 0
        #20 sel = 0;
        tdata_0 = 32'h85;
        tvalid_0 = 1'b0;
        tdata_1 = 32'h46;
        tvalid_1 = 1'b0;
        tready_out = 1'b0;
        
        // Test case 10: Select stream 1
        #20 sel = 1;
        tdata_0 = 32'h125;
        tvalid_0 = 1'b1;
        tdata_1 = 32'h136;
        tvalid_1 = 1'b1;
        tready_out = 1'b1;
        
        // Test case 11: Select stream 0
        #20 sel = 0;
        tdata_0 = 32'h85;
        tvalid_0 = 1'b0;
        tdata_1 = 32'h46;
        tvalid_1 = 1'b0;
        tready_out = 1'b0;
        
        // Test case 12: Select stream 1
        #20 sel = 1;
        tdata_0 = 32'h155;
        tvalid_0 = 1'b1;
        tdata_1 = 32'h126;
        tvalid_1 = 1'b1;
        tready_out = 1'b1;
        
        // Test case 13: Select stream 0
        #20 sel = 0;
        tdata_0 = 32'h85;
        tvalid_0 = 1'b0;
        tdata_1 = 32'h46;
        tvalid_1 = 1'b0;
        tready_out = 1'b0;
        
        // Test case 14: Select stream 1
        #20 sel = 1;
        tdata_0 = 32'h185;
        tvalid_0 = 1'b1;
        tdata_1 = 32'h146;
        tvalid_1 = 1'b1;
        tready_out = 1'b1;

        // End simulation
        #700 $finish;
    end
endmodule
