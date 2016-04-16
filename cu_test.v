`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:01:42 03/22/2016
// Design Name:   sccu
// Module Name:   E:/xilin_project/sccpu/cu_test.v
// Project Name:  sccpu
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: sccu
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module cu_test;

	// Inputs
	reg [11:0] op;
	reg z;

	// Outputs
	wire wreg;
	wire sst;
	wire m2reg;
	wire shlft;
	wire aluimm;
	wire sext;
	wire [3:0] aluc;
	wire wmem;
	wire [1:0] pcsource;

	// Instantiate the Unit Under Test (UUT)
	sccu uut (
		.op(op), 
		.z(z), 
		.wreg(wreg), 
		.sst(sst), 
		.m2reg(m2reg), 
		.shlft(shlft), 
		.aluimm(aluimm), 
		.sext(sext), 
		.aluc(aluc), 
		.wmem(wmem), 
		.pcsource(pcsource)
	);

	initial begin
		// Initialize Inputs
		op = 0;
		z = 0;

		// Wait 100 ns for global reset to finish
		#100;
		op = 12'b001001_000000;
        
		// Add stimulus here

	end
      
endmodule

