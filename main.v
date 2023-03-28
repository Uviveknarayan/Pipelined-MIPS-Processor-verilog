`include "ALU.v"
`include "ALU_CONTROL.v"
`include "DMEM_REG_WB.v"
`include "Dmem.v"
`include "EX_REG_MEM.v"
`include "ID_REG_ALU.v"
`include "IFID.v"
`include "Ins_Mem_Read.v"
`include "adder.v"
`include "caljaddr.v"
`include "change_pc.v"
`include "controlhazflush.v"
`include "conunit.v"
`include "mux.v"
`include "nop.v"
`include "r_fle.v"
`include "shiftleft.v"
`include "signext.v"
`include "stall.v"
`timescale 1ns/1ns

module main1(input clk);
wire [31:0] Inst_F,incr_pc;
wire [31:0] Ins_D,incr_pcD;
reg [31:0] pc=32'b0;
wire Regdst_D,jump_D,branch_D,Memread_D,Memtoreg_D,Memwrite_D,ALUsrc_D,Regwrit_D;
wire [3:0] aluct_D;
wire [31:0] Ins_ALU,incr_pcALU,rd1_ALU,rd2_ALU,jaddress_ALU,sign_ExtendALU,shiftleft_alu;
wire Regdst_alu,jump_alu,branch_alu,Memread_alu,Memtoreg_alu,Memwrite_alu,ALUsrc_alu,Regwrit_alu;
wire [3:0] aluct_alu;
wire[4:0] writereg_alu;
wire [31:0] ALU_Result_M,Ins_M,incr_pcM,rd2_M,jaddress_M,baddress_M;
wire zero,Regdst_M,jump_M,branch_M,Memread_M,Memtoreg_M,Memwrite_M,ALUsrc_M,Regwrit_M;
wire [4:0]writreg_M;
wire [3:0]aluct_M ;
wire [31:0] ALU_Result_WB,Ins_WB,od_WB;
wire Regdst_WB,jump_WB,branch_WB,Memread_WB,Memtoreg_WB,Memwrite_WB,ALUsrc_WB,Regwrit_WB;
wire [4:0]writreg_WB;
wire [3:0]aluct_WB;
wire f;
wire dstall,Cstall;
wire [31:0] Ins_ch;
wire [1:0] ALUop;
Ins_Mem_Read ins(pc,1'b1,Inst_F);
adder in(pc,32'b100,incr_pc);
Dstall s(clk,Ins_D,Ins_ALU,Ins_M,Ins_WB,dstall);
flush haz(clk,Ins_ALU[31:26],Ins_M[31:26],Ins_WB[31:26],f);
noper no (clk,Cstall,Inst_F,Ins_ch);
wire [4:0] writereg ;
mux_5bit mm(Regdst_D,Ins_D[20:16],Ins_D[15:11],writereg);
wire [31:0] rd1,rd2,wbd;
r_fle fle(clk,Ins_D[25:21],Ins_D[20:16],writreg_WB,wbd,Regwrit_WB,rd1,rd2);
wire [31:0] sign_extend,alusrc;
sign_extension signex(Ins_D[15:0],sign_extend);
mux_32bit m(ALUsrc_alu,rd2_ALU,sign_ExtendALU,alusrc);
wire[3:0] ALUCTRL;
ALU_CONTROL_UNIT ctrl(clk,Ins_D[5:0],ALUop,ALUCTRL);
wire[31:0]ALU_result;
wire z;
ALU Ex(rd1_ALU,alusrc,aluct_alu,ALU_result,z);
wire [31:0]outputdata;
DMem Memunit(Memread_M,Memwrite_M,ALU_Result_M,rd2_M,wbd);
mux_32bit m2(Memtoreg_WB,ALU_Result_WB,od_WB,wbd);
output reg[31:0] shiftleftaddr;
always@(sign_ExtendALU)
begin
shiftleftaddr={sign_ExtendALU[29:0],2'b00};
end
output reg[27:0] jaddr;
always@(Ins_D[25:0])
begin
jaddr={Ins_D[25:0],2'b00};
end
output reg[31:0] jaddrsll;
always @(incr_pc[31:28],jaddr)
begin
jaddrsll={incr_pc[31:28],jaddr};
end
output reg[31:0]branchpc;
always@(incr_pcALU,shiftleftaddr)
begin
branchpc=incr_pcALU+shiftleftaddr;
end
wire sele;
assign sele=zero&branch_M;
output reg[31:0]selectpc;
always@(sele,incr_pcM,baddress_M) 
begin
case(sele)
	1'b0:selectpc=incr_pcM;
	1'b1:selectpc=baddress_M;
endcase
end
output reg [31:0]finalpc;
always@(jump_M,selectpc,jaddress_M) 
begin
case(jump_M)
	1'b0:finalpc=selectpc;
	1'b1:finalpc=jaddress_M;
endcase
end
always @ (finalpc)
begin
if(dstall==1'b0)
    pc<=finalpc;
end

IFIDreg reg1(clk,Inst_F,incr_pc,Ins_D,incr_pcD,dstall);
ID_REG_ALU reg2(clk,Regdst_D,Regwrit_D,Memread_D,Memwrite_D,ALUsrc_D,Memtoreg_D,jump_D,branch_D,ALUCTRL,Ins_D,incr_pcD,rd1,rd2,
sign_extend,jaddrsll,writereg,Regdst_alu,Regwrit_alu,Memread_alu,Memwrite_alu,ALUsrc_alu,Memtoreg_alu,
jump_alu,branch_alu,aluct_alu,Ins_ALU,incr_pcALU,sign_ExtendALU,rd1_ALU,rd2_ALU,jaddress_ALU,writereg_alu,1'b1);
EX_REG_MEM reg3(clk,zero,1'b1,Regdst_alu,Regwrit_alu,ALUsrc_alu,Memread_alu,Memwrite_alu,Memtoreg_alu,branch_alu,jump_alu,aluct_alu,
Ins_ALU,incr_pcALU,rd2_ALU,ALU_result,branchpc,jaddress_ALU,writereg_alu,Regdst_M,Regwrit_M,ALUsrc_M,Memread_M,
Memwrite_M,Memtoreg_M,branch_M,jump_M,aluct_M,Ins_M,incr_pcM,rd2_M,ALU_Result_M,baddress_M,jaddress_M,writreg_M,z);
DMEM_REG_WB reg4(clk,Regdst_M,Regwrit_M,ALUsrc_M,Memread_M,
Memwrite_M,Memtoreg_M,branch_M,jump_M,aluct_M,Ins_M,rd2_M,ALU_Result_M,writreg_M,
Regdst_WB,Regwrit_WB,Memread_WB,Memwrite_WB,ALUsrc_WB,Memtoreg_WB,jump_WB,branch_WB,aluct_WB,
Ins_WB,od_WB,ALU_Result_WB,writreg_WB,1'b1
);
/*always @(posedge clk)begin
    $display(rd1);
    $display(rd2);
end*/
endmodule