`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:01:12 04/24/2016
// Design Name:   pipe_noDataHazards_EX
// Module Name:   E:/xilin_project/sccpu/pipe_noDataHazards_EX_test.v
// Project Name:  sccpu
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: pipe_noDataHazards_EX
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module pipe_noDataHazards_EX_test;

	// Inputs
	reg IDwreg;
	reg IDm2reg;
	reg IDwmem;
	reg [3:0] IDaluc;
	reg [1:0] IDselectAlua;
	reg [1:0] IDselectAlub;
	reg [4:0] IDwn;
	reg [31:0] IDqa;
	reg [31:0] IDqb;
	reg [31:0] IDsaOrImme;
	reg [31:0] MEMaluResult;
	reg [31:0] WBdata;
	reg clk;
	reg clrn;

	// Outputs
	wire EXwreg;
	wire EXm2reg;
	wire EXwmem;
	wire [4:0] EXwn;
	wire [31:0] EXaluResult;
	wire [31:0] EXqb;

	// Instantiate the Unit Under Test (UUT)
	pipe_noDataHazards_EX uut (
		.IDwreg(IDwreg), 
		.IDm2reg(IDm2reg), 
		.IDwmem(IDwmem), 
		.IDaluc(IDaluc), 
		.IDselectAlua(IDselectAlua), 
		.IDselectAlub(IDselectAlub), 
		.IDwn(IDwn), 
		.IDqa(IDqa), 
		.IDqb(IDqb), 
		.IDsaOrImme(IDsaOrImme), 
		.MEMaluResult(MEMaluResult), 
		.WBdata(WBdata), 
		.clk(clk), 
		.clrn(clrn), 
		.EXwreg(EXwreg), 
		.EXm2reg(EXm2reg), 
		.EXwmem(EXwmem), 
		.EXwn(EXwn), 
		.EXaluResult(EXaluResult), 
		.EXqb(EXqb)
	);

	always #50 clk = ~clk;
	initial begin
		// Initialize Inputs
		IDwreg = 0;
		IDm2reg = 0;
		IDwmem = 0;
		IDaluc = 0;
		IDselectAlua = 0;
		IDselectAlub = 0;
		IDwn = 0;
		IDqa = 0;
		IDqb = 0;
		IDsaOrImme = 0;
		MEMaluResult = 0;
		WBdata = 0;
		clk = 0;
		clrn = 0;

		// Wait 100 ns for global reset to finish
		#50;
		clrn = 1;
		#50;
        
		// Add stimulus here

	end
      
endmodule

