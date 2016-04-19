`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:51:47 04/19/2016
// Design Name:   pipe_EX
// Module Name:   E:/xilin_project/sccpu/pipe_EX_test.v
// Project Name:  sccpu
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: pipe_EX
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module pipe_EX_test;

	// Inputs
	reg IDwreg;
	reg IDm2reg;
	reg IDwmem;
	reg [3:0] IDaluc;
	reg IDshift;
	reg IDaluimm;
	reg [4:0] IDwn;
	reg [31:0] IDqa;
	reg [31:0] IDqb;
	reg [31:0] IDimmeOrSa;
	reg clk;
	reg clrn;

	// Outputs
	wire EXwreg;
	wire EXm2reg;
	wire EXwmem;
	wire [4:0] EXwn;
	wire [31:0] EXaluResult;
	wire [31:0] EXdi;

	// Instantiate the Unit Under Test (UUT)
	pipe_EX uut (
		.IDwreg(IDwreg), 
		.IDm2reg(IDm2reg), 
		.IDwmem(IDwmem), 
		.IDaluc(IDaluc), 
		.IDshift(IDshift), 
		.IDaluimm(IDaluimm), 
		.IDwn(IDwn), 
		.IDqa(IDqa), 
		.IDqb(IDqb), 
		.IDimmeOrSa(IDimmeOrSa), 
		.clk(clk), 
		.clrn(clrn), 
		.EXwreg(EXwreg), 
		.EXm2reg(EXm2reg), 
		.EXwmem(EXwmem), 
		.EXwn(EXwn), 
		.EXaluResult(EXaluResult), 
		.EXdi(EXdi)
	);
always #50 clk = ~clk;
	initial begin
		// Initialize Inputs
		IDwreg = 0;
		IDm2reg = 0;
		IDwmem = 0;
		IDaluc = 0;
		IDshift = 0;
		IDaluimm = 0;
		IDwn = 0;
		IDqa = 0;
		IDqb = 0;
		IDimmeOrSa = 0;
		clk = 1;
		clrn = 0;

		// Wait 100 ns for global reset to finish
		#50;
		clrn = 1;
		#50;
		IDaluc = 4'b0000;
		IDqa = 32'h0002;
		IDqb = 32'h0003;
		#100;
		IDaluc = 4'b0000;
		IDqa = 32'h0004;
		IDqb = 32'h0007;
        
		// Add stimulus here

	end
      
endmodule

