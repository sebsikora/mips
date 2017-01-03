library ieee;
use ieee.std_logic_1164.all;
use work.all;

entity set_on_less_than is
	port (input_A:					in std_logic_vector(31 downto 0);
			input_B:					in std_logic_vector(31 downto 0);
			output:					out std_logic_vector(31 downto 0)
	);
end set_on_less_than;

architecture rtl of set_on_less_than is
begin
	process (input_A, input_B)
	begin
		if (input_B < input_A) then
			output <= "00000000000000000000000000000001";
		else
			output <= "00000000000000000000000000000000";
		end if;
	end process;
end rtl;
