# Traffic Light Simulator

This is a design of an actuated traffic light controller at a four-way intersection. A Traffic Light Controller are finite state machines at their simplest form, so we can represent its behavior with states and various transitions. 

### State Diagram
<img src="TL_StateDiagram.png" alt="Diagram" width="50%"/>

Above is the state diagram for the light controller itself. S0 is where Light A is green and Light B is red. S1 is where Light A is yellow and Light B is red. S3 is where Light A is red and Light B is green. S4 is where Light A is red and Light B is yellow.


