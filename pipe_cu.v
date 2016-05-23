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
module pipe_cu(IDrs,IDrt,IDop,EXwreg,MEMwreg,MEMm2reg,EXwn,MEMwn,EXm2reg, MEMjumpType,MEMzero,
					IDsst,IDsext,IDshift,IDwreg,IDm2reg,IDwmem,IDaluc,IDselectAlua,IDselectAlub,is_store_hazards,IFwip,IDwir,IFwillJump,IDjumpType
    );
	 
	 input [4:0] IDrs,IDrt;
	 input [4:0] EXwn,MEMwn;
	 input [11:0] IDop;
	 input EXwreg,MEMwreg,EXm2reg;
	 input MEMm2reg;
	 
	 output IDsst,IDsext,IDshift,IDwreg,IDm2reg,IDwmem;
	 output IFwip,IDwir;
	 output [3:0] IDaluc;
	 output [1:0] IDselectAlua,IDselectAlub;
	 output [1:0] is_store_hazards;
	 
	 input [1:0] MEMjumpType;
	 input MEMzero;
	 output IFwillJump;
	 output [1:0] IDjumpType;
	 
	 wire z;
	 wire wreg,m2reg,wmem,shift,aluimm,sst,sext;
	 wire [1:0] pcsource;
	 wire [3:0] aluc;
	 
	 sccu cu_core(IDop,z,wreg,sst,m2reg,shift,aluimm,sext,aluc,wmem,pcsource);
	 
	 //load
	 wire EXE_is_load = EXm2reg;
	 wire ID_alua_need_reg = ~shift;
	 wire ID_alub_need_reg = ~aluimm;
	 wire EXE_A_DEPEN = (IDrs == EXwn)&(EXE_is_load)&(ID_alua_need_reg);
	 wire EXE_B_DEPEN = (IDrt == EXwn)&(EXE_is_load)&(ID_alub_need_reg);
	 wire LoadDepend = EXE_A_DEPEN | EXE_B_DEPEN;
	 wire MEM_is_load = MEMm2reg;
	 //store
	 wire ID_is_store = wmem;
	 wire EX_is_store_hazards = ID_is_store&(IDrt == EXwn)&EXwreg;
	 wire MEM_is_store_hazards = ID_is_store&(IDrt == MEMwn)&MEMwreg;
	 //data Hazards
	 assign IDselectAlua[1] = ((~MEM_is_load)&(
									  ((ID_alua_need_reg)&(~EXwreg)&MEMwreg&(IDrs==MEMwn)) | 
									  ((ID_alua_need_reg)&(EXwreg)&(~MEMwreg)&(IDrs==EXwn)) |
									  ((ID_alua_need_reg)&(EXwreg)&(MEMwreg)&(~(IDrs==EXwn))&(IDrs==MEMwn))|
									  ((ID_alua_need_reg)&(EXwreg)&(MEMwreg)&(IDrs==EXwn)&(~(IDrs==MEMwn)))|
									  ((ID_alua_need_reg)&(EXwreg)&(MEMwreg)&(IDrs==EXwn)&(IDrs==MEMwn))
									  ))|(
									  (MEM_is_load)&(ID_alua_need_reg)&(MEMwreg)&(IDrs == MEMwn)
									  );
	 assign IDselectAlua[0] = ((~MEM_is_load)&(
									  (~ID_alua_need_reg)|
									  ((ID_alua_need_reg)&(~EXwreg)&(MEMwreg)&(IDrs==MEMwn))|
									  ((ID_alua_need_reg)&(EXwreg)&(MEMwreg)&(~(IDrs==EXwn))&(IDrs==MEMwn))
									  ))|(
									  (MEM_is_load)
									  );
									  
	 assign IDselectAlub[1] = ((~MEM_is_load)&(
									  ((ID_alub_need_reg)&(~EXwreg)&MEMwreg&(IDrt==MEMwn)) | 
									  ((ID_alub_need_reg)&(EXwreg)&(~MEMwreg)&(IDrt==EXwn)) |
									  ((ID_alub_need_reg)&(EXwreg)&(MEMwreg)&(~(IDrt==EXwn))&(IDrt==MEMwn))|
									  ((ID_alub_need_reg)&(EXwreg)&(MEMwreg)&(IDrt==EXwn)&(~(IDrt==MEMwn)))|
									  ((ID_alub_need_reg)&(EXwreg)&(MEMwreg)&(IDrt==EXwn)&(IDrt==MEMwn))
									  ))|(
									  (MEM_is_load)&(ID_alub_need_reg)&(MEMwreg)&(IDrt==MEMwn)
									  );
	assign IDselectAlub[0] =  ((~MEM_is_load)&(
									  (~ID_alub_need_reg)|
									  ((ID_alub_need_reg)&(~EXwreg)&(MEMwreg)&(IDrt==MEMwn))|
									  ((ID_alub_need_reg)&(EXwreg)&(MEMwreg)&(~(IDrt==EXwn))&(IDrt==MEMwn))
									  ))|(
									  (MEM_is_load)
									  );
									  
	assign IDwreg = wreg&(~LoadDepend);
	assign IDwmem = wmem&(~LoadDepend);
	assign IDsst = sst;
	assign IDsext = sext;
	assign IDshift = shift;
	assign IDm2reg = m2reg;
	assign IDaluc = aluc;
	assign IFwip = (~LoadDepend);
	assign IDwir = (~LoadDepend);
	
	
	assign IFwillJump = ((~MEMjumpType[1])&MEMjumpType[0]&(~MEMzero))|
							  (MEMjumpType[1]&(~MEMjumpType[0])&MEMzero) |
							  (MEMjumpType[1]&MEMjumpType[0]);
	wire i_beq = (IDop[11:6] == 6'b001111)?1:0; 
	wire i_bne = (IDop[11:6] == 6'b010000)?1:0; 
	wire i_jump = (IDop[11:6] == 6'b010010)?1:0; 
	assign IDjumpType[1] = i_jump | i_beq;
	assign IDjumpType[0] = i_jump | i_bne;
	assign is_store_hazards[1] = (~EX_is_store_hazards) & MEM_is_store_hazards;
	assign is_store_hazards[0] = EX_is_store_hazards;
endmodule
