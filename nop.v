module noper(input clk,input cstall,input [31:0]InsFetch,output reg[31:0]RInsFetch);
always@(posedge clk)
begin
 if(cstall)
  begin
   RInsFetch<=32'b0;
  end
 else
  begin
   RInsFetch<=InsFetch;
  end
end
endmodule