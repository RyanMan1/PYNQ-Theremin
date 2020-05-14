There are 3 folders in this submission:

- Files for PYNQ SD card -
copy all its contents to a folder on your SD card and run the jupyter notebook - this forms the project demo

- Source Files -
contains VHDL source files for the ultrasonic driver and the system generator solution for the NCO

- IPI Overlay Regen - 
if required, run the tcl script from the Vivado welcome page to regenerate the Vivaod IPI block design using our IP repository
IP repository for the PYNQ z2 has also been included for convenience

If you wish to regenerate the bitstream, the HDL wrapper and constraints file should be overwritten with those provided (before synthesis)