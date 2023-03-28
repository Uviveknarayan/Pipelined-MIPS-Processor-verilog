module ALU(regdata1,regdata2,ALUCTRL,regdata3,zero_flg);
  input [31:0] regdata1;
  input [31:0] regdata2;
  input [3:0] ALUCTRL;
  output reg [31:0] regdata3;
  output reg zero_flg;
    always@(ALUCTRL,regdata1,regdata2)
      begin
        case(ALUCTRL)
        4'b0010 : regdata3=regdata1+regdata2;
        4'b0110 : regdata3=regdata1-regdata2;
        4'b0100 : regdata3=regdata1*regdata2;
        4'b0000 : regdata3=regdata1&regdata2;
        4'b0001 : regdata3=regdata1|regdata2;

        default : regdata3=regdata1+regdata2;
        endcase
        if(regdata3==32'b0)
           zero_flg=1'b1;
        else
           zero_flg=1'b0;   
      end
endmodule