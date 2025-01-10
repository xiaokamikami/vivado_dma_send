`timescale 1ns / 1ps

module interrupt_gen(
input 				sys_clk,
input               full_break,
input               en,
output              nutshell_clk

    );
    
 	

BUFGCE inst_bufgce (
		.O(nutshell_clk),
		.I(sys_clk),
		.CE( ~full_break || en) //no break 2
	);
endmodule
