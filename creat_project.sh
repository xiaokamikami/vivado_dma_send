vivado -mode batch -source pcie4_send.tcl
vivado -mode batch -source core_bd.tcl
vivado -mode batch -source system_top.tcl
rm ./*.jou
rm ./*.log