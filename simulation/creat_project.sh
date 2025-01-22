vivado -mode batch -source simulation.tcl
vivado -mode batch -source ../pcie4_send.tcl
rm ./*.jou
rm ./*.log