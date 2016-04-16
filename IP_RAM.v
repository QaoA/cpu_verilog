`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:22:17 03/21/2016 
// Design Name: 
// Module Name:    IP_RAM 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module IP_RAM(we,addr,datain,clk,dataout
	);
	input [31:0] datain;
	input [31:0] addr;
	input clk,we;
	output [31:0] dataout;
	reg [31:0] ram [0:31];
	assign dataout=ram[addr[6:2]];
	always @(posedge clk)begin
	if(we)ram[addr[6:2]]=datain;
	end
	integer i;
	initial begin
	for(i=0;i<32;i=i+1)
		ram[i]=0;
/*   	ram[5'h00]=32'hBF800000;
		ram[5'h14]=32'hBF8000a3;
		ram[5'h15]=32'hBF800027;
		ram[5'h16]=32'hBF800079;
		ram[5'h17]=32'hBF800115; */
		end
endmodule
