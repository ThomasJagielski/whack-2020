################################################################################
# Tools
################################################################################

# -Wall turns on all warnings
# -g2012 selects the 2012 version of iVerilog
IVERILOG=iverilog -Wall -g2012
VVP=vvp
VERILATOR_LINT=verilator_bin --lint-only

# Look up .PHONY rules for Makefiles
.PHONY: clean

test_temp.bin: csa.v full_adder.v ripple.v temp.v test_temp.v
	${IVERILOG} -o $@ $^

test_temp.lint: csa.v full_adder.v ripple.v temp.v test_temp.v
	${VERILATOR_LINT} $^

test_csa.bin: csa.v full_adder.v ripple.v temp.v test_csa.v
	${IVERILOG} -o $@ $^

test_csa.lint: csa.v full_adder.v ripple.v temp.v test_csa.v
	${VERILATOR_LINT} $^

# This calls VVP on the *.bin file you generated to make a *.vcd file
# for GTKWave
%.vcd: %.bin
	${VVP} $^

# Call this to clean up all your generated files
clean:
	rm -f *.bin *.vcd
