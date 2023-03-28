module change_pc(clk,in_put,out_put,activate);
input clk,activate;
input [31:0] in_put;
output reg [31:0] out_put;

initial
assign out_put=32'b0;

always @(in_put) 
begin
if(activate==1'b0)
    assign out_put=in_put;
end
endmodule