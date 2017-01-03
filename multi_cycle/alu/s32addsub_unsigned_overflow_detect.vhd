library ieee;
use ieee.std_logic_1164.all;
use work.all;

entity s32addsub_unsigned_overflow_detect is
	port (ctrl_line:			in std_logic;
			carry_out:			in std_logic;
			flag_out:			out std_logic
	);
end s32addsub_unsigned_overflow_detect;

architecture rtl of s32addsub_unsigned_overflow_detect is
	
	signal not_carry_out:			std_logic;
	signal not_ctrl_line:			std_logic;
	signal sub_unsigned_overflow:	std_logic;
	signal add_unsigned_overflow:	std_logic;
	
begin
	
	not_carry_out <= not carry_out;
	not_ctrl_line <= not ctrl_line;
	
	sub_unsigned_overflow <= ctrl_line and not_carry_out;
	add_unsigned_overflow <= not_ctrl_line and carry_out;
	
	flag_out <= sub_unsigned_overflow or add_unsigned_overflow;
	
end rtl;