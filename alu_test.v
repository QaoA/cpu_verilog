`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:47:38 03/22/2016
// Design Name:   alu
// Module Name:   E:/xilin_project/sccpu/alu_test.v
// Project Name:  sccpu
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: alu
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module alu_test;

	// Inputs
	reg [31:0] a;
	reg [31:0] b;
	reg [3:0] aluc;

	// Outputs
	wire z;
	wire [31:0] r;

	// Instantiate the Unit Under Test (UUT)
	alu uut (
		.a(a), 
		.b(b), 
		.aluc(aluc), 
		.z(z), 
		.r(r)
	);

	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;
		aluc = 0;

		// Wait 100 ns for global reset to finish
		#100;
		aluc[3:0] = 4'b1000;
		a = 12;
		b = 8;
		// Add stimulus here

	end
      
endmodule

