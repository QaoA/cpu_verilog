`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:36:40 04/19/2016
// Design Name:   pipe_ID
// Module Name:   E:/xilin_project/sccpu/pipe_ID_test.v
// Project Name:  sccpu
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: pipe_ID
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module pipe_ID_test;

	// Inputs
	reg [31:0] newInst;
	reg clrn;
	reg clk;
	reg WBwreg;
	reg [4:0] WBwn;
	reg [31:0] WBdata;

	// Outputs
	wire IDwreg;
	wire IDm2reg;
	wire IDwmem;
	wire [3:0] IDaluc;
	wire IDshift;
	wire IDaluimm;
	wire [4:0] IDwn;
	wire [31:0] IDqa;
	wire [31:0] IDqb;
	wire [31:0] IDimmeOrSa;

	// Instantiate the Unit Under Test (UUT)
	pipe_ID uut (
		.newInst(newInst), 
		.clrn(clrn), 
		.clk(clk), 
		.WBwreg(WBwreg), 
		.WBwn(WBwn), 
		.WBdata(WBdata), 
		.IDwreg(IDwreg), 
		.IDm2reg(IDm2reg), 
		.IDwmem(IDwmem), 
		.IDaluc(IDaluc), 
		.IDshift(IDshift), 
		.IDaluimm(IDaluimm), 
		.IDwn(IDwn), 
		.IDqa(IDqa), 
		.IDqb(IDqb), 
		.IDimmeOrSa(IDimmeOrSa)
	);

always #50 clk = ~clk;
	initial begin
		// Initialize Inputs
		newInst = 0;
		clrn = 0;
		clk = 1;
		WBwreg = 0;
		WBwn = 0;
		WBdata = 0;
		#50;
		clrn = 1;

		// Wait 100 ns for global reset to finish
		#50;
      newInst = 32'b000101_00000000_00000011_00001_00001;
		WBwreg = 1;
		WBwn = 5'b00010;
		WBdata = 32'h0000000f;
		#100;
		newInst = 32'b000101_00000000_00001001_00001_00010;
		  
		// Add stimulus here

	end
      
endmodule

