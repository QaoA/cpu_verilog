`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:27:23 03/23/2016
// Design Name:   regfile
// Module Name:   E:/xilin_project/sccpu/rf_test.v
// Project Name:  sccpu
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: regfile
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module rf_test;

	// Inputs
	reg [4:0] rna;
	reg [4:0] rnb;
	reg [31:0] d;
	reg [4:0] wn;
	reg we;
	reg clk;
	reg clrn;

	// Outputs
	wire [31:0] qa;
	wire [31:0] qb;

	// Instantiate the Unit Under Test (UUT)
	regfile uut (
		.rna(rna), 
		.rnb(rnb), 
		.d(d), 
		.wn(wn), 
		.we(we), 
		.clk(clk), 
		.clrn(clrn), 
		.qa(qa), 
		.qb(qb)
	);

	always #50 clk = ~clk;
	initial begin
		// Initialize Inputs
		rna = 0;
		rnb = 0;
		d = 0;
		wn = 0;
		we = 0;
		clk = 1;
		clrn = 1;

		// Wait 100 ns for global reset to finish
		#100;
		
		rna = 5'b00001;
		rnb = 5'b00001;
		d = 1;
		wn = 5'b00001;
		we = 1;
		
		#100;
		rna = 5'b00001;
		rnb = 5'b00001;
		d = 2;
		wn = 5'b00001;
		we = 1;
		
		#100;
		rna = 5'b00001;
		rnb = 5'b00001;
		d = 3;
		wn = 5'b00001;
		we = 1;
        
		// Add stimulus here

	end
      
endmodule

