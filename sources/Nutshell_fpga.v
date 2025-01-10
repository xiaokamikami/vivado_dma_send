`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/08/28 17:22:47
// Design Name: 
// Module Name: Nutshell_fpga
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

// (c) Copyright 1995-2023 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: xilinx.com:module_ref:NutShell:1.0
// IP Revision: 1

(* X_CORE_INFO = "NutShell,Vivado 2020.2" *)
(* CHECK_LICENSE_TYPE = "Nutshell_fpga,NutShell,{}" *)
(* CORE_GENERATION_INFO = "Nutshell_fpga,NutShell,{x_ipProduct=Vivado 2020.2,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=NutShell,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED}" *)
(* IP_DEFINITION_SOURCE = "module_ref" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module Nutshell_fpga (
  input           clock,
  input           reset,
                  io_mem_awready,	// src/main/scala/system/NutShell.scala:45:14
  output          io_mem_awvalid,	// src/main/scala/system/NutShell.scala:45:14
  output [31:0]   io_mem_awaddr,	// src/main/scala/system/NutShell.scala:45:14
  output [2:0]    io_mem_awprot,	// src/main/scala/system/NutShell.scala:45:14
  output          io_mem_awid,	// src/main/scala/system/NutShell.scala:45:14
                  io_mem_awuser,	// src/main/scala/system/NutShell.scala:45:14
  output [7:0]    io_mem_awlen,	// src/main/scala/system/NutShell.scala:45:14
  output [2:0]    io_mem_awsize,	// src/main/scala/system/NutShell.scala:45:14
  output [1:0]    io_mem_awburst,	// src/main/scala/system/NutShell.scala:45:14
  output          io_mem_awlock,	// src/main/scala/system/NutShell.scala:45:14
  output [3:0]    io_mem_awcache,	// src/main/scala/system/NutShell.scala:45:14
                  io_mem_awqos,	// src/main/scala/system/NutShell.scala:45:14
  input           io_mem_wready,	// src/main/scala/system/NutShell.scala:45:14
  output          io_mem_wvalid,	// src/main/scala/system/NutShell.scala:45:14
  output [63:0]   io_mem_wdata,	// src/main/scala/system/NutShell.scala:45:14
  output [7:0]    io_mem_wstrb,	// src/main/scala/system/NutShell.scala:45:14
  output          io_mem_wlast,	// src/main/scala/system/NutShell.scala:45:14
                  io_mem_bready,	// src/main/scala/system/NutShell.scala:45:14
  input           io_mem_bvalid,	// src/main/scala/system/NutShell.scala:45:14
  input  [1:0]    io_mem_bresp,	// src/main/scala/system/NutShell.scala:45:14
  input           io_mem_bid,	// src/main/scala/system/NutShell.scala:45:14
                  io_mem_buser,	// src/main/scala/system/NutShell.scala:45:14
                  io_mem_arready,	// src/main/scala/system/NutShell.scala:45:14
  output          io_mem_arvalid,	// src/main/scala/system/NutShell.scala:45:14
  output [31:0]   io_mem_araddr,	// src/main/scala/system/NutShell.scala:45:14
  output [2:0]    io_mem_arprot,	// src/main/scala/system/NutShell.scala:45:14
  output          io_mem_arid,	// src/main/scala/system/NutShell.scala:45:14
                  io_mem_aruser,	// src/main/scala/system/NutShell.scala:45:14
  output [7:0]    io_mem_arlen,	// src/main/scala/system/NutShell.scala:45:14
  output [2:0]    io_mem_arsize,	// src/main/scala/system/NutShell.scala:45:14
  output [1:0]    io_mem_arburst,	// src/main/scala/system/NutShell.scala:45:14
  output          io_mem_arlock,	// src/main/scala/system/NutShell.scala:45:14
  output [3:0]    io_mem_arcache,	// src/main/scala/system/NutShell.scala:45:14
                  io_mem_arqos,	// src/main/scala/system/NutShell.scala:45:14
  output          io_mem_rready,	// src/main/scala/system/NutShell.scala:45:14
  input           io_mem_rvalid,	// src/main/scala/system/NutShell.scala:45:14
  input  [1:0]    io_mem_rresp,	// src/main/scala/system/NutShell.scala:45:14
  input  [63:0]   io_mem_rdata,	// src/main/scala/system/NutShell.scala:45:14
  input           io_mem_rlast,	// src/main/scala/system/NutShell.scala:45:14
                  io_mem_rid,	// src/main/scala/system/NutShell.scala:45:14
                  io_mem_ruser,	// src/main/scala/system/NutShell.scala:45:14
                  io_mmio_awready,	// src/main/scala/system/NutShell.scala:45:14
  output          io_mmio_awvalid,	// src/main/scala/system/NutShell.scala:45:14
  output [31:0]   io_mmio_awaddr,	// src/main/scala/system/NutShell.scala:45:14
  output [2:0]    io_mmio_awprot,	// src/main/scala/system/NutShell.scala:45:14
  output          io_mmio_awid,	// src/main/scala/system/NutShell.scala:45:14
                  io_mmio_awuser,	// src/main/scala/system/NutShell.scala:45:14
  output [7:0]    io_mmio_awlen,	// src/main/scala/system/NutShell.scala:45:14
  output [2:0]    io_mmio_awsize,	// src/main/scala/system/NutShell.scala:45:14
  output [1:0]    io_mmio_awburst,	// src/main/scala/system/NutShell.scala:45:14
  output          io_mmio_awlock,	// src/main/scala/system/NutShell.scala:45:14
  output [3:0]    io_mmio_awcache,	// src/main/scala/system/NutShell.scala:45:14
                  io_mmio_awqos,	// src/main/scala/system/NutShell.scala:45:14
  input           io_mmio_wready,	// src/main/scala/system/NutShell.scala:45:14
  output          io_mmio_wvalid,	// src/main/scala/system/NutShell.scala:45:14
  output [63:0]   io_mmio_wdata,	// src/main/scala/system/NutShell.scala:45:14
  output [7:0]    io_mmio_wstrb,	// src/main/scala/system/NutShell.scala:45:14
  output          io_mmio_wlast,	// src/main/scala/system/NutShell.scala:45:14
                  io_mmio_bready,	// src/main/scala/system/NutShell.scala:45:14
  input           io_mmio_bvalid,	// src/main/scala/system/NutShell.scala:45:14
  input  [1:0]    io_mmio_bresp,	// src/main/scala/system/NutShell.scala:45:14
  input           io_mmio_bid,	// src/main/scala/system/NutShell.scala:45:14
                  io_mmio_buser,	// src/main/scala/system/NutShell.scala:45:14
                  io_mmio_arready,	// src/main/scala/system/NutShell.scala:45:14
  output          io_mmio_arvalid,	// src/main/scala/system/NutShell.scala:45:14
  output [31:0]   io_mmio_araddr,	// src/main/scala/system/NutShell.scala:45:14
  output [2:0]    io_mmio_arprot,	// src/main/scala/system/NutShell.scala:45:14
  output          io_mmio_arid,	// src/main/scala/system/NutShell.scala:45:14
                  io_mmio_aruser,	// src/main/scala/system/NutShell.scala:45:14
  output [7:0]    io_mmio_arlen,	// src/main/scala/system/NutShell.scala:45:14
  output [2:0]    io_mmio_arsize,	// src/main/scala/system/NutShell.scala:45:14
  output [1:0]    io_mmio_arburst,	// src/main/scala/system/NutShell.scala:45:14
  output          io_mmio_arlock,	// src/main/scala/system/NutShell.scala:45:14
  output [3:0]    io_mmio_arcache,	// src/main/scala/system/NutShell.scala:45:14
                  io_mmio_arqos,	// src/main/scala/system/NutShell.scala:45:14
  output          io_mmio_rready,	// src/main/scala/system/NutShell.scala:45:14
  input           io_mmio_rvalid,	// src/main/scala/system/NutShell.scala:45:14
  input  [1:0]    io_mmio_rresp,	// src/main/scala/system/NutShell.scala:45:14
  input  [63:0]   io_mmio_rdata,	// src/main/scala/system/NutShell.scala:45:14
  input           io_mmio_rlast,	// src/main/scala/system/NutShell.scala:45:14
                  io_mmio_rid,	// src/main/scala/system/NutShell.scala:45:14
                  io_mmio_ruser,	// src/main/scala/system/NutShell.scala:45:14
  output          io_frontend_awready,	// src/main/scala/system/NutShell.scala:45:14
  input           io_frontend_awvalid,	// src/main/scala/system/NutShell.scala:45:14
  input  [31:0]   io_frontend_awaddr,	// src/main/scala/system/NutShell.scala:45:14
  input  [2:0]    io_frontend_awprot,	// src/main/scala/system/NutShell.scala:45:14
  input           io_frontend_awid,	// src/main/scala/system/NutShell.scala:45:14
                  io_frontend_awuser,	// src/main/scala/system/NutShell.scala:45:14
  input  [7:0]    io_frontend_awlen,	// src/main/scala/system/NutShell.scala:45:14
  input  [2:0]    io_frontend_awsize,	// src/main/scala/system/NutShell.scala:45:14
  input  [1:0]    io_frontend_awburst,	// src/main/scala/system/NutShell.scala:45:14
  input           io_frontend_awlock,	// src/main/scala/system/NutShell.scala:45:14
  input  [3:0]    io_frontend_awcache,	// src/main/scala/system/NutShell.scala:45:14
                  io_frontend_awqos,	// src/main/scala/system/NutShell.scala:45:14
  output          io_frontend_wready,	// src/main/scala/system/NutShell.scala:45:14
  input           io_frontend_wvalid,	// src/main/scala/system/NutShell.scala:45:14
  input  [63:0]   io_frontend_wdata,	// src/main/scala/system/NutShell.scala:45:14
  input  [7:0]    io_frontend_wstrb,	// src/main/scala/system/NutShell.scala:45:14
  input           io_frontend_wlast,	// src/main/scala/system/NutShell.scala:45:14
                  io_frontend_bready,	// src/main/scala/system/NutShell.scala:45:14
  output          io_frontend_bvalid,	// src/main/scala/system/NutShell.scala:45:14
  output [1:0]    io_frontend_bresp,	// src/main/scala/system/NutShell.scala:45:14
  output          io_frontend_bid,	// src/main/scala/system/NutShell.scala:45:14
                  io_frontend_buser,	// src/main/scala/system/NutShell.scala:45:14
                  io_frontend_arready,	// src/main/scala/system/NutShell.scala:45:14
  input           io_frontend_arvalid,	// src/main/scala/system/NutShell.scala:45:14
  input  [31:0]   io_frontend_araddr,	// src/main/scala/system/NutShell.scala:45:14
  input  [2:0]    io_frontend_arprot,	// src/main/scala/system/NutShell.scala:45:14
  input           io_frontend_arid,	// src/main/scala/system/NutShell.scala:45:14
                  io_frontend_aruser,	// src/main/scala/system/NutShell.scala:45:14
  input  [7:0]    io_frontend_arlen,	// src/main/scala/system/NutShell.scala:45:14
  input  [2:0]    io_frontend_arsize,	// src/main/scala/system/NutShell.scala:45:14
  input  [1:0]    io_frontend_arburst,	// src/main/scala/system/NutShell.scala:45:14
  input           io_frontend_arlock,	// src/main/scala/system/NutShell.scala:45:14
  input  [3:0]    io_frontend_arcache,	// src/main/scala/system/NutShell.scala:45:14
                  io_frontend_arqos,	// src/main/scala/system/NutShell.scala:45:14
  input           io_frontend_rready,	// src/main/scala/system/NutShell.scala:45:14
  output          io_frontend_rvalid,	// src/main/scala/system/NutShell.scala:45:14
  output [1:0]    io_frontend_rresp,	// src/main/scala/system/NutShell.scala:45:14
  output [63:0]   io_frontend_rdata,	// src/main/scala/system/NutShell.scala:45:14
  output          io_frontend_rlast,	// src/main/scala/system/NutShell.scala:45:14
                  io_frontend_rid,	// src/main/scala/system/NutShell.scala:45:14
                  io_frontend_ruser,	// src/main/scala/system/NutShell.scala:45:14
input     io_meip,
//output  [38 : 0] io_ila_WBUpc,
//output  io_ila_WBUvalid,
//output  io_ila_WBUrfWen,
//output  [4 : 0] io_ila_WBUrfDest,
//output  [63 : 0] io_ila_WBUrfData,
//output  [63 : 0] io_ila_InstrCnt,
   output [233:0]  nutcore_backend_exu_difftest_packed__bore,
  output [170:0]  nutcore_backend_exu_csr_CSRDiffWrapper_difftestArchEvent_packed__bore,
  output [172:0]  nutcore_backend_wbu_difftest_commit_packed__bore,
  output [2055:0] nutcore_backend_isu_difftest_packed__bore,
  output [1159:0] nutcore_backend_exu_csr_CSRDiffWrapper_difftest_packed__bore,
  output [77:0]   nutcore_backend_wbu_difftest_wb_packed__bore
);



  NutShell inst (
    .clock(clock),
    .reset(reset),
    .io_mem_awready(io_mem_awready),
    .io_mem_awvalid(io_mem_awvalid),
    .io_mem_awaddr(io_mem_awaddr),
    .io_mem_awprot(io_mem_awprot),
    .io_mem_awid(io_mem_awid),
    .io_mem_awuser(io_mem_awuser),
    .io_mem_awlen(io_mem_awlen),
    .io_mem_awsize(io_mem_awsize),
    .io_mem_awburst(io_mem_awburst),
    .io_mem_awlock(io_mem_awlock),
    .io_mem_awcache(io_mem_awcache),
    .io_mem_awqos(io_mem_awqos),
    .io_mem_wready(io_mem_wready),
    .io_mem_wvalid(io_mem_wvalid),
    .io_mem_wdata(io_mem_wdata),
    .io_mem_wstrb(io_mem_wstrb),
    .io_mem_wlast(io_mem_wlast),
    .io_mem_bready(io_mem_bready),
    .io_mem_bvalid(io_mem_bvalid),
    .io_mem_bresp(io_mem_bresp),
    .io_mem_bid(io_mem_bid),
    .io_mem_buser(io_mem_buser),
    .io_mem_arready(io_mem_arready),
    .io_mem_arvalid(io_mem_arvalid),
    .io_mem_araddr(io_mem_araddr),
    .io_mem_arprot(io_mem_arprot),
    .io_mem_arid(io_mem_arid),
    .io_mem_aruser(io_mem_aruser),
    .io_mem_arlen(io_mem_arlen),
    .io_mem_arsize(io_mem_arsize),
    .io_mem_arburst(io_mem_arburst),
    .io_mem_arlock(io_mem_arlock),
    .io_mem_arcache(io_mem_arcache),
    .io_mem_arqos(io_mem_arqos),
    .io_mem_rready(io_mem_rready),
    .io_mem_rvalid(io_mem_rvalid),
    .io_mem_rresp(io_mem_rresp),
    .io_mem_rdata(io_mem_rdata),
    .io_mem_rlast(io_mem_rlast),
    .io_mem_rid(io_mem_rid),
    .io_mem_ruser(io_mem_ruser),
    .io_mmio_awready(io_mmio_awready),
    .io_mmio_awvalid(io_mmio_awvalid),
    .io_mmio_awaddr(io_mmio_awaddr),
    .io_mmio_awprot(io_mmio_awprot),
    .io_mmio_awid(io_mmio_awid),
    .io_mmio_awuser(io_mmio_awuser),
    .io_mmio_awlen(io_mmio_awlen),
    .io_mmio_awsize(io_mmio_awsize),
    .io_mmio_awburst(io_mmio_awburst),
    .io_mmio_awlock(io_mmio_awlock),
    .io_mmio_awcache(io_mmio_awcache),
    .io_mmio_awqos(io_mmio_awqos),
    .io_mmio_wready(io_mmio_wready),
    .io_mmio_wvalid(io_mmio_wvalid),
    .io_mmio_wdata(io_mmio_wdata),
    .io_mmio_wstrb(io_mmio_wstrb),
    .io_mmio_wlast(io_mmio_wlast),
    .io_mmio_bready(io_mmio_bready),
    .io_mmio_bvalid(io_mmio_bvalid),
    .io_mmio_bresp(io_mmio_bresp),
    .io_mmio_bid(io_mmio_bid),
    .io_mmio_buser(io_mmio_buser),
    .io_mmio_arready(io_mmio_arready),
    .io_mmio_arvalid(io_mmio_arvalid),
    .io_mmio_araddr(io_mmio_araddr),
    .io_mmio_arprot(io_mmio_arprot),
    .io_mmio_arid(io_mmio_arid),
    .io_mmio_aruser(io_mmio_aruser),
    .io_mmio_arlen(io_mmio_arlen),
    .io_mmio_arsize(io_mmio_arsize),
    .io_mmio_arburst(io_mmio_arburst),
    .io_mmio_arlock(io_mmio_arlock),
    .io_mmio_arcache(io_mmio_arcache),
    .io_mmio_arqos(io_mmio_arqos),
    .io_mmio_rready(io_mmio_rready),
    .io_mmio_rvalid(io_mmio_rvalid),
    .io_mmio_rresp(io_mmio_rresp),
    .io_mmio_rdata(io_mmio_rdata),
    .io_mmio_rlast(io_mmio_rlast),
    .io_mmio_rid(io_mmio_rid),
    .io_mmio_ruser(io_mmio_ruser),


    .io_frontend_awready(io_frontend_awready),
    .io_frontend_awvalid(io_frontend_awvalid),
    .io_frontend_awaddr(io_frontend_awaddr),
    .io_frontend_awprot(io_frontend_awprot),
    .io_frontend_awid(io_frontend_awid),
    .io_frontend_awuser(io_frontend_awuser),
    .io_frontend_awlen(io_frontend_awlen),
    .io_frontend_awsize(io_frontend_awsize),
    .io_frontend_awburst(io_frontend_awburst),
    .io_frontend_awlock(io_frontend_awlock),
    .io_frontend_awcache(io_frontend_awcache),
    .io_frontend_awqos(io_frontend_awqos),
    .io_frontend_wready(io_frontend_wready),
    .io_frontend_wvalid(io_frontend_wvalid),
    .io_frontend_wdata(io_frontend_wdata),
    .io_frontend_wstrb(io_frontend_wstrb),
    .io_frontend_wlast(io_frontend_wlast),
    .io_frontend_bready(io_frontend_bready),
    .io_frontend_bvalid(io_frontend_bvalid),
    .io_frontend_bresp(io_frontend_bresp),
    .io_frontend_bid(io_frontend_bid),
    .io_frontend_buser(io_frontend_buser),
    .io_frontend_arready(io_frontend_arready),
    .io_frontend_arvalid(io_frontend_arvalid),
    .io_frontend_araddr(io_frontend_araddr),
    .io_frontend_arprot(io_frontend_arprot),
    .io_frontend_arid(io_frontend_arid),
    .io_frontend_aruser(io_frontend_aruser),
    .io_frontend_arlen(io_frontend_arlen),
    .io_frontend_arsize(io_frontend_arsize),
    .io_frontend_arburst(io_frontend_arburst),
    .io_frontend_arlock(io_frontend_arlock),
    .io_frontend_arcache(io_frontend_arcache),
    .io_frontend_arqos(io_frontend_arqos),
    .io_frontend_rready(io_frontend_rready),
    .io_frontend_rvalid(io_frontend_rvalid),
    .io_frontend_rresp(io_frontend_rresp),
    .io_frontend_rdata(io_frontend_rdata),
    .io_frontend_rlast(io_frontend_rlast),
    .io_frontend_rid(io_frontend_rid),
    .io_frontend_ruser(io_frontend_ruser),
    .io_meip(io_meip),
//    .io_ila_WBUpc(io_ila_WBUpc),
//    .io_ila_WBUvalid(io_ila_WBUvalid),
//    .io_ila_WBUrfWen(io_ila_WBUrfWen),
//    .io_ila_WBUrfDest(io_ila_WBUrfDest),
//    .io_ila_WBUrfData(io_ila_WBUrfData),
//    .io_ila_InstrCnt(io_ila_InstrCnt),
    .nutcore_backend_exu_difftest_packed__bore(nutcore_backend_exu_difftest_packed__bore),                           
    .nutcore_backend_exu_csr_CSRDiffWrapper_difftest_packed__bore(nutcore_backend_exu_csr_CSRDiffWrapper_difftest_packed__bore),        
    .nutcore_backend_wbu_difftest_commit_packed__bore(nutcore_backend_wbu_difftest_commit_packed__bore),                    
    .nutcore_backend_wbu_difftest_wb_packed__bore(nutcore_backend_wbu_difftest_wb_packed__bore),                        
    .nutcore_backend_isu_difftest_packed__bore(nutcore_backend_isu_difftest_packed__bore),                           
    .nutcore_backend_exu_csr_CSRDiffWrapper_difftestArchEvent_packed__bore(nutcore_backend_exu_csr_CSRDiffWrapper_difftestArchEvent_packed__bore)
  );
endmodule

