view wave 
wave clipboard store
wave create -driver freeze -pattern clock -initialvalue 0 -period 100ns -dutycycle 50 -starttime 0ns -endtime 1000ns sim:/mips_pipelined/clk 
WaveCollapseAll -1
wave clipboard restore
