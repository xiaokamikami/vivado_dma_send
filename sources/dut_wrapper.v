`timescale 1ns / 1ps
`include "axi.vh"

module dut_wrapper(
    input xdma_clk,
    input xdma_resetn,
    input encore_clk,
    input encore_task_clk,
    input ila_clk,
    `axi_slave_if_noid(AXI_DMA, 32),
    //`axi_slave_if_noid(AXI_RESET, 20),
    `axi_master_if(AXI_MEM, 33),
    `axi_master_if(AXI_MMIO, 32),
    input reset_en,
    //dut out
    output  out_enable,
    output  [4063:0] out_io_data
    );
    
    core_bd core_bd(
    .xdma_clk(xdma_clk),
    .xdma_resetn(xdma_resetn),
    .encore_clk(encore_clk),
    .ila_clk(ila_clk),
    .reset_en(reset_en),
    .encore_task_clk(encore_task_clk),
    `axi_connect_if_noid(AXI_DMA, AXI_DMA),
    //`axi_connect_if_noid(AXI_RESET, AXI_RESET),
    `axi_connect_if(AXI_MEM, AXI_MEM),
    `axi_connect_if(AXI_MMIO, AXI_MMIO),
    .out_enable(out_enable),
    .out_io_data_0(out_io_data)
);
endmodule
