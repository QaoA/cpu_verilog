`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:16:11 03/21/2016 
// Design Name: 
// Module Name:    alu 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module alu(a,b,aluc,z,r
    );
	 input [31:0] a;
	 input [31:0] b;
	 input [3:0] aluc;
	 output z;
	 output [31:0] r;
	 
	 wire [31:0] r_shift;
	 wire [4:0] a_shift = a[4:0];
	 shift shifer(b,a_shift,~aluc[1],(~aluc[1])&(~aluc[0]),r_shift);
	 assign r = 
	 (aluc == 4'b0000)?a + b:
	 (aluc == 4'b0111)?a + b:
	 (aluc == 4'b1011)?a + b:
	 (aluc == 4'b1100)?a + b:
	 (aluc == 4'b0001)?a & b:
	 (aluc == 4'b1000)?a & b:
	 (aluc == 4'b0010)?a | b:
	 (aluc == 4'b1001)?a | b:
	 (aluc == 4'b0011)?a ^ b:
	 (aluc == 4'b1010)?a ^ b:
	 (aluc == 4'b1101)?a - b:
	 (aluc == 4'b1110)?a - b:
	 (aluc == 4'b0100)?r_shift:
	 (aluc == 4'b0101)?r_shift:
	 (aluc == 4'b0110)?r_shift:
	 32'h00000000;
	 /*
	 reg [31:0] r;
	 wire [31:0] r_add,r_and,r_or,r_xor,r_shift,r_sub;
	 addsub32 adder(a,b,1'b0,r_add);
	 shift shifer(b,a,~(aluc[1]&aluc[0]),(~aluc[1])&(~aluc[0]),r_shift);
	 addsub32 suber(a,b,1'b1,r_sub);
	 //r_and = a & b;
	 //r_or = a|b;
	 //r_xor = a^b;
	 always @(a or b or aluc)
	 begin
	case (aluc)
		//add
		4'b0000,
		//addi
		4'b0111,
		//load
		4'b1011,
		//sotre
		4'b1100:
		r = r_add;
		//and
		//andi
		4'b0001,
		4'b1000:
		r = a & b;
		//or
		4'b0010,
		//ori
		4'b1001:
		r = a | b;
		//xor
		4'b0011,
		//xori
		4'b1010:
		r = a ^ b; 
		//shift
		4'b0100,
		4'b0101,
		4'b0110:
		r = r_shift;
		//beq
		4'b1101,
		//bne
		4'b1110:
		r = r_sub;
		//jump
		4'b1111:;
	endcase
	end
	*/
	assign z = ~|r;
endmodule
