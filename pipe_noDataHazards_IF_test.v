`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:36:13 04/24/2016
// Design Name:   pipe_noDataHazards_IF
// Module Name:   E:/xilin_project/sccpu/pipe_noDataHazards_IF_test.v
// Project Name:  sccpu
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: pipe_noDataHazards_IF
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module pipe_noDataHazards_IF_test;

	// Inputs
	reg IFwip;
	reg clk;
	reg clrn;

	// Outputs
	wire [31:0] inst;
	wire [31:0] pc;

	// Instantiate the Unit Under Test (UUT)
	pipe_noDataHazards_IF uut (
		.IFwip(IFwip), 
		.clk(clk), 
		.clrn(clrn), 
		.inst(inst), 
		.pc(pc)
	);

	always #50 clk = ~clk;
	initial begin
		// Initialize Inputs
		IFwip = 1;
		clk = 0;
		clrn = 0;

		// Wait 100 ns for global reset to finish
		#50;
		clrn = 1;
        
		// Add stimulus here

	end
      
endmodule

