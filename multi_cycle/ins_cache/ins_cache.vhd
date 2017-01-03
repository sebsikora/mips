library ieee;
use ieee.std_logic_1164.all;
use work.all;

entity ins_cache is
	port (address:		in std_logic_vector (9 downto 0);
			clock:		in std_logic;
			data:			in std_logic_vector (31 downto 0);
			wren:			in std_logic;
			q:				out std_logic_vector (31 downto 0)
	);
end ins_cache;
	
architecture rtl of ins_cache is
	component ins_cache_m4k_ram_block is
		port (address:		in std_logic_vector (9 downto 0);
				clock:		in std_logic;
				data:			in std_logic_vector (31 downto 0);
				wren:			in std_logic ;
				q:				out std_logic_vector (31 downto 0)
		);
	end component;
begin
	
	block_1:			ins_cache_m4k_ram_block port map (address => address,
																	 clock => clock,
																	 data => data,
																	 wren => wren,
																	 q => q
														);
	
end rtl;