library ieee;
use ieee.std_logic_1164.all;
use work.all;

entity mux_2_to_1_by_5 is
	port (data_in_0:				in std_logic_vector(4 downto 0);
			data_in_1:				in std_logic_vector(4 downto 0);
			selection:				in std_logic;
			output:					out std_logic_vector(4 downto 0)
	);
end mux_2_to_1_by_5;

architecture rtl of mux_2_to_1_by_5 is
	
begin
	process (selection,
				data_in_0,
				data_in_1
	) is
	begin
		case selection is
			when '0' => output <= data_in_0;
			when '1' => output <= data_in_1;
			when others => output <= "00000";
		end case;
	end process;	
end rtl;