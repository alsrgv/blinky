blinky.bit: *.tcl *.v *.xdc
	vivado -mode batch -source build.tcl -verbose -nojournal

.PHONY: sim test deploy clean

blinky_tb.wdb: *.v
	xvlog blinky.v blinky_tb.v ${XILINX_VIVADO}/data/verilog/src/glbl.v
	xelab -debug typical blinky_tb -s blinky_tb

sim: blinky_tb.wdb
	xsim blinky_tb -gui

test: blinky_tb.wdb
	xsim blinky_tb -R

deploy:
	vivado -mode batch -source deploy.tcl -verbose -nojournal

clean:
	rm -rf *.log *.jou *.pb *.wdb *.bit xsim.dir
