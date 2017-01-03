library ieee;
use ieee.std_logic_1164.all;
use work.all;

entity dat_cache is
	port (address:		in std_logic_vector (10 downto 0);
			clock:		in std_logic;
			data:			in std_logic_vector (31 downto 0);
			wren:			in std_logic;
			q:				out std_logic_vector (31 downto 0)
	);
end dat_cache;
	
architecture rtl of dat_cache is
	component dat_cache_m4k_ram_block is
		port (address:		in std_logic_vector (10 downto 0);
				clock:		in std_logic;
				data:			in std_logic_vector (31 downto 0);
				wren:			in std_logic ;
				q:				out std_logic_vector (31 downto 0)
		);
	end component;
	
	signal clock_line:			std_logic;
	
begin
	clock_line <= clock;
		
	block_1:			dat_cache_m4k_ram_block port map (address => address,
																	 clock => clock_line,
																	 data => data,
																	 wren => wren,
																	 q => q
														);
	
end rtl;