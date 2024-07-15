`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/11/2024 11:47:15 PM
// Design Name: 
// Module Name: topmodule
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


module topmodule(input tck,input rst,input extest,input intest,input tdi,input [1:0] in,output tdo,output [1:0] out);
wire shift_dr1,up_enable1,mode1,sel1,bp_shift1,shift_dr2,up_enable2,mode2,sel2,bp_shift2;
wire tdi1;
wire [3:0]out13;
fsmcontroller fsm1(tck,rst,intest,extest,shift_dr1,up_enable1,mode1,sel1,bp_shift1,shift_dr2,up_enable2,mode2,sel2,bp_shift2);

chip_1 a1(tck,in,tdi,shift_dr1,up_enable1,mode1,sel1,bp_shift1,tdi1,out13);
chip_2 a2(tck,out13,tdi1,shift_dr2,up_enable2,mode2,sel2,bp_shift2,tdo,out);
endmodule
