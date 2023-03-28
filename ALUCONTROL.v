module ALU_CONTROL_UNIT(clk,funct,ALUOP,ALUCTRL);
input clk;
input[5:0] funct;
input[1:0] ALUOP;
output reg[3:0] ALUCTRL;
always@(funct,ALUOP,posedge clk)
  begin
    if(ALUOP==2'b10)
    begin 
      if(funct==6'b100000)
        ALUCTRL=4'b0010; //add
      if(funct==6'b100010)
        ALUCTRL=4'b0110; //sub
      if(funct==6'b100001)
        ALUCTRL=4'b0100; //mul
       if(funct==6'b100100)
        ALUCTRL=4'b0000; //and
       if(funct==6'b100101)
        ALUCTRL=4'b0001; //or
    end
    if(ALUOP==2'b01)
      ALUCTRL=4'b0110;  //beq
    if(ALUOP==2'b00) 
      ALUCTRL=4'b0010;  //lw and sw 
  end
endmodule