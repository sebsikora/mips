library ieee;
use ieee.std_logic_1164.all;
use work.all;

entity comparator_5_2 is
	port( inputA:			in std_logic_vector(4 downto 0);
			inputB:			in std_logic_vector(4 downto 0);
			output:			out std_logic
	);
end comparator_5_2;

architecture struct of comparator_5_2 is
	
begin
	process (inputA, inputB) is
	begin
		if (inputA = "00000" or inputB = "00000") then
			output <= '0';
		else
			if (inputA = inputB) then
				output <= '1';
			else
				output <= '0';
			end if;
		end if;
	end process;
end struct;
