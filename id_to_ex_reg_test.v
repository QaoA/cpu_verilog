`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:13:28 04/19/2016
// Design Name:   ID_EX_reg
// Module Name:   E:/xilin_project/sccpu/id_to_ex_reg_test.v
// Project Name:  sccpu
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ID_EX_reg
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module id_to_ex_reg_test;

	// Inputs
	reg wreg;
	reg m2reg;
	reg wmem;
	reg [3:0] aluc;
	reg shift;
	reg aluimm;
	reg [4:0] wn;
	reg [31:0] qa;
	reg [31:0] qb;
	reg [31:0] immeOrSa;
	reg clk;
	reg clrn;

	// Outputs
	wire EXwreg;
	wire EXm2reg;
	wire EXwmem;
	wire [3:0] EXaluc;
	wire EXshift;
	wire EXaluimm;
	wire [4:0] EXwn;
	wire [31:0] EXqa;
	wire [31:0] EXqb;
	wire [31:0] EXimmeOrSa;

	// Instantiate the Unit Under Test (UUT)
	ID_EX_reg uut (
		.wreg(wreg), 
		.m2reg(m2reg), 
		.wmem(wmem), 
		.aluc(aluc), 
		.shift(shift), 
		.aluimm(aluimm), 
		.wn(wn), 
		.qa(qa), 
		.qb(qb), 
		.immeOrSa(immeOrSa), 
		.clk(clk), 
		.clrn(clrn), 
		.EXwreg(EXwreg), 
		.EXm2reg(EXm2reg), 
		.EXwmem(EXwmem), 
		.EXaluc(EXaluc), 
		.EXshift(EXshift), 
		.EXaluimm(EXaluimm), 
		.EXwn(EXwn), 
		.EXqa(EXqa), 
		.EXqb(EXqb), 
		.EXimmeOrSa(EXimmeOrSa)
	);
	
	always #50 clk = ~clk;

	initial begin
		// Initialize Inputs
		wreg = 0;
		m2reg = 0;
		wmem = 0;
		aluc = 0;
		shift = 0;
		aluimm = 0;
		wn = 0;
		qa = 0;
		qb = 0;
		immeOrSa = 0;
		clk = 1;
		clrn = 0;

		// Wait 100 ns for global reset to finish
		#50;
		clrn = 1;
		
		#50;
		qa = 32'h00000002;
		qb = 32'h00000003;
		#100;
		qa = 32'h00000004;
		qb = 32'h00000005;
        
		// Add stimulus here

	end
      
endmodule

