source /opt/legup/legup-4.0/examples/legup.tcl
set_parameter CLOCK_PERIOD 10
#set_parameter PRINTF_CYCLES 1

#set_project CycloneIV DE2-115 Tiger_SDRAM

#loop_pipeline "loop"
#loop_pipeline "initLoop"

set_accelerator_function "main.omp_fn.0"
#set_dcache_ports 4
#set_dcache_type MP

#set_accelerator_function "outerloop"
#set_accelerator_function "pad"
#set_parameter LOCAL_RAMS 1
