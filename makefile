# export IVERILOG_DUMPER = lxt2Z
MODULES=mux.v cmp.v cnt.v mul.v register.v dp.v cu.v factorial_top.v factorial_tb.v

all:
	iverilog -o factorial_tb $(MODULES)
