view wave 
wave clipboard store
wave create -driver freeze -pattern constant -value 1 -starttime 0ns -endtime 100ns sim:/mips_one_cycle/rst 
wave modify -driver freeze -pattern constant -value 0 -starttime 100ns -endtime 1000ns Edit:/mips_one_cycle/rst 
wave create -driver freeze -pattern clock -initialvalue 0 -period 100ns -dutycycle 50 -starttime 0ns -endtime 1000ns sim:/mips_one_cycle/clk 
wave create -driver freeze -pattern clock -initialvalue 0 -period 100ns -dutycycle 33 -starttime 0ns -endtime 1000ns sim:/mips_one_cycle/clk1 
wave modify -driver freeze -pattern clock -initialvalue 1 -period 400ns -dutycycle 25 -starttime 50ns -endtime 1250ns Edit:/mips_one_cycle/clk1 
wave create -driver freeze -pattern clock -initialvalue 1 -period 400ns -dutycycle 25 -starttime 100ns -endtime 1250ns sim:/mips_one_cycle/clk2 
wave modify -driver freeze -pattern clock -initialvalue 1 -period 400ns -dutycycle 25 -starttime 150ns -endtime 1250ns Edit:/mips_one_cycle/clk2 
wave modify -driver freeze -pattern constant -value 0 -starttime 0ns -endtime 150ns Edit:/mips_one_cycle/clk2 
wave create -driver freeze -pattern constant -value 0 -starttime 0ns -endtime 250ns sim:/mips_one_cycle/clk3 
wave create -driver freeze -pattern constant -value 0 -starttime 0ns -endtime 350ns sim:/mips_one_cycle/clk4 
wave modify -driver freeze -pattern clock -initialvalue 1 -period 400ns -dutycycle 25 -starttime 250ns -endtime 1250ns Edit:/mips_one_cycle/clk3 
wave modify -driver freeze -pattern clock -initialvalue 1 -period 400ns -dutycycle 25 -starttime 350ns -endtime 1250ns Edit:/mips_one_cycle/clk4 
wave modify -driver freeze -pattern constant -value 0 -starttime 100ns -endtime 1250ns Edit:/mips_one_cycle/rst 
wave modify -driver freeze -pattern constant -value 0 -starttime 100ns -endtime 2500ns Edit:/mips_one_cycle/rst 
wave modify -driver freeze -pattern clock -initialvalue 1 -period 400ns -dutycycle 25 -starttime 50ns -endtime 2500ns Edit:/mips_one_cycle/clk1 
wave modify -driver freeze -pattern clock -initialvalue 1 -period 400ns -dutycycle 25 -starttime 150ns -endtime 2500ns Edit:/mips_one_cycle/clk2 
wave modify -driver freeze -pattern clock -initialvalue 1 -period 400ns -dutycycle 25 -starttime 250ns -endtime 2500ns Edit:/mips_one_cycle/clk3 
wave modify -driver freeze -pattern clock -initialvalue 1 -period 400ns -dutycycle 25 -starttime 350ns -endtime 2500ns Edit:/mips_one_cycle/clk4 
WaveCollapseAll -1
wave clipboard restore
