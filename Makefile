blinky.bit: *.tcl *.v *.xdc
	vivado -mode batch -source build.tcl -verbose -nojournal

.PHONY: deploy clean

deploy:
	vivado -mode batch -source deploy.tcl -verbose -nojournal

clean:
	rm -f *.log *.bit usage_statistics_webtalk.*
