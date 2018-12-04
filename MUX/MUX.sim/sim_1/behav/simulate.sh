#!/bin/bash -f
xv_path="/opt/Xilinx/Vivado/2015.4"
ExecStep()
{
"$@"
RETVAL=$?
if [ $RETVAL -ne 0 ]
then
exit $RETVAL
fi
}
ExecStep $xv_path/bin/xsim mux_test_behav -key {Behavioral:sim_1:Functional:mux_test} -tclbatch mux_test.tcl -log simulate.log
