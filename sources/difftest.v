`timescale 1ns / 1ps

module difftest(
  input            clock,	// difftest/src/main/scala/Gateway.scala:164:7
  input            reset,	// difftest/src/main/scala/Gateway.scala:164:7
   output [4063:0] out_io_data,
  output           out_enable,	// difft
  output     out_step,	// difftes
  output     dut_zeon,
  input  [77:0]   in_5,
  input  [172:0]  in_4,
  input  [233:0]  in_3,
  input  [170:0]  in_2,
  input  [1159:0] in_1,
  input  [2055:0] in_0
    );
    
 GatewayEndpoint endpoint(
   .clock(clock), 
   .reset(reset),
   .out_zeon(dut_zeon),
   .out_data(out_io_data),
   .out_enable(out_enable),
   .step(out_step),
   .in_5(in_5),
   .in_4(in_4),
   .in_3(in_3),
   .in_2(in_2),
   .in_1(in_1),
   .in_0(in_0)
 );
endmodule
