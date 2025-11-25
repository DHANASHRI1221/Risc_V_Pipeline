# RISC-V 5-Stage Pipelined Processor (Verilog)

This project implements a fully pipelined 5-stage RISC-V processor in Verilog, capable of executing more than 50 arithmetic, logical, memory, and control instructions. The processor integrates hazard detection, data forwarding, and an AI-driven branch predictor, achieving a ~30% reduction in pipeline stalls across diverse workloads. Verification is performed using an extensive SystemVerilog testbench with more than 200 directed and random sequences to validate pipeline robustness.

## Features

### 5-Stage Pipeline
- IF (Instruction Fetch)  
- ID (Instruction Decode & Register Fetch)  
- EX (Execute / ALU)  
- MEM (Memory Access)  
- WB (Write Back)

### Supported RV32I Instructions
Includes 50+ instructions across arithmetic, logical, shift, immediate, branch, jump, load/store, and upper-immediate categories. Examples:  
ADD, SUB, OR, XOR, AND, SLT, SLL, SRL, ADDI, ORI, LW, SW, BEQ, BNE, JAL, JALR, LUI, AUIPC.

## Hazard Handling

### Data Hazards
- Full forwarding support (EX/MEM → EX, MEM/WB → EX).  
- Load-use hazard detection with automatic stall and bubble insertion.

### Control Hazards
- AI-based perceptron-style branch predictor using global branch history.  
- Online learning to improve branch prediction accuracy.  
- Pipeline flush on misprediction.

## AI-Based Branch Prediction

The processor integrates a lightweight learning-based branch predictor:
- Maintains a global history register (GHR).  
- Computes a dot-product with trainable weights.  
- Output sign determines taken/not-taken.  
- Weights updated using actual branch outcomes.

This approach reduces unnecessary stalls by approximately 30% across branch-intensive workloads.

## Verification (SystemVerilog)

The design is validated using an advanced SystemVerilog testbench:
- 200+ directed and constrained-random sequences.  
- Tests cover arithmetic, memory, control flow, hazards, and pipeline corner cases.  
- Self-checking scoreboard verifies register and memory states.  
- Stress tests with long random instruction sequences ensure stability.

All sequences pass, confirming correct pipeline, hazard logic, and branch prediction behavior.

## Performance Summary
- Achieves near 1 CPI on hazard-free workloads.  
- AI-based prediction and forwarding significantly reduce stall cycles.  
- Handles deep branching and dependent instruction sequences reliably.

## Future Enhancements
- Add RV32M (multiply/divide) extension.  
- Introduce I-cache and D-cache.  
- Expand to full UVM verification.  
- Port to FPGA (Basys3/Nexys A7).

## Author
Designed and verified as part of **RISC-V Pipelined Processor Design and Verification (Mar–May 2025)** under **Prof. Sumantra Datta**.
