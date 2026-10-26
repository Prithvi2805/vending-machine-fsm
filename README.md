# Vending Machine FSM (Digital Design & Verification)

A Verilog HDL implementation and behavioral verification of a **Synchronous Vending Machine Finite State Machine (FSM)**. The system models an item costing 10 Rs, accepting 5 Rs and 10 Rs coins.

## 🚀 Architecture & Design Decisions
* **Hybrid FSM Style:** Uses a stable **Moore FSM** structure for the `dispense` logic to ensure safe, glitch-free item delivery synchronized with the clock edge. Uses a **Mealy FSM** path for the `change` signal to enable instantaneous, same-cycle feedback when a user overpays.
* **State Minimization:** Optimized into three active state registers (`idle`, `five`, `ten`) to save hardware real estate.
* **Latch Prevention:** Modeled with rigorous default next-state and default output evaluations inside the combinational blocks to prevent the synthesis of unintended **combinational latches**.

## 📊 Verification & Simulation Results
Verified using Verilator simulation. The system successfully validated three critical scenarios:
1. **Exact Change (5 Rs + 5 Rs):** `dispense` asserts exactly at 10 Rs.
2. **Direct Payment (10 Rs):** Immediate item dispensing on the next cycle.
3. **Overpayment Handling (5 Rs + 10 Rs):** The Mealy `change` wire instantly flashes high mid-cycle at 15 Rs to return 5 Rs change before resetting back to idle safely.

### Simulation Log Output:
```text
time = 0 | coin5 = 0 | coin10 = 0 | dispense = 0 | change = 0
time = 25 | coin5 = 1 | coin10 = 0 | dispense = 0 | change = 0
time = 45 | coin5 = 1 | coin10 = 0 | dispense = 1 | change = 0
time = 85 | coin5 = 1 | coin10 = 0 | dispense = 0 | change = 0
time = 105 | coin5 = 0 | coin10 = 1 | dispense = 0 | change = 1
time = 105 | coin5 = 0 | coin10 = 1 | dispense = 1 | change = 0
```
