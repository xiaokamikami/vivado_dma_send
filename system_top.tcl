open_project ./project/project_1.xpr

add_files sources/system_top.v
add_files sources/axi.vh
add_files sources/dut_wrapper.v

update_compile_order -fileset sources_1

set_property top system_top [current_fileset]

save_project
close_project