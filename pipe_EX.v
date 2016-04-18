`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:34:13 04/18/2016 
// Design Name: 
// Module Name:    pipe_EX 
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
module pipe_EX(IDwreg,IDm2reg,IDwmem,IDaluc,IDshift,IDaluimm,IDwn,IDqa,IDqb,IDimmeOrSa,clk,clrn,
					EXwreg,EXm2reg,EXwmem,EXwn,EXaluResult,EXdi
    );
	 
	 input IDwreg,IDm2reg,IDwmem,IDshift,IDaluimm;
	 input [3:0] IDaluc;
	 input [4:0] IDwn;
	 input [31:0] IDqa,IDqb;
	 input [31:0] IDimmeOrSa;
	 input clk,clrn;
	 
	 output EXwreg,EXm2reg,EXwmem;
	 output [4:0] EXwn;
	 output [31:0] EXaluResult,EXdi;
	 
	 wire shift,aluim;
	 wire [3:0] aluc;
	 wire [31:0] qa,qb,immeOrSa;
	 ID_EX_reg id_to_ex_reg(.wreg(IDwreg),.m2reg(IDm2reg),.wmem(IDwmem),.aluc(IDaluc),.shift(IDshift),.aluimm(IDaluimm),.wn(IDwn),.qa(IDqa),.qb(IDqb),.immeOrSa(IDimmeOrSa),
									.EXwreg(EXwreg),.EXm2reg(EXm2reg),.EXwmem(EXwmem),.EXaluc(aluc),.EXshift(shift),.EXaluimm(aluimm),.EXwn(EXwn),
									.EXqa(qa),.EXqb(qb),.EXimmeOrSa(immeOrSa));
	 
	 wire [31:0] alua,alub;
	 mux2x32 alu_a(qa,immeOrSa,shift,alua);
	 mux2x32 alu_b(qb,immeOrSa,aluimm,alub);
	 
	 wire z;
	 //wire [31:0] alu_result;
	 alu al_unit(.a(alua),.b(alub),.aluc(aluc),.z(z),.r(EXaluResult));
	 
	 //EX_MEM_reg ex_to_mem_reg(.EXwreg(EXwreg),.EXm2reg(EXm2reg),.EXwmem(EXwmem),.EXwn(EXwn),.aluResult(alu_result),.EXqb(EXqb),.clrn(clrn),.clk(clk),
	//									.MEMwreg(MEMwreg),.MEMm2reg(MEMm2reg),.MEMwmem(MEMwmem),.MEMwn(MEMwn),.MEMaluResult(MEMaluResult),.MEMdi(MEMdi));


endmodule
