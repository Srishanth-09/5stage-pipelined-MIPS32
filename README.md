# 5stage-pipelined-MIPS32
This project implements a five-stage pipelined MIPS-32 processor using Verilog HDL.
It models the instruction flow through the classic stages :
Instruction Fetch (IF)
Instruction Decode (ID)
Execute (EX)
Memory Access (MEM)
Write Back (WB).

📌 Features
Five-stage pipeline architecture (IF → ID → EX → MEM → WB)

Instruction and data memory modules

Register bank with 32 registers

Branch prediction with branch decision logic

ALU with support for:

Arithmetic: ADD, SUB, MUL, ADDI, SUBI

Logical: AND, OR

Comparison: SLT, SLTI

Load and store support: LW, SW

Branch instructions: BEQZ, BNEQZ

Immediate value extension and instruction decoding

HALT instruction to stop execution

Pipeline register forwarding across all stages
