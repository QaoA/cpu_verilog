`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:44:01 04/24/2016
// Design Name:   pipe_noDataHazards_ID
// Module Name:   E:/xilin_project/sccpu/pipe_noDataHazards_ID_test.v
// Project Name:  sccpu
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: pipe_noDataHazards_ID
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module pipe_noDataHazards_ID_test;

	// Inputs
	reg clk;
	reg clrn;
	reg [31:0] IFinst;
	reg [4:0] EXwn;
	reg [4:0] MEMwn;
	reg [4:0] WBwn;
	reg EXm2reg;
	reg EXwreg;
	reg MEMwreg;
	reg WBwreg;
	reg [31:0] WBdata;

	// Outputs
	wire IFwip;
	wire IDwreg;
	wire IDm2reg;
	wire IDwmem;
	wire [3:0] IDaluc;
	wire [1:0] IDselectAlua;
	wire [1:0] IDselectAlub;
	wire [4:0] IDwn;
	wire [31:0] IDqa;
	wire [31:0] IDqb;
	wire [31:0] IDsaOrImme;

	// Instantiate the Unit Under Test (UUT)
	pipe_noDataHazards_ID uut (
		.clk(clk), 
		.clrn(clrn), 
		.IFinst(IFinst), 
		.EXwn(EXwn), 
		.MEMwn(MEMwn), 
		.WBwn(WBwn), 
		.EXm2reg(EXm2reg), 
		.EXwreg(EXwreg), 
		.MEMwreg(MEMwreg), 
		.WBwreg(WBwreg), 
		.WBdata(WBdata), 
		.IFwip(IFwip), 
		.IDwreg(IDwreg), 
		.IDm2reg(IDm2reg), 
		.IDwmem(IDwmem), 
		.IDaluc(IDaluc), 
		.IDselectAlua(IDselectAlua), 
		.IDselectAlub(IDselectAlub), 
		.IDwn(IDwn), 
		.IDqa(IDqa), 
		.IDqb(IDqb), 
		.IDsaOrImme(IDsaOrImme)
	);
	always #50 clk = ~clk;
	initial begin
		// Initialize Inputs
		clk = 0;
		clrn = 0;
		IFinst = 0;
		EXwn = 0;
		MEMwn = 0;
		WBwn = 0;
		EXm2reg = 0;
		EXwreg = 0;
		MEMwreg = 0;
		WBwreg = 0;
		WBdata = 0;

		// Wait 100 ns for global reset to finish
		#50;
		clrn = 1;
		
		#50;
		IFinst = 32'b000101_00000000_00000011_00001_00001;
		#100;
		IFinst = 32'b000101_00000000_00000100_00010_00010;
        
		// Add stimulus here

	end
      
endmodule

