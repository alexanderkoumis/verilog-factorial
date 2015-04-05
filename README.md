# verilog-factorial

## Prerequisites

  * Verilog HDL Simulator
  * [atlys-spi-pmod](http://github.com/alexanderkoumis/atlys-spi-pmod "atlys-spi-pmod")

These instructions assume usage of [iverilog](http://iverilog.icarus.com/ "iverilog.com") to run Verilog HDL simulations. iverilog provides a light alternative for simulations, but cannot synthesize .bit files.

### atlys-spi-pmod

Clone the project linked above into a directory of your choice. Replace the value of `LIB_DIR` value in this project's (verilog-factorial) `makefile` to reflect your local copy of `atlys-spi-mod`.

### iverilog

#### Debian/Ubuntu:

```
sudo apt-get install verilog
sudo apt-get install gtkwave
```

#### OSX

Install 'brew', a package manager for Mac, by entering the following in a terminal:

```
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

Now use brew to install iverilog and gtkwave:

```
brew install verilog
brew install gtkwave
```

## Running/Testing Verilog

In the terminal, navigate to the directory you cloned this project to, and type `make`. This will run the iverilog compiler and tell you if there are any syntax errors.

Then type `vvp ./factorial_tb -lxt2` to run the simulation. Any '$display' or '$monitor' commands in the code will show up here. A simulation dump will be created from this run named `factorial_tb.lxt2`. Load this file with gtkwave by typing: `gtkwave ./factorial_tb.lxt2` to view the waveforms.

## FPGA Implementation

`factorial_fpga.v` provides a sample FPGA interface implementation for the Digilent Atlys (based on Xilinx Spartan 6 LX45), hence the usage of the PMOD adapter from `atlys-spi-pmod`. To use this project with a PMOD-enabled device (Atlys, Nexus 3, etc.), modify `constraints.ucf` from `atlys-spi-pmod` to match the master UCF file provided for your board.