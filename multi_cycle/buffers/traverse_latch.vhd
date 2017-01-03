library ieee;
use ieee.std_logic_1164.all;
use work.all;

entity traverse_latch is
	port (data_in:						in std_logic;
			data_out:					out std_logic;
			load:							in std_logic;
			clr:							in std_logic;
			clk:							in std_logic
	);
end traverse_latch;

architecture rtl of traverse_latch is
	component mux_2_to_1_by_1 is
		port (input_0:					in std_logic;
				input_1:					in std_logic;
				sel:						in std_logic;
				output:					out std_logic
		);
	end component;
	
	component register_1 is
		port (data_in:					in std_logic;
				data_out:				out std_logic;
				load:						in std_logic;
				clk:						in std_logic
		);
	end component;
	
	signal low_bit:					std_logic;
	signal mux_output:				std_logic;
	
begin
	
	low_bit <= '0';
	
	input_mux:							mux_2_to_1_by_1 port map (input_0 => data_in, input_1 => low_bit, sel => clr, output => mux_output);
	data_register:						register_1		 port map (data_in => mux_output, data_out => data_out, load => load, clk => clk);
	
end rtl;