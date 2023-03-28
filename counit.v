module conunit(input[5:0] opcode,input[5:0] funct,input [31:0] inst_reg,input clock,output reg reg_dst,output reg jump,output reg branch,output reg mem_read,output reg mem_to_reg,output reg [1:0] ALUOp,output reg mem_write,output reg ALUSrc,output reg reg_write);
always@(opcode,funct,posedge clock)
begin
if(inst_reg==32'b0)
begin
reg_dst<=1'b0;
jump<=1'b0;
branch<=1'b0;
mem_read<=1'b0;
mem_to_reg<=1'b0;
ALUOp<=2'b0;
mem_write<=1'b0;
ALUSrc<=1'b0;
reg_write<=1'b0;
end
else
begin
if(opcode==6'b000000)
begin
reg_dst=1'b1;
jump=1'b0;
branch=1'b0;
mem_read=1'b0;
mem_to_reg=1'b0;
ALUOp=2'b10;
mem_write=1'b0;
ALUSrc=1'b0;
reg_write=1'b1;
end
if(opcode==6'b100011)
begin
reg_dst<=1'b0;
jump<=1'b0;
branch<=1'b0;
mem_read<=1'b1;
mem_to_reg<=1'b1;
ALUOp<=2'b00;
mem_write<=1'b0;
ALUSrc<=1'b1;
reg_write<=1'b1;
end
if(opcode==6'b101011)
begin
reg_dst<=1'bx;
jump<=1'b0;
branch<=1'b0;
mem_read<=1'b0;
mem_to_reg<=1'bx;
ALUOp<=2'b00;
mem_write<=1'b1;
ALUSrc<=1'b1;
reg_write<=1'b0;
end
if(opcode==6'b000100)
begin
reg_dst<=1'bx;
jump<=1'b0;
branch<=1'b1;
mem_read<=1'b0;
mem_to_reg<=1'bx;
ALUOp<=2'b01;
mem_write<=1'b0;
ALUSrc<=1'b0;
reg_write<=1'b0;
end
if(opcode==6'b000010)
begin
reg_dst<=1'bx;
jump<=1'b1;
branch<=1'bx;
mem_read<=1'bx;
mem_to_reg<=1'bx;
ALUOp<=2'bxx;
mem_write<=1'b0;
ALUSrc<=1'bx;
reg_write<=1'b0;
end

end
end
endmodule