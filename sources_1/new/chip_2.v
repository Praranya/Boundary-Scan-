`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/11/2024 09:25:56 PM
// Design Name: 
// Module Name: chip_2
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


module chip_2(tck,in,tdi,shift_dr2,up_enable2,mode2,sel2,bp_shift2,tdo,out);
input tck,tdi,shift_dr2,up_enable2,mode2,bp_shift2,sel2;
input [3:0]in;
output tdo;
output[1:0] out;

wire sout21,sout22,sout23,sout24,sout25,sout26,out21,out22,out23,out24,in21,in22,out2;
scancell chip21(in[0],tdi,shift_dr2,tck,up_enable2,mode2,sout21,out21);
scancell chip22(in[1],sout21,shift_dr2,tck,up_enable2,mode2,sout22,out22);
scancell chip23(in[2],sout22,shift_dr2,tck,up_enable2,mode2,sout23,out23);
scancell chip24(in[3],sout23,shift_dr2,tck,up_enable2,mode2,sout24,out24);
scancell chip25(in21,sout24,shift_dr2,tck,up_enable2,mode2,sout25,out[1]);
scancell chip26(in22,sout25,shift_dr2,tck,up_enable2,mode2,sout26,out[0]);

encoder a2(out24,out23,out22,out21,in22,in21);
bypass_reg chip2(tdi,bp_shift2,tck,out2);
mux mchip2(sout26,out2,sel2,tdo);

    
endmodule
