library ieee;
use ieee.std_logic_1164.all;
use work.all;

entity sign_extender_16_to_32 is
	port (data_in:					in std_logic_vector(15 downto 0);
			data_out:				out std_logic_vector(31 downto 0)
	);
end sign_extender_16_to_32;

architecture rtl of sign_extender_16_to_32 is
	signal padding_bus:			std_logic_vector(15 downto 0);
begin
	padding_bus(0) <= data_in(15);
	padding_bus(1) <= data_in(15);
	padding_bus(2) <= data_in(15);
	padding_bus(3) <= data_in(15);
	padding_bus(4) <= data_in(15);
	padding_bus(5) <= data_in(15);
	padding_bus(6) <= data_in(15);
	padding_bus(7) <= data_in(15);
	padding_bus(8) <= data_in(15);
	padding_bus(9) <= data_in(15);
	padding_bus(10) <= data_in(15);
	padding_bus(11) <= data_in(15);
	padding_bus(12) <= data_in(15);
	padding_bus(13) <= data_in(15);
	padding_bus(14) <= data_in(15);
	padding_bus(15) <= data_in(15);
	
	data_out(15 downto 0) <= data_in;
	data_out(31 downto 16) <= padding_bus;
	
end rtl;