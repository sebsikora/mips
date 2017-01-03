library ieee;
use ieee.std_logic_1164.all;
use work.all;

entity register_IF_ID_buffer_bubmux is
	port (program_counter_in:						in std_logic_vector(31 downto 0);
			program_counter_out:						out std_logic_vector(31 downto 0);
			instruction_word_in:						in std_logic_vector(31 downto 0);
			instruction_word_out:					out std_logic_vector(31 downto 0);
			bubble:										in std_logic
	);
end register_IF_ID_buffer_bubmux;

architecture rtl of register_IF_ID_buffer_bubmux is
	
begin
	process (bubble, program_counter_in, instruction_word_in) is
	begin
		if bubble = '1' then
			program_counter_out <= "00000000000000000000000000000000";
			instruction_word_out <= "00000000000000000000000000000000";
		else
			program_counter_out <= program_counter_in;
			instruction_word_out <= instruction_word_in;
		end if;
	end process;
end rtl;