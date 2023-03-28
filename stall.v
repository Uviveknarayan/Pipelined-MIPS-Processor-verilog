module Dstall(input clk,input [31:0]Ins_D,input [31:0]Ins_ALU,input [31:0] Ins_M,input [31:0] Ins_WB,output reg dstall );
reg readafterwrit1 ,readafterwrit2;
reg writALU,writM ,writWB ;
wire [5:0] opID = Ins_D[31:26] ;
wire [5:0] opID_ALU = Ins_ALU[31:26];
wire [5:0] opID_M = Ins_M[31:26];
wire [5:0] opID_WB =Ins_WB[31:26];
wire [4:0] rs = Ins_D[25:21];
wire [4:0] rt = Ins_D[20:16];
wire [4:0] rd = Ins_D [15:11];
reg[4:0]regtowritALU,regtowritM,regtowritWB;
initial 
 begin
  dstall=1'b0;
  readafterwrit1=1'b0;
  readafterwrit2 =1'b0;
  writALU =1'b0;
  writM =1'b0;
  writWB =1'b0;
  regtowritALU = 5'b0;
  regtowritM =5'b0;
  regtowritWB =5'b0;

 end
 always @(clk,Ins_ALU,Ins_D,Ins_M,Ins_WB)begin
if(Ins_D==32'b0)begin
end
else begin
  if(opID==000000|opID == 000100)begin
    readafterwrit1 =1'b1;
    readafterwrit2 =1'b1;
  end
  else if(opID==101011|opID==100011)begin
    readafterwrit1 =1'b1;
    readafterwrit2 =1'b0;
  end
  else begin
    readafterwrit1 =1'b0;
    readafterwrit2 =1'b0;
  end
end
if(Ins_ALU==32'b0)begin
end
else begin
        if(opID_ALU==000000)begin
            writALU =1'b1;
            regtowritALU = Ins_ALU[15:11];
        end
        else if(opID_ALU==101011|opID_ALU==100011)begin
            writALU =1'b1;
            regtowritALU = Ins_ALU[20:16];
        end
end
if(Ins_M==32'b0)begin
end
else begin
        if(opID_M==000000)begin
            writM =1'b1;
            regtowritM = Ins_M[15:11];
        end
        else if(opID_M==101011|opID_M==100011)begin
            writM =1'b1;
            regtowritM = Ins_M[20:16];
        end
end
if(Ins_WB==32'b0)begin
end
else begin
        if(opID_WB==000000)begin
            writWB=1'b1;
            regtowritWB= Ins_WB[15:11];
        end
        else if(opID_WB==101011|opID_WB==100011)begin
            writWB =1'b1;
            regtowritWB = Ins_WB[20:16];
        end
end
#1 dstall=(((((rs==regtowritALU)&writALU)|((rs==regtowritM)&writM)|((rs==regtowritWB)&writWB))&readafterwrit1|(((rt==regtowritALU)&writALU)|((rt==regtowritM)&writM)|((rt==regtowritWB)&writWB))&readafterwrit2));
 end

endmodule