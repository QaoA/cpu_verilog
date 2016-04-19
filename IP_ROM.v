`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:15:10 03/21/2016 
// Design Name: 
// Module Name:    IP_ROM 
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
module IP_ROM(a,inst
	);
	input [31:0] a;
	output [31:0] inst;
	wire [31:0] rom [0:63];
	
	assign rom[6'h00]=32'h00000000;
	assign rom[6'h01]=32'b000101_00000000_00000011_00001_00001;//addi #r1 <- r1 + 3   r1 = 3
	assign rom[6'h02]=32'b000101_00000000_00000100_00010_00010;//addi #r2 <- r2 + 4   r2 = 4
	assign rom[6'h03]=32'b00000000_00000000_00000000_00000000;//nop
	assign rom[6'h04]=32'b00000000_00000000_00000000_00000000;//nop
	assign rom[6'h05]=32'b00000000_00000000_00000000_00000000;//nop
	assign rom[6'h06]=32'b000000_000001_00000_00011_00001_00010;//add #r3 <- r1 + r2   r3 = 7
	assign rom[6'h07]=32'b000001_000001_00000_00100_00001_00010;//and #r4 <- r1 and r2  r4 = 0
	assign rom[6'h08]=32'b000001_000010_00000_00101_00001_00010;//or #r5 <- r1 or r2  r5 = 7
	assign rom[6'h09]=32'b000001_000100_00000_00110_00001_00010;//xor #r6 <- r1 xor r2  r6 = 7
	assign rom[6'h0A]=32'b001001_00000000_00000101_00011_00111;//andi #r7 <- r3 and 0101  r7 = 5
	assign rom[6'h0B]=32'b001010_00000000_00001111_00100_01000;//ori #r8 <- r4 or 1111   r8 = 15
	assign rom[6'h0C]=32'b001100_00000000_00000011_00101_01001;//xori #r9 <- r5 xor 0011  r9 = 5
	assign rom[6'h0D]=32'b000010_000001_00010_01010_00000_00110;//sra #r10 <- r6 op shift(2) r10 = 1
	assign rom[6'h0E]=32'b000010_000010_00010_01011_00000_00111;//srl #r11 <- r7 op shift(2) r11 = 1 
	assign rom[6'h0F]=32'b000010_000011_00010_01100_00000_01000;//sll #r12 <- r8 op shift(2) r12 = 12

	assign rom[6'h10]=32'b001110_00000000_00000011_00001_00011;//store memory[r5 + 7] <- r3   memory[r1 + 3] = r3 memory[6] = r3
	assign rom[6'h11]=32'b001101_00000000_00000011_00001_01101;//load load  #r13 <- memory[r1 + 3]  r13 = memory[6]
	assign rom[6'h12]=32'h00000000;
	assign rom[6'h13]=32'h00000000;
	assign rom[6'h14]=32'h00000000;
	assign rom[6'h15]=32'h00000000;
	assign rom[6'h16]=32'h00000000;
	assign rom[6'h17]=32'h00000000;
	assign rom[6'h18]=32'h00000000;
	assign rom[6'h19]=32'h00000000;
	assign rom[6'h1A]=32'h00000000;
	assign rom[6'h1B]=32'h00000000;
	assign rom[6'h1C]=32'h00000000;
	assign rom[6'h1D]=32'h00000000;
	assign rom[6'h1E]=32'h00000000;
	assign rom[6'h1F]=32'h00000000;

	assign rom[6'h20]=32'h00000000;
	assign rom[6'h21]=32'h00000000;
	assign rom[6'h22]=32'h00000000;
	assign rom[6'h23]=32'h00000000;
	assign rom[6'h24]=32'h00000000;
	assign rom[6'h25]=32'h00000000;
	assign rom[6'h26]=32'h00000000;
	assign rom[6'h27]=32'h00000000;
	assign rom[6'h28]=32'h00000000;
	assign rom[6'h29]=32'h00000000;
	assign rom[6'h2A]=32'h00000000;
	assign rom[6'h2B]=32'h00000000;
	assign rom[6'h2C]=32'h00000000;
	assign rom[6'h2D]=32'h00000000;
	assign rom[6'h2E]=32'h00000000;
	assign rom[6'h2F]=32'h00000000;


	assign rom[6'h30]=32'h00000000;
	assign rom[6'h31]=32'h00000000;
	assign rom[6'h32]=32'h00000000;
	assign rom[6'h33]=32'h00000000;
	assign rom[6'h34]=32'h00000000;
	assign rom[6'h35]=32'h00000000;
	assign rom[6'h36]=32'h00000000;
	assign rom[6'h37]=32'h00000000;
	assign rom[6'h37]=32'h00000000;
	assign rom[6'h38]=32'h00000000;
	assign rom[6'h39]=32'h00000000;
	assign rom[6'h3A]=32'h00000000;
	assign rom[6'h3B]=32'h00000000;
	assign rom[6'h3C]=32'h00000000;
	assign rom[6'h3D]=32'h00000000;
	assign rom[6'h3E]=32'h00000000;
	assign rom[6'h3F]=32'h00000000;


	assign inst=rom[a[7:2]];
endmodule
