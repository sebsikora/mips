library ieee;
use ieee.std_logic_1164.all;
use work.all;

entity signed_32bit_add_subtract is
	port (input_A:					in std_logic_vector(31 downto 0);
			input_B:					in std_logic_vector(31 downto 0);
			ctrl_line:				in std_logic;
			output:					out std_logic_vector(31 downto 0);
			unsigned_overflow:	out std_logic;
			signed_overflow:		out std_logic
	);
end signed_32bit_add_subtract;

architecture rtl of signed_32bit_add_subtract is
	
	component s32addsub_full_adder is
		port (input_A:			in std_logic_vector(31 downto 0);
				input_B:			in std_logic_vector(31 downto 0);
				carry_in:		in std_logic;
				output:			out std_logic_vector(31 downto 0);
				carry_out:		out std_logic
		);
	end component;
	
	component s32addsub_subtraction_invertors is
		port (input:				in std_logic_vector(31 downto 0);
				ctrl_line:			in std_logic;
				output:				out std_logic_vector(31 downto 0)
		);
	end component;
	
	component s32addsub_unsigned_overflow_detect is
		port (ctrl_line:			in std_logic;
				carry_out:			in std_logic;
				flag_out:			out std_logic
		);
	end component;
	
	component s32addsub_signed_overflow_detect is
		port (sign_bit_A:			in std_logic;
				sign_bit_B:			in std_logic;
				sign_bit_out:		in std_logic;
				flag_out:			out std_logic
		);
	end component; 
	
	signal sign_bit_A:			std_logic;
	signal sign_bit_B:			std_logic;
	signal sign_bit_out:			std_logic;
	
	signal sub_inv_out:			std_logic_vector(31 downto 0);
	
	signal adder_carry_out:		std_logic;
	signal adder_output:			std_logic_vector(31 downto 0);
	
	signal signed_overflow_line:			std_logic;
	signal unsigned_overflow_line:		std_logic;
	
begin
	
	sub_inv:			s32addsub_subtraction_invertors 	port map (input => input_B,
																				 ctrl_line => ctrl_line,
																				 output => sub_inv_out
																	);
	
	addder:			s32addsub_full_adder				   port map (input_A => input_A,
																				 input_B => sub_inv_out,
																				 carry_in => ctrl_line,
																				 output => adder_output,
																				 carry_out => adder_carry_out
																   );
	
	signed_of_det:	s32addsub_signed_overflow_detect port map (sign_bit_A => sign_bit_A,
																				 sign_bit_B => sign_bit_B,
																				 sign_bit_out => sign_bit_out,
																				 flag_out => signed_overflow
																	);
	
	usigned_of_det:s32addsub_unsigned_overflow_detect port map (ctrl_line => ctrl_line,
																				 carry_out => adder_carry_out,
																				 flag_out => unsigned_overflow
																	);
	
	sign_bit_A <= input_A(31);
	sign_bit_B <= sub_inv_out(31);
	sign_bit_out <= adder_output(31);
	
	output <= adder_output;
	
end rtl;