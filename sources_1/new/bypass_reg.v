`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/11/2024 08:39:00 PM
// Design Name: 
// Module Name: bypass_reg
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


module bypass_reg(in,bp_shift,clk,out);
input in,bp_shift,clk;
output out;
wire a;
mux bypass(1'bx,in,bp_shift,a);
dflop bypassf(clk,a,out);
endmodule
