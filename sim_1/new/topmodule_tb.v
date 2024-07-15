`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/11/2024 11:53:45 PM
// Design Name: 
// Module Name: topmodule_tb
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


module topmodule_tb;
reg tck,rst,extest,intest,tdi;
reg [1:0] in;
wire tdo;
wire [1:0] out;
integer i;

topmodule boundary(tck,rst,extest,intest,tdi,in,tdo,out);

always #5 tck=~tck;
initial begin
tck=0;rst=0;extest=0;intest=0;
#1 rst=1;
  for(i=0;i<15;i=i+1)begin
    #2 extest=1;
    #1 extest=0;
    #6 tdi=$random;
    #10 tdi=$random;
    #10 tdi=$random;
    #10 tdi=$random;
    #10 tdi=1'bx;
    #10 tdi=1'bx;
    #100;
  end
end


/*initial begin
tck=0;rst=0;extest=0;intest=0;
#1 rst=1;
#2 extest=1;
#1 extest=0;
#6 tdi=1;
#10 tdi=0;
#10 tdi=1;
#10 tdi=0;
#10 tdi=1'bx;
#10 tdi=1'bx;
#300 $finish;
end*/
 
 /*initial begin
  tck=0;rst=0;extest=0;intest=0;
  #1 rst=1;
  #2 intest=1;
  #1 intest=0;
  #6 tdi=1;
  #10 tdi=0;
  #10 tdi=1'bx;
  #300 $finish;
end*/

/*initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end*/

endmodule

