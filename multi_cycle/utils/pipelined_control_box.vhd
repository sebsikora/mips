library ieee;
use ieee.std_logic_1164.all;
use work.all;

entity pipelined_control_box is
	port (instruction_word:				in std_logic_vector(31 downto 0);
			flag_zero:						in std_logic;
			flag_reg_haz:					in std_logic_vector(1 downto 0);
			delay_arrive:					in std_logic;
			mem_arrive:						in std_logic;
			ex_arrive:						in std_logic;
			alu_reg_dest:					out std_logic;
			alu_src:							out std_logic;
			alu_op:							out std_logic_vector(2 downto 0);
			mem_jump:						out std_logic;
			mem_branch:						out std_logic;
			mem_read:						out std_logic;
			mem_write:						out std_logic;
			wb_memwrite:					out std_logic;
			wb_memtoreg:					out std_logic;
			IF_ID_trav_in:					out std_logic;
			ID_EX_trav_in:					out std_logic;
			reg_write_trav:				out std_logic;
			branch_trav:					out std_logic;
			jump_trav:						out std_logic;
			flag_error:						out std_logic
	);
end pipelined_control_box;

architecture rtl of pipelined_control_box is
	signal flag_reg_haz_line:			std_logic;
begin
	
	flag_reg_haz_line <= flag_reg_haz(0) or flag_reg_haz(1);
	
	process (instruction_word,
				flag_zero,
				flag_reg_haz_line,
				delay_arrive,
				ex_arrive,
				mem_arrive
	) is
	begin
		if instruction_word(31 downto 26) = "000000" then			-- This is an R-type instruction
			if (flag_reg_haz_line = '0') and (delay_arrive = '0') then				-- No hazard or remaining register write to happen - process normally
				alu_reg_dest <= '1';
				alu_src <= '0';
				mem_jump <= '0';
				mem_branch <= '0';
				mem_read <= '0';
				mem_write <= '0';
				wb_memwrite <= '1';
				wb_memtoreg <= '0';
				IF_ID_trav_in <= '0';
				ID_EX_trav_in <= '0';
				reg_write_trav <= '0';
				branch_trav <= '0';
				jump_trav <= '0';
				flag_error <= '0';
				if instruction_word(5 downto 0) = "100100" then
					alu_op <= "000";
				elsif instruction_word(5 downto 0) = "100101" then
					alu_op <= "001";
				elsif instruction_word(5 downto 0) = "100000" then
					alu_op <= "010";
				elsif instruction_word(5 downto 0) = "100010" then
					alu_op <= "110";
				elsif instruction_word(5 downto 0) = "101010" then
					alu_op <= "111";
				else
					alu_op <= "011";
					flag_error <= '1';
				end if;
			elsif (flag_reg_haz_line = '1') and (delay_arrive = '0') then			-- Hazard detected, stall PC and IF/ID and bubble ID/EX
				alu_op <= "011";
				alu_reg_dest <= '0';
				alu_src <= '0';
				mem_jump <= '0';
				mem_branch <= '0';
				mem_read <= '0';
				mem_write <= '0';
				wb_memwrite <= '0';
				wb_memtoreg <= '0';
				IF_ID_trav_in <= '1';
				ID_EX_trav_in <= '1';
				reg_write_trav <= '1';
				branch_trav <= '0';
				jump_trav <= '0';
				flag_error <= '0';
			elsif (flag_reg_haz_line = '0') and (delay_arrive = '1') then			-- No hazard still on the busses, but register write needs to happen so as above
				alu_op <= "011";
				alu_reg_dest <= '0';
				alu_src <= '0';
				mem_jump <= '0';
				mem_branch <= '0';
				mem_read <= '0';
				mem_write <= '0';
				wb_memwrite <= '0';
				wb_memtoreg <= '0';
				IF_ID_trav_in <= '1';
				ID_EX_trav_in <= '1';
				reg_write_trav <= '1';
				branch_trav <= '0';
				jump_trav <= '0';
				flag_error <= '0';
			else --(flag_reg_haz_line = '1') and (delay_arrive = '1') then			Hazard detected but somehow traverse bit arrival at the end of the line is indicated. Flag an error to stop the cpu.
				alu_op <= "011";
				alu_reg_dest <= '0';
				alu_src <= '0';
				mem_jump <= '0';
				mem_branch <= '0';
				mem_read <= '0';
				mem_write <= '0';
				wb_memwrite <= '0';
				wb_memtoreg <= '0';
				IF_ID_trav_in <= '0';
				ID_EX_trav_in <= '0';
				reg_write_trav <= '0';
				branch_trav <= '0';
				jump_trav <= '0';
				flag_error <= '1';
				--elsif instruction_word(31 downto 26) = "100011" then		-- This is an I-type instruction (LW)
				
				--elsif instruction_word(31 downto 26) = "101011" then		-- This is an I-type instruction (SW)
				
				--elsif instruction_word(31 downto 26) = "000100" then		-- This is a BEQ instruction
				
				--elsif instruction_word(31 downto 26) = "000101" then		-- This is a BNEQ instruction
				
				--elsif instruction_word(31 downto 26) = "000010" then		-- This is a JMP instruction
			end if;
		else																										-- It's an NOP, set controls accordingly
			alu_op <= "011";
			alu_reg_dest <= '0';
			alu_src <= '0';
			mem_jump <= '0';
			mem_branch <= '0';
			mem_read <= '0';
			mem_write <= '0';
			wb_memwrite <= '0';
			wb_memtoreg <= '0';
			IF_ID_trav_in <= '0';
			ID_EX_trav_in <= '0';
			reg_write_trav <= '0';
			branch_trav <= '0';
			jump_trav <= '0';
			flag_error <= '1';
		end if;
	end process;
end rtl;
