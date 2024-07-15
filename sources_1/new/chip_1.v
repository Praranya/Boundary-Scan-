`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/11/2024 09:17:28 PM
// Design Name: 
// Module Name: chip_1
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


module chip_1(tck,in,tdi,shift_dr1,up_enable1,mode1,sel1,bp_shift1,tdo,out);
input tck,tdi,shift_dr1,up_enable1,mode1,bp_shift1,sel1;
input [1:0] in;
output tdo;
output[3:0] out;
wire sout11,sout12,sout13,sout14,sout15,sout16,out11,out12,in11,in12,in13,in14,out1;
scancell chip11(in[0],tdi,shift_dr1,tck,up_enable1,mode1,sout11,out11);
scancell chip12(in[1],sout11,shift_dr1,tck,up_enable1,mode1,sout12,out12);
scancell chip13(in11,sout12,shift_dr1,tck,up_enable1,mode1,sout13,out[3]);
scancell chip14(in12,sout13,shift_dr1,tck,up_enable1,mode1,sout14,out[2]);
scancell chip15(in13,sout14,shift_dr1,tck,up_enable1,mode1,sout15,out[1]);
scancell chip16(in14,sout15,shift_dr1,tck,up_enable1,mode1,sout16,out[0]);
decoder a1(out12,out11,in11,in12,in13,in14);
bypass_reg chip1(tdi,bp_shift1,tck,out1);
mux mchip1(sout16,out1,sel1,tdo);

   
endmodule
