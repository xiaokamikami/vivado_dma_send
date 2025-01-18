`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/04/2024 10:14:15 PM
// Design Name: 
// Module Name: system_top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
`include "axi.vh"

module system_top #(
    parameter   IFSIM                     = 0,
    parameter   FIFO_WIDTH                = 64,
    parameter   AXIS_WIDTH                = 512,
    parameter   EXTRA_INFORMATION_WIDTH   = 25,
    //parameter   COMMIT_WINDOW             = 55,
    parameter   INDEX_IsNormalCommit      = 0,
    parameter   INDEX_ISRegCompare        = 1,
    parameter   INDEX_DiffError           = 2,
    parameter   INDEX_ArchEvent           = 3,
    parameter   INDEX_TrapEvent           = 4,
    parameter   INDEX_LrscEvent           = 5,
    parameter   INDEX_MMIOEvent           = 6,
    parameter   INDEX_ITERATION_END       = 10
)(
    c0_ddr4_act_n,
    c0_ddr4_adr,
    c0_ddr4_ba,
    c0_ddr4_bg,
    c0_ddr4_ck_c,
    c0_ddr4_ck_t,
    c0_ddr4_cke,
    c0_ddr4_cs_n,
    c0_ddr4_dm_n,
    c0_ddr4_dq,
    c0_ddr4_dqs_c,
    c0_ddr4_dqs_t,
    c0_ddr4_odt,
    c0_ddr4_reset_n,
    ddr4_mig_calib_done,
    ddr4_mig_sys_clk_clk_n,
    ddr4_mig_sys_clk_clk_p,
    pci_ep_rxn,
    pci_ep_rxp,
    pci_ep_txn,
    pci_ep_txp,
    pcie_ep_gt_ref_clk_clk_n,
    pcie_ep_gt_ref_clk_clk_p,
    pcie_ep_lnk_up,
    pcie_ep_perstn
    );
output c0_ddr4_act_n;
output [16:0]c0_ddr4_adr;
output [1:0]c0_ddr4_ba;
output [1:0]c0_ddr4_bg;
output [0:0]c0_ddr4_ck_c;
output [0:0]c0_ddr4_ck_t;
output [0:0]c0_ddr4_cke;
output [0:0]c0_ddr4_cs_n;
inout [7:0]c0_ddr4_dm_n;
inout [63:0]c0_ddr4_dq;
inout [7:0]c0_ddr4_dqs_c;
inout [7:0]c0_ddr4_dqs_t;
output [0:0]c0_ddr4_odt;
output c0_ddr4_reset_n;
output ddr4_mig_calib_done;
input ddr4_mig_sys_clk_clk_n;
input ddr4_mig_sys_clk_clk_p;

input [7:0]pci_ep_rxn;
input [7:0]pci_ep_rxp;
output [7:0]pci_ep_txn;
output [7:0]pci_ep_txp;
input pcie_ep_gt_ref_clk_clk_n;
input pcie_ep_gt_ref_clk_clk_p;
output pcie_ep_lnk_up;
input pcie_ep_perstn;

`axi_wire_noid(32, AXI_DMA);
//`axi_wire_noid(20, AXI_RESET);
`axi_wire(33, AXI_MEM);
`axi_wire(32, AXI_MMIO);
wire encore_clk;
wire encore_resetn;
wire xdma_clk;
wire xdma_resetn;
wire reset_en;
////H2C AXI-Stream Interface
//wire  [AXIS_WIDTH-1:0]    s_axis_h2c_tdata_0;
//wire  [63:0]              s_axis_h2c_tkeep_0;
//wire                      s_axis_h2c_tlast_0;
//wire                      s_axis_h2c_tready_0;
//wire                      s_axis_h2c_tvalid_0;

////C2H AXI-Stream
//wire  [AXIS_WIDTH-1:0]    m_axis_c2h_tdata_0;
//wire  [63:0]              m_axis_c2h_tkeep_0;
//wire                      m_axis_c2h_tlast_0;
//wire                      m_axis_c2h_tready_0;
//wire                      m_axis_c2h_tvalid_0;

wire encore_task_clk;
wire ila_clk;
wire if_delayed;
wire [17:0] io_covSum_0;

 wire out_enable;
 wire [4063:0] out_io_data;

pcie4_send pcie4_send (
    `axi_connect_if_noid(AXI_DMA, AXI_DMA),
    //`axi_connect_if_noid(AXI_RESET, AXI_RESET),
    `axi_connect_if(AXI_MEM, AXI_MEM),
    `axi_connect_if(AXI_MMIO, AXI_MMIO),
    //ddr region
    .c0_ddr4_act_n(c0_ddr4_act_n),
    .c0_ddr4_adr(c0_ddr4_adr),
    .c0_ddr4_ba(c0_ddr4_ba),
    .c0_ddr4_bg(c0_ddr4_bg),
    .c0_ddr4_ck_c(c0_ddr4_ck_c),
    .c0_ddr4_ck_t(c0_ddr4_ck_t),
    .c0_ddr4_cke(c0_ddr4_cke),
    .c0_ddr4_cs_n(c0_ddr4_cs_n),
    .c0_ddr4_dm_n(c0_ddr4_dm_n),
    .c0_ddr4_dq(c0_ddr4_dq),
    .c0_ddr4_dqs_c(c0_ddr4_dqs_c),
    .c0_ddr4_dqs_t(c0_ddr4_dqs_t),
    .c0_ddr4_odt(c0_ddr4_odt),
    .c0_ddr4_reset_n(c0_ddr4_reset_n),
    .ddr4_mig_calib_done(ddr4_mig_calib_done),
    .ddr4_mig_sys_clk_clk_n(ddr4_mig_sys_clk_clk_n),
    .ddr4_mig_sys_clk_clk_p(ddr4_mig_sys_clk_clk_p),
    //pcie region
    .pci_ep_rxn(pci_ep_rxn),
    .pci_ep_rxp(pci_ep_rxp),
    .pci_ep_txn(pci_ep_txn),
    .pci_ep_txp(pci_ep_txp),
    .pcie_ep_gt_ref_clk_clk_n(pcie_ep_gt_ref_clk_clk_n),
    .pcie_ep_gt_ref_clk_clk_p(pcie_ep_gt_ref_clk_clk_p),
    .pcie_ep_lnk_up(pcie_ep_lnk_up),
    .pcie_ep_perstn(pcie_ep_perstn),
    //encore region
    .encore_clk(encore_clk),
    .encore_resetn(encore_resetn),
    .xdma_clk(xdma_clk),
    .xdma_resetn(xdma_resetn),
    .reset_en(reset_en),
    .encore_task_clk(encore_task_clk),
    .ila_clk(ila_clk),
    .out_io_data(out_io_data),
    .out_enable(out_enable)
    );

dut_wrapper dut_wrapper(
    .xdma_clk(xdma_clk),
    .xdma_resetn(xdma_resetn),
    .encore_clk(encore_clk),
    .ila_clk(ila_clk),
    .encore_task_clk(encore_task_clk),
    .reset_en(reset_en),
    `axi_connect_if_noid(AXI_DMA, AXI_DMA),
    //`axi_connect_if_noid(AXI_RESET, AXI_RESET),
    `axi_connect_if(AXI_MEM, AXI_MEM),
    `axi_connect_if(AXI_MMIO, AXI_MMIO),
    .out_enable(out_enable),
    .out_io_data(out_io_data)

);


endmodule
