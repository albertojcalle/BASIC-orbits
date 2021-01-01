# BASIC-orbits

The objective of this project is to make a planet simulator that can run in an old PC with MS-DOS. Since this limits our computation power we will use numerical methods to aproximate the positions of the planets.

The program is written in QuickBasic. It can be executed inside a MS-DOS emulator like dosbox and compiled with qbasic. We can control the speed of the emulation, since the speed is dependent on the CPU cycles. Faster with ALT-F12 and slower with CTRL-F12.

![orbits.gif](orbits.gif)

In this example we sart in a 4 planet conjunction, and we observe the results after one year. We observe that the end position for Earth is precise up to 2 decimals. This can be improved making the step of the numerical method (deltat) smaller, at the cost of more computation time.
