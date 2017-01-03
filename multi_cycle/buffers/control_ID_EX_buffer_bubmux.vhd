library ieee;
use ieee.std_logic_1164.all;
use work.all;

entity control_ID_EX_buffer_bubmux is
	port (alu_reg_dest_in:			in std_logic;
			alu_src_in:					in std_logic;
			alu_op_in:					in std_logic_vector(2 downto 0);
			mem_jump_in:				in std_logic;
			mem_branch_in:				in std_logic;
			mem_read_in:				in std_logic;
			mem_write_in:				in std_logic;
			wb_mem_to_reg_in:			in std_logic;
			wb_mem_write_in:			in std_logic;
			alu_reg_dest_out:			out std_logic;
			alu_src_out:				out std_logic;
			alu_op_out:					out std_logic_vector(2 downto 0);
			mem_jump_out:				out std_logic;
			mem_branch_out:			out std_logic;
			mem_read_out:				out std_logic;
			mem_write_out:				out std_logic;
			wb_mem_to_reg_out:		out std_logic;
			wb_mem_write_out:			out std_logic;
			bubble:						in std_logic
			
	);
end control_ID_EX_buffer_bubmux;

architecture rtl of control_ID_EX_buffer_bubmux is
	
begin
	process (bubble,
				alu_reg_dest_in,
				alu_src_in,
				alu_op_in,
				mem_jump_in,
				mem_branch_in,
				mem_read_in,
				mem_write_in,
				wb_mem_to_reg_in,
				wb_mem_write_in) is
	begin
		if bubble = '1' then
			alu_reg_dest_out <= '0';
			alu_src_out <= '0';
			alu_op_out <= "000";
			mem_jump_out <= '0';
			mem_branch_out <= '0';
			mem_read_out <= '0';
			mem_write_out <= '0';
			wb_mem_to_reg_out <= '0';
			wb_mem_write_out <= '0';
		else
			alu_reg_dest_out <= alu_reg_dest_in;
			alu_src_out <= alu_src_in;
			alu_op_out <= alu_op_in;
			mem_jump_out <= mem_jump_in;
			mem_branch_out <= mem_branch_in;
			mem_read_out <= mem_read_in;
			mem_write_out <= mem_write_in;
			wb_mem_to_reg_out <= wb_mem_to_reg_in;
			wb_mem_write_out <= wb_mem_write_in;
		end if;
	end process;
end rtl;