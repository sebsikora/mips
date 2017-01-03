library ieee;
use ieee.std_logic_1164.all;
use work.all;

entity register_5 is
	port (data_in:				in std_logic_vector(4 downto 0);
			data_out:			out std_logic_vector(4 downto 0);
			load:					in std_logic;
			clk:					in std_logic
	);
end register_5;

architecture rtl of register_5 is
	
begin
	process is
	begin
		wait until (rising_edge(clk) and load = '1');
		data_out <= data_in;
	end process;
end rtl;