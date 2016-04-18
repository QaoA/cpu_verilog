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
module pipe_EX(EXwreg,EXm2reg,EXwmem,EXaluc,EXshift,EXaluimm,EXwn,EXqa,EXqb,EXimmeOrSa,clk,clrn,
					MEMwreg,MEMm2reg,MEMwmem,MEMwn,MEMaluResult,MEMdi
    );
	 
	 input EXwreg,EXm2reg,EXwmem,EXshift,EXaluimm;
	 input [3:0] EXaluc;
	 input [4:0] EXwn;
	 input [31:0] EXqa,EXqb;
	 input [31:0] EXimmeOrSa;
	 input clk,clrn;
	 
	 output MEMwreg,MEMm2reg,MEMwmem;
	 output [4:0] MEMwn;
	 output [31:0] MEMaluResult,MEMdi;
	 
	 wire [31:0] alua,alub;
	 mux2x32 alu_a(EXqa,EXimmeOrSa,EXshift,alua);
	 mux2x32 alu_b(EXqb,EXimmeOrSa,EXaluimm,alub);
	 
	 wire z;
	 wire [31:0] alu_result;
	 alu al_unit(.a(alua),.b(alub),.aluc(EXaluc),.z(z),.r(alu_result));
	 
	 EX_MEM_reg ex_to_mem_reg(.EXwreg(EXwreg),.EXm2reg(EXm2reg),.EXwmem(EXwmem),.EXwn(EXwn),.aluResult(alu_result),.EXqb(EXqb),.clrn(clrn),.clk(clk),
										.MEMwreg(MEMwreg),.MEMm2reg(MEMm2reg),.MEMwmem(MEMwmem),.MEMwn(MEMwn),.MEMaluResult(MEMaluResult),.MEMdi(MEMdi));


endmodule
