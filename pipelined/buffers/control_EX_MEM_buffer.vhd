library ieee;
use ieee.std_logic_1164.all;
use work.all;

entity control_EX_MEM_buffer is
	port (mem_jump_in:				in std_logic;
			mem_branch_in:				in std_logic;
			mem_read_in:				in std_logic;
			mem_write_in:				in std_logic;
			wb_mem_to_reg_in:			in std_logic;
			wb_reg_write_in:			in std_logic;
			mem_jump_out:				out std_logic;
			mem_branch_out:			out std_logic;
			mem_read_out:				out std_logic;
			mem_write_out:				out std_logic;
			wb_mem_to_reg_out:		out std_logic;
			wb_reg_write_out:			out std_logic;
			clk:							in std_logic
	);
end control_EX_MEM_buffer;

architecture rtl of control_EX_MEM_buffer is
	component register_8 is
		port (data_in:				in std_logic_vector(7 downto 0);
				data_out:			out std_logic_vector(7 downto 0);
				load:					in std_logic;
				clk:					in std_logic
		);
	end component;
	
	signal load_line:					std_logic;
	signal clk_line:					std_logic;
	
	signal mem_jump_lines:			std_logic;
	signal mem_branch_lines:		std_logic;
	signal mem_read_lines:			std_logic;
	signal mem_write_lines:			std_logic;
	signal wb_mem_to_reg_lines:	std_logic;
	signal wb_reg_write_lines:		std_logic;
	
	signal mem_reg_in:			std_logic_vector(7 downto 0);
	signal wb_reg_in:				std_logic_vector(7 downto 0);
	
	signal mem_reg_out:			std_logic_vector(7 downto 0);
	signal wb_reg_out:			std_logic_vector(7 downto 0);
	
begin
	
	clk_line <= clk;
	load_line <= '1';
	
	mem_reg_in(0) <= mem_jump_in;
	mem_reg_in(1) <= mem_branch_in;
	mem_reg_in(2) <= mem_read_in;
	mem_reg_in(3) <= mem_write_in;
	mem_reg_in(7 downto 4) <= "0000";
	
	wb_reg_in(0) <= wb_mem_to_reg_in;
	wb_reg_in(1) <= wb_reg_write_in;
	wb_reg_in(7 downto 2) <= "000000";
		
	mem_cont_reg_8:					register_8 port map (data_in => mem_reg_in,
																		data_out => mem_reg_out,
																		load => load_line,
																		clk => clk_line
											);
	
	wb_cont_reg_8:						register_8 port map (data_in => wb_reg_in,
																		data_out => wb_reg_out,
																		load => load_line,
																		clk => clk_line
											);
	
	mem_jump_out <= mem_reg_out(0);
	mem_branch_out <= mem_reg_out(1);
	mem_read_out <= mem_reg_out(2);
	mem_write_out <= mem_reg_out(3);
	
	wb_mem_to_reg_out <= wb_reg_out(0);
	wb_reg_write_out <= wb_reg_out(1);
	
end rtl;
