`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:23:53 03/23/2016
// Design Name:   sccpu
// Module Name:   E:/xilin_project/sccpu/cpu_test.v
// Project Name:  sccpu
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: sccpu
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module cpu_test;

	// Inputs
	reg clk;
	reg clrn;

	// Outputs
	wire [31:0] inst;
	wire [31:0] pc;
	wire [31:0] aluout;
	wire [31:0] memout;

	// Instantiate the Unit Under Test (UUT)
	sccpu uut (
		.clk(clk), 
		.clrn(clrn), 
		.inst(inst), 
		.pc(pc), 
		.aluout(aluout), 
		.memout(memout)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		clrn = 0;

		// Wait 100 ns for global reset to finish
		#50;
		clrn <= 1;
		end
		always begin
		#50;
		clk = ~clk;
		end
      
endmodule

