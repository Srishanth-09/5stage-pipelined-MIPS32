`timescale 1ns / 1ps
module tb_MIPS();
reg clk1,clk2;
integer i;
Pipelined_MIPS32 mips(clk1,clk2);
initial begin
    clk1=0; clk2=0;
    forever begin
      #5 clk1=~clk1;
      #5 clk2=~clk2;
    end
  end
initial begin 
    for (i=0; i<32; i=i+1) begin
      mips.regbank[i]=i;
    end
    mips.instr_mem[0]= 32'h2801000a;//ADD R1,R0,10
    mips.instr_mem[1]= 32'h28020014;//ADDI R2,R0,20
    mips.instr_mem[2]= 32'h28030019;//ADDI R3,R0,25
    mips.instr_mem[3]= 32'h0ce77800;//OR R7,R7,R7 DUMMY INSTRUCTION
    mips.instr_mem[4]= 32'h0ce77800 ;//OR R7,R7,R7 DUMMY INSTRUCTION
    mips.instr_mem[5]= 32'h00222000;//ADD R4,R1,R2
    mips.instr_mem[6]= 32'h0ce77800;//OR R7,R7,R7 DUMMY INSTRUCTION
    mips.instr_mem[7]= 32'h00832800;//ADD R5,R4,R3
    mips.instr_mem[8]= 32'h00000000;//HLT
    mips.HALTED=0;
    mips.PC=0;
    mips.TAKEN_BRANCH=0;
    #280
    for (i=0;i<6;i=i+1)
        $display("R%1d - %2d",i,mips.regbank[i]);
     
  end
 initial begin
 #300 $finish;end
endmodule
