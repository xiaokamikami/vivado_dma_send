`timescale 1ns / 1ps

module simulation_top_tb;
    reg rst_en;
    reg clk;
    reg io_enable = 0;
    reg m_axis_c2h_aclk;
    // Reset generation
    reg [4:0]test_piple = 0;
    reg [4:0]test_need_count = 0;
    wire core_clk;
    // Instantiate the Unit Under Test (UUT)
    simulation_top uut (
        .rstn_en(!rst_en),
        .m_axis_c2h_aclk(m_axis_c2h_aclk),
        .clk(m_axis_c2h_aclk),
        .io_enable(io_enable),
        .core_clk(core_clk)
    );
    initial begin
        rst_en = 1;
        #100;
        rst_en = 0;
    end
    // Clock generation
    initial begin
        m_axis_c2h_aclk = 0;
        forever #5 m_axis_c2h_aclk = ~m_axis_c2h_aclk; // 100MHz clock
    end

    initial begin
        clk = 0;
        forever #10 clk = ~clk; // 50MHz clock
    end


    // Test stimulus
    always @(posedge m_axis_c2h_aclk) begin
        if (rst_en) begin
            io_enable <= 1'b0;
            test_piple <= 5'd0;
        end else begin
            if (test_piple == test_need_count) begin
                io_enable <= 1'b1;
                test_piple <= 5'd0000;
                test_need_count <= test_need_count + 1'b1;
            end else begin
                io_enable <= 1'b0;
                test_piple = test_piple + 1'b1;
            end
        end
    end
    

endmodule