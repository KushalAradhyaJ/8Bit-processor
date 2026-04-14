#8-Bit Accumulator-Based Microprocessor
A functional 8-bit RISC processor designed and simulated in Verilog. This project demonstrates the core principles of computer architecture, including the Von Neumann model, instruction fetching, decoding, and execution using a Finite State Machine (FSM).

⚡ Project Overview
This processor uses a two-stage state machine (Fetch and Execute) to manage data flow between a 256-byte RAM and an 8-bit Accumulator (ACC). It is capable of performing arithmetic, memory storage, and control flow (loops) using a custom Instruction Set Architecture (ISA).
Key Features
Architecture: Accumulator-based (single-operand instructions).
Word Size: 8-bit data, 8-bit instructions.
Memory: Integrated 256x8-bit RAM.
Control Flow: Supports unconditional jumps for infinite loops.
Verification: Fully simulated using Icarus Verilog and GTKWave.

📜 Instruction Set Architecture (ISA)
The CPU uses the upper 4 bits of the Instruction Register (IR) for the Opcode and the lower 4 bits for the Operand (Address).
Opcode (Hex),Mnemonic,Description
1x,LOAD,Load value from RAM Address x into ACC.
2x,ADD,Add value at RAM Address x to current ACC.
30,OUT,Send ACC value to the out_port.
40,HALT,Stop Program Counter (PC) incrementing.
5x,STORE,Save current ACC value back to RAM Address x.
7x,JUMP,Set PC to Address x (Creates loops).


🛠️ Hardware Design
The design consists of two main states:FETCH (State 0): Grabs the instruction from RAM at the current PC and increments the PC.EXECUTE (State 1): Decodes the opcode and performs the logic (ALU math, Memory Write, or PC Jump).

![Simulation Waveform](<img width="1602" height="387" alt="image" src="https://github.com/user-attachments/assets/34fb393f-aba6-48b4-a1e6-30f79a513db8" />
)
