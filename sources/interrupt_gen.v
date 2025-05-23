`timescale 1ns / 1ps

module interrupt_gen(
input 				sys_clk,
input               data_next,
input               rstn,
output              cpu_clk

    );

BUFGCE inst_bufgce (
		.O(cpu_clk),
		.I(sys_clk),
		.CE( data_next || !rstn) //no break 2
	);
endmodule
