module r_fle (clk, r_register01, r_register02, wrt_register, wrt_data, r_wrt, r_data01, r_data02);
input [4:0] r_register01;
input [4:0] r_register02;
input [4:0] wrt_register;
input clk;
input r_wrt;
input [31:0] wrt_data;
output [31:0] r_data01;
output [31:0] r_data02;

reg [31:0] Arr [31:0];
integer i;
initial begin
      for (i=1; i<32; i=i+1)   
        Arr[i]=i*10;
end
always @(posedge clk)
  begin
	if (r_wrt) 
        Arr[wrt_register] <= wrt_data;
    Arr[0]=0;
  end
 assign r_data01 = Arr[r_register01];
 assign r_data02 = Arr[r_register02];
endmodule