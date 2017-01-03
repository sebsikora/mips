library ieee;
use ieee.std_logic_1164.all;
use work.all;

entity or_block is
	port (input_A:					in std_logic_vector(31 downto 0);
			input_B:					in std_logic_vector(31 downto 0);
			output:					out std_logic_vector(31 downto 0)
	);
end or_block;

architecture rtl of or_block is
begin
	output <= input_A or input_B;
end rtl;
