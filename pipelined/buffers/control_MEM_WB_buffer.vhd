library ieee;
use ieee.std_logic_1164.all;
use work.all;

entity control_MEM_WB_buffer is
	port (wb_mem_to_reg_in:			in std_logic;
			wb_reg_write_in:			in std_logic;
			wb_mem_to_reg_out:		out std_logic;
			wb_reg_write_out:			out std_logic;
			clk:							in std_logic
	);
end control_MEM_WB_buffer;

architecture rtl of control_MEM_WB_buffer is
	component register_8 is
		port (data_in:					in std_logic_vector(7 downto 0);
				data_out:				out std_logic_vector(7 downto 0);
				load:						in std_logic;
				clk:						in std_logic
		);
	end component;
	
	signal load_line:					std_logic;
	signal clk_line:					std_logic;
	
	signal wb_mem_to_reg_lines:	std_logic;
	signal wb_reg_write_lines:		std_logic;
	
	signal wb_reg_in:					std_logic_vector(7 downto 0);
	
	signal wb_reg_out:				std_logic_vector(7 downto 0);
	
begin
	
	clk_line <= clk;
	load_line <= '1';
	
	wb_reg_in(0) <= wb_mem_to_reg_in;
	wb_reg_in(1) <= wb_reg_write_in;
	wb_reg_in(7 downto 2) <= "000000";
		
	wb_cont_reg_8:						register_8 port map (data_in => wb_reg_in,
																		data_out => wb_reg_out,
																		load => load_line,
																		clk => clk_line
											);
	
	wb_mem_to_reg_out <= wb_reg_out(0);
	wb_reg_write_out <= wb_reg_out(1);
	
end rtl;
