library ieee;
use ieee.std_logic_1164.all;
use work.all;

entity traverse_latch_test is
	port (IF_ID_in:					in std_logic;
			ID_EX_in:					in std_logic;
			EX_MEM_out:					out std_logic;
			MEM_WB_out:					out std_logic;
			clk:							in std_logic
	);
end traverse_latch_test;

architecture rtl of traverse_latch_test is
	
	component traverse_latch is
		port (data_in:						in std_logic;
				data_out:					out std_logic;
				load:							in std_logic;
				clr:							in std_logic;
				clk:							in std_logic
		);
	end component;
	
	signal load_line:					std_logic;
	signal clk_line:					std_logic;
	signal clr_line:					std_logic;
	signal IF_ID_output:				std_logic;
	signal ID_EX_input:				std_logic;
	signal ID_EX_output:				std_logic;
	signal EX_MEM_output:			std_logic;
	signal MEM_WB_output:			std_logic;
	signal mux_output:				std_logic;
	
begin
	
	ID_EX_input <= IF_ID_output or ID_EX_in;
	EX_MEM_out <= EX_MEM_output;
	MEM_WB_out <= MEM_WB_output;
	
	load_line <= '1';
	clr_line <= MEM_WB_output and '1';
	clk_line <= clk;
	
	latch_0:				traverse_latch port map (data_in => IF_ID_in, data_out => IF_ID_output, load => load_line, clk => clk_line, clr => clr_line);
	latch_1:				traverse_latch port map (data_in => ID_EX_input, data_out => ID_EX_output, load => load_line, clk => clk_line, clr => clr_line);				
	latch_2:				traverse_latch port map (data_in => ID_EX_output, data_out => EX_MEM_output, load => load_line, clk => clk_line, clr => clr_line);
	latch_3:				traverse_latch port map (data_in => EX_MEM_output, data_out => MEM_WB_output, load => load_line, clk => clk_line, clr => clr_line);
	
end rtl;