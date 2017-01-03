library ieee;
use ieee.std_logic_1164.all;
use work.all;

entity ins_cache is
	port (address:		in std_logic_vector (9 downto 0);
			clock:		in std_logic;
			stall:		in std_logic;
			data:			in std_logic_vector (31 downto 0);
			wren:			in std_logic;
			q:				out std_logic_vector (31 downto 0)
	);
end ins_cache;
	
architecture rtl of ins_cache is
	
	component ins_cache_m4k_ram_block is
		port (address:							in std_logic_vector (9 downto 0);
				clock:							in std_logic;
				data:								in std_logic_vector (31 downto 0);
				wren:								in std_logic ;
				q:									out std_logic_vector (31 downto 0)
		);
	end component;
	
	component register_32 is
		port (data_in:							in std_logic_vector(31 downto 0);
				data_out:						out std_logic_vector(31 downto 0);
				load:								in std_logic;
				clk:								in std_logic
		);
	end component;
	
	component mux_2_to_1_by_32 is
		port (data_in_0:						in std_logic_vector(31 downto 0);
				data_in_1:						in std_logic_vector(31 downto 0);
				selection:						in std_logic;
				output:							out std_logic_vector(31 downto 0)
		);
	end component;
	
	component register_1 is
		port (data_in:							in std_logic;
				data_out:						out std_logic;
				load:								in std_logic;
				clk:								in std_logic
		);
	end component;
	
	signal clock_line:						std_logic;
	signal high_bit:							std_logic;
	
	signal q_out:								std_logic_vector(31 downto 0);
	signal stall_reg_out:					std_logic_vector(31 downto 0);
	
	signal stall_line:						std_logic;
	signal delay_stall_line:				std_logic;
	
begin
	
	high_bit <= '1';
	
	clock_line <= clock;
	
	stall_line <= stall or delay_stall_line;
	
	block_1:			ins_cache_m4k_ram_block port map (address => address,
																	 clock => clock_line,
																	 data => data,
																	 wren => wren,
																	 q => q_out
														);
	
	stall_mux:		mux_2_to_1_by_32 			port map (data_in_0 => q_out,
																	 data_in_1 => stall_reg_out,
																	 selection => stall_line,
																	 output => q
														);
	
	stall_reg:		register_32 				port map (data_in => q_out,
																	 data_out => stall_reg_out,
																	 load => high_bit,
																	 clk => stall_line
														);
	
	delay_stall_reg:	register_1		 port map (data_in => stall, data_out => delay_stall_line, load => high_bit, clk => clock_line);
	
end rtl;