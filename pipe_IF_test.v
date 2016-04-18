`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:08:35 04/18/2016
// Design Name:   pipe_IF
// Module Name:   E:/xilin_project/sccpu/pipe_IF_test.v
// Project Name:  sccpu
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: pipe_IF
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module pipe_IF_test;

	// Inputs
	reg clrn;
	reg clk;

	// Outputs
	wire [31:0] inst;
	wire [31:0] pc;

	// Instantiate the Unit Under Test (UUT)
	pipe_IF uut (
		.clrn(clrn), 
		.clk(clk), 
		.newInst(inst), 
		.pc(pc)
	);

	always #50 clk = ~clk;
	initial begin
		// Initialize Inputs
		clrn = 0;
		clk = 1;
		#50;
		clrn = 1;

		// Wait 100 ns for global reset to finish
		#50;
        
		// Add stimulus here

	end
      
endmodule

