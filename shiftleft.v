module branch_shiftleftby2(in_32,out_32);
input[31:0] in_32;
output reg[31:0] out_32;
always@(in_32)
begin
out_32={in_32[29:0],2'b00};
end
endmodule

module jump_shiftleftby2(in_jump,out_jump);
input[25:0] in_jump;
output reg[27:0] out_jump;
always@(in_jump)
begin
out_jump={in_jump[25:0],2'b00};
end
endmodule
