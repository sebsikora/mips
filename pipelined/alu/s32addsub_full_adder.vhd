library ieee;
use ieee.std_logic_1164.all;
use work.all;

entity s32addsub_full_adder is
	port (input_A:			in std_logic_vector(31 downto 0);
			input_B:			in std_logic_vector(31 downto 0);
			carry_in:		in std_logic;
			output:			out std_logic_vector(31 downto 0);
			carry_out:		out std_logic
	);
end s32addsub_full_adder;

architecture struct of s32addsub_full_adder is
	
	component s32addsub_onebit_full_adder is
		port( inputX:		in std_logic;
				inputY:		in std_logic;
				carry_in:	in std_logic;
				carry_out:	out std_logic;
				bit_out:		out std_logic
		);
	end component;
	
	signal root_carry_in:		std_logic;
	signal carry_out_link_0:	std_logic;
	signal carry_out_link_1:	std_logic;
	signal carry_out_link_2:	std_logic;
	signal carry_out_link_3:	std_logic;
	signal carry_out_link_4:	std_logic;
	signal carry_out_link_5:	std_logic;
	signal carry_out_link_6:	std_logic;
	signal carry_out_link_7:	std_logic;
	signal carry_out_link_8:	std_logic;
	signal carry_out_link_9:	std_logic;
	signal carry_out_link_10:	std_logic;
	signal carry_out_link_11:	std_logic;
	signal carry_out_link_12:	std_logic;
	signal carry_out_link_13:	std_logic;
	signal carry_out_link_14:	std_logic;
	signal carry_out_link_15:	std_logic;
	signal carry_out_link_16:	std_logic;
	signal carry_out_link_17:	std_logic;
	signal carry_out_link_18:	std_logic;
	signal carry_out_link_19:	std_logic;
	signal carry_out_link_20:	std_logic;
	signal carry_out_link_21:	std_logic;
	signal carry_out_link_22:	std_logic;
	signal carry_out_link_23:	std_logic;
	signal carry_out_link_24:	std_logic;
	signal carry_out_link_25:	std_logic;
	signal carry_out_link_26:	std_logic;
	signal carry_out_link_27:	std_logic;
	signal carry_out_link_28:	std_logic;
	signal carry_out_link_29:	std_logic;
	signal carry_out_link_30:	std_logic;
	signal carry_out_link_31:	std_logic;
	
	signal bit_out_link_0:	std_logic;
	signal bit_out_link_1:	std_logic;
	signal bit_out_link_2:	std_logic;
	signal bit_out_link_3:	std_logic;
	signal bit_out_link_4:	std_logic;
	signal bit_out_link_5:	std_logic;
	signal bit_out_link_6:	std_logic;
	signal bit_out_link_7:	std_logic;
	signal bit_out_link_8:	std_logic;
	signal bit_out_link_9:	std_logic;
	signal bit_out_link_10:	std_logic;
	signal bit_out_link_11:	std_logic;
	signal bit_out_link_12:	std_logic;
	signal bit_out_link_13:	std_logic;
	signal bit_out_link_14:	std_logic;
	signal bit_out_link_15:	std_logic;
	signal bit_out_link_16:	std_logic;
	signal bit_out_link_17:	std_logic;
	signal bit_out_link_18:	std_logic;
	signal bit_out_link_19:	std_logic;
	signal bit_out_link_20:	std_logic;
	signal bit_out_link_21:	std_logic;
	signal bit_out_link_22:	std_logic;
	signal bit_out_link_23:	std_logic;
	signal bit_out_link_24:	std_logic;
	signal bit_out_link_25:	std_logic;
	signal bit_out_link_26:	std_logic;
	signal bit_out_link_27:	std_logic;
	signal bit_out_link_28:	std_logic;
	signal bit_out_link_29:	std_logic;
	signal bit_out_link_30:	std_logic;
	signal bit_out_link_31:	std_logic;
	
begin
	
	root_carry_in <= carry_in;
	
	bit_0: s32addsub_onebit_full_adder port map (inputX => input_A(0), inputY => input_B(0), carry_in => root_carry_in, carry_out => carry_out_link_0, bit_out => bit_out_link_0);
	bit_1: s32addsub_onebit_full_adder port map (inputX => input_A(1), inputY => input_B(1), carry_in => carry_out_link_0, carry_out => carry_out_link_1, bit_out => bit_out_link_1);
	bit_2: s32addsub_onebit_full_adder port map (inputX => input_A(2), inputY => input_B(2), carry_in => carry_out_link_1, carry_out => carry_out_link_2, bit_out => bit_out_link_2);
	bit_3: s32addsub_onebit_full_adder port map (inputX => input_A(3), inputY => input_B(3), carry_in => carry_out_link_2, carry_out => carry_out_link_3, bit_out => bit_out_link_3);	
	bit_4: s32addsub_onebit_full_adder port map (inputX => input_A(4), inputY => input_B(4), carry_in => carry_out_link_3, carry_out => carry_out_link_4, bit_out => bit_out_link_4);
	bit_5: s32addsub_onebit_full_adder port map (inputX => input_A(5), inputY => input_B(5), carry_in => carry_out_link_4, carry_out => carry_out_link_5, bit_out => bit_out_link_5);
	bit_6: s32addsub_onebit_full_adder port map (inputX => input_A(6), inputY => input_B(6), carry_in => carry_out_link_5, carry_out => carry_out_link_6, bit_out => bit_out_link_6);
	bit_7: s32addsub_onebit_full_adder port map (inputX => input_A(7), inputY => input_B(7), carry_in => carry_out_link_6, carry_out => carry_out_link_7, bit_out => bit_out_link_7);
	bit_8: s32addsub_onebit_full_adder port map (inputX => input_A(8), inputY => input_B(8), carry_in => carry_out_link_7, carry_out => carry_out_link_8, bit_out => bit_out_link_8);
	bit_9: s32addsub_onebit_full_adder port map (inputX => input_A(9), inputY => input_B(9), carry_in => carry_out_link_8, carry_out => carry_out_link_9, bit_out => bit_out_link_9);
	bit_10: s32addsub_onebit_full_adder port map (inputX => input_A(10), inputY => input_B(10), carry_in => carry_out_link_9, carry_out => carry_out_link_10, bit_out => bit_out_link_10);
	bit_11: s32addsub_onebit_full_adder port map (inputX => input_A(11), inputY => input_B(11), carry_in => carry_out_link_10, carry_out => carry_out_link_11, bit_out => bit_out_link_11);
	bit_12: s32addsub_onebit_full_adder port map (inputX => input_A(12), inputY => input_B(12), carry_in => carry_out_link_11, carry_out => carry_out_link_12, bit_out => bit_out_link_12);
	bit_13: s32addsub_onebit_full_adder port map (inputX => input_A(13), inputY => input_B(13), carry_in => carry_out_link_12, carry_out => carry_out_link_13, bit_out => bit_out_link_13);
	bit_14: s32addsub_onebit_full_adder port map (inputX => input_A(14), inputY => input_B(14), carry_in => carry_out_link_13, carry_out => carry_out_link_14, bit_out => bit_out_link_14);
	bit_15: s32addsub_onebit_full_adder port map (inputX => input_A(15), inputY => input_B(15), carry_in => carry_out_link_14, carry_out => carry_out_link_15, bit_out => bit_out_link_15);
	bit_16: s32addsub_onebit_full_adder port map (inputX => input_A(16), inputY => input_B(16), carry_in => carry_out_link_15, carry_out => carry_out_link_16, bit_out => bit_out_link_16);
	bit_17: s32addsub_onebit_full_adder port map (inputX => input_A(17), inputY => input_B(17), carry_in => carry_out_link_16, carry_out => carry_out_link_17, bit_out => bit_out_link_17);
	bit_18: s32addsub_onebit_full_adder port map (inputX => input_A(18), inputY => input_B(18), carry_in => carry_out_link_17, carry_out => carry_out_link_18, bit_out => bit_out_link_18);
	bit_19: s32addsub_onebit_full_adder port map (inputX => input_A(19), inputY => input_B(19), carry_in => carry_out_link_18, carry_out => carry_out_link_19, bit_out => bit_out_link_19);
	bit_20: s32addsub_onebit_full_adder port map (inputX => input_A(20), inputY => input_B(20), carry_in => carry_out_link_19, carry_out => carry_out_link_20, bit_out => bit_out_link_20);
	bit_21: s32addsub_onebit_full_adder port map (inputX => input_A(21), inputY => input_B(21), carry_in => carry_out_link_20, carry_out => carry_out_link_21, bit_out => bit_out_link_21);
	bit_22: s32addsub_onebit_full_adder port map (inputX => input_A(22), inputY => input_B(22), carry_in => carry_out_link_21, carry_out => carry_out_link_22, bit_out => bit_out_link_22);
	bit_23: s32addsub_onebit_full_adder port map (inputX => input_A(23), inputY => input_B(23), carry_in => carry_out_link_22, carry_out => carry_out_link_23, bit_out => bit_out_link_23);
	bit_24: s32addsub_onebit_full_adder port map (inputX => input_A(24), inputY => input_B(24), carry_in => carry_out_link_23, carry_out => carry_out_link_24, bit_out => bit_out_link_24);
	bit_25: s32addsub_onebit_full_adder port map (inputX => input_A(25), inputY => input_B(25), carry_in => carry_out_link_24, carry_out => carry_out_link_25, bit_out => bit_out_link_25);
	bit_26: s32addsub_onebit_full_adder port map (inputX => input_A(26), inputY => input_B(26), carry_in => carry_out_link_25, carry_out => carry_out_link_26, bit_out => bit_out_link_26);
	bit_27: s32addsub_onebit_full_adder port map (inputX => input_A(27), inputY => input_B(27), carry_in => carry_out_link_26, carry_out => carry_out_link_27, bit_out => bit_out_link_27);
	bit_28: s32addsub_onebit_full_adder port map (inputX => input_A(28), inputY => input_B(28), carry_in => carry_out_link_27, carry_out => carry_out_link_28, bit_out => bit_out_link_28);
	bit_29: s32addsub_onebit_full_adder port map (inputX => input_A(29), inputY => input_B(29), carry_in => carry_out_link_28, carry_out => carry_out_link_29, bit_out => bit_out_link_29);
	bit_30: s32addsub_onebit_full_adder port map (inputX => input_A(30), inputY => input_B(30), carry_in => carry_out_link_29, carry_out => carry_out_link_30, bit_out => bit_out_link_30);
	bit_31: s32addsub_onebit_full_adder port map (inputX => input_A(31), inputY => input_B(31), carry_in => carry_out_link_30, carry_out => carry_out_link_31, bit_out => bit_out_link_31);
	
	carry_out <= carry_out_link_31;
	
	output(0) <= bit_out_link_0;
	output(1) <= bit_out_link_1;
	output(2) <= bit_out_link_2;
	output(3) <= bit_out_link_3;
	output(4) <= bit_out_link_4;
	output(5) <= bit_out_link_5;
	output(6) <= bit_out_link_6;
	output(7) <= bit_out_link_7;
	output(8) <= bit_out_link_8;
	output(9) <= bit_out_link_9;
	output(10) <= bit_out_link_10;
	output(11) <= bit_out_link_11;
	output(12) <= bit_out_link_12;
	output(13) <= bit_out_link_13;
	output(14) <= bit_out_link_14;
	output(15) <= bit_out_link_15;
	output(16) <= bit_out_link_16;
	output(17) <= bit_out_link_17;
	output(18) <= bit_out_link_18;
	output(19) <= bit_out_link_19;
	output(20) <= bit_out_link_20;
	output(21) <= bit_out_link_21;
	output(22) <= bit_out_link_22;
	output(23) <= bit_out_link_23;
	output(24) <= bit_out_link_24;
	output(25) <= bit_out_link_25;
	output(26) <= bit_out_link_26;
	output(27) <= bit_out_link_27;
	output(28) <= bit_out_link_28;
	output(29) <= bit_out_link_29;
	output(30) <= bit_out_link_30;
	output(31) <= bit_out_link_31;
	
end struct;