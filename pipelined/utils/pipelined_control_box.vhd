library ieee;
use ieee.std_logic_1164.all;
use work.all;

entity pipelined_control_box is
	port (instruction_word:				in std_logic_vector(31 downto 0);
			flag_zero:						in std_logic;
			ID_EX_flag_reg_haz:			in std_logic_vector(1 downto 0);
			EX_MEM_flag_reg_haz:			in std_logic_vector(1 downto 0);
			MEM_WB_flag_reg_haz:			in std_logic_vector(1 downto 0);
			wb_arrive:						in std_logic;
			mem_arrive:						in std_logic;
			ex_arrive:						in std_logic;
			rst:								in std_logic;
			ni_read_reg_1:					out std_logic_vector(4 downto 0);
			ni_read_reg_2:					out std_logic_vector(4 downto 0);
			alu_reg_dest:					out std_logic;
			alu_src:							out std_logic;
			alu_op:							out std_logic_vector(2 downto 0);
			mem_jump:						out std_logic;
			mem_branch:						out std_logic;
			mem_read:						out std_logic;
			mem_write:						out std_logic;
			wb_regwrite:					out std_logic;
			wb_memtoreg:					out std_logic;
			pc_stall:						out std_logic;
			ins_cache_stall:				out std_logic;
			IF_ID_bubble:					out std_logic;
			IF_ID_stall:					out std_logic;
			ID_EX_bubble:					out std_logic;
			ID_EX_stall:					out std_logic;
			IF_ID_trav_in:					out std_logic;
			ID_EX_trav_in:					out std_logic;
			EX_MEM_trav_in:				out std_logic;
			reg_write_trav:				out std_logic;
			branch_trav:					out std_logic;
			jump_trav:						out std_logic;
			flag_error:						out std_logic
	);
end pipelined_control_box;

architecture rtl of pipelined_control_box is
	
	signal read_register_1_haz:				std_logic;
	signal read_register_2_haz:				std_logic;
	
	signal pc_stall_line:						std_logic;
	signal ins_cache_stall_line:				std_logic;
	signal IF_ID_stall_line:					std_logic;
	signal ID_EX_stall_line:					std_logic;
	
	signal IF_ID_bubble_line:					std_logic;
	
begin
	
	pc_stall <= pc_stall_line;
	ins_cache_stall <= rst or ins_cache_stall_line;
	
	IF_ID_stall <= IF_ID_stall_line;
	ID_EX_stall <= ID_EX_stall_line;
	
	IF_ID_bubble <= rst or IF_ID_bubble_line;
		
	read_register_1_haz <= (ID_EX_flag_reg_haz(0) or EX_MEM_flag_reg_haz(0) or MEM_WB_flag_reg_haz(0));
	read_register_2_haz <= (ID_EX_flag_reg_haz(1) or EX_MEM_flag_reg_haz(1) or MEM_WB_flag_reg_haz(1));
	
	ni_read_reg_1(4 downto 0) <= instruction_word(25 downto 21);
	ni_read_reg_2(4 downto 0) <= instruction_word(20 downto 16);
	
	process (instruction_word,
				flag_zero,
				read_register_1_haz,
				read_register_2_haz,
				ex_arrive,
				mem_arrive,
				wb_arrive
	) is
	begin
		if instruction_word(31 downto 26) = "100011" then					-- LW instruction
			if (read_register_1_haz or read_register_2_haz) = '1' then
				alu_reg_dest <= '0';
				alu_src <= '0';
				alu_op <= "011";
				mem_jump <= '0';
				mem_branch <= '0';
				mem_read <= '0';
				mem_write <= '0';
				wb_regwrite <= '0';
				wb_memtoreg <= '0';
				pc_stall_line <= '1';
				ins_cache_stall_line <= '1';
				IF_ID_bubble_line <= '0';
				IF_ID_stall_line <= '1';
				ID_EX_bubble <= '1';
				ID_EX_stall_line <= '0';
				IF_ID_trav_in <= '1';
				ID_EX_trav_in <= '1';
				EX_MEM_trav_in <= '1';
				reg_write_trav <= '1';
				branch_trav <= '0';
				jump_trav <= '0';
				flag_error <= '0';
			else
				alu_reg_dest <= '0';
				alu_src <= '1';
				alu_op <= "010";
				mem_jump <= '0';
				mem_branch <= '0';
				mem_read <= '0';
				mem_write <= '0';
				wb_regwrite <= '1';
				wb_memtoreg <= '1';
				pc_stall_line <= '0';
				ins_cache_stall_line <= '0';
				IF_ID_bubble_line <= '0';
				IF_ID_stall_line <= '0';
				ID_EX_bubble <= '0';
				ID_EX_stall_line <= '0';
				IF_ID_trav_in <= '0';
				ID_EX_trav_in <= '0';
				EX_MEM_trav_in <= '0';
				reg_write_trav <= '0';
				branch_trav <= '0';
				jump_trav <= '0';
				flag_error <= '0';
			end if;
		elsif instruction_word(31 downto 26) = "101011" then				-- SW instruction
			if (read_register_1_haz or read_register_2_haz) = '1' then
				alu_reg_dest <= '0';
				alu_src <= '0';
				alu_op <= "011";
				mem_jump <= '0';
				mem_branch <= '0';
				mem_read <= '0';
				mem_write <= '0';
				wb_regwrite <= '0';
				wb_memtoreg <= '0';
				pc_stall_line <= '1';
				ins_cache_stall_line <= '1';
				IF_ID_bubble_line <= '0';
				IF_ID_stall_line <= '1';
				ID_EX_bubble <= '1';
				ID_EX_stall_line <= '0';
				IF_ID_trav_in <= '1';
				ID_EX_trav_in <= '1';
				EX_MEM_trav_in <= '1';
				reg_write_trav <= '1';
				branch_trav <= '0';
				jump_trav <= '0';
				flag_error <= '0';
			else
				alu_reg_dest <= '0';
				alu_src <= '1';
				alu_op <= "010";
				mem_jump <= '0';
				mem_branch <= '0';
				mem_read <= '0';
				mem_write <= '1';
				wb_regwrite <= '0';
				wb_memtoreg <= '0';
				pc_stall_line <= '0';
				ins_cache_stall_line <= '0';
				IF_ID_bubble_line <= '0';
				IF_ID_stall_line <= '0';
				ID_EX_bubble <= '0';
				ID_EX_stall_line <= '0';
				IF_ID_trav_in <= '0';
				ID_EX_trav_in <= '0';
				EX_MEM_trav_in <= '0';
				reg_write_trav <= '0';
				branch_trav <= '0';
				jump_trav <= '0';
				flag_error <= '0';
			end if;
		else																				-- NOP instruction	
			alu_reg_dest <= '0';
			alu_src <= '0';
			alu_op <= "011";
			mem_jump <= '0';
			mem_branch <= '0';
			mem_read <= '0';
			mem_write <= '0';
			wb_regwrite <= '0';
			wb_memtoreg <= '0';
			pc_stall_line <= '0';
			ins_cache_stall_line <= '0';
			IF_ID_bubble_line <= '0';
			IF_ID_stall_line <= '0';
			ID_EX_bubble <= '0';
			ID_EX_stall_line <= '0';
			IF_ID_trav_in <= '0';
			ID_EX_trav_in <= '0';
			EX_MEM_trav_in <= '0';
			reg_write_trav <= '0';
			branch_trav <= '0';
			jump_trav <= '0';
			flag_error <= '0';
		end if;
	end process;
end rtl;
