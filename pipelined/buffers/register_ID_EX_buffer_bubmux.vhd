library ieee;
use ieee.std_logic_1164.all;
use work.all;

entity register_ID_EX_buffer_bubmux is
	port (program_counter_in:						in std_logic_vector(31 downto 0);
			reg_read_data_1_in:						in std_logic_vector(31 downto 0);
			reg_read_data_2_in:						in std_logic_vector(31 downto 0);
			sign_ext_addr_oset_in:					in std_logic_vector(31 downto 0);
			reg_write_dest_1_in:						in std_logic_vector(4 downto 0);
			reg_write_dest_2_in:						in std_logic_vector(4 downto 0);
			program_counter_out:						out std_logic_vector(31 downto 0);
			reg_read_data_1_out:						out std_logic_vector(31 downto 0);
			reg_read_data_2_out:						out std_logic_vector(31 downto 0);
			sign_ext_addr_oset_out:					out std_logic_vector(31 downto 0);
			reg_write_dest_1_out:					out std_logic_vector(4 downto 0);
			reg_write_dest_2_out:					out std_logic_vector(4 downto 0);
			bubble:										in std_logic
	);
end register_ID_EX_buffer_bubmux;

architecture rtl of register_ID_EX_buffer_bubmux is
	
begin
	process (bubble, program_counter_in, reg_read_data_1_in, reg_read_data_2_in, sign_ext_addr_oset_in, reg_write_dest_1_in, reg_write_dest_2_in) is
	begin
		if bubble = '1' then
			program_counter_out <= "00000000000000000000000000000000";
			reg_read_data_1_out <= "00000000000000000000000000000000";
			reg_read_data_2_out <= "00000000000000000000000000000000";
			sign_ext_addr_oset_out <= "00000000000000000000000000000000";
			reg_write_dest_1_out <= "00000";
			reg_write_dest_2_out <= "00000";
		else
			program_counter_out <= program_counter_in;
			reg_read_data_1_out <= reg_read_data_1_in;
			reg_read_data_2_out <= reg_read_data_2_in;
			sign_ext_addr_oset_out <= sign_ext_addr_oset_in;
			reg_write_dest_1_out <= reg_write_dest_1_in;
			reg_write_dest_2_out <= reg_write_dest_2_in;
		end if;
	end process;
end rtl;