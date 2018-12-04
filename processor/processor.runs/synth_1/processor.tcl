# 
# Synthesis run script generated by Vivado
# 

set_param xicom.use_bs_reader 1
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7a35tcpg236-1

set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir /home/ecestudent/ECE2700/processor/processor.cache/wt [current_project]
set_property parent.project_path /home/ecestudent/ECE2700/processor/processor.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property board_part digilentinc.com:basys3:part0:1.1 [current_project]
set_property vhdl_version vhdl_2k [current_fileset]
read_verilog -library xil_defaultlib {
  /home/ecestudent/ECE2700/processor/processor.srcs/sources_1/new/clockDivider.v
  /home/ecestudent/ECE2700/processor/processor.srcs/sources_1/new/caseController.v
  /home/ecestudent/ECE2700/debouncer/debouncer.srcs/sources_1/new/debouncer.v
  /home/ecestudent/ECE2700/processor/processor.srcs/sources_1/new/rom.v
  /home/ecestudent/ECE2700/processor/processor.srcs/sources_1/new/processor.v
}
read_xdc /home/ecestudent/ECE2700/Basys3_Master.xdc
set_property used_in_implementation false [get_files /home/ecestudent/ECE2700/Basys3_Master.xdc]

synth_design -top processor -part xc7a35tcpg236-1
write_checkpoint -noxdef processor.dcp
catch { report_utilization -file processor_utilization_synth.rpt -pb processor_utilization_synth.pb }
