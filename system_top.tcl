namespace eval _tcl {
proc get_script_folder {} {
   set script_path [file normalize [info script]]
   set script_folder [file dirname $script_path]
   return $script_folder
}
}
variable script_folder
set script_folder [_tcl::get_script_folder]

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2020.2
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   catch {common::send_gid_msg -ssname BD::TCL -id 2041 -severity "ERROR" "This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."}

   return 1
}

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 project -part xcvu19p-fsva3824-2-e
}

add_files sources/difftest.v
add_files sources/Nutshell_fpga.v
add_files sources/axi.vh
add_files sources/dut_wrapper.v
add_files sources/axis_data_packge.v
add_files sources/interrupt_gen.v
add_files sources/system_top.v
add_files sources/ClockGate.v

set_property top system_top [current_fileset]

add_files xdc/vu19p.xdc

save_project
close_project