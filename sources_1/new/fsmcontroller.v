`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/11/2024 11:44:57 PM
// Design Name: 
// Module Name: fsmcontroller
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


module fsmcontroller(clk,rst,intest,extest,shift_dr1,up_enable1,mode1,sel1,bp_shift1,shift_dr2,up_enable2,mode2,sel2,bp_shift2);
input clk,rst,intest,extest;
output reg shift_dr1,up_enable1,mode1,sel1,bp_shift1,shift_dr2,up_enable2,mode2,sel2,bp_shift2;
parameter idle=4'b0000,eshift1=4'b0001,eupdate=4'b0010,ecapture=4'b0011,eshift2=4'b0100,ishift1=4'b0101,iupdate=4'b0110,icapture=4'b0111,ishift2=4'b1000;
reg [3:0] state,next_state;
reg [2:0] ecount1=0,ecount2=0,icount1=0,icount2=0;
always @(*)
case(state)
idle:begin shift_dr1=1'bx; up_enable1=0; mode1=0; sel1=1;shift_dr2=1'bx;up_enable2=0;mode2=0;sel2=1;bp_shift1=0;bp_shift2=0;
if(extest)
next_state=eshift1;
else if(intest)
next_state=ishift1;
end

eshift1:begin if(ecount1!=0)begin
shift_dr1=1; up_enable1=0; mode1=1; sel1=1;shift_dr2=1'bx;up_enable2=0;mode2=1;sel2=1;bp_shift1=0;bp_shift2=0;
end
  if(ecount1==3'd7)begin
ecount1=0;
next_state=eupdate;
end
end

eupdate: begin shift_dr1=1'bx; up_enable1=1; mode1=1; sel1=1;shift_dr2=0;up_enable2=0;mode2=1;sel2=1;bp_shift1=0;bp_shift2=0;
next_state=ecapture;
end

ecapture:begin shift_dr1=1'bx; up_enable1=0; mode1=1; sel1=1;shift_dr2=0;up_enable2=0;mode2=1;sel2=1;bp_shift1=0;bp_shift2=0;
next_state=eshift2;
end

eshift2:begin if(ecount2!=0)begin
shift_dr1=1'bx; up_enable1=0; mode1=1; sel1=1;shift_dr2=1;up_enable2=0;mode2=1;sel2=0;bp_shift1=0;bp_shift2=0;
end
  if(ecount2==3'd6)begin
ecount2=0;
next_state=idle;
end
end

ishift1:begin if(icount1!=0)begin
shift_dr1=1; up_enable1=0; mode1=1; sel1=1;shift_dr2=0;up_enable2=0;mode2=1;sel2=1;bp_shift1=0;bp_shift2=0;
end
  if(icount1==3'd3)begin
icount1=0;
next_state=iupdate;
end
end

iupdate:begin
shift_dr1=0; up_enable1=1; mode1=1; sel1=1;shift_dr2=1'bx;up_enable2=0;mode2=1;sel2=1;bp_shift1=0;bp_shift2=0;
next_state=icapture;
end

icapture:begin
shift_dr1=0; up_enable1=0; mode1=1; sel1=1;shift_dr2=1'bx;up_enable2=0;mode2=1;sel2=1;bp_shift1=0;bp_shift2=0;
next_state=ishift2;
end

ishift2: begin if(icount2!=0)begin
shift_dr1=1; up_enable1=0; mode1=1; sel1=0;shift_dr2=1'bx;up_enable2=0;mode2=1;sel2=1;bp_shift1=0;bp_shift2=1;
end
  if(icount2==3'd5)begin
icount2=0;
next_state=idle;
end
end

endcase


always@(posedge clk,negedge rst)begin
if(!rst)
state=idle;
else begin
state=next_state;
if(state==eshift1)
ecount1=ecount1+1;
if(state==eshift2)
ecount2=ecount2+1;
if(state==ishift1)
icount1=icount1+1;
if(state==ishift2)
icount2=icount2+1;
end
end







  
endmodule
