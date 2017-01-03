library ieee;
use ieee.std_logic_1164.all;
use work.all;

entity register_EX_MEM_buffer is
	port (alu_result_in:								in std_logic_vector(31 downto 0);
			reg_read_data_2_in:						in std_logic_vector(31 downto 0);
			reg_write_dest_in:						in std_logic_vector(4 downto 0);
			ni_reg_read_addr_1:						in std_logic_vector(4 downto 0);
			ni_reg_read_addr_2:						in std_logic_vector(4 downto 0);
			reg_haz_ind_in:							in std_logic_vector(1 downto 0);
			alu_zero_flag_in:							in std_logic;
			traverse_bit_in:							in std_logic;
			traverse_bit_clr:							in std_logic;
			traverse_bit_clk:							in std_logic;
			traverse_bit_out:							out std_logic;
			alu_result_out:							out std_logic_vector(31 downto 0);
			reg_read_data_2_out:						out std_logic_vector(31 downto 0);
			reg_write_dest_out:						out std_logic_vector(4 downto 0);
			reg_haz_ind_out:							out std_logic_vector(1 downto 0);
			alu_zero_flag_out:						out std_logic;
			load:											in std_logic;
			clk:											in std_logic
	);
end register_EX_MEM_buffer;

architecture rtl of register_EX_MEM_buffer is
	component register_32 is
		port (data_in:									in std_logic_vector(31 downto 0);
				data_out:								out std_logic_vector(31 downto 0);
				load:										in std_logic;
				clk:										in std_logic
		);
	end component;
	
	component register_8 is
		port (data_in:									in std_logic_vector(7 downto 0);
				data_out:								out std_logic_vector(7 downto 0);
				load:										in std_logic;
				clk:										in std_logic
		);
	end component;
	
	component traverse_latch is
		port (data_in:									in std_logic;
				data_out:								out std_logic;
				load:										in std_logic;
				clr:										in std_logic;
				clk:										in std_logic
		);
	end component;
	
	component comparator_5_2 is
		port( inputA:									in std_logic_vector(4 downto 0);
				inputB:									in std_logic_vector(4 downto 0);
				output:									out std_logic
		);
	end component;
	
	signal clk_line:									std_logic;
	signal t_clk_line:								std_logic;
	signal load_line:									std_logic;
	
	signal register_8_input:						std_logic_vector(7 downto 0);
	signal register_8_output:						std_logic_vector(7 downto 0);
	
	signal reg_write_dest_lines:					std_logic_vector(4 downto 0);
	
	signal reg_haz_ind_1_line:						std_logic;
	signal reg_haz_ind_2_line:						std_logic;
	
begin
	
	clk_line <= clk;
	t_clk_line <= traverse_bit_clk;
	load_line <= load;
	
	register_8_input(4 downto 0) <= reg_write_dest_in(4 downto 0);
	register_8_input(5) <= alu_zero_flag_in;
	register_8_input(7 downto 6) <= "00";
	
	alu_zero_flag_out <= register_8_output(5);
	reg_write_dest_lines(4 downto 0) <= register_8_output(4 downto 0);
	reg_write_dest_out(4 downto 0) <= reg_write_dest_lines(4 downto 0);
	
	alu_result:										register_32 port map (data_in => alu_result_in, data_out => alu_result_out, load => load_line, clk => clk_line);
	reg_read_data_2:								register_32 port map (data_in => reg_read_data_2_in, data_out => reg_read_data_2_out, load => load_line, clk => clk_line);
	zero_flag_and_reg_write_dest:				register_8 	port map (data_in => register_8_input, data_out => register_8_output, load => load_line, clk => clk_line);
	
	traverse_latch_buffer:						traverse_latch port map (data_in => traverse_bit_in, data_out => traverse_bit_out, load => load_line, clr => traverse_bit_clr, clk => t_clk_line);
	
	comparator_5_2_1:								comparator_5_2 port map (inputA => ni_reg_read_addr_1, inputB => reg_write_dest_lines, output => reg_haz_ind_1_line);
	comparator_5_2_2:								comparator_5_2 port map (inputA => ni_reg_read_addr_2, inputB => reg_write_dest_lines, output => reg_haz_ind_2_line);
	
	reg_haz_ind_out(0) <= reg_haz_ind_1_line or reg_haz_ind_in(0);
	reg_haz_ind_out(1) <= reg_haz_ind_2_line or reg_haz_ind_in(1);
	
end rtl;