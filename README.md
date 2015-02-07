# CMPE 140 Lab 1

## Install

For quick coding/testing, install the command-line programs iverilog and gtkwave.

### Mac Install

Install 'brew', a package manager for Mac, by entering the following in a terminal:

```bash
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

Now use brew to install iverilog and gtkwave:

```bash
brew install verilog
brew install gtkwave
```

### Ubuntu install

Install programs with apt-get:

```bash
sudo apt-get install verilog
sudo apt-get install gtkwave
```

## Running/Testing Verilog HDL

In the terminal, navigate to the directory you cloned this project to, and type `make`. This will run the iverilog compiler and tell you if there are any syntax errors.

Then type `vvp ./factorial_tb -lxt2` to run the simulation. Any '$display' or '$monitor' commands in the code will show up here. A simulation dump will be created from this run named `factorial_tb.lxt2`. Load this file with gtkwave by typing: `gtkwave ./factorial_tb.lxt2` to view the waveforms.
