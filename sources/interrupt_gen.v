`timescale 1ns / 1ps

module interrupt_gen(
input 				sys_clk,
input               data_next,
input               en,
output              nutshell_clk

    );
    
 	

BUFGCE inst_bufgce (
		.O(nutshell_clk),
		.I(sys_clk),
		.CE( data_next || en) //no break 2
	);
endmodule
