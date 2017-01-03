library ieee;
use ieee.std_logic_1164.all;
use work.all;

entity mips_one_cycle is
	port (program_counter:					out std_logic_vector(9 downto 0);
			ins_cache_output:					out std_logic_vector(31 downto 0);
			data_cache_input:					out std_logic_vector(31 downto 0);
			data_cache_output:				out std_logic_vector(31 downto 0);
			rst:									in std_logic;
			clk1:									in std_logic;
			clk2:									in std_logic;
			clk3:									in std_logic;
			clk4:									in std_logic
	);
end mips_one_cycle;

architecture rtl of mips_one_cycle is
	
	component control_box is
		port (instruction_word:				in std_logic_vector(31 downto 0);
				alu_zero:						in std_logic;
				ctrl_alu_op:					out std_logic_vector(2 downto 0);
				ctrl_reg_dest:					out std_logic;
				ctrl_reg_write:				out std_logic;
				ctrl_alu_source:				out std_logic;
				ctrl_dat_cache_write:		out std_logic;
				ctrl_regblk_data_in_mux:	out std_logic;
				ctrl_pc_source:				out std_logic;
				ctrl_jump:						out std_logic;
				error:							out std_logic
		);
	end component;
	
	component regfile_32_by_32 is
		port (read_reg_1:						in std_logic_vector(4 downto 0);
				read_reg_2:						in std_logic_vector(4 downto 0);
				write_reg:						in std_logic_vector(4 downto 0);
				write_data:						in std_logic_vector(31 downto 0);
				read_data_1:					out std_logic_vector(31 downto 0);
				read_data_2:					out std_logic_vector(31 downto 0);
				reg_write:						in std_logic;
				clk:								in std_logic
		);
	end component;
	
	component mips_32_bit_alu is
		port (input_A:							in std_logic_vector(31 downto 0);
				input_B:							in std_logic_vector(31 downto 0);
				aluop:							in std_logic_vector(2 downto 0);
				output:							out std_logic_vector(31 downto 0);
				zero:								out std_logic;
				unsigned_overflow:			out std_logic;
				signed_overflow:				out std_logic	
		);
	end component;
	
	component ins_cache is
		port (address:							in std_logic_vector (9 downto 0);
				clock:							in std_logic;
				data:								in std_logic_vector (31 downto 0);
				wren:								in std_logic;
				q:									out std_logic_vector (31 downto 0)
		);
	end component;

	component dat_cache is
			port (address:						in std_logic_vector (10 downto 0);	
				clock:							in std_logic;
				data:								in std_logic_vector (31 downto 0);
				wren:								in std_logic;
				q:									out std_logic_vector (31 downto 0)
		);
	end component;
	
	component register_32 is
		port (data_in:							in std_logic_vector(31 downto 0);
				data_out:						out std_logic_vector(31 downto 0);
				load:								in std_logic;
				clk:								in std_logic
		);
	end component;
	
	component s32addsub_full_adder is
		port (input_A:							in std_logic_vector(31 downto 0);
				input_B:							in std_logic_vector(31 downto 0);
				carry_in:						in std_logic;
				output:							out std_logic_vector(31 downto 0);
				carry_out:						out std_logic
		);
	end component;
	
	component mux_2_to_1_by_32 is
		port (data_in_0:						in std_logic_vector(31 downto 0);
				data_in_1:						in std_logic_vector(31 downto 0);
				selection:						in std_logic;
				output:							out std_logic_vector(31 downto 0)
		);
	end component;
	
	component mux_2_to_1_by_5 is
		port (data_in_0:						in std_logic_vector(4 downto 0);
				data_in_1:						in std_logic_vector(4 downto 0);
				selection:						in std_logic;
				output:							out std_logic_vector(4 downto 0)
		);
	end component;
	
	component sign_extender_16_to_32 is
		port (data_in:							in std_logic_vector(15 downto 0);
				data_out:						out std_logic_vector(31 downto 0)
		);
	end component;
	
	signal pc_reg_out:						std_logic_vector(31 downto 0);
	signal pc_adder_out:						std_logic_vector(31 downto 0);
	signal pc_adder_const:					std_logic_vector(31 downto 0);
	signal pc_rst_mux_out:					std_logic_vector(31 downto 0);
	signal pc_adder_overflow:				std_logic;
		
	signal ins_cache_addr_in:				std_logic_vector(9 downto 0);
	signal ins_cache_out:					std_logic_vector(31 downto 0);
	
	signal regblk_read_reg_1:				std_logic_vector(4 downto 0);
	signal regblk_read_reg_2:				std_logic_vector(4 downto 0);
	signal regblk_write_reg:				std_logic_vector(4 downto 0);
	signal regblk_read_dat_1:				std_logic_vector(31 downto 0);
	signal regblk_read_dat_2:				std_logic_vector(31 downto 0);
	signal regblk_write_dat:				std_logic_vector(31 downto 0);
	signal write_reg_mux_output:			std_logic_vector(4 downto 0);
	
	signal alu_source_mux_output:			std_logic_vector(31 downto 0);
	signal alu_zero:							std_logic;
	signal alu_result:						std_logic_vector(31 downto 0);
	signal alu_u_of:							std_logic;
	signal alu_of:								std_logic;
	
	signal dat_cache_addr_in:				std_logic_vector(10 downto 0);
	signal dat_cache_out:					std_logic_vector(31 downto 0);
	
	signal breq_adder_out:					std_logic_vector(31 downto 0);
	signal breq_mux_out:						std_logic_vector(31 downto 0);
	signal breq_adder_overflow:			std_logic;
	
	signal jump_bus:							std_logic_vector(31 downto 0);
	signal jump_mux_out:						std_logic_vector(31 downto 0);
	
	signal i_type_const:						std_logic_vector(15 downto 0);
	signal i_type_const_ext:				std_logic_vector(31 downto 0);
	
	signal ctrl_alu_op:						std_logic_vector(2 downto 0);
	signal ctrl_reg_dest:					std_logic;
	signal ctrl_reg_write:					std_logic;
	signal ctrl_alu_source:					std_logic;
	signal ctrl_dat_cache_write:			std_logic;
	signal ctrl_regblk_data_in_mux: 		std_logic;
	signal ctrl_pc_source:					std_logic;
	signal ctrl_jump:							std_logic;
	
	signal flag_error:						std_logic;
	
	signal high_bit:							std_logic;
	signal low_bit:							std_logic;
	signal low_bus:							std_logic_vector(31 downto 0);
	signal high_bus:							std_logic_vector(31 downto 0);
	
	--signal clk_line:							std_logic;
	
begin
	
	--clk_line <= clk when rst = '0' else '0';
	
	ins_cache_output <= ins_cache_out;
	program_counter <= ins_cache_addr_in;
	data_cache_input <= regblk_read_dat_2;
	data_cache_output <= dat_cache_out;
	
	high_bit <= '1';
	low_bit <= '0';
	low_bus <= "00000000000000000000000000000000";
	high_bus <= "11111111111111111111111111111111";
	
	pc_adder_const <= "00000000000000000000000000000001";
	
	ins_cache_addr_in(9 downto 0) <= pc_reg_out(9 downto 0);
	dat_cache_addr_in(10 downto 0) <= alu_result(10 downto 0);
	
	regblk_read_reg_1(4 downto 0) <= ins_cache_out(25 downto 21);
	regblk_read_reg_2(4 downto 0) <= ins_cache_out(20 downto 16);
	regblk_write_reg(4 downto 0) <= ins_cache_out(15 downto 11);
	i_type_const <= ins_cache_out(15 downto 0);
	jump_bus(25 downto 0) <= ins_cache_out(25 downto 0);
	jump_bus(31 downto 26) <= "000000";
	
	pc_rst_mux:							mux_2_to_1_by_32 		port map (  data_in_0 => jump_mux_out,
																						data_in_1 => low_bus,
																						selection => rst,
																						output => pc_rst_mux_out
											);
	
	pc_adder:							s32addsub_full_adder port map ( 	input_A => pc_adder_const,
																						input_B => pc_reg_out,
																						carry_in => low_bit,
																						output => pc_adder_out,
																						carry_out => pc_adder_overflow
											);
	
	pc_register:						register_32				port map (  data_in => pc_rst_mux_out,
																					   data_out => pc_reg_out,
																						load => high_bit,
																						clk => clk1
											);
	
	instruction_cache:				ins_cache				port map (  address => ins_cache_addr_in,
																					   clock => clk2,
																						data => low_bus,
																						wren => low_bit,
																						q => ins_cache_out
											);
	
	reg_blk:								regfile_32_by_32 		port map (  read_reg_1 => regblk_read_reg_1,
																						read_reg_2 => regblk_read_reg_2,
																						write_reg => write_reg_mux_output,
																						write_data => regblk_write_dat,
																						read_data_1 => regblk_read_dat_1,
																						read_data_2 => regblk_read_dat_2,
																						reg_write => ctrl_reg_write,
																						clk => clk4
											);
	
	alu:									mips_32_bit_alu 		port map (  input_A => regblk_read_dat_1,
																						input_B => alu_source_mux_output,
																						aluop => ctrl_alu_op,
																						output => alu_result,
																						zero => alu_zero,
																						unsigned_overflow => alu_u_of,
																						signed_overflow => alu_of
											);
	
	write_reg_mux:						mux_2_to_1_by_5 		port map (  data_in_0 => regblk_read_reg_2,
																						data_in_1 => regblk_write_reg,
																						selection => ctrl_reg_dest,
																						output => write_reg_mux_output
											);
	
	alu_source_sign_ext:				sign_extender_16_to_32 port map (data_in => i_type_const,
																						data_out => i_type_const_ext
											);
	
	alu_source_mux:					mux_2_to_1_by_32 		port map (  data_in_0 => regblk_read_dat_2,
																						data_in_1 => i_type_const_ext,
																						selection => ctrl_alu_source,
																						output => alu_source_mux_output
											);
	
	data_cache:							dat_cache				port map (  address => dat_cache_addr_in,
																					   clock => clk3,
																						data => regblk_read_dat_2,
																						wren => ctrl_dat_cache_write,
																						q => dat_cache_out
											);
	
	regblk_data_in_mux:				mux_2_to_1_by_32 		port map (  data_in_0 => alu_result,
																						data_in_1 => dat_cache_out,
																						selection => ctrl_regblk_data_in_mux,
																						output => regblk_write_dat
											);
	
	controller:							control_box				port map (  instruction_word => ins_cache_out,
																						alu_zero => alu_zero,
																						ctrl_alu_op => ctrl_alu_op,
																						ctrl_reg_dest => ctrl_reg_dest,
																						ctrl_reg_write => ctrl_reg_write,
																						ctrl_alu_source => ctrl_alu_source,
																						ctrl_dat_cache_write => ctrl_dat_cache_write,
																						ctrl_regblk_data_in_mux => ctrl_regblk_data_in_mux,
																						ctrl_pc_source => ctrl_pc_source,
																						ctrl_jump => ctrl_jump,
																						error => flag_error
											);
	
	breq_mux:							mux_2_to_1_by_32 		port map (  data_in_0 => pc_adder_out,
																						data_in_1 => breq_adder_out,
																						selection => ctrl_pc_source,
																						output => breq_mux_out
											);
	
	breq_adder:							s32addsub_full_adder port map ( 	input_A => pc_adder_out,
																						input_B => i_type_const_ext,
																						carry_in => low_bit,
																						output => breq_adder_out,
																						carry_out => breq_adder_overflow
											);
	
	jump_mux:							mux_2_to_1_by_32 		port map (  data_in_0 => breq_mux_out,
																						data_in_1 => jump_bus,
																						selection => ctrl_jump,
																						output => jump_mux_out
											);
	
end rtl;