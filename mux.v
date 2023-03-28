module mux_32bit(input select,input[31:0] data_1,input[31:0] data_2,output reg [31:0] out_data);
always@(select,data_1,data_2) 
begin
case(select)
	1'b0:out_data=data_1;
	1'b1:out_data=data_2;
endcase
end
endmodule

module mux_5bit(input select,input[4:0] data_1,input[4:0] data_2,output reg [4:0] out_data);
always@(select,data_1,data_2) 
begin
case(select)
	1'b0:out_data=data_1;
	1'b1:out_data=data_2;
endcase
end
endmodule