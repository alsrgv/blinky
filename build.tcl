create_project -in_memory -part xc7z020clg400-1
read_verilog -library xil_defaultlib blinky.v
read_xdc Zybo-Z7-Master.xdc
synth_design -top blinky
opt_design 
place_design 
route_design 
write_bitstream -force blinky.bit 
