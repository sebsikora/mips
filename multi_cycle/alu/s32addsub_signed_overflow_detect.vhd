library ieee;
use ieee.std_logic_1164.all;
use work.all;

entity s32addsub_signed_overflow_detect is
	port (sign_bit_A:			in std_logic;
			sign_bit_B:			in std_logic;
			sign_bit_out:		in std_logic;
			flag_out:			out std_logic
	);
end s32addsub_signed_overflow_detect;

architecture rtl of s32addsub_signed_overflow_detect is
	
	signal not_sign_bit_A:			std_logic;
	signal not_sign_bit_B:			std_logic;
	signal not_sign_bit_out:		std_logic;
	signal signed_overflow_A:		std_logic;
	signal signed_overflow_B:		std_logic;
	
begin
	
	not_sign_bit_A <= not sign_bit_A;
	not_sign_bit_B <= not sign_bit_B;
	not_sign_bit_out <= not sign_bit_out;
	
	signed_overflow_A <= sign_bit_A and sign_bit_B and not_sign_bit_out;
	signed_overflow_B <= not_sign_bit_A and not_sign_bit_B and sign_bit_out;
	
	flag_out <= signed_overflow_A or signed_overflow_B;
	
end rtl;