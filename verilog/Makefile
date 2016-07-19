TOP="sha256"
FAMILY="Cyclone IV"
FPGA_BOARD="DE2-115"
NAME="PROJ1"
TOP_LEVEL_MODULE=$(TOP)

init: 
	vlib work

c:
	vlog *.v

v:
	vsim -c -do "run 700000000000ns; exit;" work.$(TOP)

p:
	quartus_sh -t setup_proj.tcl $(FAMILY) $(FPGA_BOARD) $(NAME) $(TOP_LEVEL_MODULE)

f:
	quartus_sh --64bit --flow compile top
