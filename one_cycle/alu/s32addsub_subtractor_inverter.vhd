library ieee;
use ieee.std_logic_1164.all;
use work.all;

entity s32addsub_subtraction_invertors is
	port (input:		in std_logic_vector(31 downto 0);
			ctrl_line:	in std_logic;
			output:		out std_logic_vector(31 downto 0)
	);
end s32addsub_subtraction_invertors;

architecture rtl of s32addsub_subtraction_invertors is
	
begin
	
	output(0) <= input(0) xor ctrl_line;
	output(1) <= input(1) xor ctrl_line;
	output(2) <= input(2) xor ctrl_line;
	output(3) <= input(3) xor ctrl_line;
	output(4) <= input(4) xor ctrl_line;
	output(5) <= input(5) xor ctrl_line;
	output(6) <= input(6) xor ctrl_line;
	output(7) <= input(7) xor ctrl_line;
	output(8) <= input(8) xor ctrl_line;
	output(9) <= input(9) xor ctrl_line;
	output(10) <= input(10) xor ctrl_line;
	output(11) <= input(11) xor ctrl_line;
	output(12) <= input(12) xor ctrl_line;
	output(13) <= input(13) xor ctrl_line;
	output(14) <= input(14) xor ctrl_line;
	output(15) <= input(15) xor ctrl_line;
	output(16) <= input(16) xor ctrl_line;
	output(17) <= input(17) xor ctrl_line;
	output(18) <= input(18) xor ctrl_line;
	output(19) <= input(19) xor ctrl_line;
	output(20) <= input(20) xor ctrl_line;
	output(21) <= input(21) xor ctrl_line;
	output(22) <= input(22) xor ctrl_line;
	output(23) <= input(23) xor ctrl_line;
	output(24) <= input(24) xor ctrl_line;
	output(25) <= input(25) xor ctrl_line;
	output(26) <= input(26) xor ctrl_line;
	output(27) <= input(27) xor ctrl_line;
	output(28) <= input(28) xor ctrl_line;
	output(29) <= input(29) xor ctrl_line;
	output(30) <= input(30) xor ctrl_line;
	output(31) <= input(31) xor ctrl_line;
	
end rtl;