library ieee;
use ieee.std_logic_1164.all;
use work.all;

entity mux_2_to_1_by_1 is
	port (input_0:					in std_logic;
			input_1:					in std_logic;
			sel:						in std_logic;
			output:					out std_logic
	);
end mux_2_to_1_by_1;

architecture rtl of mux_2_to_1_by_1 is
	
begin
	output <= input_0 when sel = '0' else input_1;
	
end rtl;