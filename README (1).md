# 4-bit Array Multiplier with UVM Testbench

This project implements a 4-bit array multiplier in SystemVerilog and verifies its functionality using the Universal Verification Methodology (UVM).

---

## 📌 Overview

- **Design:** 4-bit combinational array multiplier using structural modeling.
- **Testbench:** Built entirely using standard UVM components:
  - Sequence Item
  - Sequence
  - Sequencer
  - Driver
  - Monitor
  - Scoreboard
  - Agent
  - Environment
  - Test

---

## 📐 Design Module

The DUT (`array_multiplier_4bit`) takes two 4-bit inputs (`A` and `B`) and generates an 8-bit output (`P = A * B`). For simplicity and correctness, the implementation uses the built-in `*` operator.

```systemverilog
module array_multiplier_4bit (
    input  [3:0] A, B,
    output [7:0] P
);
    assign P = A * B;
endmodule
```

---

## 🧪 Verification Methodology

The testbench follows the standard UVM architecture:

```text
       +-----------------------+
       |       Test           |
       +-----------------------+
                  |
       +-----------------------+
       |      Environment      |
       +-----------------------+
           |             |
    +------------+   +------------+
    |   Agent    |   | Scoreboard |
    +------------+   +------------+
       |       |
 +-----------+ +-----------+
 | Sequencer | | Monitor   |
 +-----------+ +-----------+
       |
    +--------+
    | Driver |
    +--------+
       |
     DUT ⟵⟶ Interface
```

### Functional Flow
- Stimuli are generated in the `base_sequence`.
- The `driver` drives them to the DUT via the virtual interface.
- The `monitor` observes inputs/outputs.
- The `scoreboard` checks if `P == A * B`.

---

## 📁 File Structure

```text
.
├── interface.sv          // Virtual interface definition
├── sequence_item.sv      // Transaction class
├── sequence.sv           // Sequence to generate stimulus
├── sequencer.sv          // Sequencer class
├── driver.sv             // Drives stimulus to DUT
├── monitor.sv            // Samples DUT signals
├── scoreboard.sv         // Compares expected and actual outputs
├── agent.sv              // Bundles sequencer, driver, and monitor
├── env.sv                // Top UVM environment
├── test.sv               // UVM test class
├── top.sv                // Top-level testbench with DUT instantiation
├── array_multiplier_4bit.sv // DUT implementation
├── README.md             // This file
```

---

## ▶️ How to Run

1. **Simulator:** Any SystemVerilog-compliant simulator (e.g., Synopsys VCS, Cadence Xcelium, Aldec Riviera, etc.)
2. **Compile and Run:**

```sh
vlog top.sv
vsim -c top -do "run -all"
```

---

## ✅ Features

- Full UVM-based functional verification
- Constrained-random stimulus generation
- Automated output checking using scoreboard
- Scalable testbench structure

---

## 🔧 To Do

- Add coverage collection (`uvm_subscriber`)
- Add constrained corner-case generation
- Add assertions for protocol compliance

---

## 👨‍💻 Author

**Kavin Kumar K**  
Passionate about VLSI and verification design.  
If you found this helpful, leave a ⭐️ on the repo!

---

## 📜 License

This project is open-source and free to use under the [MIT License](LICENSE).
