library ieee;
use ieee.std_logic_1164.all;
use work.all;

entity regfile_32_by_32 is
	port (read_reg_1:			in std_logic_vector(4 downto 0);
			read_reg_2:			in std_logic_vector(4 downto 0);
			write_reg:			in std_logic_vector(4 downto 0);
			write_data:			in std_logic_vector(31 downto 0);
			read_data_1:		out std_logic_vector(31 downto 0);
			read_data_2:		out std_logic_vector(31 downto 0);
			reg_write:			in std_logic;
			clk:					in std_logic
	);
end regfile_32_by_32;

architecture rtl of regfile_32_by_32 is
	
	component register_32 is
		port (data_in:				in std_logic_vector(31 downto 0);
				data_out:			out std_logic_vector(31 downto 0);
				load:					in std_logic;
				clk:					in std_logic
		);
	end component;
	
	component mux_32_to_1_by_32 is
		port (data_in_0:				in std_logic_vector(31 downto 0);
				data_in_1:				in std_logic_vector(31 downto 0);
				data_in_2:				in std_logic_vector(31 downto 0);
				data_in_3:				in std_logic_vector(31 downto 0);
				data_in_4:				in std_logic_vector(31 downto 0);
				data_in_5:				in std_logic_vector(31 downto 0);
				data_in_6:				in std_logic_vector(31 downto 0);
				data_in_7:				in std_logic_vector(31 downto 0);
				data_in_8:				in std_logic_vector(31 downto 0);
				data_in_9:				in std_logic_vector(31 downto 0);
				data_in_10:				in std_logic_vector(31 downto 0);
				data_in_11:				in std_logic_vector(31 downto 0);
				data_in_12:				in std_logic_vector(31 downto 0);
				data_in_13:				in std_logic_vector(31 downto 0);
				data_in_14:				in std_logic_vector(31 downto 0);
				data_in_15:				in std_logic_vector(31 downto 0);
				data_in_16:				in std_logic_vector(31 downto 0);
				data_in_17:				in std_logic_vector(31 downto 0);
				data_in_18:				in std_logic_vector(31 downto 0);
				data_in_19:				in std_logic_vector(31 downto 0);
				data_in_20:				in std_logic_vector(31 downto 0);
				data_in_21:				in std_logic_vector(31 downto 0);
				data_in_22:				in std_logic_vector(31 downto 0);
				data_in_23:				in std_logic_vector(31 downto 0);
				data_in_24:				in std_logic_vector(31 downto 0);
				data_in_25:				in std_logic_vector(31 downto 0);
				data_in_26:				in std_logic_vector(31 downto 0);
				data_in_27:				in std_logic_vector(31 downto 0);
				data_in_28:				in std_logic_vector(31 downto 0);
				data_in_29:				in std_logic_vector(31 downto 0);
				data_in_30:				in std_logic_vector(31 downto 0);
				data_in_31:				in std_logic_vector(31 downto 0);
				selection:				in std_logic_vector(4 downto 0);
				output:					out std_logic_vector(31 downto 0)
		);
	end component;
	
	component  decoder_5_to_32 is
		port (selection:			in std_logic_vector(4 downto 0);
				output:				out std_logic_vector(31 downto 0)
		);
	end component;
	
	signal clk_line:			std_logic;
	
	signal write_select_lines:		std_logic_vector(31 downto 0);
	
	--signal write_select_line_0:	std_logic;
	signal write_select_line_1:	std_logic;
	signal write_select_line_2:	std_logic;
	signal write_select_line_3:	std_logic;
	signal write_select_line_4:	std_logic;
	signal write_select_line_5:	std_logic;
	signal write_select_line_6:	std_logic;
	signal write_select_line_7:	std_logic;
	signal write_select_line_8:	std_logic;
	signal write_select_line_9:	std_logic;
	signal write_select_line_10:	std_logic;
	signal write_select_line_11:	std_logic;
	signal write_select_line_12:	std_logic;
	signal write_select_line_13:	std_logic;
	signal write_select_line_14:	std_logic;
	signal write_select_line_15:	std_logic;
	signal write_select_line_16:	std_logic;
	signal write_select_line_17:	std_logic;
	signal write_select_line_18:	std_logic;
	signal write_select_line_19:	std_logic;
	signal write_select_line_20:	std_logic;
	signal write_select_line_21:	std_logic;
	signal write_select_line_22:	std_logic;
	signal write_select_line_23:	std_logic;
	signal write_select_line_24:	std_logic;
	signal write_select_line_25:	std_logic;
	signal write_select_line_26:	std_logic;
	signal write_select_line_27:	std_logic;
	signal write_select_line_28:	std_logic;
	signal write_select_line_29:	std_logic;
	signal write_select_line_30:	std_logic;
	signal write_select_line_31:	std_logic;
	
	signal data_output_line_0:		std_logic_vector(31 downto 0);
	signal data_output_line_1:		std_logic_vector(31 downto 0);
	signal data_output_line_2:		std_logic_vector(31 downto 0);
	signal data_output_line_3:		std_logic_vector(31 downto 0);
	signal data_output_line_4:		std_logic_vector(31 downto 0);
	signal data_output_line_5:		std_logic_vector(31 downto 0);
	signal data_output_line_6:		std_logic_vector(31 downto 0);
	signal data_output_line_7:		std_logic_vector(31 downto 0);
	signal data_output_line_8:		std_logic_vector(31 downto 0);
	signal data_output_line_9:		std_logic_vector(31 downto 0);
	signal data_output_line_10:		std_logic_vector(31 downto 0);
	signal data_output_line_11:		std_logic_vector(31 downto 0);
	signal data_output_line_12:		std_logic_vector(31 downto 0);
	signal data_output_line_13:		std_logic_vector(31 downto 0);
	signal data_output_line_14:		std_logic_vector(31 downto 0);
	signal data_output_line_15:		std_logic_vector(31 downto 0);
	signal data_output_line_16:		std_logic_vector(31 downto 0);
	signal data_output_line_17:		std_logic_vector(31 downto 0);
	signal data_output_line_18:		std_logic_vector(31 downto 0);
	signal data_output_line_19:		std_logic_vector(31 downto 0);
	signal data_output_line_20:		std_logic_vector(31 downto 0);
	signal data_output_line_21:		std_logic_vector(31 downto 0);
	signal data_output_line_22:		std_logic_vector(31 downto 0);
	signal data_output_line_23:		std_logic_vector(31 downto 0);
	signal data_output_line_24:		std_logic_vector(31 downto 0);
	signal data_output_line_25:		std_logic_vector(31 downto 0);
	signal data_output_line_26:		std_logic_vector(31 downto 0);
	signal data_output_line_27:		std_logic_vector(31 downto 0);
	signal data_output_line_28:		std_logic_vector(31 downto 0);
	signal data_output_line_29:		std_logic_vector(31 downto 0);
	signal data_output_line_30:		std_logic_vector(31 downto 0);
	signal data_output_line_31:		std_logic_vector(31 downto 0);
	
begin
	
	clk_line <= clk;
	
	decoder:					decoder_5_to_32   port map (selection => write_reg, output => write_select_lines);
	
	--write_select_line_0 <= write_select_lines(0) and reg_write;
	write_select_line_1 <= write_select_lines(1) and reg_write;
	write_select_line_2 <= write_select_lines(2) and reg_write;
	write_select_line_3 <= write_select_lines(3) and reg_write;
	write_select_line_4 <= write_select_lines(4) and reg_write;
	write_select_line_5 <= write_select_lines(5) and reg_write;
	write_select_line_6 <= write_select_lines(6) and reg_write;
	write_select_line_7 <= write_select_lines(7) and reg_write;
	write_select_line_8 <= write_select_lines(8) and reg_write;
	write_select_line_9 <= write_select_lines(9) and reg_write;
	write_select_line_10 <= write_select_lines(10) and reg_write;
	write_select_line_11 <= write_select_lines(11) and reg_write;
	write_select_line_12 <= write_select_lines(12) and reg_write;
	write_select_line_13 <= write_select_lines(13) and reg_write;
	write_select_line_14 <= write_select_lines(14) and reg_write;
	write_select_line_15 <= write_select_lines(15) and reg_write;
	write_select_line_16 <= write_select_lines(16) and reg_write;
	write_select_line_17 <= write_select_lines(17) and reg_write;
	write_select_line_18 <= write_select_lines(18) and reg_write;
	write_select_line_19 <= write_select_lines(19) and reg_write;
	write_select_line_20 <= write_select_lines(20) and reg_write;
	write_select_line_21 <= write_select_lines(21) and reg_write;
	write_select_line_22 <= write_select_lines(22) and reg_write;
	write_select_line_23 <= write_select_lines(23) and reg_write;
	write_select_line_24 <= write_select_lines(24) and reg_write;
	write_select_line_25 <= write_select_lines(25) and reg_write;
	write_select_line_26 <= write_select_lines(26) and reg_write;
	write_select_line_27 <= write_select_lines(27) and reg_write;
	write_select_line_28 <= write_select_lines(28) and reg_write;
	write_select_line_29 <= write_select_lines(29) and reg_write;
	write_select_line_30 <= write_select_lines(30) and reg_write;
	write_select_line_31 <= write_select_lines(31) and reg_write;
	
	data_output_line_0 <= "00000000000000000000000000000000";
	
	--register_0:				register_32			port map (data_in => write_data, data_out => data_output_line_0, load => write_select_line_0, clk => clk_line);
	register_1:				register_32			port map (data_in => write_data, data_out => data_output_line_1, load => write_select_line_1, clk => clk_line);
	register_2:				register_32			port map (data_in => write_data, data_out => data_output_line_2, load => write_select_line_2, clk => clk_line);
	register_3:				register_32			port map (data_in => write_data, data_out => data_output_line_3, load => write_select_line_3, clk => clk_line);
	register_4:				register_32			port map (data_in => write_data, data_out => data_output_line_4, load => write_select_line_4, clk => clk_line);
	register_5:				register_32			port map (data_in => write_data, data_out => data_output_line_5, load => write_select_line_5, clk => clk_line);
	register_6:				register_32			port map (data_in => write_data, data_out => data_output_line_6, load => write_select_line_6, clk => clk_line);
	register_7:				register_32			port map (data_in => write_data, data_out => data_output_line_7, load => write_select_line_7, clk => clk_line);
	register_8:				register_32			port map (data_in => write_data, data_out => data_output_line_8, load => write_select_line_8, clk => clk_line);
	register_9:				register_32			port map (data_in => write_data, data_out => data_output_line_9, load => write_select_line_9, clk => clk_line);
	register_10:			register_32			port map (data_in => write_data, data_out => data_output_line_10, load => write_select_line_10, clk => clk_line);
	register_11:			register_32			port map (data_in => write_data, data_out => data_output_line_11, load => write_select_line_11, clk => clk_line);
	register_12:			register_32			port map (data_in => write_data, data_out => data_output_line_12, load => write_select_line_12, clk => clk_line);
	register_13:			register_32			port map (data_in => write_data, data_out => data_output_line_13, load => write_select_line_13, clk => clk_line);
	register_14:			register_32			port map (data_in => write_data, data_out => data_output_line_14, load => write_select_line_14, clk => clk_line);
	register_15:			register_32			port map (data_in => write_data, data_out => data_output_line_15, load => write_select_line_15, clk => clk_line);
	register_16:			register_32			port map (data_in => write_data, data_out => data_output_line_16, load => write_select_line_16, clk => clk_line);
	register_17:			register_32			port map (data_in => write_data, data_out => data_output_line_17, load => write_select_line_17, clk => clk_line);
	register_18:			register_32			port map (data_in => write_data, data_out => data_output_line_18, load => write_select_line_18, clk => clk_line);
	register_19:			register_32			port map (data_in => write_data, data_out => data_output_line_19, load => write_select_line_19, clk => clk_line);
	register_20:			register_32			port map (data_in => write_data, data_out => data_output_line_20, load => write_select_line_20, clk => clk_line);
	register_21:			register_32			port map (data_in => write_data, data_out => data_output_line_21, load => write_select_line_21, clk => clk_line);
	register_22:			register_32			port map (data_in => write_data, data_out => data_output_line_22, load => write_select_line_22, clk => clk_line);
	register_23:			register_32			port map (data_in => write_data, data_out => data_output_line_23, load => write_select_line_23, clk => clk_line);
	register_24:			register_32			port map (data_in => write_data, data_out => data_output_line_24, load => write_select_line_24, clk => clk_line);
	register_25:			register_32			port map (data_in => write_data, data_out => data_output_line_25, load => write_select_line_25, clk => clk_line);
	register_26:			register_32			port map (data_in => write_data, data_out => data_output_line_26, load => write_select_line_26, clk => clk_line);
	register_27:			register_32			port map (data_in => write_data, data_out => data_output_line_27, load => write_select_line_27, clk => clk_line);
	register_28:			register_32			port map (data_in => write_data, data_out => data_output_line_28, load => write_select_line_28, clk => clk_line);
	register_29:			register_32			port map (data_in => write_data, data_out => data_output_line_29, load => write_select_line_29, clk => clk_line);
	register_30:			register_32			port map (data_in => write_data, data_out => data_output_line_30, load => write_select_line_30, clk => clk_line);
	register_31:			register_32			port map (data_in => write_data, data_out => data_output_line_31, load => write_select_line_31, clk => clk_line);
	
	read_mux_1:				mux_32_to_1_by_32 port map (data_in_0 => data_output_line_0,
																	 data_in_1 => data_output_line_1,
																	 data_in_2 => data_output_line_2,
																	 data_in_3 => data_output_line_3,
																	 data_in_4 => data_output_line_4,
																	 data_in_5 => data_output_line_5,
																	 data_in_6 => data_output_line_6,
																	 data_in_7 => data_output_line_7,
																	 data_in_8 => data_output_line_8,
																	 data_in_9 => data_output_line_9,
																	 data_in_10 => data_output_line_10,
																	 data_in_11 => data_output_line_11,
																	 data_in_12 => data_output_line_12,
																	 data_in_13 => data_output_line_13,
																	 data_in_14 => data_output_line_14,
																	 data_in_15 => data_output_line_15,
																	 data_in_16 => data_output_line_16,
																	 data_in_17 => data_output_line_17,
																	 data_in_18 => data_output_line_18,
																	 data_in_19 => data_output_line_19,
																	 data_in_20 => data_output_line_20,
																	 data_in_21 => data_output_line_21,
																	 data_in_22 => data_output_line_22,
																	 data_in_23 => data_output_line_23,
																	 data_in_24 => data_output_line_24,
																	 data_in_25 => data_output_line_25,
																	 data_in_26 => data_output_line_26,
																	 data_in_27 => data_output_line_27,
																	 data_in_28 => data_output_line_28,
																	 data_in_29 => data_output_line_29,
																	 data_in_30 => data_output_line_30,
																	 data_in_31 => data_output_line_31,
																	 selection => read_reg_1,
																	 output => read_data_1
														);
	
	read_mux_2:				mux_32_to_1_by_32 port map (data_in_0 => data_output_line_0,
																	 data_in_1 => data_output_line_1,
																	 data_in_2 => data_output_line_2,
																	 data_in_3 => data_output_line_3,
																	 data_in_4 => data_output_line_4,
																	 data_in_5 => data_output_line_5,
																	 data_in_6 => data_output_line_6,
																	 data_in_7 => data_output_line_7,
																	 data_in_8 => data_output_line_8,
																	 data_in_9 => data_output_line_9,
																	 data_in_10 => data_output_line_10,
																	 data_in_11 => data_output_line_11,
																	 data_in_12 => data_output_line_12,
																	 data_in_13 => data_output_line_13,
																	 data_in_14 => data_output_line_14,
																	 data_in_15 => data_output_line_15,
																	 data_in_16 => data_output_line_16,
																	 data_in_17 => data_output_line_17,
																	 data_in_18 => data_output_line_18,
																	 data_in_19 => data_output_line_19,
																	 data_in_20 => data_output_line_20,
																	 data_in_21 => data_output_line_21,
																	 data_in_22 => data_output_line_22,
																	 data_in_23 => data_output_line_23,
																	 data_in_24 => data_output_line_24,
																	 data_in_25 => data_output_line_25,
																	 data_in_26 => data_output_line_26,
																	 data_in_27 => data_output_line_27,
																	 data_in_28 => data_output_line_28,
																	 data_in_29 => data_output_line_29,
																	 data_in_30 => data_output_line_30,
																	 data_in_31 => data_output_line_31,
																	 selection => read_reg_2,
																	 output => read_data_2
														);
	
end rtl;