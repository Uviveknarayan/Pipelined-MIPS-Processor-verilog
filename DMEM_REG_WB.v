module DMEM_REG_WB (ck,REGDSTS,REGWRT,MEMREAD,MEMWRITE,ALUSRC,MEMTOREG,JUMP,BRANCH,ALUCTRL,INSTRUCT,DATA,R,REGDST,regdsts,regwrt,memread,memwrite,alusrc,memtoreg,jump,branch,aluctrl,instruct,data,r,regdst,en);
input ck,en,REGDSTS,REGWRT,MEMREAD,MEMWRITE,ALUSRC,MEMTOREG,JUMP,BRANCH;
input [31:0] INSTRUCT,DATA,R;
input [3:0] ALUCTRL;
input [4:0] REGDST;
output regdsts,regwrt,memread,memwrite,alusrc,memtoreg,jump,branch;
output [31:0] instruct,data,r;
output [3:0] aluctrl;
output[4:0] regdst;
reg regdsts,regwrt,memread,memwrite,alusrc,memtoreg,jump,branch;
reg [31:0] instruct,data,r;
reg [3:0] aluctrl;
reg [4:0] regdst;      
initial begin
  instruct = 32'b0;
end
always @(posedge ck) begin
    if(en) begin
    regdsts <=REGDSTS;
    regwrt  <=REGWRT;
    memread  <= MEMREAD;
    memwrite  <= MEMWRITE;
    alusrc  <= ALUSRC;
    memtoreg <=MEMTOREG;
    jump  <= JUMP;
    branch  <= BRANCH;
    aluctrl <= ALUCTRL;
    instruct <= INSTRUCT;
    data <= DATA;
    r  <=R;
    regdst <= REGDST; 
    end
end 
endmodule