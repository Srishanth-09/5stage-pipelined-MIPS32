`timescale 1ns / 1ps
module tb2_mips();
reg clk1,clk2;
integer i;
Pipelined_MIPS32 mips(clk1,clk2);
initial begin
    clk1=0; clk2=0;
    repeat(50) begin
      #5 clk1=~clk1;
      #5 clk2=~clk2;
    end
  end
initial 
begin 
    for (i=0; i<32; i=i+1) begin
      mips.regbank[i]=i;
    end
    mips.instr_mem[0]= 32'h28010078;//ADDI R1,R0,120
    mips.instr_mem[1]= 32'h0c631800;//OR R,R3,R3 DUMMY
    mips.instr_mem[2]= 32'h20220000;//LW R2,0(R1)
    mips.instr_mem[3]= 32'h0c631800;//OR R,R3,R3 DUMMY
    mips.instr_mem[4]= 32'h2842002d ;//ADDI R2,R2,45
    mips.instr_mem[5]= 32'h0c631800;//OR R,R3,R3 DUMMY
    mips.instr_mem[6]= 32'h24220001;//SW R2,1(R1)
    mips.instr_mem[7]= 32'hfc000000;//HLT
    
    mips.data_mem[120]=85;
    mips.HALTED=0;
    mips.PC=0;
    mips.TAKEN_BRANCH=0;
    #500 $display("mem[120] : %4d \nmem[121] : %4d",mips.data_mem[120],mips.data_mem[121]);
  end
  initial begin
  $dumpfile("waveform.vcd");
  $dumpvars(0,tb2_mips );
  #600 $finish;
end
endmodule
