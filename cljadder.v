module caljaddr(input [3:0] PCmsb,input [27:0] signextjaddr,output reg [31:0] targetjaddr);
always @(PCmsb,signextjaddr)
begin
targetjaddr={PCmsb,signextjaddr};
end
endmodule