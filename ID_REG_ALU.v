module ID_REG_ALU(ck,REGDSTS,REGWRT,MEMREAD,MEMWRITE,ALUSRC,MEMTOREG,JUMPS,BRANCHES,ALUCTRL,INSTRUCT,PC_NEXT,DATA1,DATA2,SIGNAL,J_VALUE,REGDST,regdsts,regwrt,memread,memwrite,alusrc,memtoreg,jumps,branches,aluctrl,instruct,pc_next,signal,data1,data2,j_value,regdst,en);
input ck,en,REGDSTS,REGWRT,MEMREAD,MEMWRITE,ALUSRC,MEMTOREG,JUMPS,BRANCHES;
input [31:0] INSTRUCT,PC_NEXT,DATA1,DATA2,SIGNAL,J_VALUE;
input [3:0] ALUCTRL;
input [4:0] REGDST;
output regdsts,regwrt,memread,memwrite,alusrc,memtoreg,jumps,branches;
output [31:0] instruct,pc_next,signal,data1,data2,j_value;
output [3:0] aluctrl;
output[4:0] regdst;
reg regdsts,regwrt,memread,memwrite,alusrc,memtoreg,jumps,branches;
reg [31:0] instruct,pc_next,signal,data1,data2,j_value;
reg [3:0] aluctrl;
reg [4:0] regdst;      
initial begin
  instruct = 32'b0;
  pc_next =32'b0;
end
always @(posedge ck) begin
    if(en) begin
    regdsts <=REGDSTS;
    regwrt  <=REGWRT;
    memread  <= MEMREAD;
    memwrite  <= MEMWRITE;
    alusrc  <= ALUSRC;
    memtoreg <=MEMTOREG;
    jumps  <= JUMPS;
    branches  <=BRANCHES;
    aluctrl <= ALUCTRL;
    instruct <= INSTRUCT;
    pc_next<=PC_NEXT;
    signal <=SIGNAL;
    data1 <= DATA1;
    data2 <=DATA2;
    regdst <= REGDST;
    j_value <= J_VALUE; 
    end
end 
endmodule