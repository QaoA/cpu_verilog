`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:58:25 03/23/2016
// Design Name:   sccpu_cpu
// Module Name:   E:/xilin_project/sccpu/sccpu_test.v
// Project Name:  sccpu
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: sccpu_cpu
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module sccpu_test;

	// Inputs
	reg clk;
	reg clrn;
	reg [31:0] inst;
	reg [31:0] mem;

	// Outputs
	wire [31:0] pc;
	wire wmem;
	wire [31:0] result;
	wire [31:0] data;

	// Instantiate the Unit Under Test (UUT)
	sccpu_cpu uut (
		.clk(clk), 
		.clrn(clrn), 
		.inst(inst), 
		.mem(mem), 
		.pc(pc), 
		.wmem(wmem), 
		.result(result), 
		.data(data)
	);

always #50 clk = ~clk;
	initial begin
		// Initialize Inputs
		clk = 1;
		clrn = 0;
		inst = 0;
		mem = 0;
		#50;
		clrn = 1;

		// Wait 100 ns for global reset to finish
		#50;
		inst = 32'b000101_00000000_00000011_00001_00001;
		
		#100;
		inst = 32'b000101_00000000_00001001_00001_00010;
		
		#100;
		inst = 32'b000000_000001_00000_00011_00001_00010;
		
		#100;
		inst = 32'b001001_00000000_00001010_00010_00100;
		
		
		
		// Add stimulus here
	end
      
endmodule

