library ieee;
use ieee.std_logic_1164.all;
use work.all;

entity control_ID_EX_buffer is
	port (alu_reg_dest_in:			in std_logic;
			alu_src_in:					in std_logic;
			alu_op_in:					in std_logic_vector(2 downto 0);
			mem_jump_in:				in std_logic;
			mem_branch_in:				in std_logic;
			mem_read_in:				in std_logic;
			mem_write_in:				in std_logic;
			wb_mem_to_reg_in:			in std_logic;
			wb_reg_write_in:			in std_logic;
			alu_reg_dest_out:			out std_logic;
			alu_src_out:				out std_logic;
			alu_op_out:					out std_logic_vector(2 downto 0);
			mem_jump_out:				out std_logic;
			mem_branch_out:			out std_logic;
			mem_read_out:				out std_logic;
			mem_write_out:				out std_logic;
			wb_mem_to_reg_out:		out std_logic;
			wb_reg_write_out:			out std_logic;
			stall:						in std_logic;
			clk:							in std_logic;
			bubble:						in std_logic
	);
end control_ID_EX_buffer;

architecture rtl of control_ID_EX_buffer is
	component register_8 is
		port (data_in:				in std_logic_vector(7 downto 0);
				data_out:			out std_logic_vector(7 downto 0);
				load:					in std_logic;
				clk:					in std_logic
		);
	end component;
	
	component control_ID_EX_buffer_bubmux is
	port (alu_reg_dest_in:			in std_logic;
			alu_src_in:					in std_logic;
			alu_op_in:					in std_logic_vector(2 downto 0);
			mem_jump_in:				in std_logic;
			mem_branch_in:				in std_logic;
			mem_read_in:				in std_logic;
			mem_write_in:				in std_logic;
			wb_mem_to_reg_in:			in std_logic;
			wb_reg_write_in:			in std_logic;
			alu_reg_dest_out:			out std_logic;
			alu_src_out:				out std_logic;
			alu_op_out:					out std_logic_vector(2 downto 0);
			mem_jump_out:				out std_logic;
			mem_branch_out:			out std_logic;
			mem_read_out:				out std_logic;
			mem_write_out:				out std_logic;
			wb_mem_to_reg_out:		out std_logic;
			wb_reg_write_out:			out std_logic;
			bubble:						in std_logic
		);
	end component;
	
	signal load_line:					std_logic;
	signal bubble_line:				std_logic;
	signal clk_line:					std_logic;
	
	signal alu_reg_dest_lines:		std_logic;
	signal alu_src_lines:			std_logic;
	signal alu_op_lines:				std_logic_vector(2 downto 0);
	signal mem_jump_lines:			std_logic;
	signal mem_branch_lines:		std_logic;
	signal mem_read_lines:			std_logic;
	signal mem_write_lines:			std_logic;
	signal wb_mem_to_reg_lines:	std_logic;
	signal wb_reg_write_lines:		std_logic;
	
	signal alu_reg_in:			std_logic_vector(7 downto 0);
	signal mem_reg_in:			std_logic_vector(7 downto 0);
	signal wb_reg_in:				std_logic_vector(7 downto 0);
	
	signal alu_reg_out:			std_logic_vector(7 downto 0);
	signal mem_reg_out:			std_logic_vector(7 downto 0);
	signal wb_reg_out:			std_logic_vector(7 downto 0);
	
begin
	
	clk_line <= clk;
	bubble_line <= bubble;
	load_line <= not stall;
	
	alu_reg_in(0) <= alu_reg_dest_lines;
	alu_reg_in(1) <= alu_src_lines;
	alu_reg_in(4 downto 2) <= alu_op_lines;
	alu_reg_in(7 downto 5) <= "000";
	
	mem_reg_in(0) <= mem_jump_lines;
	mem_reg_in(1) <= mem_branch_lines;
	mem_reg_in(2) <= mem_read_lines;
	mem_reg_in(3) <= mem_write_lines;
	mem_reg_in(7 downto 4) <= "0000";
	
	wb_reg_in(0) <= wb_mem_to_reg_lines;
	wb_reg_in(1) <= wb_reg_write_lines;
	wb_reg_in(7 downto 2) <= "000000";
		
	input_bubble_multiplexor:		control_ID_EX_buffer_bubmux port map ( alu_reg_dest_in => alu_reg_dest_in,
																								alu_src_in => alu_src_in,
																								alu_op_in => alu_op_in,
																								mem_jump_in => mem_jump_in,
																								mem_branch_in => mem_branch_in,
																								mem_read_in => mem_read_in,
																								mem_write_in => mem_write_in,
																								wb_mem_to_reg_in => wb_mem_to_reg_in,
																								wb_reg_write_in => wb_reg_write_in,
																								alu_reg_dest_out => alu_reg_dest_lines,
																								alu_src_out => alu_src_lines,
																								alu_op_out => alu_op_lines,
																								mem_jump_out => mem_jump_lines,
																								mem_branch_out => mem_branch_lines,
																								mem_read_out => mem_read_lines,
																								mem_write_out => mem_write_lines,
																								wb_mem_to_reg_out => wb_mem_to_reg_lines,
																								wb_reg_write_out => wb_reg_write_lines,
																								bubble => bubble_line
											);
	
	alu_cont_reg_8:					register_8 port map (data_in => alu_reg_in,
																		data_out => alu_reg_out,
																		load => load_line,
																		clk => clk_line
											);
	
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
	
	alu_reg_dest_out <= alu_reg_out(0);
	alu_src_out <= alu_reg_out(1);
	alu_op_out <= alu_reg_out(4 downto 2);
	
	mem_jump_out <= mem_reg_out(0);
	mem_branch_out <= mem_reg_out(1);
	mem_read_out <= mem_reg_out(2);
	mem_write_out <= mem_reg_out(3);
	
	wb_mem_to_reg_out <= wb_reg_out(0);
	wb_reg_write_out <= wb_reg_out(1);
	
end rtl;
