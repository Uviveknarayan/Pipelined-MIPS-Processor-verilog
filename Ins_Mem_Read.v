module Ins_Mem_Read( input [31:0] adrr, input m_r, output [31:0]r_data);

  reg [31:0] r_data ;
  reg  t_A ;
  reg [31:0] Ins_M_Arr [255:0];
  integer t;
  initial begin
    //integer inst_count;
    Ins_M_Arr[0]=32'b10001100010000110000000000000010;
    Ins_M_Arr[1]=32'b00000000110000110010000000100000;
    Ins_M_Arr[2]=32'b00000000001001110011000000100010;
    Ins_M_Arr[3]=32'b00000000001010010100000000100010;
    for (t=4; t<=255; t=t+1)   
        Ins_M_Arr[t]=32'b0;
  end
  always@( adrr , m_r , Ins_M_Arr[adrr])                                                 
  begin
    if(m_r)
    begin
      t_A=adrr>>2;
      r_data=Ins_M_Arr[t_A];                       
    end
  end
endmodule