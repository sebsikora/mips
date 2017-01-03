library ieee;
use ieee.std_logic_1164.all;
use work.all;

entity register_32 is
	port (data_in:				in std_logic_vector(31 downto 0);
			data_out:			out std_logic_vector(31 downto 0);
			load:					in std_logic;
			clk:					in std_logic
	);
end register_32;

architecture rtl of register_32 is
	
begin
	process is
	begin
		wait until (rising_edge(clk) and load = '1');
		data_out <= data_in;
	end process;
end rtl;