`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:59:53 04/23/2016 
// Design Name: 
// Module Name:    pipe_cu 
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
module pipe_cu(IDrs,IDrt,IDop,EXwreg,MEMwreg,EXwn,MEMwn,EXm2reg,
					IDsst,IDsext,IDshift,IDwreg,IDm2reg,IDwmem,IDaluc,IDselectAlua,IDselectAlub,IFwip,IDwir
    );
	 
	 input [4:0] IDrs,IDrt;
	 input [4:0] EXwn,MEMwn;
	 input [11:0] IDop;
	 input EXwreg,MEMwreg,EXm2reg;
	 
	 output IDsst,IDsext,IDshift,IDwreg,IDm2reg,IDwmem;
	 output IFwip,IDwir;
	 output [3:0] IDaluc;
	 output [1:0] IDselectAlua,IDselectAlub;
	 
	 wire z;
	 wire wreg,m2reg,wmem,shift,aluimm,sst,sext;
	 wire [1:0] pcsource;
	 wire [3:0] aluc;
	 
	 sccu cu_core(IDop,z,wreg,sst,m2reg,shift,aluimm,sext,aluc,wmme,pcsource);
	 
	 //load
	 wire EXE_is_load = EXm2reg;
	 wire ID_alua_need_reg = ~shift;
	 wire ID_alub_need_reg = ~aluimm;
	 wire EXE_A_DEPPEN = (IDrs == EXwn)&(EXE_is_load)&(ID_alua_need_reg);
	 wire EXE_B_DEPPEN = (IDrt == EXwn)&(EXE_is_load)&(ID_alub_need_reg);
	 wire LoadAppend = EXE_A_DEPPEN | EXE_B_DEPPEN;
	 //data Hazards
	 assign IDselectAlua[1] = (ID_alua_need_reg)&(~EXwreg)&MEMwreg&(IDrs==MEMwn) + 
									  (ID_alua_need_reg)&(EXwreg)&(~MEMwreg)&(IDrs==EXwn) +
									  (ID_alua_need_reg)&(EXwreg)&(MEMwreg)&(~(IDrs==EXwn))&(IDrs==MEMwn)+
									  (ID_alua_need_reg)&(EXwreg)&(MEMwreg)&(IDrs==EXwn)&(~(IDrs==MEMwn))+
									  (ID_alua_need_reg)&(EXwreg)&(MEMwreg)&(IDrs==EXwn)&(IDrs==MEMwn);
	 assign IDselectAlua[0] = (~ID_alua_need_reg)+
									  (ID_alua_need_reg)&(~EXwreg)&(MEMwreg)&(IDrs==MEMwn)+
									  (ID_alua_need_reg)&(EXwreg)&(MEMwreg)&(~(IDrs==EXwn))&(IDrs==MEMwn);
									  
	 assign IDselectAlub[1] = (ID_alub_need_reg)&(~EXwreg)&MEMwreg&(IDrt==MEMwn) + 
									  (ID_alub_need_reg)&(EXwreg)&(~MEMwreg)&(IDrt==EXwn) +
									  (ID_alub_need_reg)&(EXwreg)&(MEMwreg)&(~(IDrt==EXwn))&(IDrt==MEMwn)+
									  (ID_alub_need_reg)&(EXwreg)&(MEMwreg)&(IDrt==EXwn)&(~(IDrt==MEMwn))+
									  (ID_alub_need_reg)&(EXwreg)&(MEMwreg)&(IDrt==EXwn)&(IDrt==MEMwn);
	assign IDselectAlub[0] =  (~ID_alub_need_reg)+
									  (ID_alub_need_reg)&(~EXwreg)&(MEMwreg)&(IDrt==MEMwn)+
									  (ID_alub_need_reg)&(EXwreg)&(MEMwreg)&(~(IDrt==EXwn))&(IDrt==MEMwn);
									  
	assign IDwreg = wreg&(~LoadAppend);
	assign IDwmem = wmem&(~LoadAppend);
	assign IDsst = sst;
	assign IDsext = sext;
	assign IDshift = shift;
	assign IDm2reg = m2reg;
	assign IDaluc = aluc;
	assign IFwip = ~LoadAppend;
	assign IDwir = ~LoadAppend;
endmodule
