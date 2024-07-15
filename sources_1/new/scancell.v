`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/11/2024 08:37:18 PM
// Design Name: 
// Module Name: scancell
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
/////////////////////////////////////////////////////////////////////////////////
module scancell(in,sin,shiftdr,clk,updatedr,mode,sout,out);
input in,sin,shiftdr,clk,updatedr,mode;
output sout;
output out;
wire a,b,c;
mux shiftmux(in,sin,shiftdr,a);
dflop captureflop(clk,a,b);
dflop updateflop(updatedr,b,c);
mux modemux(in,c,mode,out);
assign sout=b;

    
endmodule

