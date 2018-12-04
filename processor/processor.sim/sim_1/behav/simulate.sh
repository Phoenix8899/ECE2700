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
ExecStep $xv_path/bin/xsim processorTest_behav -key {Behavioral:sim_1:Functional:processorTest} -tclbatch processorTest.tcl -log simulate.log
