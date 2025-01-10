vivado -mode batch -source system_top.tcl
vivado -mode batch -source pcie4_send.tcl
vivado -mode batch -source core_bd.tcl
rm ./*.jou
rm ./*.log