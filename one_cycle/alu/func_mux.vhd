library ieee;
use ieee.std_logic_1164.all;
use work.all;

entity func_mux is
	port (input_A:					in std_logic_vector(31 downto 0);
			input_B:					in std_logic_vector(31 downto 0);
			input_C:					in std_logic_vector(31 downto 0);
			input_D:					in std_logic_vector(31 downto 0);
			output:					out std_logic_vector(31 downto 0);
			aluop:					in std_logic_vector(2 downto 0)
	);
end func_mux;

architecture rtl of func_mux is
begin
	process (aluop, input_A, input_B, input_C, input_D)
	begin
		case aluop is
				when "000" => output <= input_A;
				when "001" => output <= input_B;
				when "010" => output <= input_C;
				when "110" => output <= input_C;
				when "111" => output <= input_D;
				when others => output <= "00000000000000000000000000000000";
		end case;
	end process;
end rtl;
