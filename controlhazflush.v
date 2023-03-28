module flush(input clk,input [5:0]opcodeALU,input [5:0]opcodeDMEM,input [5:0]opcodeWB,output reg flush);
initial
begin
 flush=1'b1;
end
always@(posedge clk,negedge clk)
begin
if((opcodeALU==6'b000010)||(opcodeALU==6'b000100)||(opcodeDMEM==6'b000010)||(opcodeDMEM==6'b000100)||(opcodeWB==6'b000010)||(opcodeWB==6'b000100))
begin
  flush=1'b0;
end
else
  begin
   flush=1'b1;
  end
 
end
endmodule