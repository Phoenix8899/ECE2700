proc start_step { step } {
  set stopFile ".stop.rst"
  if {[file isfile .stop.rst]} {
    puts ""
    puts "*** Halting run - EA reset detected ***"
    puts ""
    puts ""
    return -code error
  }
  set beginFile ".$step.begin.rst"
  set platform "$::tcl_platform(platform)"
  set user "$::tcl_platform(user)"
  set pid [pid]
  set host ""
  if { [string equal $platform unix] } {
    if { [info exist ::env(HOSTNAME)] } {
      set host $::env(HOSTNAME)
    }
  } else {
    if { [info exist ::env(COMPUTERNAME)] } {
      set host $::env(COMPUTERNAME)
    }
  }
  set ch [open $beginFile w]
  puts $ch "<?xml version=\"1.0\"?>"
  puts $ch "<ProcessHandle Version=\"1\" Minor=\"0\">"
  puts $ch "    <Process Command=\".planAhead.\" Owner=\"$user\" Host=\"$host\" Pid=\"$pid\">"
  puts $ch "    </Process>"
  puts $ch "</ProcessHandle>"
  close $ch
}

proc end_step { step } {
  set endFile ".$step.end.rst"
  set ch [open $endFile w]
  close $ch
}

proc step_failed { step } {
  set endFile ".$step.error.rst"
  set ch [open $endFile w]
  close $ch
}

set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000

start_step init_design
set rc [catch {
  create_msg_db init_design.pb
  set_param xicom.use_bs_reader 1
  create_project -in_memory -part xc7a35tcpg236-1
  set_property board_part digilentinc.com:basys3:part0:1.1 [current_project]
  set_property design_mode GateLvl [current_fileset]
  set_property webtalk.parent_dir /home/ecestudent/ECE2700/rotateLED/rotateLED.cache/wt [current_project]
  set_property parent.project_path /home/ecestudent/ECE2700/rotateLED/rotateLED.xpr [current_project]
  set_property ip_repo_paths /home/ecestudent/ECE2700/rotateLED/rotateLED.cache/ip [current_project]
  set_property ip_output_repo /home/ecestudent/ECE2700/rotateLED/rotateLED.cache/ip [current_project]
  add_files -quiet /home/ecestudent/ECE2700/rotateLED/rotateLED.runs/synth_1/rotateLED.dcp
  read_xdc /home/ecestudent/ECE2700/rotateLED/rotateLED.srcs/constrs_1/imports/ECE2700/Basys3_Master.xdc
  link_design -top rotateLED -part xc7a35tcpg236-1
  close_msg_db -file init_design.pb
} RESULT]
if {$rc} {
  step_failed init_design
  return -code error $RESULT
} else {
  end_step init_design
}

start_step opt_design
set rc [catch {
  create_msg_db opt_design.pb
  catch {write_debug_probes -quiet -force debug_nets}
  opt_design 
  write_checkpoint -force rotateLED_opt.dcp
  report_drc -file rotateLED_drc_opted.rpt
  close_msg_db -file opt_design.pb
} RESULT]
if {$rc} {
  step_failed opt_design
  return -code error $RESULT
} else {
  end_step opt_design
}

start_step place_design
set rc [catch {
  create_msg_db place_design.pb
  catch {write_hwdef -file rotateLED.hwdef}
  place_design 
  write_checkpoint -force rotateLED_placed.dcp
  report_io -file rotateLED_io_placed.rpt
  report_utilization -file rotateLED_utilization_placed.rpt -pb rotateLED_utilization_placed.pb
  report_control_sets -verbose -file rotateLED_control_sets_placed.rpt
  close_msg_db -file place_design.pb
} RESULT]
if {$rc} {
  step_failed place_design
  return -code error $RESULT
} else {
  end_step place_design
}

start_step route_design
set rc [catch {
  create_msg_db route_design.pb
  route_design 
  write_checkpoint -force rotateLED_routed.dcp
  report_drc -file rotateLED_drc_routed.rpt -pb rotateLED_drc_routed.pb
  report_timing_summary -warn_on_violation -max_paths 10 -file rotateLED_timing_summary_routed.rpt -rpx rotateLED_timing_summary_routed.rpx
  report_power -file rotateLED_power_routed.rpt -pb rotateLED_power_summary_routed.pb
  report_route_status -file rotateLED_route_status.rpt -pb rotateLED_route_status.pb
  report_clock_utilization -file rotateLED_clock_utilization_routed.rpt
  close_msg_db -file route_design.pb
} RESULT]
if {$rc} {
  step_failed route_design
  return -code error $RESULT
} else {
  end_step route_design
}

start_step write_bitstream
set rc [catch {
  create_msg_db write_bitstream.pb
  catch { write_mem_info -force rotateLED.mmi }
  write_bitstream -force rotateLED.bit 
  catch { write_sysdef -hwdef rotateLED.hwdef -bitfile rotateLED.bit -meminfo rotateLED.mmi -file rotateLED.sysdef }
  close_msg_db -file write_bitstream.pb
} RESULT]
if {$rc} {
  step_failed write_bitstream
  return -code error $RESULT
} else {
  end_step write_bitstream
}

