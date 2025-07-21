`timescale 1ns / 1ps
module tb3_mips32();
reg clk1,clk2;
integer i;
Pipelined_MIPS32 mips(clk1,clk2);
initial 
    begin
    clk1=0; clk2=0;
    #100
    forever begin
      #5 clk1=~clk1;
      #5 clk2=~clk2;
    end
  end
initial 
begin 
    for (i=0; i<32; i=i+1) 
    begin
      mips.regbank[i]=i;
    end
    mips.instr_mem[0]= 32'h280a00c8;//ADDI R10,R0,200
    mips.instr_mem[1]= 32'h28020001;//ADDI R2,R0,1
    mips.instr_mem[2]= 32'h0e94a000;//OR R20,R20,R20 DUMMY
    mips.instr_mem[3]= 32'h21430000;//LW R3,0(R10)
    mips.instr_mem[4]= 32'h0e94a000;//OR R20,R20,R20 DUMMY
    mips.instr_mem[5]= 32'h14431000;//loop : MUL R2,R2,R3
    mips.instr_mem[6]= 32'h2c630001;//SUBI R3,R3,1;
    mips.instr_mem[7]= 32'h0e94a000;//OR R20,R20,R20 DUMMY
    mips.instr_mem[8]= 32'h3460fffc;//BNEQZ R3,Loop (4 OFFSET)
    mips.instr_mem[9]= 32'h2542fffe;//SW R2,-2(R10)
    mips.instr_mem[10]=32'hfc000000;//HLT
    
    mips.data_mem[200]=7;//factorial of 7 
    mips.HALTED=0;
    mips.PC=0;
    mips.TAKEN_BRANCH=0;
    
end
initial 
begin
    #200
    $monitor("R2 - %2d",mips.regbank[2]);
    $monitor("mem[198] - %0d",mips.data_mem[198]);
end
initial begin
  #6000 // Increased to allow time for pipeline to finish
  $display("Factorial of %0d is: %0d", mips.data_mem[200], mips.data_mem[198]);
  $finish;
end
endmodule
