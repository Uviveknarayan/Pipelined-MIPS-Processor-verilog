module adder(input [31:0] data_1,input [31:0] data_2,output reg [31:0] out_data);
always@(data_1,data_2)
begin
out_data=data_1+data_2;
end
endmodule