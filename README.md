# 8-Bit Arithmetic Logic Unit (ALU) | Verilog HDL

An 8-bit Arithmetic Logic Unit (ALU) designed and implemented in Verilog HDL. The ALU supports five arithmetic and logical operations, along with four status flags for interpreting the results.

This project was built independently over three days, starting with essentially no prior experience in digital logic or Verilog.

## Supported Operations

The ALU accepts two 8-bit inputs and a 3-bit opcode.

| Opcode | Operation | Description |
|--------|-----------|-------------|
| `000` | ADD | 8-bit binary addition |
| `001` | SUB | 8-bit binary subtraction |
| `010` | AND | Bitwise AND |
| `011` | OR | Bitwise OR |
| `111` | XOR | Bitwise XOR |

All other opcodes produce a zero result.

## Architecture

The ALU uses a modular design, with individual arithmetic and logic components connected through a top-level module.

### 1. Addition
- Built an 8-bit ripple-carry adder from fundamental adder circuits.
- Uses carry propagation between consecutive bit positions.
- Produces an 8-bit result and an additional carry-out bit.

### 2. Subtraction
- Built an 8-bit ripple-borrow subtractor using full-subtractor circuits.
- Implements borrow propagation between consecutive bit positions.
- Produces an 8-bit difference and a final borrow-out bit.

### 3. Bitwise Logic
- Implements AND, OR, and XOR operations on two 8-bit inputs.
- Calculates logical outputs independently of the arithmetic circuits.

### 4. Top-Level ALU
- Instantiates the arithmetic and logic modules.
- Uses a combinational `case` statement to select the requested operation.
- Generates four status flags based on the selected operation and result.

## Status Flags

| Flag | Name | Description |
|------|------|-------------|
| `Z` | Zero | Set when the result equals zero |
| `N` | Negative | Reflects bit 7 of the result |
| `C` | Carry | Carry-out for addition; no-borrow for subtraction |
| `V` | Overflow | Detects signed arithmetic overflow |

The arithmetic circuits support both unsigned and two's-complement signed interpretations without requiring separate datapaths.

## Verification

I developed Verilog testbenches to validate the ALU's functionality, beginning with directed tests and progressing to automated exhaustive result verification.

### Directed Testing

Initial tests covered:
- Basic addition and subtraction
- Carry and borrow propagation
- Positive and negative signed overflow
- Zero and negative result flags
- Bitwise AND, OR, and XOR
- Invalid opcodes

### Exhaustive Result Verification

Using nested `for` loops, I tested all 65,536 possible combinations of two 8-bit inputs for each supported operation.

| Operation | Test Cases | Result Errors |
|-----------|------------|---------------|
| Addition | 65,536 | 0 |
| Subtraction | 65,536 | 0 |
| AND | 65,536 | 0 |
| OR | 65,536 | 0 |
| XOR | 65,536 | 0 |
| **Total** | **327,680** | **0** |

All 327,680 operation-result comparisons passed.

The exhaustive tests verified the 8-bit outputs, while status flags were checked separately using directed test cases.

## Running the Project

1. Open the Verilog source files in a compatible Verilog simulator.
2. Include the top-level ALU module and all supporting arithmetic and logic modules.
3. Include `alu_8bit_tb.v` as the testbench.
4. Select `alu_8bit_tb` as the simulation top-level module.
5. Run the simulation and inspect the verification results.

The project was developed and simulated using EnggViz.

## What I Learned

Through this project, I gained my first practical experience with:

- Boolean algebra and combinational digital logic
- Half-adders, full-adders, and arithmetic circuit design
- Carry and borrow propagation
- Signed and unsigned binary arithmetic
- Verilog HDL and modular RTL design
- Module instantiation and combinational control logic
- Writing Verilog testbenches
- Automated functional verification

Most importantly, this project helped me begin developing an understanding of how digital hardware is constructed from simple logic operations.

## Next Steps

Having completed my first digital hardware project, I plan to continue learning sequential logic, flip-flops, registers, finite-state machines, and more advanced RTL design.

My longer-term goal is to apply these fundamentals toward designing more complex digital systems and exploring ASIC development.