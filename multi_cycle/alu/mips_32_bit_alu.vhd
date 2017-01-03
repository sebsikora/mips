library ieee;
use ieee.std_logic_1164.all;
use work.all;

entity mips_32_bit_alu is
	port (input_A:					in std_logic_vector(31 downto 0);
			input_B:					in std_logic_vector(31 downto 0);
			aluop:					in std_logic_vector(2 downto 0);
			output:					out std_logic_vector(31 downto 0);
			zero:						out std_logic;
			unsigned_overflow:	out std_logic;
			signed_overflow:		out std_logic
	);
end mips_32_bit_alu;

architecture rtl of mips_32_bit_alu is
	
	component signed_32bit_add_subtract is
		port (input_A:					in std_logic_vector(31 downto 0);
				input_B:					in std_logic_vector(31 downto 0);
				ctrl_line:				in std_logic;
				output:					out std_logic_vector(31 downto 0);
				unsigned_overflow:	out std_logic;
				signed_overflow:		out std_logic
		);
	end component;
	
	component set_on_less_than is
		port (input_A:					in std_logic_vector(31 downto 0);
				input_B:					in std_logic_vector(31 downto 0);
				output:					out std_logic_vector(31 downto 0)
		);
	end component;
	
	component and_block is
		port (input_A:					in std_logic_vector(31 downto 0);
				input_B:					in std_logic_vector(31 downto 0);
				output:					out std_logic_vector(31 downto 0)
		);
	end component;
	
	component or_block is
		port (input_A:					in std_logic_vector(31 downto 0);
				input_B:					in std_logic_vector(31 downto 0);
				output:					out std_logic_vector(31 downto 0)
		);
	end component;
	
	component func_mux is
		port (input_A:					in std_logic_vector(31 downto 0);
				input_B:					in std_logic_vector(31 downto 0);
				input_C:					in std_logic_vector(31 downto 0);
				input_D:					in std_logic_vector(31 downto 0);
				output:					out std_logic_vector(31 downto 0);
				aluop:					in std_logic_vector(2 downto 0)
		);
	end component;
	
	signal sub_notAdd:				std_logic;
	
	signal input_bus_A:				std_logic_vector(31 downto 0);
	signal input_bus_B:				std_logic_vector(31 downto 0);
	
	signal output_bus_A:				std_logic_vector(31 downto 0);
	signal output_bus_B:				std_logic_vector(31 downto 0);
	signal output_bus_C:				std_logic_vector(31 downto 0);
	signal output_bus_D:				std_logic_vector(31 downto 0);
	
	signal output_bus:				std_logic_vector(31 downto 0);
	
begin
	
	sub_notAdd <= aluop(2);
	
	zero <= '1' when output_bus = "00000000000000000000000000000000" else '0';
	output <= output_bus;
	
	input_bus_A <= input_A;
	input_bus_B <= input_B;
	
	addsub_unit:	signed_32bit_add_subtract port map (input_A => input_bus_A,
																		input_B => input_bus_B,
																		ctrl_line => sub_notAdd,
																		output => output_bus_C,
																		unsigned_overflow => unsigned_overflow,
																		signed_overflow => signed_overflow
														  );
	
	slt_unit:		set_on_less_than 			  port map (input_A => input_bus_A,
																		input_B => input_bus_B,
																		output => output_bus_D
														  );
	
	and_unit:		and_block					  port map (input_A => input_bus_A,
																		input_B => input_bus_B,
																		output => output_bus_A
														  );
	
	or_unit:			or_block						  port map (input_A => input_bus_A,
																		input_B => input_bus_B,
																		output => output_bus_B
														  );
	
	func_mux_unit:	func_mux 					  port map (input_A => output_bus_A,
																		input_B => output_bus_B,
																		input_C => output_bus_C,
																		input_D => output_bus_D,
																		aluop => aluop,
																		output => output_bus
														  );
	
end rtl;
