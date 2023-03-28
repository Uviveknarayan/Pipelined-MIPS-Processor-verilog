module IFIDreg(input clk,input [31:0]InsF,input [31:0]nextPC,output reg[31:0]InsD,output reg[31:0]nextPCID,input dataBubble);
initial 
begin
InsD<=32'b0;
nextPCID<=32'b0;
end
always@(posedge clk)
begin
#2
if(dataBubble==0)
begin
InsD<=InsF;
nextPCID<=nextPC;
end
else
begin
InsD<=32'b0;
end
end
endmodule