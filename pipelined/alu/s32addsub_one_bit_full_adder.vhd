
-- One bit full adder.

library ieee;
use ieee.std_logic_1164.all;

entity s32addsub_onebit_full_adder is
	port( inputX:		in std_logic;
			inputY:		in std_logic;
			carry_in:	in std_logic;
			carry_out:	out std_logic;
			bit_out:		out std_logic
	);
end s32addsub_onebit_full_adder;

architecture struct of s32addsub_onebit_full_adder is
	
	component OR_gate is
		port( inputA:		in std_logic;
				inputB:		in std_logic;
				output:		out std_logic
		);
	end component;
	
	component XOR_gate is
		port( inputA:		in std_logic;
				inputB:		in std_logic;
				output:		out std_logic
		);
	end component;
	
	component AND_gate is
		port( inputA:		in std_logic;
				inputB:		in std_logic;
				output:		out std_logic
		);
	end component;
	
	signal xor_1_output_wire:	std_logic;
	signal and_1_output_wire:	std_logic;
	signal and_2_output_wire:	std_logic;
	
begin
	
	xor_1:	XOR_gate port map (inputA => inputX, inputB => inputY, output => xor_1_output_wire);
	xor_2:	XOR_gate port map (inputA => xor_1_output_wire, inputB => carry_in, output => bit_out);
	and_1:	AND_gate port map (inputA => inputX, inputB => inputY, output => and_1_output_wire);
	and_2:	AND_gate port map (inputA => xor_1_output_wire, inputB => carry_in, output => and_2_output_wire);
	or_1:		OR_gate port map (inputA => and_2_output_wire, inputB => and_1_output_wire, output => carry_out);
	
end struct;
