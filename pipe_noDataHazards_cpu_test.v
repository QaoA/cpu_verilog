`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:45:11 04/24/2016
// Design Name:   pipe_noDataHazards_cpu
// Module Name:   E:/xilin_project/sccpu/pipe_noDataHazards_cpu_test.v
// Project Name:  sccpu
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: pipe_noDataHazards_cpu
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module pipe_noDataHazards_cpu_test;

	// Inputs
	reg clrn;
	reg clk;

	// Outputs
	wire [31:0] pc;
	wire [31:0] aluOut;
	wire [31:0] memOut;

	// Instantiate the Unit Under Test (UUT)
	pipe_noDataHazards_cpu uut (
		.clrn(clrn), 
		.clk(clk), 
		.pc(pc), 
		.aluOut(aluOut), 
		.memOut(memOut)
	);

	always #50 clk = ~clk;
	initial begin
		// Initialize Inputs
		clrn = 0;
		clk = 0;

		// Wait 100 ns for global reset to finish
		#50;
        clrn = 1;
		// Add stimulus here
		
		#900;

	end
      
endmodule

