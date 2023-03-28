module sign_extension(in_val,out_val);
input[15:0] in_val;
output[31:0] out_val;
reg[31:0] out_val;
always@(in_val)
begin
out_val[31:0]={{16{in_val[15]}},in_val};
end
endmodule