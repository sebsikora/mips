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
	output <= '1' when (inputA = inputB) else '0';
end struct;
