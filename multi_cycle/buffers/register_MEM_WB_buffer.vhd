library ieee;
use ieee.std_logic_1164.all;
use work.all;

entity register_MEM_WB_buffer is
	port (alu_result_in:								in std_logic_vector(31 downto 0);
			reg_write_dest_in:						in std_logic_vector(4 downto 0);
			dc_read_dat_in:							in std_logic_vector(31 downto 0);
			ni_reg_read_addr_1:						in std_logic_vector(4 downto 0);
			ni_reg_read_addr_2:						in std_logic_vector(4 downto 0);
			reg_haz_ind_in:							in std_logic_vector(1 downto 0);
			traverse_bit_in:							in std_logic;
			traverse_bit_clr:							in std_logic;
			traverse_bit_clk:							in std_logic;
			traverse_bit_out:							out std_logic;
			alu_result_out:							out std_logic_vector(31 downto 0);
			reg_write_dest_out:						out std_logic_vector(4 downto 0);
			dc_read_dat_out:							out std_logic_vector(31 downto 0);
			reg_haz_ind_out:							out std_logic_vector(1 downto 0);
			load:											in std_logic;
			clk:											in std_logic
	);
end register_MEM_WB_buffer;

architecture rtl of register_MEM_WB_buffer is
	component register_32 is
		port (data_in:									in std_logic_vector(31 downto 0);
				data_out:								out std_logic_vector(31 downto 0);
				load:										in std_logic;
				clk:										in std_logic
		);
	end component;
	
	component register_5 is
		port (data_in:									in std_logic_vector(4 downto 0);
				data_out:								out std_logic_vector(4 downto 0);
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
	
	signal reg_write_dest_lines:					std_logic_vector(4 downto 0);
	signal reg_haz_ind_1_line:						std_logic;
	signal reg_haz_ind_2_line:						std_logic;
	
begin
	
	clk_line <= clk;
	t_clk_line <= traverse_bit_clk;
	load_line <= load;
	
	alu_result:										register_32 port map (data_in => alu_result_in, data_out => alu_result_out, load => load_line, clk => clk_line);
	register_write_destination:				register_5 	port map (data_in => reg_write_dest_in, data_out => reg_write_dest_lines, load => load_line, clk => clk_line);
	
	dc_read_dat_out <= dc_read_dat_in;
	
	traverse_latch_buffer:						traverse_latch port map (data_in => traverse_bit_in, data_out => traverse_bit_out, load => load_line, clr => traverse_bit_clr, clk => t_clk_line);
	
	comparator_5_2_1:								comparator_5_2 port map (inputA => ni_reg_read_addr_1, inputB => reg_write_dest_lines, output => reg_haz_ind_1_line);
	comparator_5_2_2:								comparator_5_2 port map (inputA => ni_reg_read_addr_2, inputB => reg_write_dest_lines, output => reg_haz_ind_2_line);
	
	reg_write_dest_out <= reg_write_dest_lines;
	
	reg_haz_ind_out(0) <= reg_haz_ind_1_line or reg_haz_ind_in(0);
	reg_haz_ind_out(1) <= reg_haz_ind_2_line or reg_haz_ind_in(1);
	
end rtl;