library ieee;
use ieee.std_logic_1164.all;
use work.all;

entity register_ID_EX_buffer is
	port (program_counter_in:							in std_logic_vector(31 downto 0);
			reg_read_data_1_in:							in std_logic_vector(31 downto 0);
			reg_read_data_2_in:							in std_logic_vector(31 downto 0);
			sign_ext_addr_oset_in:						in std_logic_vector(31 downto 0);
			reg_write_dest_1_in:							in std_logic_vector(4 downto 0);
			reg_write_dest_2_in:							in std_logic_vector(4 downto 0);
			ni_reg_read_addr_1:							in std_logic_vector(4 downto 0);
			ni_reg_read_addr_2:							in std_logic_vector(4 downto 0);
			reg_haz_ind_in:								in std_logic_vector(1 downto 0);
			traverse_bit_in:								in std_logic;
			traverse_bit_clr:								in std_logic;
			traverse_bit_clk:								in std_logic;
			traverse_bit_out:								out std_logic;
			program_counter_out:							out std_logic_vector(31 downto 0);
			reg_read_data_1_out:							out std_logic_vector(31 downto 0);
			reg_read_data_2_out:							out std_logic_vector(31 downto 0);
			sign_ext_addr_oset_out:						out std_logic_vector(31 downto 0);
			reg_write_dest_1_out:						out std_logic_vector(4 downto 0);
			reg_write_dest_2_out:						out std_logic_vector(4 downto 0);
			reg_haz_ind_out:								out std_logic_vector(1 downto 0);
			load:												in std_logic;
			bubble:											in std_logic;
			clk:												in std_logic
	);
end register_ID_EX_buffer;

architecture rtl of register_ID_EX_buffer is
	component register_32 is
		port (data_in:										in std_logic_vector(31 downto 0);
				data_out:									out std_logic_vector(31 downto 0);
				load:											in std_logic;
				clk:											in std_logic
		);
	end component;
	
	component register_5 is
		port (data_in:										in std_logic_vector(4 downto 0);
				data_out:									out std_logic_vector(4 downto 0);
				load:											in std_logic;
				clk:											in std_logic
		);
	end component;
	
	component traverse_latch is
		port (data_in:										in std_logic;
				data_out:									out std_logic;
				load:											in std_logic;
				clr:											in std_logic;
				clk:											in std_logic
		);
	end component;
	
	component comparator_5_2 is
		port( inputA:										in std_logic_vector(4 downto 0);
				inputB:										in std_logic_vector(4 downto 0);
				output:										out std_logic
		);
	end component;
	
	component register_ID_EX_buffer_bubmux is
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
	end component;
	
	signal clk_line:										std_logic;
	signal t_clk_line:									std_logic;
	signal load_line:										std_logic;
	signal bubble_line:									std_logic;
	signal reg_haz_ind_line_11:						std_logic;
	signal reg_haz_ind_line_12:						std_logic;
	signal reg_haz_ind_line_21:						std_logic;
	signal reg_haz_ind_line_22:						std_logic;
	
	signal reg_write_dest_1_out_lines:				std_logic_vector(4 downto 0);
	signal reg_write_dest_2_out_lines:				std_logic_vector(4 downto 0);

	signal program_counter_lines:						std_logic_vector(31 downto 0);
	signal reg_read_data_1_lines:						std_logic_vector(31 downto 0);
	signal reg_read_data_2_lines:						std_logic_vector(31 downto 0);
	signal sign_ext_addr_oset_lines:					std_logic_vector(31 downto 0);
	signal reg_write_dest_1_lines:					std_logic_vector(4 downto 0);
	signal reg_write_dest_2_lines:					std_logic_vector(4 downto 0);
	
begin
	
	clk_line <= clk;
	t_clk_line <= traverse_bit_clk;
	load_line <= load;
	bubble_line <= bubble;
	
	input_bubble_multiplexor:			register_ID_EX_buffer_bubmux port map (program_counter_in => program_counter_in,
																									reg_read_data_1_in => reg_read_data_1_in,
																									reg_read_data_2_in => reg_read_data_2_in,
																									sign_ext_addr_oset_in => sign_ext_addr_oset_in,
																									reg_write_dest_1_in => reg_write_dest_1_in,
																									reg_write_dest_2_in => reg_write_dest_2_in,
																									program_counter_out => program_counter_lines,
																									reg_read_data_1_out => reg_read_data_1_lines,
																									reg_read_data_2_out => reg_read_data_2_lines,
																									sign_ext_addr_oset_out => sign_ext_addr_oset_lines,
																									reg_write_dest_1_out => reg_write_dest_1_lines,
																									reg_write_dest_2_out => reg_write_dest_2_lines,
																									bubble => bubble_line
												);
	
	program_counter_buffer:				register_32 port map (data_in => program_counter_lines, data_out => program_counter_out, load => load_line, clk => clk_line);
	register_read_data_1:				register_32 port map (data_in => reg_read_data_1_lines, data_out => reg_read_data_1_out, load => load_line, clk => clk_line);
	register_read_data_2:				register_32 port map (data_in => reg_read_data_2_lines, data_out => reg_read_data_2_out, load => load_line, clk => clk_line);
	sign_extended_address_offset:		register_32 port map (data_in => sign_ext_addr_oset_lines, data_out => sign_ext_addr_oset_out, load => load_line, clk => clk_line);
	register_write_destination_1:		register_5 	port map (data_in => reg_write_dest_1_lines, data_out => reg_write_dest_1_out_lines, load => load_line, clk => clk_line);
	register_write_destination_2:		register_5 	port map (data_in => reg_write_dest_2_lines, data_out => reg_write_dest_2_out_lines, load => load_line, clk => clk_line);
	
	traverse_latch_buffer:				traverse_latch port map (data_in => traverse_bit_in, data_out => traverse_bit_out, load => load_line, clr => traverse_bit_clr, clk => t_clk_line);
	
	write_dest_11_comparator:			comparator_5_2 port map (inputA => reg_write_dest_1_out_lines, inputB => ni_reg_read_addr_1, output => reg_haz_ind_line_11);
	write_dest_12_comparator:			comparator_5_2 port map (inputA => reg_write_dest_1_out_lines, inputB => ni_reg_read_addr_2, output => reg_haz_ind_line_12);
	write_dest_21_comparator:			comparator_5_2 port map (inputA => reg_write_dest_2_out_lines, inputB => ni_reg_read_addr_1, output => reg_haz_ind_line_21);
	write_dest_22_comparator:			comparator_5_2 port map (inputA => reg_write_dest_2_out_lines, inputB => ni_reg_read_addr_2, output => reg_haz_ind_line_22);
	
	reg_haz_ind_out(0) <= reg_haz_ind_in(0) or (reg_haz_ind_line_11 or reg_haz_ind_line_21);
	reg_haz_ind_out(1) <= reg_haz_ind_in(1) or (reg_haz_ind_line_12 or reg_haz_ind_line_22);
	
	reg_write_dest_1_out <= reg_write_dest_1_out_lines;
	reg_write_dest_2_out <= reg_write_dest_2_out_lines;
	
end rtl;