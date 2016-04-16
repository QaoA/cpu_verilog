`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:40:06 03/20/2016 
// Design Name: 
// Module Name:    CU 
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
module sccu(
	input[11:0] op,input z,
	output wreg,output sst,output m2reg,
	output shlft,output aluimm,output sext,
	output[3:0] aluc,output wmem,output[1:0] pcsource
    );
//signals
wire i_add = (op == 12'b000000000001)?1:0;
wire i_and = (op == 12'b000001000001)?1:0;
wire i_or = (op == 12'b000001000010)?1:0;
wire i_xor = (op == 12'b000001000100)?1:0;
wire i_sra = (op == 12'b000010000001)?1:0;
wire i_srl = (op == 12'b000010000010)?1:0;
wire i_sll = (op == 12'b000010000011)?1:0;
wire i_addi = (op[11:6] == 6'b000101)?1:0;
wire i_andi = (op[11:6] == 6'b001001)?1:0; 
wire i_ori = (op[11:6] == 6'b001010)?1:0; 
wire i_xori = (op[11:6] == 6'b001100)?1:0; 
wire i_load = (op[11:6] == 6'b001101)?1:0; 
wire i_store = (op[11:6] == 6'b001110)?1:0; 
wire i_beq = (op[11:6] == 6'b001111)?1:0; 
wire i_bne = (op[11:6] == 6'b010000)?1:0; 
wire i_jump = (op[11:6] == 6'b010010)?1:0; 
//outputs
assign wreg = i_add|i_and|i_or|i_xor|i_sra|i_srl|i_sll|i_addi|i_andi|i_ori|i_xori|i_load;
assign sst = i_add|i_and|i_or|i_xor|i_sra|i_srl|i_sll;
assign m2reg = i_load;
assign shlft = i_sra|i_srl|i_sll;
assign aluimm = i_addi|i_andi|i_ori|i_xori|i_load|i_store;
assign sext = i_addi|i_load|i_store|i_beq|i_bne;
assign wmem = i_store;
//pcsource
assign pcsource[1] = i_jump;
assign pcsource[0] = i_jump|(i_beq&z)|(i_bne&~z);
//aluc
assign aluc[3] = i_andi|i_ori|i_xori|i_load|i_store|i_beq|i_bne|i_jump;
assign aluc[2] = i_sra|i_srl|i_sll|i_addi|i_store|i_beq|i_bne|i_jump;
assign aluc[1] = i_or|i_xor|i_sll|i_addi|i_xori|i_load|i_bne|i_jump;
assign aluc[0] = i_and|i_xor|i_srl|i_addi|i_ori|i_load|i_beq|i_jump;
endmodule
