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
	assign rom[6'h01]=32'b000101_00000000_00000011_00001_00001;//addi  #r1 <- r1 + 3  r1 = 3
	assign rom[6'h02]=32'b000101_00000000_00001001_00001_00010;//addi  #r2 <- r1 + 9  r2 = 12 
	assign rom[6'h03]=32'b000000_000001_00000_00011_00001_00010;//add   #r3 <- r1 + r2  r3 = 15
	assign rom[6'h04]=32'b001001_00000000_00001010_00010_00100;//andi  #r4 <- r2 and 10  r4 = 8
	assign rom[6'h05]=32'b001010_00000000_00001001_00001_00101;//ori   #r5 <- r1 or 9  r5 = 11
	assign rom[6'h06]=32'b001100_00000000_00001101_00101_00110;//xori  #r6 <- r5 xor 13 r6 = 6
	assign rom[6'h07]=32'b000001_000001_00000_00111_00001_00100;//and   #r7 <- r1 and r4  r7 = 11
	assign rom[6'h08]=32'b000001_000010_00000_01000_00001_00101;//or    #r8 <- r1 or r5  r8 = 11
	assign rom[6'h09]=32'b000001_000100_00000_01001_00110_00101;//xor   #r9 <- r6 xor r5  r9 = 13
	assign rom[6'h0A]=32'b000010_000001_00010_01010_00000_00001;//sra   #r10 <- r1 shift 2  r10 = 0
	assign rom[6'h0B]=32'b000010_000001_00010_01011_00000_00100;//sra   #r11 <- r4 shift 2  r11 = 14
	assign rom[6'h0C]=32'b000010_000010_00010_01100_00000_00011;//srl   #r12 <- r3 shift 2  r12 = 3
	assign rom[6'h0D]=32'b000010_000011_00010_01101_00000_00110;//sll   #r13 <- r6 shift 2  r13 = 8
	assign rom[6'h0E]=32'b001101_00000000_00000011_00001_01110;//load  #r14 <- memory[r1 + 3]  r14 = r6 = 6
	assign rom[6'h0F]=32'b001101_00000000_00000100_00101_00011;//store memory[r5 + 4] <- r3    r15 = r3 = 15

	assign rom[6'h10]=32'b010010_00000000_00000000_00000000_01;//jump 4
	assign rom[6'h11]=32'h00000000;
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
