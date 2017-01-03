library ieee;
use ieee.std_logic_1164.all;
use work.all;

entity register_IF_ID_buffer is
	port (program_counter_in:							in std_logic_vector(31 downto 0);
			program_counter_out:							out std_logic_vector(31 downto 0);
			instruction_word_in:							in std_logic_vector(31 downto 0);
			instruction_word_out:						out std_logic_vector(31 downto 0);
			traverse_bit_in:								in std_logic;
			traverse_bit_clr:								in std_logic;
			traverse_bit_out:								out std_logic;
			stall:											in std_logic;
			bubble:											in std_logic;
			clk:												in std_logic
	);
end register_IF_ID_buffer;

architecture rtl of register_IF_ID_buffer is
	component register_32 is
		port (data_in:										in std_logic_vector(31 downto 0);
				data_out:									out std_logic_vector(31 downto 0);
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
	
	component register_IF_ID_buffer_bubmux is
		port (program_counter_in:						in std_logic_vector(31 downto 0);
				program_counter_out:						out std_logic_vector(31 downto 0);
				instruction_word_in:						in std_logic_vector(31 downto 0);
				instruction_word_out:					out std_logic_vector(31 downto 0);
				bubble:										in std_logic
		);
	end component;
	
	component mux_2_to_1_by_32 is
		port (data_in_0:									in std_logic_vector(31 downto 0);
				data_in_1:									in std_logic_vector(31 downto 0);
				selection:									in std_logic;
				output:										out std_logic_vector(31 downto 0)
		);
	end component;
	
	component register_1 is
		port (data_in:										in std_logic;
				data_out:									out std_logic;
				load:											in std_logic;
				clk:											in std_logic
		);
	end component;
	
	signal clk_line:										std_logic;
	signal t_clk_line:									std_logic;
	signal load_line:										std_logic;
	signal bubble_line:									std_logic;
	--signal bubble_line_delay:							std_logic;
	
	signal low_bus:										std_logic_vector(31 downto 0);
	signal high_bit:										std_logic;
	
	signal instruction_word_lines:					std_logic_vector(31 downto 0);
	--signal pre_instruction_word_lines:				std_logic_vector(31 downto 0);
	signal program_counter_lines:						std_logic_vector(31 downto 0);
	
begin
	
	clk_line <= clk;
	t_clk_line <= clk;
	load_line <= not stall;
	bubble_line <= bubble;
	
	low_bus <= "00000000000000000000000000000000";
	high_bit <= '1';
	
	--ins_word_delay_mux:			mux_2_to_1_by_32 			port map (data_in_0 => instruction_word_in,
	--																				 data_in_1 => low_bus,
	--																				 selection => bubble_line_delay,
	--																				 output => pre_instruction_word_lines
	--									);
	
	--ins_word_delay_reg:			register_1		 port map (data_in => bubble_line, data_out => bubble_line_delay, load => load_line, clk => clk_line);
	
	input_bubble_multiplexor:	register_IF_ID_buffer_bubmux port map (program_counter_in => program_counter_in, instruction_word_in => instruction_word_in, program_counter_out => program_counter_lines, instruction_word_out => instruction_word_lines, bubble => bubble_line);
	
	program_counter_buffer:		register_32 port map (data_in => program_counter_lines, data_out => program_counter_out, load => load_line, clk => clk_line);
	traverse_latch_buffer:		traverse_latch port map (data_in => traverse_bit_in, data_out => traverse_bit_out, load => high_bit, clr => traverse_bit_clr, clk => t_clk_line);
	
	instruction_word_out <= instruction_word_lines;
	
end rtl;