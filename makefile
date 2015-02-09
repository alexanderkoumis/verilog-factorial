CURR_DIR=$(PWD)
LIB_DIR=~/git/atlys_spi_led

LIB_MODS=$(LIB_DIR)/bcd.v
MODULES=$(LIB_MODS) mux.v cmp.v cnt.v mul.v register.v dp.v cu.v factorial_top.v factorial_tb.v

all:
	iverilog -o factorial_tb $(MODULES)
