🧠 Pipelined MIPS32 Processor (RISC-based) — Verilog Implementation
🔍 Overview
This project is a Verilog HDL-based implementation of a 5-stage Pipelined MIPS32 Processor, inspired by RISC (Reduced Instruction Set Computer) architecture. It demonstrates instruction-level parallelism, modularity, and the use of Harvard architecture with separate instruction and data memory.

⚙️ Features
✅ 5-stage instruction pipeline:

IF – Instruction Fetch

ID – Instruction Decode & Register Fetch

EX – Execute / ALU

MEM – Memory Access

WB – Write Back

✅ Designed with RISC principles:

Fixed-length 32-bit instructions

Load/store-based memory access

Simple instruction formats and register-based operations

✅ Uses Harvard Architecture:
Separate instruction and data memory for parallel access and efficient pipeline performance

✅ Opcode parameterization for better readability and maintainability

✅ Handles:

Arithmetic operations (ADD, SUB, MUL, ADDI, etc.)

Logical operations (AND, OR)

Comparison (SLT, SLTI)

Memory access (LW, SW)

Branching (BEQZ, BNEQZ)

Halt condition (HLT)

🧪 Testbenches
✅ Test 1: Add Three Numbers
Performs basic arithmetic using register-to-register and immediate instructions.

Demonstrates register access and write-back stage.

✅ Test 2: Load, Add, Store
Loads data from memory into a register

Performs an arithmetic operation

Stores the result back into memory

Demonstrates memory handling and load-store control

✅ Test 3: Factorial of a Number
Implements a loop using branch instructions

Calculates factorial of a given number

Validates branch prediction and pipeline control flow

🛠 Tools Used
Verilog HDL

Xilinx Vivado

GTKWave (for waveform analysis)

📌 Future Improvements
Data forwarding to reduce hazards

Stalling mechanism for better hazard management

Branch prediction optimization

Integration with FPGA board for real-time execution

🙋‍♂️ About Me
I'm Srishanth Pathakamuri, a passionate electronics & communication engineering student, deeply interested in digital design, processor architectures, and hardware-level innovations. This project reflects my journey into building efficient and modular hardware designs from the ground up.
