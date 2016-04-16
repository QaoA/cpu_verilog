`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:06:47 03/21/2016
// Design Name:   mux2x32
// Module Name:   E:/xilin_project/sccpu/mux2x32test.v
// Project Name:  sccpu
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: mux2x32
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module mux2x32test;

	// Inputs
	reg [31:0] a0;
	reg [31:0] a1;
	reg s;

	// Outputs
	wire [31:0] y;

	// Instantiate the Unit Under Test (UUT)
	mux2x32 uut (
		.a0(a0), 
		.a1(a1), 
		.s(s), 
		.y(y)
	);

	initial begin
		// Initialize Inputs
		a0 = 0;
		a1 = 0;
		s = 0;

		// Wait 100 ns for global reset to finish
		#100;
		a0 = 5'b01001;
		a1 = 32'h0000;
		s = 0;
        
		// Add stimulus here

	end
      
endmodule

