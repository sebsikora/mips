
-- XOR gate.
library ieee;
use ieee.std_logic_1164.all;

entity XOR_gate is
	port( inputA:		in std_logic;
			inputB:		in std_logic;
			output:		out std_logic
	);
end XOR_gate;

architecture rtl of XOR_gate is
begin
	process(inputA, inputB)
	begin
		output <= inputA xor inputB;
	end process;
end rtl;

-- OR gate

library ieee;
use ieee.std_logic_1164.all;

entity OR_gate is
	port( inputA: 	in std_logic;
			inputB: 	in std_logic;
			output:	out std_logic
	);
end OR_gate;

architecture rtl of OR_gate is
begin
	output <= (inputA or inputB);
end rtl;

-- 3 input OR gate

library ieee;
use ieee.std_logic_1164.all;

entity OR_3_gate is
	port( inputA: 	in std_logic;
			inputB: 	in std_logic;
			inputC: 	in std_logic;
			output:	out std_logic
	);
end OR_3_gate;

architecture rtl of OR_3_gate is
begin
	output <= (inputA or inputB or inputC);
end rtl;

-- 4 input OR gate

library ieee;
use ieee.std_logic_1164.all;

entity OR_4_gate is
	port( inputA: 	in std_logic;
			inputB: 	in std_logic;
			inputC: 	in std_logic;
			inputD: 	in std_logic;
			output:	out std_logic
	);
end OR_4_gate;

architecture rtl of OR_4_gate is
begin
	output <= (inputA or inputB or inputC or inputD);
end rtl;

-- NOT gate

library ieee;
use ieee.std_logic_1164.all;

entity NOT_gate is
	port( input: 	in std_logic;
			output:	out std_logic
	);
end NOT_gate;

architecture rtl of NOT_gate is
begin
	output <= not input;
end rtl;


-- 2 input AND gate

library ieee;
use ieee.std_logic_1164.all;

entity AND_gate is
	port( inputA: 	in std_logic;
			inputB:	in std_logic;
			output:	out std_logic
	);
end AND_gate;

architecture rtl of AND_gate is
begin
	output <= (inputA and inputB);
end rtl;


-- 3 input AND gate

library ieee;
use ieee.std_logic_1164.all;

entity AND_3_gate is
	port( inputA: 	in std_logic;
			inputB:	in std_logic;
			inputC:	in std_logic;
			output:	out std_logic
	);
end AND_3_gate;

architecture rtl of AND_3_gate is
begin
	output <= (inputA and inputB and inputC);
end rtl;

-- 4 input AND gate

library ieee;
use ieee.std_logic_1164.all;

entity AND_4_gate is
	port( inputA: 	in std_logic;
			inputB:	in std_logic;
			inputC:	in std_logic;
			inputD:	in std_logic;
			output:	out std_logic
	);
end AND_4_gate;

architecture rtl of AND_4_gate is
begin
	output <= (inputA and inputB and inputC and inputD);
end rtl;

-- 5 input AND gate

library ieee;
use ieee.std_logic_1164.all;

entity AND_5_gate is
	port( inputA: 	in std_logic;
			inputB:	in std_logic;
			inputC:	in std_logic;
			inputD:	in std_logic;
			inputE:	in std_logic;
			output:	out std_logic
	);
end AND_5_gate;

architecture rtl of AND_5_gate is
begin
	output <= (inputA and inputB and inputC and inputD and inputE);
end rtl;

-- 3 input NAND gate

library ieee;
use ieee.std_logic_1164.all;

entity NAND_3_gate is
	port( inputA: 	in std_logic;
			inputB:	in std_logic;
			inputC:	in std_logic;
			output:	out std_logic
	);
end NAND_3_gate;

architecture rtl of NAND_3_gate is
begin
	output <= not (inputA and inputB and inputC);
end rtl;


-- NAND gate

library ieee;
use ieee.std_logic_1164.all;

entity NAND_gate is
	port( inputA: 	in std_logic;
			inputB:	in std_logic;
			output:	out std_logic
	);
end NAND_gate;

architecture rtl of NAND_gate is
begin
	output <= not (inputA and inputB);
end rtl;


-- NOR gate

library ieee;
use ieee.std_logic_1164.all;

entity NOR_gate is
	port( inputA: 	in std_logic;
			inputB:	in std_logic;
			output:	out std_logic
	);
end NOR_gate;

architecture rtl of NOR_gate is
begin
	output <= not (inputA or inputB);
end rtl;


-- 3 input NOR gate

library ieee;
use ieee.std_logic_1164.all;

entity NOR_3_gate is
	port( inputA: 	in std_logic;
			inputB:	in std_logic;
			inputC:	in std_logic;
			output:	out std_logic
	);
end NOR_3_gate;

architecture rtl of NOR_3_gate is
begin
	output <= not (inputA or inputB or inputC);
end rtl;

