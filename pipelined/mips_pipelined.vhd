library ieee;
use ieee.std_logic_1164.all;
use work.all;

entity mips_pipelined is
	port (prog_count_output:				out std_logic_vector(9 downto 0);
			ins_cache_output:					out std_logic_vector(31 downto 0);
			data_cache_input:					out std_logic_vector(31 downto 0);
			data_cache_output:				out std_logic_vector(31 downto 0);
			rst:									in std_logic;
			clk:									in std_logic;
			error:								out std_logic
	);
end mips_pipelined;

architecture rtl of mips_pipelined is
	
	---------------------- Component declarations for IF ----------------------
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
	
	component ins_cache is
		port (address:							in std_logic_vector (9 downto 0);
				clock:							in std_logic;
				stall:							in std_logic;
				data:								in std_logic_vector (31 downto 0);
				wren:								in std_logic;
				q:									out std_logic_vector (31 downto 0)
		);
	end component;
	
	component register_IF_ID_buffer is
		port (program_counter_in:			in std_logic_vector(31 downto 0);
				program_counter_out:			out std_logic_vector(31 downto 0);
				instruction_word_in:			in std_logic_vector(31 downto 0);
				instruction_word_out:		out std_logic_vector(31 downto 0);
				traverse_bit_in:				in std_logic;
				traverse_bit_clr:				in std_logic;
				traverse_bit_out:				out std_logic;
				stall:							in std_logic;
				bubble:							in std_logic;
				clk:								in std_logic
		);
	end component;
	
	---------------------- Component declarations for ID stage ----------------------
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
	
	component sign_extender_16_to_32 is
		port (data_in:							in std_logic_vector(15 downto 0);
				data_out:						out std_logic_vector(31 downto 0)
		);
	end component;
	
	component control_ID_EX_buffer is
		port (alu_reg_dest_in:				in std_logic;
				alu_src_in:						in std_logic;
				alu_op_in:						in std_logic_vector(2 downto 0);
				mem_jump_in:					in std_logic;
				mem_branch_in:					in std_logic;
				mem_read_in:					in std_logic;
				mem_write_in:					in std_logic;
				wb_mem_to_reg_in:				in std_logic;
				wb_reg_write_in:				in std_logic;
				alu_reg_dest_out:				out std_logic;
				alu_src_out:					out std_logic;
				alu_op_out:						out std_logic_vector(2 downto 0);
				mem_jump_out:					out std_logic;
				mem_branch_out:				out std_logic;
				mem_read_out:					out std_logic;
				mem_write_out:					out std_logic;
				wb_mem_to_reg_out:			out std_logic;
				wb_reg_write_out:				out std_logic;
				stall:							in std_logic;
				clk:								in std_logic;
				bubble:							in std_logic
		);
	end component;
	
	component register_ID_EX_buffer is
		port (program_counter_in:			in std_logic_vector(31 downto 0);
				reg_read_data_1_in:			in std_logic_vector(31 downto 0);
				reg_read_data_2_in:			in std_logic_vector(31 downto 0);
				sign_ext_addr_oset_in:		in std_logic_vector(31 downto 0);
				reg_write_dest_1_in:			in std_logic_vector(4 downto 0);
				reg_write_dest_2_in:			in std_logic_vector(4 downto 0);
				ni_reg_read_addr_1:			in std_logic_vector(4 downto 0);
				ni_reg_read_addr_2:			in std_logic_vector(4 downto 0);
				traverse_bit_in:				in std_logic;
				traverse_bit_clr:				in std_logic;
				traverse_bit_out:				out std_logic;
				program_counter_out:			out std_logic_vector(31 downto 0);
				reg_read_data_1_out:			out std_logic_vector(31 downto 0);
				reg_read_data_2_out:			out std_logic_vector(31 downto 0);
				sign_ext_addr_oset_out:		out std_logic_vector(31 downto 0);
				reg_write_dest_1_out:		out std_logic_vector(4 downto 0);
				reg_write_dest_2_out:		out std_logic_vector(4 downto 0);
				reg_haz_ind:					out std_logic_vector(1 downto 0);
				stall:							in std_logic;
				bubble:							in std_logic;
				clk:								in std_logic
		);
	end component;
	
	component pipelined_control_box is
		port (instruction_word:				in std_logic_vector(31 downto 0);
				flag_zero:						in std_logic;
				ID_EX_flag_reg_haz:			in std_logic_vector(1 downto 0);
				EX_MEM_flag_reg_haz:			in std_logic_vector(1 downto 0);
				MEM_WB_flag_reg_haz:			in std_logic_vector(1 downto 0);
				wb_arrive:						in std_logic;
				mem_arrive:						in std_logic;
				ex_arrive:						in std_logic;
				rst:								in std_logic;
				ni_read_reg_1:					out std_logic_vector(4 downto 0);
				ni_read_reg_2:					out std_logic_vector(4 downto 0);
				alu_reg_dest:					out std_logic;
				alu_src:							out std_logic;
				alu_op:							out std_logic_vector(2 downto 0);
				mem_jump:						out std_logic;
				mem_branch:						out std_logic;
				mem_read:						out std_logic;
				mem_write:						out std_logic;
				wb_regwrite:					out std_logic;
				wb_memtoreg:					out std_logic;
				pc_stall:						out std_logic;
				ins_cache_stall:				out std_logic;
				IF_ID_bubble:					out std_logic;
				IF_ID_stall:					out std_logic;
				ID_EX_bubble:					out std_logic;
				ID_EX_stall:					out std_logic;
				IF_ID_trav_in:					out std_logic;
				ID_EX_trav_in:					out std_logic;
				EX_MEM_trav_in:				out std_logic;
				reg_write_trav:				out std_logic;
				branch_trav:					out std_logic;
				jump_trav:						out std_logic;
				flag_error:						out std_logic
		);
	end component;
	
	---------------------- Component declarations for EX stage ----------------------
	component mux_2_to_1_by_5 is
		port (data_in_0:						in std_logic_vector(4 downto 0);
				data_in_1:						in std_logic_vector(4 downto 0);
				selection:						in std_logic;
				output:							out std_logic_vector(4 downto 0)
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
	
	component control_EX_MEM_buffer is
		port (mem_jump_in:					in std_logic;
				mem_branch_in:					in std_logic;
				mem_read_in:					in std_logic;
				mem_write_in:					in std_logic;
				wb_mem_to_reg_in:				in std_logic;
				wb_reg_write_in:				in std_logic;
				mem_jump_out:					out std_logic;
				mem_branch_out:				out std_logic;
				mem_read_out:					out std_logic;
				mem_write_out:					out std_logic;
				wb_mem_to_reg_out:			out std_logic;
				wb_reg_write_out:				out std_logic;
				clk:								in std_logic
		);
	end component;
	
	component register_EX_MEM_buffer is
		port (alu_result_in:					in std_logic_vector(31 downto 0);
				alu_zero_in:					in std_logic;
				reg_write_dest_in:			in std_logic_vector(4 downto 0);
				reg_read_data_2_in:			in std_logic_vector(31 downto 0);
				branch_addr_in:				in std_logic_vector(31 downto 0);
				ni_reg_read_addr_1:			in std_logic_vector(4 downto 0);
				ni_reg_read_addr_2:			in std_logic_vector(4 downto 0);
				traverse_bit_in:				in std_logic;
				traverse_bit_clr:				in std_logic;
				traverse_bit_out:				out std_logic;
				alu_result_out:				out std_logic_vector(31 downto 0);
				alu_zero_out:					out std_logic;
				reg_write_dest_out:			out std_logic_vector(4 downto 0);
				reg_read_data_2_out:			out std_logic_vector(31 downto 0);
				branch_addr_out:				out std_logic_vector(31 downto 0);
				reg_haz_ind:					out std_logic_vector(1 downto 0);
				clk:								in std_logic
		);
	end component;
	
	---------------------- Component declarations for MEM stage ----------------------
	component dat_cache is
		port (address:							in std_logic_vector (10 downto 0);	
				clock:							in std_logic;
				data:								in std_logic_vector (31 downto 0);
				wren:								in std_logic;
				q:									out std_logic_vector (31 downto 0)
		);
	end component;
	
	component control_MEM_WB_buffer is
		port (wb_mem_to_reg_in:				in std_logic;
				wb_reg_write_in:				in std_logic;
				wb_mem_to_reg_out:			out std_logic;
				wb_reg_write_out:				out std_logic;
				clk:								in std_logic
		);
	end component;
	
	component register_MEM_WB_buffer is
		port (alu_result_in:					in std_logic_vector(31 downto 0);
				reg_write_dest_in:			in std_logic_vector(4 downto 0);
				mem_data_in:					in std_logic_vector(31 downto 0);
				ni_reg_read_addr_1:			in std_logic_vector(4 downto 0);
				ni_reg_read_addr_2:			in std_logic_vector(4 downto 0);
				traverse_bit_in:				in std_logic;
				traverse_bit_clr:				in std_logic;
				traverse_bit_out:				out std_logic;
				alu_result_out:				out std_logic_vector(31 downto 0);
				reg_write_dest_out:			out std_logic_vector(4 downto 0);
				mem_data_out:					out std_logic_vector(31 downto 0);
				reg_haz_ind:					out std_logic_vector(1 downto 0);
				clk:								in std_logic
		);
	end component;
	
	---------------------------------------------------------------------------------
	signal jump_address:						std_logic_vector(31 downto 0);
	signal branch_address:					std_logic_vector(31 downto 0);
	signal wb_write_reg:						std_logic_vector(4 downto 0);
	signal wb_write_data:					std_logic_vector(31 downto 0);
	signal ni_read_reg_1:					std_logic_vector(4 downto 0);
	signal ni_read_reg_2:					std_logic_vector(4 downto 0);
	
	signal ctrl_reg_write_trav:			std_logic;
	signal ctrl_branch_trav:				std_logic;
	signal ctrl_jump_trav:					std_logic;
	
	signal clk_line:							std_logic;
	signal ctrl_trav_bit_clr:				std_logic;
	
	signal high_bit:							std_logic;
	signal low_bit:							std_logic;
	signal low_bus:							std_logic_vector(31 downto 0);
	
	---------------------- Signal declarations for IF stage ----------------------
	signal ctrl_IF_pc_stall:				std_logic;
	signal ctrl_IF_ins_cache_stall:		std_logic;
	signal ctrl_IF_pc_not_stall:			std_logic;
	signal ctrl_IF_ID_stall:				std_logic;
	signal ctrl_IF_ID_bubble:				std_logic;
	signal ctrl_IF_ID_trav_bit_in:		std_logic;
	
	signal IF_branch_addr_mplex_out:		std_logic_vector(31 downto 0);
	signal IF_jump_addr_mplex_out:		std_logic_vector(31 downto 0);
	
	signal IF_pc_rst_mux_out:				std_logic_vector(31 downto 0);	
	signal IF_program_counter_out:		std_logic_vector(31 downto 0);
	
	signal IF_prog_count_incr_in:			std_logic_vector(31 downto 0);
	signal IF_prog_count_incr_out:		std_logic_vector(31 downto 0);
	signal IF_prog_count_carry_out:		std_logic;
	
	signal IF_ins_cache_addr:				std_logic_vector(9 downto 0);	
	signal IF_ins_cache_out:				std_logic_vector(31 downto 0);
	
	signal IF_ID_prog_count_in:			std_logic_vector(31 downto 0);
	
	---------------------- Signal declarations for ID stage ----------------------
	signal IF_ID_trav_bit_out:				std_logic;
	
	signal IF_ID_prog_count_out:			std_logic_vector(31 downto 0);
	signal IF_ID_ins_word:					std_logic_vector(31 downto 0);
	
	signal ctrl_box_id_jump:				std_logic;
	signal ctrl_box_alu_src:				std_logic;
	signal ctrl_box_alu_reg_dest:			std_logic;
	signal ctrl_box_alu_op:					std_logic_vector(2 downto 0);
	signal ctrl_box_mem_write:				std_logic;
	signal ctrl_box_mem_branch:			std_logic;
	signal ctrl_box_mem_jump:				std_logic;
	signal ctrl_box_mem_read:				std_logic;
	signal ctrl_box_wb_reg_or_mem:		std_logic;
	signal ctrl_box_wb_reg_write:			std_logic;
	
	signal ctrl_ID_jump:						std_logic;
	signal ctrl_ID_EX_trav_bit_in:		std_logic;
	signal ctrl_ID_EX_stall:				std_logic;
	signal ctrl_ID_EX_bubble:				std_logic;
	
	signal ID_reg_blk_read_reg_1:			std_logic_vector(4 downto 0);
	signal ID_reg_blk_read_reg_2:			std_logic_vector(4 downto 0);
	signal ID_reg_blk_write_reg_1:		std_logic_vector(4 downto 0);
	signal ID_reg_blk_write_reg_2:		std_logic_vector(4 downto 0);
	signal ID_reg_blk_read_data_1:		std_logic_vector(31 downto 0);
	signal ID_reg_blk_read_data_2:		std_logic_vector(31 downto 0);
		
	signal ID_branch_addr_offset_16:		std_logic_vector(15 downto 0);
	signal ID_branch_addr_offset_32:		std_logic_vector(31 downto 0);
	
	signal ID_EX_trav_bit_in:				std_logic;
	signal ID_EX_reg_haz_out:				std_logic_vector(1 downto 0);
	
	---------------------- Signal declarations for EX stage ----------------------
	signal ID_EX_trav_bit_out:				std_logic;
	signal ID_EX_trav_arrive:				std_logic;
	
	signal ID_EX_prog_count_out:			std_logic_vector(31 downto 0);
	signal ID_EX_reg_read_data_1_out:	std_logic_vector(31 downto 0);
	signal ID_EX_reg_read_data_2_out:	std_logic_vector(31 downto 0);
	signal ID_EX_branch_addr_out:			std_logic_vector(31 downto 0);
	signal ID_EX_write_reg_1_out:			std_logic_vector(4 downto 0);
	signal ID_EX_write_reg_2_out:			std_logic_vector(4 downto 0);
		
	signal ctrl_EX_alu_sel:					std_logic;
	signal ctrl_EX_alu_op:					std_logic_vector(2 downto 0);
	signal ctrl_EX_reg_dest:				std_logic;
	signal ctrl_EX_mem_write:				std_logic;
	signal ctrl_EX_mem_branch:				std_logic;
	signal ctrl_EX_mem_jump:				std_logic;
	signal ctrl_EX_wb_mem_or_reg:			std_logic;
	signal ctrl_EX_wb_reg_write:			std_logic;
	signal ctrl_EX_MEM_trav_bit_in:		std_logic;
	
	signal flag_EX_arrive:					std_logic;
	
	signal ctrl_EX_mem_read_sink:			std_logic;
	
	signal EX_branch_addr_overflow:		std_logic;
	signal EX_alu_unsigned_overflow:		std_logic;
	signal EX_alu_signed_overflow:		std_logic;
	
	signal EX_branch_address:				std_logic_vector(31 downto 0);
	signal EX_alu_input: 					std_logic_vector(31 downto 0);
	signal EX_alu_result:					std_logic_vector(31 downto 0);
	signal EX_alu_zero:						std_logic;
	signal EX_write_reg_dest:				std_logic_vector(4 downto 0);
	
	signal EX_MEM_trav_bit_in:				std_logic;
	signal EX_MEM_reg_haz_out:				std_logic_vector(1 downto 0);
	
	---------------------- Signal declarations for MEM stage ----------------------
	signal EX_MEM_trav_arrive:				std_logic;
	signal EX_MEM_trav_bit_out:			std_logic;
	
	signal ctrl_MEM_write:					std_logic;
	signal ctrl_MEM_branch:					std_logic;
	signal ctrl_MEM_jump:					std_logic;
	signal ctrl_MEM_wb_mem_or_reg:		std_logic;
	signal ctrl_MEM_wb_reg_write:			std_logic;
	
	signal flag_MEM_arrive:					std_logic;
	
	signal ctrl_MEM_mem_read_sink:		std_logic;
	
	signal EX_MEM_branch_addr_out:		std_logic_vector(31 downto 0);
	signal EX_MEM_alu_result_out:			std_logic_vector(31 downto 0);
	signal EX_MEM_alu_zero_out:			std_logic;
	signal EX_MEM_reg_read_data_2_out:	std_logic_vector(31 downto 0);
	signal EX_MEM_write_reg_dest_out:	std_logic_vector(4 downto 0);
	
	signal MEM_dat_cache_data_out:		std_logic_vector(31 downto 0);
	signal MEM_dat_cache_addr_in:			std_logic_vector(10 downto 0);
	
	signal MEM_WB_trav_bit_in:				std_logic;
	signal MEM_WB_reg_haz_out:				std_logic_vector(1 downto 0);
	
	---------------------- Signal declarations for WB stage ----------------------
	signal MEM_WB_trav_bit_out:			std_logic;
	
	signal ctrl_WB_mem_or_reg:				std_logic;
	signal ctrl_WB_reg_write:				std_logic;
	
	signal flag_WB_arrive:					std_logic;
	
	signal MEM_WB_alu_result_out:			std_logic_vector(31 downto 0);
	signal MEM_WB_mem_data_out:			std_logic_vector(31 downto 0);
	
begin
	
	high_bit <= '1';
	low_bit <= '0';
	low_bus <= "00000000000000000000000000000000";
	
	clk_line <= clk;
	
	
	---------------------- Component instantiations for IF stage ----------------------
	ctrl_IF_pc_not_stall <= not ctrl_IF_pc_stall;
	IF_prog_count_incr_in <= "00000000000000000000000000000001";
	IF_ins_cache_addr(9 downto 0) <= IF_program_counter_out(9 downto 0);
	
	IF_branch_address_multiplexor:		mux_2_to_1_by_32 			port map (data_in_0 => IF_prog_count_incr_out,
																								 data_in_1 => branch_address,
																								 selection => ctrl_MEM_branch,
																								 output => IF_branch_addr_mplex_out
													);
	
	IF_jump_address_multiplexor:			mux_2_to_1_by_32 			port map (data_in_0 => IF_branch_addr_mplex_out,
																								 data_in_1 => jump_address,
																								 selection => ctrl_MEM_jump,
																								 output => IF_jump_addr_mplex_out
													);
	
	IF_pc_rst_mux:								mux_2_to_1_by_32 			port map (data_in_0 => IF_jump_addr_mplex_out,
																								 data_in_1 => low_bus,
																								 selection => rst,
																								 output => IF_pc_rst_mux_out
													);
	
	IF_program_counter:						register_32 				port map (data_in => IF_pc_rst_mux_out,
																								 data_out => IF_program_counter_out,
																								 load => ctrl_IF_pc_not_stall,
																								 clk => clk_line
													);
	
	IF_program_counter_incrementer:		s32addsub_full_adder		port map (input_A => IF_prog_count_incr_in,
																								 input_B => IF_program_counter_out,
																								 carry_in => low_bit,
																								 output => IF_prog_count_incr_out,
																								 carry_out => IF_prog_count_carry_out
													);
	
	IF_instruction_cache:					ins_cache 					port map (address => IF_ins_cache_addr,
																								 clock => clk_line,
																								 stall => ctrl_IF_ins_cache_stall,
																								 data => low_bus,
																								 wren => low_bit,
																								 q => IF_ins_cache_out
													);
	
	IF_ID_buffer:								register_IF_ID_buffer	port map (program_counter_in => IF_prog_count_incr_out,
																								 program_counter_out => IF_ID_prog_count_out,
																								 instruction_word_in => IF_ins_cache_out,
																								 instruction_word_out => IF_ID_ins_word,
																								 traverse_bit_in => ctrl_IF_ID_trav_bit_in,
																								 traverse_bit_clr => ctrl_trav_bit_clr,
																								 traverse_bit_out => IF_ID_trav_bit_out,
																								 stall => ctrl_IF_ID_stall,
																								 bubble => ctrl_IF_ID_bubble,
																								 clk => clk_line
													);
	
	---------------------- Component instantiations for ID stage ----------------------
	ctrl_trav_bit_clr <= (flag_MEM_arrive and (ctrl_branch_trav or ctrl_jump_trav)) or (flag_WB_arrive and ctrl_reg_write_trav);
	
	ID_reg_blk_read_reg_1(4 downto 0) <= IF_ID_ins_word(25 downto 21);
	ID_reg_blk_read_reg_2(4 downto 0) <= IF_ID_ins_word(20 downto 16);
	ID_branch_addr_offset_16(15 downto 0) <= IF_ID_ins_word(15 downto 0);
	ID_reg_blk_write_reg_1(4 downto 0) <= IF_ID_ins_word(20 downto 16);
	ID_reg_blk_write_reg_2(4 downto 0) <= IF_ID_ins_word(15 downto 11);
	ID_EX_trav_bit_in <= ctrl_ID_EX_trav_bit_in or IF_ID_trav_bit_out;
	
	ID_register_file:							regfile_32_by_32 			port map (read_reg_1 => ID_reg_blk_read_reg_1,
																							  	 read_reg_2 => ID_reg_blk_read_reg_2,
																								 write_reg => wb_write_reg,
																								 write_data => wb_write_data,
																								 read_data_1 => ID_reg_blk_read_data_1,
																								 read_data_2 => ID_reg_blk_read_data_2,
																								 reg_write => ctrl_WB_reg_write,
																								 clk => clk_line
																					);
	
	ID_addr_offset_sign_extender:			sign_extender_16_to_32	port map (data_in => ID_branch_addr_offset_16, data_out => ID_branch_addr_offset_32);
	
	ID_EX_control_buffer:					control_ID_EX_buffer		port map (alu_reg_dest_in => ctrl_box_alu_reg_dest,
																								 alu_src_in => ctrl_box_alu_src,
																								 alu_op_in => ctrl_box_alu_op,
																								 mem_jump_in => ctrl_box_mem_jump,
																								 mem_branch_in => ctrl_box_mem_branch,
																								 mem_read_in => low_bit,
																								 mem_write_in => ctrl_box_mem_write,
																								 wb_mem_to_reg_in => ctrl_box_wb_reg_or_mem,
																								 wb_reg_write_in => ctrl_box_wb_reg_write,
																								 alu_reg_dest_out => ctrl_EX_reg_dest,
																								 alu_src_out => ctrl_EX_alu_sel,
																								 alu_op_out => ctrl_EX_alu_op,
																								 mem_jump_out => ctrl_EX_mem_jump,
																								 mem_branch_out => ctrl_EX_mem_branch,
																								 mem_read_out => ctrl_EX_mem_read_sink,
																								 mem_write_out => ctrl_EX_mem_write,
																								 wb_mem_to_reg_out => ctrl_EX_wb_mem_or_reg,
																								 wb_reg_write_out => ctrl_EX_wb_reg_write,
																								 stall => ctrl_ID_EX_stall,
																								 clk => clk_line,
																								 bubble => ctrl_ID_EX_bubble
													);
	
	ID_EX_buffer:								register_ID_EX_buffer   port map (program_counter_in => IF_ID_prog_count_out,
																								 reg_read_data_1_in => ID_reg_blk_read_data_1,
																								 reg_read_data_2_in => ID_reg_blk_read_data_2,
																								 sign_ext_addr_oset_in => ID_branch_addr_offset_32,
																								 reg_write_dest_1_in => ID_reg_blk_write_reg_1,
																								 reg_write_dest_2_in => ID_reg_blk_write_reg_2,
																								 ni_reg_read_addr_1 => ni_read_reg_1,
																								 ni_reg_read_addr_2 => ni_read_reg_2,
																								 traverse_bit_in => ID_EX_trav_bit_in,
																								 traverse_bit_clr => ctrl_trav_bit_clr,
																								 traverse_bit_out => ID_EX_trav_bit_out,
																								 program_counter_out => ID_EX_prog_count_out,
																								 reg_read_data_1_out => ID_EX_reg_read_data_1_out,
																								 reg_read_data_2_out => ID_EX_reg_read_data_2_out,
																								 sign_ext_addr_oset_out => ID_EX_branch_addr_out,
																								 reg_write_dest_1_out => ID_EX_write_reg_1_out,
																								 reg_write_dest_2_out => ID_EX_write_reg_2_out,
																								 reg_haz_ind => ID_EX_reg_haz_out,
																								 stall => ctrl_ID_EX_stall,
																								 bubble => ctrl_ID_EX_bubble,
																								 clk => clk_line
													);
	
	control_box:								pipelined_control_box	port map (instruction_word => IF_ID_ins_word,
																								 flag_zero => EX_alu_zero,
																								 ID_EX_flag_reg_haz => ID_EX_reg_haz_out,
																								 EX_MEM_flag_reg_haz => EX_MEM_reg_haz_out,
																								 MEM_WB_flag_reg_haz => MEM_WB_reg_haz_out,
																								 wb_arrive => flag_WB_arrive,
																								 mem_arrive => flag_MEM_arrive,
																								 ex_arrive => flag_EX_arrive,
																								 rst => rst,
																								 ni_read_reg_1 => ni_read_reg_1,
																								 ni_read_reg_2 => ni_read_reg_2,
																								 alu_reg_dest => ctrl_box_alu_reg_dest,
																								 alu_src => ctrl_box_alu_src,
																								 alu_op => ctrl_box_alu_op,
																								 mem_jump => ctrl_box_mem_jump,
																								 mem_branch => ctrl_box_mem_branch,
																								 mem_read => ctrl_box_mem_read,
																								 mem_write => ctrl_box_mem_write,
																								 wb_regwrite => ctrl_box_wb_reg_write,
																								 wb_memtoreg => ctrl_box_wb_reg_or_mem,
																								 pc_stall => ctrl_IF_pc_stall,
																								 ins_cache_stall => ctrl_IF_ins_cache_stall,
																								 IF_ID_bubble => ctrl_IF_ID_bubble,
																								 IF_ID_stall => ctrl_IF_ID_stall,
																								 ID_EX_bubble => ctrl_ID_EX_bubble,
																								 ID_EX_stall => ctrl_ID_EX_stall,
																								 IF_ID_trav_in => ctrl_IF_ID_trav_bit_in,
																								 ID_EX_trav_in => ctrl_ID_EX_trav_bit_in,
																								 EX_MEM_trav_in => ctrl_EX_MEM_trav_bit_in,
																								 reg_write_trav => ctrl_reg_write_trav,
																								 branch_trav => ctrl_branch_trav,
																								 jump_trav => ctrl_jump_trav,
																								 flag_error => error
													);
	
	---------------------- Component instantiations for EX stage ----------------------
	flag_EX_arrive <= id_EX_trav_bit_out;
	EX_MEM_trav_bit_in <= ctrl_EX_MEM_trav_bit_in or ID_EX_trav_bit_out;
	
	EX_breq_adder:								s32addsub_full_adder 	port map (input_A => ID_EX_prog_count_out,
																								 input_B => ID_EX_branch_addr_out,
																								 carry_in => low_bit,
																								 output => EX_branch_address,
																								 carry_out => EX_branch_addr_overflow
													);
	
	EX_alu:										mips_32_bit_alu 			port map (input_A => ID_EX_reg_read_data_1_out,
																								 input_B => EX_alu_input,
																								 aluop => ctrl_EX_alu_op,
																								 output => EX_alu_result,
																								 zero => EX_alu_zero,
																								 unsigned_overflow => EX_alu_unsigned_overflow,
																								 signed_overflow => EX_alu_signed_overflow
													);
	
	EX_alu_source_mux:						mux_2_to_1_by_32 			port map (data_in_0 => ID_EX_reg_read_data_2_out,
																								 data_in_1 => ID_EX_branch_addr_out,
																								 selection => ctrl_EX_alu_sel,
																								 output => EX_alu_input
													);
	
	EX_write_reg_mux:							mux_2_to_1_by_5 			port map (data_in_0 => ID_EX_write_reg_1_out,
																								 data_in_1 => ID_EX_write_reg_2_out,
																								 selection => ctrl_EX_reg_dest,
																								 output => EX_write_reg_dest
													);
	
	EX_MEM_control_buffer:					control_EX_MEM_buffer	port map (mem_jump_in => ctrl_EX_mem_jump,
																								 mem_branch_in => ctrl_EX_mem_branch,
																								 mem_read_in => low_bit,
																								 mem_write_in => ctrl_EX_mem_write,
																								 wb_mem_to_reg_in => ctrl_EX_wb_mem_or_reg,
																								 wb_reg_write_in => ctrl_EX_wb_reg_write,
																								 mem_jump_out => ctrl_MEM_jump,
																								 mem_branch_out => ctrl_MEM_branch,
																								 mem_read_out => ctrl_MEM_mem_read_sink,
																								 mem_write_out => ctrl_MEM_write,
																								 wb_mem_to_reg_out => ctrl_MEM_wb_mem_or_reg,
																								 wb_reg_write_out => ctrl_MEM_wb_reg_write,
																								 clk => clk_line
													);
	
	EX_MEM_buffer:								register_EX_MEM_buffer  port map (alu_result_in => EX_alu_result,
																								 alu_zero_in => EX_alu_zero,
																								 reg_read_data_2_in => ID_EX_reg_read_data_2_out,
																								 reg_write_dest_in => EX_write_reg_dest,
																								 branch_addr_in => EX_branch_address,
																								 ni_reg_read_addr_1 => ni_read_reg_1,
																								 ni_reg_read_addr_2 => ni_read_reg_2,
																								 traverse_bit_in => EX_MEM_trav_bit_in,
																								 traverse_bit_clr => ctrl_trav_bit_clr,
																								 traverse_bit_out => EX_MEM_trav_bit_out,
																								 alu_result_out => EX_MEM_alu_result_out,
																								 alu_zero_out => EX_MEM_alu_zero_out,
																								 reg_read_data_2_out => EX_MEM_reg_read_data_2_out,
																								 reg_write_dest_out => EX_MEM_write_reg_dest_out,
																								 branch_addr_out => branch_address,
																								 reg_haz_ind => EX_MEM_reg_haz_out,
																								 clk => clk_line
													);
	
	---------------------- Component instantiations for MEM stage ----------------------
	flag_MEM_arrive <= EX_MEM_trav_bit_out;
	MEM_WB_trav_bit_in <= EX_MEM_trav_bit_out;
	MEM_dat_cache_addr_in(10 downto 0) <= EX_MEM_alu_result_out(10 downto 0);
	
	MEM_data_cache:							dat_cache					port map (address => MEM_dat_cache_addr_in,
																								 clock => clk_line,
																								 data => EX_MEM_reg_read_data_2_out,
																								 wren => ctrl_MEM_write,
																								 q => MEM_dat_cache_data_out
													);
	
	MEM_WB_control_buffer:					control_MEM_WB_buffer	port map (wb_mem_to_reg_in => ctrl_MEM_wb_mem_or_reg,
																								 wb_reg_write_in => ctrl_MEM_wb_reg_write,
																								 wb_mem_to_reg_out => ctrl_WB_mem_or_reg,
																								 wb_reg_write_out => ctrl_WB_reg_write,
																								 clk => clk_line
													);
	
	MEM_WB_buffer:								register_MEM_WB_buffer  port map (alu_result_in => EX_MEM_alu_result_out,
																								 reg_write_dest_in => EX_MEM_write_reg_dest_out,
																								 mem_data_in => MEM_dat_cache_data_out,
																								 ni_reg_read_addr_1 => ni_read_reg_1,
																								 ni_reg_read_addr_2 => ni_read_reg_2,
																								 traverse_bit_in => MEM_WB_trav_bit_in,
																								 traverse_bit_clr => ctrl_trav_bit_clr,
																								 traverse_bit_out => MEM_WB_trav_bit_out,
																								 alu_result_out => MEM_WB_alu_result_out,
																								 reg_write_dest_out => wb_write_reg,
																								 mem_data_out => MEM_WB_mem_data_out,
																								 reg_haz_ind => MEM_WB_reg_haz_out,
																								 clk => clk_line
													);
	
	---------------------- Component instantiations for WB stage ----------------------
	flag_WB_arrive <= MEM_WB_trav_bit_out;
	
	regblk_data_in_mux:						mux_2_to_1_by_32 			port map (data_in_0 => MEM_WB_alu_result_out,
																								 data_in_1 => MEM_WB_mem_data_out,
																								 selection => ctrl_WB_mem_or_reg,
																								 output => wb_write_data
													);
	
	---------------------- External connections ----------------------
	prog_count_output(9 downto 0) <= IF_program_counter_out(9 downto 0);
	ins_cache_output <= IF_ins_cache_out;
	data_cache_input <= EX_MEM_reg_read_data_2_out;
	data_cache_output <= MEM_dat_cache_data_out;
	
end rtl;
