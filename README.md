# Traffic Light Simulator

This is a design of an actuated traffic light controller at a four-way intersection. A Traffic Light Controller are finite state machines at their simplest form, so we can represent its behavior with states and various transitions. 

### State Diagram

<img src="TL_StateDiagram.png" alt="Diagram" width="50%"/>

Above is the state diagram for the light controller itself. S0 is where Light A is green and Light B is red. S1 is where Light A is yellow and Light B is red. S3 is where Light A is red and Light B is green. S4 is where Light A is red and Light B is yellow.

### State Encoding Table and State Transition Table

*2-bit Binary Encoding for Traffic Lights*
| Light  | Binary |
|--------|--------|
| GREEN  | 2'b10  |
| YELLOW | 2'b01  |
| RED    | 2'b00  |

*State Encoding Table*
| State | One-Hot Code |
|----------|----------|
| S0    | 0001     |
| S1    | 0010     |
| S2    | 0100     |
| S3    | 1000     |

I chose to use one-hot encoding due to the fact that it would require less external gates (combinational logic), reducing propogation delay as a whole. Although it would require two more flip-flops than binary encoding, the reduction of next-state logic complexity makes it worth it. 

| Present State |       | Input       | Next State   |       | Output        |
|---------------|-------|------------|--------------|-------|---------------|
| A | B | C | D  | x | y | z | A | B | C | D | Y1 | Y2 | Y3 | Y4 |
| 0 | 0 | 0 | 0  | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0  | 0  | 0  | 0  |
| 0 | 0 | 0 | 0  | 0 | 0 | 1 | 0 | 0 | 0 | 0 | 0  | 0  | 0  | 0  |
| 0 | 0 | 0 | 0  | 0 | 1 | 0 | 0 | 0 | 0 | 0 | 0  | 0  | 0  | 0  |
| 0 | 0 | 0 | 0  | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0  | 0  | 0  | 0  |
| 0 | 0 | 0 | 0  | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0  | 0  | 0  | 0  |
| … | … | … | …  | … | … | … | … | … | … | … | …  | …  | …  | …  |








