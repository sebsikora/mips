library ieee;
use ieee.std_logic_1164.all;
use work.all;

entity control_box is
	port (instruction_word:				in std_logic_vector(31 downto 0);
			alu_zero:						in std_logic;
			ctrl_alu_op:					out std_logic_vector(2 downto 0);
			ctrl_reg_dest:					out std_logic;
			ctrl_reg_write:				out std_logic;
			ctrl_alu_source:				out std_logic;
			ctrl_dat_cache_write:		out std_logic;
			ctrl_regblk_data_in_mux:	out std_logic;
			ctrl_pc_source:				out std_logic;
			ctrl_jump:						out std_logic;
			error:							out std_logic
	);
end control_box;

architecture rtl of control_box is
begin
	process (instruction_word, alu_zero)
	begin
		if instruction_word(31 downto 26) = "000000" then			-- This is an R-type instruction
			ctrl_reg_dest <= '1';
			ctrl_reg_write <= '1';
			ctrl_alu_source <= '0';
			ctrl_dat_cache_write <= '0';
			ctrl_regblk_data_in_mux <= '0';
			ctrl_pc_source <= '0' and alu_zero;
			ctrl_jump <= '0';
			error <= '0';
			if instruction_word(5 downto 0) = "100100" then
				ctrl_alu_op <= "000";
			elsif instruction_word(5 downto 0) = "100101" then
				ctrl_alu_op <= "001";
			elsif instruction_word(5 downto 0) = "100000" then
				ctrl_alu_op <= "010";
			elsif instruction_word(5 downto 0) = "100010" then
				ctrl_alu_op <= "110";
			elsif instruction_word(5 downto 0) = "101010" then
				ctrl_alu_op <= "111";
			else
				ctrl_alu_op <= "011";
				error <= '1';
			end if;
		elsif instruction_word(31 downto 26) = "100011" then		-- This is an I-type instruction (LW)
			ctrl_reg_dest <= '0';
			ctrl_reg_write <= '1';
			ctrl_alu_source <= '1';
			ctrl_dat_cache_write <= '0';
			ctrl_regblk_data_in_mux <= '1';
			ctrl_alu_op <= "010";
			ctrl_pc_source <= '0' and alu_zero;
			ctrl_jump <= '0';
			error <= '0';
		elsif instruction_word(31 downto 26) = "101011" then		-- This is an I-type instruction (SW)
			ctrl_reg_dest <= '0';
			ctrl_reg_write <= '0';
			ctrl_alu_source <= '1';
			ctrl_dat_cache_write <= '1';
			ctrl_regblk_data_in_mux <= '0';
			ctrl_alu_op <= "010";
			ctrl_pc_source <= '0' and alu_zero;
			ctrl_jump <= '0';
			error <= '0';
		elsif instruction_word(31 downto 26) = "000100" then		-- This is a BEQ instruction
			ctrl_reg_dest <= '0';
			ctrl_reg_write <= '0';
			ctrl_alu_source <= '0';
			ctrl_dat_cache_write <= '0';
			ctrl_regblk_data_in_mux <= '0';
			ctrl_alu_op <= "110";
			ctrl_pc_source <= ('1' and alu_zero);
			ctrl_jump <= '0';
			error <= '0';
		elsif instruction_word(31 downto 26) = "000101" then		-- This is a BNEQ instruction
			ctrl_reg_dest <= '0';
			ctrl_reg_write <= '0';
			ctrl_alu_source <= '0';
			ctrl_dat_cache_write <= '0';
			ctrl_regblk_data_in_mux <= '0';
			ctrl_alu_op <= "110";
			ctrl_pc_source <= ('1' and (not alu_zero));
			ctrl_jump <= '0';
			error <= '0';
		elsif instruction_word(31 downto 26) = "000010" then		-- This is a JMP instruction
			ctrl_reg_dest <= '0';
			ctrl_reg_write <= '0';
			ctrl_alu_source <= '0';
			ctrl_dat_cache_write <= '0';
			ctrl_regblk_data_in_mux <= '0';
			ctrl_alu_op <= "011";
			ctrl_pc_source <= '0' and alu_zero;
			ctrl_jump <= '1';
			error <= '0';
		else
			ctrl_reg_dest <= '0';
			ctrl_reg_write <= '0';
			ctrl_alu_source <= '0';
			ctrl_dat_cache_write <= '0';
			ctrl_regblk_data_in_mux <= '0';
			ctrl_alu_op <= "011";
			ctrl_pc_source <= '0' and alu_zero;
			ctrl_jump <= '0';
			error <= '1';
		end if;
	end process;
end rtl;
