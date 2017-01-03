-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 13.0.1 Build 232 06/12/2013 Service Pack 1 SJ Web Edition"

-- DATE "02/25/2016 22:33:50"

-- 
-- Device: Altera EP2C5F256C6 Package FBGA256
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEII;
LIBRARY IEEE;
USE CYCLONEII.CYCLONEII_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	mips_32_bit_alu IS
    PORT (
	input_A : IN std_logic_vector(31 DOWNTO 0);
	input_B : IN std_logic_vector(31 DOWNTO 0);
	aluop : IN std_logic_vector(2 DOWNTO 0);
	output : OUT std_logic_vector(31 DOWNTO 0);
	zero : OUT std_logic;
	unsigned_overflow : OUT std_logic;
	signed_overflow : OUT std_logic
	);
END mips_32_bit_alu;

-- Design Ports Information
-- output[0]	=>  Location: PIN_T6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- output[1]	=>  Location: PIN_A5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- output[2]	=>  Location: PIN_G7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- output[3]	=>  Location: PIN_B6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- output[4]	=>  Location: PIN_B5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- output[5]	=>  Location: PIN_L2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- output[6]	=>  Location: PIN_K4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- output[7]	=>  Location: PIN_K2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- output[8]	=>  Location: PIN_K5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- output[9]	=>  Location: PIN_R7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- output[10]	=>  Location: PIN_L7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- output[11]	=>  Location: PIN_K1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- output[12]	=>  Location: PIN_T7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- output[13]	=>  Location: PIN_C6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- output[14]	=>  Location: PIN_A4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- output[15]	=>  Location: PIN_M1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- output[16]	=>  Location: PIN_N8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- output[17]	=>  Location: PIN_C13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- output[18]	=>  Location: PIN_H12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- output[19]	=>  Location: PIN_J12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- output[20]	=>  Location: PIN_A14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- output[21]	=>  Location: PIN_D15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- output[22]	=>  Location: PIN_A13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- output[23]	=>  Location: PIN_G13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- output[24]	=>  Location: PIN_H13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- output[25]	=>  Location: PIN_F15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- output[26]	=>  Location: PIN_K16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- output[27]	=>  Location: PIN_E16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- output[28]	=>  Location: PIN_G15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- output[29]	=>  Location: PIN_G16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- output[30]	=>  Location: PIN_R5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- output[31]	=>  Location: PIN_T5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- zero	=>  Location: PIN_L3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- unsigned_overflow	=>  Location: PIN_A7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- signed_overflow	=>  Location: PIN_A9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- aluop[2]	=>  Location: PIN_B10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- input_B[31]	=>  Location: PIN_B7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- input_A[31]	=>  Location: PIN_T9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- input_B[30]	=>  Location: PIN_A8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- input_A[30]	=>  Location: PIN_L9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- input_B[29]	=>  Location: PIN_N10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- input_A[29]	=>  Location: PIN_N9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- input_B[28]	=>  Location: PIN_R11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- input_A[28]	=>  Location: PIN_T11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- input_B[27]	=>  Location: PIN_F16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- input_A[27]	=>  Location: PIN_L10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- input_B[26]	=>  Location: PIN_B9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- input_A[26]	=>  Location: PIN_C12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- input_B[25]	=>  Location: PIN_P11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- input_A[25]	=>  Location: PIN_A10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- input_B[24]	=>  Location: PIN_D10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- input_A[24]	=>  Location: PIN_G11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- input_B[23]	=>  Location: PIN_A12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- input_A[23]	=>  Location: PIN_R10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- input_B[22]	=>  Location: PIN_A11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- input_A[22]	=>  Location: PIN_D11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- input_B[21]	=>  Location: PIN_B12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- input_A[21]	=>  Location: PIN_B13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- input_B[20]	=>  Location: PIN_G10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- input_A[20]	=>  Location: PIN_C11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- input_B[19]	=>  Location: PIN_D16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- input_A[19]	=>  Location: PIN_H11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- input_B[18]	=>  Location: PIN_B14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- input_A[18]	=>  Location: PIN_J11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- input_B[17]	=>  Location: PIN_B11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- input_A[17]	=>  Location: PIN_G12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- input_B[16]	=>  Location: PIN_R9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- input_A[16]	=>  Location: PIN_T8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- input_B[15]	=>  Location: PIN_C5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- input_A[15]	=>  Location: PIN_G6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- input_B[14]	=>  Location: PIN_B4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- input_A[14]	=>  Location: PIN_C4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- input_B[13]	=>  Location: PIN_D6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- input_A[13]	=>  Location: PIN_F6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- input_B[12]	=>  Location: PIN_E2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- input_A[12]	=>  Location: PIN_A6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- input_B[11]	=>  Location: PIN_E5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- input_A[11]	=>  Location: PIN_M2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- input_B[10]	=>  Location: PIN_D3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- input_A[10]	=>  Location: PIN_F7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- input_B[9]	=>  Location: PIN_L8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- input_A[9]	=>  Location: PIN_E3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- input_B[8]	=>  Location: PIN_J4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- input_A[8]	=>  Location: PIN_N2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- input_B[7]	=>  Location: PIN_M3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- input_A[7]	=>  Location: PIN_L1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- input_B[6]	=>  Location: PIN_D5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- input_A[6]	=>  Location: PIN_E4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- input_B[5]	=>  Location: PIN_H2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- input_A[5]	=>  Location: PIN_H1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- input_B[4]	=>  Location: PIN_J2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- input_A[4]	=>  Location: PIN_J1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- input_B[3]	=>  Location: PIN_F3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- input_A[3]	=>  Location: PIN_E6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- input_B[2]	=>  Location: PIN_E1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- input_A[2]	=>  Location: PIN_D4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- input_B[1]	=>  Location: PIN_B3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- input_A[1]	=>  Location: PIN_R8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- input_B[0]	=>  Location: PIN_F8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- input_A[0]	=>  Location: PIN_D8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- aluop[0]	=>  Location: PIN_F9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- aluop[1]	=>  Location: PIN_F10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default


ARCHITECTURE structure OF mips_32_bit_alu IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_input_A : std_logic_vector(31 DOWNTO 0);
SIGNAL ww_input_B : std_logic_vector(31 DOWNTO 0);
SIGNAL ww_aluop : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_output : std_logic_vector(31 DOWNTO 0);
SIGNAL ww_zero : std_logic;
SIGNAL ww_unsigned_overflow : std_logic;
SIGNAL ww_signed_overflow : std_logic;
SIGNAL \func_mux_unit|Mux30~0_combout\ : std_logic;
SIGNAL \addsub_unit|addder|bit_0|and_2|output~combout\ : std_logic;
SIGNAL \addsub_unit|addder|bit_5|or_1|output~0_combout\ : std_logic;
SIGNAL \addsub_unit|addder|bit_9|or_1|output~0_combout\ : std_logic;
SIGNAL \addsub_unit|addder|bit_17|or_1|output~0_combout\ : std_logic;
SIGNAL \addsub_unit|addder|bit_24|or_1|output~0_combout\ : std_logic;
SIGNAL \addsub_unit|addder|bit_27|or_1|output~0_combout\ : std_logic;
SIGNAL \Equal0~3_combout\ : std_logic;
SIGNAL \Equal0~6_combout\ : std_logic;
SIGNAL \func_mux_unit|Mux4~1_combout\ : std_logic;
SIGNAL \func_mux_unit|Mux5~1_combout\ : std_logic;
SIGNAL \func_mux_unit|Mux7~1_combout\ : std_logic;
SIGNAL \func_mux_unit|Mux8~1_combout\ : std_logic;
SIGNAL \func_mux_unit|Mux9~1_combout\ : std_logic;
SIGNAL \func_mux_unit|Mux10~1_combout\ : std_logic;
SIGNAL \func_mux_unit|Mux11~1_combout\ : std_logic;
SIGNAL \func_mux_unit|Mux12~1_combout\ : std_logic;
SIGNAL \func_mux_unit|Mux16~1_combout\ : std_logic;
SIGNAL \func_mux_unit|Mux17~1_combout\ : std_logic;
SIGNAL \func_mux_unit|Mux20~1_combout\ : std_logic;
SIGNAL \func_mux_unit|Mux23~1_combout\ : std_logic;
SIGNAL \func_mux_unit|Mux27~1_combout\ : std_logic;
SIGNAL \func_mux_unit|Mux31~1_combout\ : std_logic;
SIGNAL \func_mux_unit|Mux31~0_combout\ : std_logic;
SIGNAL \slt_unit|LessThan0~1_cout\ : std_logic;
SIGNAL \slt_unit|LessThan0~3_cout\ : std_logic;
SIGNAL \slt_unit|LessThan0~5_cout\ : std_logic;
SIGNAL \slt_unit|LessThan0~7_cout\ : std_logic;
SIGNAL \slt_unit|LessThan0~9_cout\ : std_logic;
SIGNAL \slt_unit|LessThan0~11_cout\ : std_logic;
SIGNAL \slt_unit|LessThan0~13_cout\ : std_logic;
SIGNAL \slt_unit|LessThan0~15_cout\ : std_logic;
SIGNAL \slt_unit|LessThan0~17_cout\ : std_logic;
SIGNAL \slt_unit|LessThan0~19_cout\ : std_logic;
SIGNAL \slt_unit|LessThan0~21_cout\ : std_logic;
SIGNAL \slt_unit|LessThan0~23_cout\ : std_logic;
SIGNAL \slt_unit|LessThan0~25_cout\ : std_logic;
SIGNAL \slt_unit|LessThan0~27_cout\ : std_logic;
SIGNAL \slt_unit|LessThan0~29_cout\ : std_logic;
SIGNAL \slt_unit|LessThan0~31_cout\ : std_logic;
SIGNAL \slt_unit|LessThan0~33_cout\ : std_logic;
SIGNAL \slt_unit|LessThan0~35_cout\ : std_logic;
SIGNAL \slt_unit|LessThan0~37_cout\ : std_logic;
SIGNAL \slt_unit|LessThan0~39_cout\ : std_logic;
SIGNAL \slt_unit|LessThan0~41_cout\ : std_logic;
SIGNAL \slt_unit|LessThan0~43_cout\ : std_logic;
SIGNAL \slt_unit|LessThan0~45_cout\ : std_logic;
SIGNAL \slt_unit|LessThan0~47_cout\ : std_logic;
SIGNAL \slt_unit|LessThan0~49_cout\ : std_logic;
SIGNAL \slt_unit|LessThan0~51_cout\ : std_logic;
SIGNAL \slt_unit|LessThan0~53_cout\ : std_logic;
SIGNAL \slt_unit|LessThan0~55_cout\ : std_logic;
SIGNAL \slt_unit|LessThan0~57_cout\ : std_logic;
SIGNAL \slt_unit|LessThan0~59_cout\ : std_logic;
SIGNAL \slt_unit|LessThan0~61_cout\ : std_logic;
SIGNAL \slt_unit|LessThan0~62_combout\ : std_logic;
SIGNAL \func_mux_unit|Mux31~2_combout\ : std_logic;
SIGNAL \func_mux_unit|Mux30~2_combout\ : std_logic;
SIGNAL \addsub_unit|addder|bit_0|and_1|output~combout\ : std_logic;
SIGNAL \addsub_unit|addder|bit_1|xor_2|output~combout\ : std_logic;
SIGNAL \func_mux_unit|Mux30~1_combout\ : std_logic;
SIGNAL \func_mux_unit|Mux30~3_combout\ : std_logic;
SIGNAL \addsub_unit|addder|bit_1|or_1|output~0_combout\ : std_logic;
SIGNAL \func_mux_unit|Mux29~1_combout\ : std_logic;
SIGNAL \func_mux_unit|Mux29~2_combout\ : std_logic;
SIGNAL \func_mux_unit|Mux29~0_combout\ : std_logic;
SIGNAL \addsub_unit|addder|bit_2|or_1|output~0_combout\ : std_logic;
SIGNAL \func_mux_unit|Mux28~1_combout\ : std_logic;
SIGNAL \func_mux_unit|Mux28~2_combout\ : std_logic;
SIGNAL \func_mux_unit|Mux28~0_combout\ : std_logic;
SIGNAL \addsub_unit|addder|bit_3|or_1|output~0_combout\ : std_logic;
SIGNAL \func_mux_unit|Mux27~2_combout\ : std_logic;
SIGNAL \func_mux_unit|Mux27~0_combout\ : std_logic;
SIGNAL \addsub_unit|addder|bit_4|or_1|output~0_combout\ : std_logic;
SIGNAL \func_mux_unit|Mux26~1_combout\ : std_logic;
SIGNAL \func_mux_unit|Mux26~2_combout\ : std_logic;
SIGNAL \func_mux_unit|Mux26~0_combout\ : std_logic;
SIGNAL \func_mux_unit|Mux25~1_combout\ : std_logic;
SIGNAL \func_mux_unit|Mux25~2_combout\ : std_logic;
SIGNAL \func_mux_unit|Mux25~0_combout\ : std_logic;
SIGNAL \func_mux_unit|Mux24~1_combout\ : std_logic;
SIGNAL \addsub_unit|addder|bit_6|or_1|output~0_combout\ : std_logic;
SIGNAL \func_mux_unit|Mux24~2_combout\ : std_logic;
SIGNAL \func_mux_unit|Mux24~0_combout\ : std_logic;
SIGNAL \addsub_unit|addder|bit_7|or_1|output~0_combout\ : std_logic;
SIGNAL \func_mux_unit|Mux23~2_combout\ : std_logic;
SIGNAL \func_mux_unit|Mux23~0_combout\ : std_logic;
SIGNAL \addsub_unit|addder|bit_8|or_1|output~0_combout\ : std_logic;
SIGNAL \func_mux_unit|Mux22~1_combout\ : std_logic;
SIGNAL \func_mux_unit|Mux22~2_combout\ : std_logic;
SIGNAL \func_mux_unit|Mux22~0_combout\ : std_logic;
SIGNAL \func_mux_unit|Mux21~1_combout\ : std_logic;
SIGNAL \func_mux_unit|Mux21~2_combout\ : std_logic;
SIGNAL \func_mux_unit|Mux21~0_combout\ : std_logic;
SIGNAL \addsub_unit|addder|bit_10|or_1|output~0_combout\ : std_logic;
SIGNAL \func_mux_unit|Mux20~2_combout\ : std_logic;
SIGNAL \func_mux_unit|Mux20~0_combout\ : std_logic;
SIGNAL \addsub_unit|addder|bit_11|or_1|output~0_combout\ : std_logic;
SIGNAL \func_mux_unit|Mux19~1_combout\ : std_logic;
SIGNAL \func_mux_unit|Mux19~2_combout\ : std_logic;
SIGNAL \func_mux_unit|Mux19~0_combout\ : std_logic;
SIGNAL \func_mux_unit|Mux18~1_combout\ : std_logic;
SIGNAL \addsub_unit|addder|bit_12|or_1|output~0_combout\ : std_logic;
SIGNAL \func_mux_unit|Mux18~2_combout\ : std_logic;
SIGNAL \func_mux_unit|Mux18~0_combout\ : std_logic;
SIGNAL \addsub_unit|addder|bit_13|or_1|output~0_combout\ : std_logic;
SIGNAL \func_mux_unit|Mux17~2_combout\ : std_logic;
SIGNAL \func_mux_unit|Mux17~0_combout\ : std_logic;
SIGNAL \addsub_unit|addder|bit_14|or_1|output~0_combout\ : std_logic;
SIGNAL \func_mux_unit|Mux16~2_combout\ : std_logic;
SIGNAL \func_mux_unit|Mux16~0_combout\ : std_logic;
SIGNAL \func_mux_unit|Mux15~1_combout\ : std_logic;
SIGNAL \func_mux_unit|Mux15~2_combout\ : std_logic;
SIGNAL \func_mux_unit|Mux15~0_combout\ : std_logic;
SIGNAL \addsub_unit|addder|bit_15|or_1|output~0_combout\ : std_logic;
SIGNAL \addsub_unit|addder|bit_16|or_1|output~0_combout\ : std_logic;
SIGNAL \func_mux_unit|Mux14~1_combout\ : std_logic;
SIGNAL \func_mux_unit|Mux14~2_combout\ : std_logic;
SIGNAL \func_mux_unit|Mux14~0_combout\ : std_logic;
SIGNAL \func_mux_unit|Mux13~1_combout\ : std_logic;
SIGNAL \func_mux_unit|Mux13~2_combout\ : std_logic;
SIGNAL \func_mux_unit|Mux13~0_combout\ : std_logic;
SIGNAL \addsub_unit|addder|bit_18|or_1|output~0_combout\ : std_logic;
SIGNAL \func_mux_unit|Mux12~2_combout\ : std_logic;
SIGNAL \func_mux_unit|Mux12~0_combout\ : std_logic;
SIGNAL \addsub_unit|addder|bit_19|or_1|output~0_combout\ : std_logic;
SIGNAL \func_mux_unit|Mux11~2_combout\ : std_logic;
SIGNAL \func_mux_unit|Mux11~0_combout\ : std_logic;
SIGNAL \addsub_unit|addder|bit_20|or_1|output~0_combout\ : std_logic;
SIGNAL \func_mux_unit|Mux10~2_combout\ : std_logic;
SIGNAL \func_mux_unit|Mux10~0_combout\ : std_logic;
SIGNAL \addsub_unit|addder|bit_21|or_1|output~0_combout\ : std_logic;
SIGNAL \func_mux_unit|Mux9~2_combout\ : std_logic;
SIGNAL \func_mux_unit|Mux9~0_combout\ : std_logic;
SIGNAL \addsub_unit|addder|bit_22|or_1|output~0_combout\ : std_logic;
SIGNAL \func_mux_unit|Mux8~2_combout\ : std_logic;
SIGNAL \func_mux_unit|Mux8~0_combout\ : std_logic;
SIGNAL \addsub_unit|addder|bit_23|or_1|output~0_combout\ : std_logic;
SIGNAL \func_mux_unit|Mux7~2_combout\ : std_logic;
SIGNAL \func_mux_unit|Mux7~0_combout\ : std_logic;
SIGNAL \func_mux_unit|Mux6~1_combout\ : std_logic;
SIGNAL \func_mux_unit|Mux6~2_combout\ : std_logic;
SIGNAL \func_mux_unit|Mux6~0_combout\ : std_logic;
SIGNAL \addsub_unit|addder|bit_25|or_1|output~0_combout\ : std_logic;
SIGNAL \func_mux_unit|Mux5~2_combout\ : std_logic;
SIGNAL \func_mux_unit|Mux5~0_combout\ : std_logic;
SIGNAL \addsub_unit|addder|bit_26|or_1|output~0_combout\ : std_logic;
SIGNAL \func_mux_unit|Mux4~2_combout\ : std_logic;
SIGNAL \func_mux_unit|Mux4~0_combout\ : std_logic;
SIGNAL \func_mux_unit|Mux3~3_combout\ : std_logic;
SIGNAL \func_mux_unit|Mux3~0_combout\ : std_logic;
SIGNAL \func_mux_unit|Mux3~1_combout\ : std_logic;
SIGNAL \addsub_unit|addder|bit_28|xor_2|output~0_combout\ : std_logic;
SIGNAL \func_mux_unit|Mux3~2_combout\ : std_logic;
SIGNAL \func_mux_unit|Mux3~4_combout\ : std_logic;
SIGNAL \func_mux_unit|Mux2~1_combout\ : std_logic;
SIGNAL \func_mux_unit|Mux2~0_combout\ : std_logic;
SIGNAL \addsub_unit|addder|bit_28|or_1|output~0_combout\ : std_logic;
SIGNAL \addsub_unit|addder|bit_29|xor_2|output~0_combout\ : std_logic;
SIGNAL \func_mux_unit|Mux2~2_combout\ : std_logic;
SIGNAL \func_mux_unit|Mux1~0_combout\ : std_logic;
SIGNAL \addsub_unit|addder|bit_29|or_1|output~0_combout\ : std_logic;
SIGNAL \func_mux_unit|Mux1~1_combout\ : std_logic;
SIGNAL \func_mux_unit|Mux1~2_combout\ : std_logic;
SIGNAL \addsub_unit|addder|bit_30|or_1|output~0_combout\ : std_logic;
SIGNAL \func_mux_unit|Mux0~0_combout\ : std_logic;
SIGNAL \func_mux_unit|Mux0~1_combout\ : std_logic;
SIGNAL \func_mux_unit|Mux0~2_combout\ : std_logic;
SIGNAL \Equal0~8_combout\ : std_logic;
SIGNAL \Equal0~9_combout\ : std_logic;
SIGNAL \Equal0~0_combout\ : std_logic;
SIGNAL \Equal0~1_combout\ : std_logic;
SIGNAL \Equal0~2_combout\ : std_logic;
SIGNAL \Equal0~4_combout\ : std_logic;
SIGNAL \Equal0~5_combout\ : std_logic;
SIGNAL \Equal0~7_combout\ : std_logic;
SIGNAL \Equal0~10_combout\ : std_logic;
SIGNAL \addsub_unit|usigned_of_det|flag_out~0_combout\ : std_logic;
SIGNAL \addsub_unit|signed_of_det|flag_out~0_combout\ : std_logic;
SIGNAL \addsub_unit|sub_inv|output\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \input_B~combout\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \input_A~combout\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \aluop~combout\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \addsub_unit|signed_of_det|ALT_INV_flag_out~0_combout\ : std_logic;

BEGIN

ww_input_A <= input_A;
ww_input_B <= input_B;
ww_aluop <= aluop;
output <= ww_output;
zero <= ww_zero;
unsigned_overflow <= ww_unsigned_overflow;
signed_overflow <= ww_signed_overflow;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\addsub_unit|signed_of_det|ALT_INV_flag_out~0_combout\ <= NOT \addsub_unit|signed_of_det|flag_out~0_combout\;

-- Location: LCCOMB_X8_Y10_N30
\func_mux_unit|Mux30~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \func_mux_unit|Mux30~0_combout\ = (!\aluop~combout\(2) & (\input_B~combout\(1) & (!\aluop~combout\(1) & \input_A~combout\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \aluop~combout\(2),
	datab => \input_B~combout\(1),
	datac => \aluop~combout\(1),
	datad => \input_A~combout\(1),
	combout => \func_mux_unit|Mux30~0_combout\);

-- Location: LCCOMB_X8_Y10_N12
\addsub_unit|addder|bit_0|and_2|output\ : cycloneii_lcell_comb
-- Equation(s):
-- \addsub_unit|addder|bit_0|and_2|output~combout\ = (\aluop~combout\(2) & (\input_A~combout\(0) $ (!\input_B~combout\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \input_A~combout\(0),
	datac => \input_B~combout\(0),
	datad => \aluop~combout\(2),
	combout => \addsub_unit|addder|bit_0|and_2|output~combout\);

-- Location: LCCOMB_X8_Y11_N6
\addsub_unit|addder|bit_5|or_1|output~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \addsub_unit|addder|bit_5|or_1|output~0_combout\ = (\input_A~combout\(5) & ((\addsub_unit|addder|bit_4|or_1|output~0_combout\) # (\input_B~combout\(5) $ (\aluop~combout\(2))))) # (!\input_A~combout\(5) & (\addsub_unit|addder|bit_4|or_1|output~0_combout\ & 
-- (\input_B~combout\(5) $ (\aluop~combout\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011111000101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \input_A~combout\(5),
	datab => \input_B~combout\(5),
	datac => \aluop~combout\(2),
	datad => \addsub_unit|addder|bit_4|or_1|output~0_combout\,
	combout => \addsub_unit|addder|bit_5|or_1|output~0_combout\);

-- Location: LCCOMB_X9_Y9_N10
\addsub_unit|addder|bit_9|or_1|output~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \addsub_unit|addder|bit_9|or_1|output~0_combout\ = (\addsub_unit|addder|bit_8|or_1|output~0_combout\ & ((\input_A~combout\(9)) # (\input_B~combout\(9) $ (\aluop~combout\(2))))) # (!\addsub_unit|addder|bit_8|or_1|output~0_combout\ & (\input_A~combout\(9) & 
-- (\input_B~combout\(9) $ (\aluop~combout\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101010011101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \input_B~combout\(9),
	datab => \addsub_unit|addder|bit_8|or_1|output~0_combout\,
	datac => \input_A~combout\(9),
	datad => \aluop~combout\(2),
	combout => \addsub_unit|addder|bit_9|or_1|output~0_combout\);

-- Location: LCCOMB_X18_Y10_N20
\addsub_unit|addder|bit_17|or_1|output~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \addsub_unit|addder|bit_17|or_1|output~0_combout\ = (\addsub_unit|addder|bit_16|or_1|output~0_combout\ & ((\input_A~combout\(17)) # (\aluop~combout\(2) $ (\input_B~combout\(17))))) # (!\addsub_unit|addder|bit_16|or_1|output~0_combout\ & 
-- (\input_A~combout\(17) & (\aluop~combout\(2) $ (\input_B~combout\(17)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111001001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \aluop~combout\(2),
	datab => \addsub_unit|addder|bit_16|or_1|output~0_combout\,
	datac => \input_B~combout\(17),
	datad => \input_A~combout\(17),
	combout => \addsub_unit|addder|bit_17|or_1|output~0_combout\);

-- Location: LCCOMB_X17_Y10_N16
\addsub_unit|addder|bit_24|or_1|output~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \addsub_unit|addder|bit_24|or_1|output~0_combout\ = (\addsub_unit|addder|bit_23|or_1|output~0_combout\ & ((\input_A~combout\(24)) # (\input_B~combout\(24) $ (\aluop~combout\(2))))) # (!\addsub_unit|addder|bit_23|or_1|output~0_combout\ & 
-- (\input_A~combout\(24) & (\input_B~combout\(24) $ (\aluop~combout\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011001100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \input_B~combout\(24),
	datab => \aluop~combout\(2),
	datac => \addsub_unit|addder|bit_23|or_1|output~0_combout\,
	datad => \input_A~combout\(24),
	combout => \addsub_unit|addder|bit_24|or_1|output~0_combout\);

-- Location: LCCOMB_X17_Y10_N4
\addsub_unit|addder|bit_27|or_1|output~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \addsub_unit|addder|bit_27|or_1|output~0_combout\ = (\input_A~combout\(27) & ((\addsub_unit|addder|bit_26|or_1|output~0_combout\) # (\aluop~combout\(2) $ (\input_B~combout\(27))))) # (!\input_A~combout\(27) & 
-- (\addsub_unit|addder|bit_26|or_1|output~0_combout\ & (\aluop~combout\(2) $ (\input_B~combout\(27)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011001011101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \input_A~combout\(27),
	datab => \aluop~combout\(2),
	datac => \addsub_unit|addder|bit_26|or_1|output~0_combout\,
	datad => \input_B~combout\(27),
	combout => \addsub_unit|addder|bit_27|or_1|output~0_combout\);

-- Location: LCCOMB_X7_Y10_N14
\Equal0~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \Equal0~3_combout\ = (!\func_mux_unit|Mux18~0_combout\ & (!\func_mux_unit|Mux17~0_combout\ & (!\func_mux_unit|Mux16~0_combout\ & !\func_mux_unit|Mux15~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \func_mux_unit|Mux18~0_combout\,
	datab => \func_mux_unit|Mux17~0_combout\,
	datac => \func_mux_unit|Mux16~0_combout\,
	datad => \func_mux_unit|Mux15~0_combout\,
	combout => \Equal0~3_combout\);

-- Location: LCCOMB_X17_Y11_N16
\Equal0~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \Equal0~6_combout\ = (!\func_mux_unit|Mux8~0_combout\ & (!\func_mux_unit|Mux7~0_combout\ & (!\func_mux_unit|Mux9~0_combout\ & !\func_mux_unit|Mux10~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \func_mux_unit|Mux8~0_combout\,
	datab => \func_mux_unit|Mux7~0_combout\,
	datac => \func_mux_unit|Mux9~0_combout\,
	datad => \func_mux_unit|Mux10~0_combout\,
	combout => \Equal0~6_combout\);

-- Location: LCCOMB_X17_Y10_N0
\func_mux_unit|Mux4~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \func_mux_unit|Mux4~1_combout\ = (\aluop~combout\(1) & (\input_A~combout\(27) $ (\aluop~combout\(2) $ (\input_B~combout\(27))))) # (!\aluop~combout\(1) & (\input_A~combout\(27) & (!\aluop~combout\(2) & \input_B~combout\(27))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000011001001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \input_A~combout\(27),
	datab => \aluop~combout\(1),
	datac => \aluop~combout\(2),
	datad => \input_B~combout\(27),
	combout => \func_mux_unit|Mux4~1_combout\);

-- Location: LCCOMB_X17_Y10_N12
\func_mux_unit|Mux5~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \func_mux_unit|Mux5~1_combout\ = (\aluop~combout\(1) & (\input_A~combout\(26) $ (\aluop~combout\(2) $ (\input_B~combout\(26))))) # (!\aluop~combout\(1) & (\input_A~combout\(26) & (!\aluop~combout\(2) & \input_B~combout\(26))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \input_A~combout\(26),
	datab => \aluop~combout\(2),
	datac => \input_B~combout\(26),
	datad => \aluop~combout\(1),
	combout => \func_mux_unit|Mux5~1_combout\);

-- Location: LCCOMB_X17_Y10_N28
\func_mux_unit|Mux7~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \func_mux_unit|Mux7~1_combout\ = (\aluop~combout\(1) & (\input_B~combout\(24) $ (\aluop~combout\(2) $ (\input_A~combout\(24))))) # (!\aluop~combout\(1) & (\input_B~combout\(24) & (!\aluop~combout\(2) & \input_A~combout\(24))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000011001001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \input_B~combout\(24),
	datab => \aluop~combout\(1),
	datac => \aluop~combout\(2),
	datad => \input_A~combout\(24),
	combout => \func_mux_unit|Mux7~1_combout\);

-- Location: LCCOMB_X17_Y11_N26
\func_mux_unit|Mux8~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \func_mux_unit|Mux8~1_combout\ = (\aluop~combout\(1) & (\input_A~combout\(23) $ (\aluop~combout\(2) $ (\input_B~combout\(23))))) # (!\aluop~combout\(1) & (\input_A~combout\(23) & (!\aluop~combout\(2) & \input_B~combout\(23))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000011001001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \input_A~combout\(23),
	datab => \aluop~combout\(1),
	datac => \aluop~combout\(2),
	datad => \input_B~combout\(23),
	combout => \func_mux_unit|Mux8~1_combout\);

-- Location: LCCOMB_X17_Y11_N30
\func_mux_unit|Mux9~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \func_mux_unit|Mux9~1_combout\ = (\aluop~combout\(1) & (\input_B~combout\(22) $ (\aluop~combout\(2) $ (\input_A~combout\(22))))) # (!\aluop~combout\(1) & (\input_B~combout\(22) & (!\aluop~combout\(2) & \input_A~combout\(22))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \input_B~combout\(22),
	datab => \aluop~combout\(2),
	datac => \input_A~combout\(22),
	datad => \aluop~combout\(1),
	combout => \func_mux_unit|Mux9~1_combout\);

-- Location: LCCOMB_X17_Y11_N10
\func_mux_unit|Mux10~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \func_mux_unit|Mux10~1_combout\ = (\aluop~combout\(1) & (\input_A~combout\(21) $ (\aluop~combout\(2) $ (\input_B~combout\(21))))) # (!\aluop~combout\(1) & (\input_A~combout\(21) & (!\aluop~combout\(2) & \input_B~combout\(21))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \input_A~combout\(21),
	datab => \aluop~combout\(2),
	datac => \input_B~combout\(21),
	datad => \aluop~combout\(1),
	combout => \func_mux_unit|Mux10~1_combout\);

-- Location: LCCOMB_X17_Y11_N6
\func_mux_unit|Mux11~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \func_mux_unit|Mux11~1_combout\ = (\aluop~combout\(1) & (\input_B~combout\(20) $ (\aluop~combout\(2) $ (\input_A~combout\(20))))) # (!\aluop~combout\(1) & (\input_B~combout\(20) & (!\aluop~combout\(2) & \input_A~combout\(20))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000011001001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \input_B~combout\(20),
	datab => \aluop~combout\(1),
	datac => \aluop~combout\(2),
	datad => \input_A~combout\(20),
	combout => \func_mux_unit|Mux11~1_combout\);

-- Location: LCCOMB_X18_Y10_N12
\func_mux_unit|Mux12~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \func_mux_unit|Mux12~1_combout\ = (\aluop~combout\(1) & (\input_A~combout\(19) $ (\aluop~combout\(2) $ (\input_B~combout\(19))))) # (!\aluop~combout\(1) & (\input_A~combout\(19) & (!\aluop~combout\(2) & \input_B~combout\(19))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000011000101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \aluop~combout\(1),
	datab => \input_A~combout\(19),
	datac => \aluop~combout\(2),
	datad => \input_B~combout\(19),
	combout => \func_mux_unit|Mux12~1_combout\);

-- Location: LCCOMB_X7_Y10_N16
\func_mux_unit|Mux16~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \func_mux_unit|Mux16~1_combout\ = (\aluop~combout\(1) & (\aluop~combout\(2) $ (\input_A~combout\(15) $ (\input_B~combout\(15))))) # (!\aluop~combout\(1) & (!\aluop~combout\(2) & (\input_A~combout\(15) & \input_B~combout\(15))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001010001100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \aluop~combout\(2),
	datab => \input_A~combout\(15),
	datac => \aluop~combout\(1),
	datad => \input_B~combout\(15),
	combout => \func_mux_unit|Mux16~1_combout\);

-- Location: LCCOMB_X7_Y10_N12
\func_mux_unit|Mux17~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \func_mux_unit|Mux17~1_combout\ = (\aluop~combout\(1) & (\input_B~combout\(14) $ (\input_A~combout\(14) $ (\aluop~combout\(2))))) # (!\aluop~combout\(1) & (\input_B~combout\(14) & (\input_A~combout\(14) & !\aluop~combout\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000010001101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \input_B~combout\(14),
	datab => \aluop~combout\(1),
	datac => \input_A~combout\(14),
	datad => \aluop~combout\(2),
	combout => \func_mux_unit|Mux17~1_combout\);

-- Location: LCCOMB_X9_Y9_N28
\func_mux_unit|Mux20~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \func_mux_unit|Mux20~1_combout\ = (\aluop~combout\(1) & (\input_A~combout\(11) $ (\input_B~combout\(11) $ (\aluop~combout\(2))))) # (!\aluop~combout\(1) & (\input_A~combout\(11) & (\input_B~combout\(11) & !\aluop~combout\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001000001101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \input_A~combout\(11),
	datab => \input_B~combout\(11),
	datac => \aluop~combout\(1),
	datad => \aluop~combout\(2),
	combout => \func_mux_unit|Mux20~1_combout\);

-- Location: LCCOMB_X8_Y9_N6
\func_mux_unit|Mux23~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \func_mux_unit|Mux23~1_combout\ = (\aluop~combout\(1) & (\aluop~combout\(2) $ (\input_A~combout\(8) $ (\input_B~combout\(8))))) # (!\aluop~combout\(1) & (!\aluop~combout\(2) & (\input_A~combout\(8) & \input_B~combout\(8))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \aluop~combout\(2),
	datab => \input_A~combout\(8),
	datac => \input_B~combout\(8),
	datad => \aluop~combout\(1),
	combout => \func_mux_unit|Mux23~1_combout\);

-- Location: LCCOMB_X8_Y11_N12
\func_mux_unit|Mux27~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \func_mux_unit|Mux27~1_combout\ = (\aluop~combout\(1) & (\input_A~combout\(4) $ (\aluop~combout\(2) $ (\input_B~combout\(4))))) # (!\aluop~combout\(1) & (\input_A~combout\(4) & (!\aluop~combout\(2) & \input_B~combout\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001001001100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \input_A~combout\(4),
	datab => \aluop~combout\(2),
	datac => \aluop~combout\(1),
	datad => \input_B~combout\(4),
	combout => \func_mux_unit|Mux27~1_combout\);

-- Location: PIN_B10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\aluop[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_aluop(2),
	combout => \aluop~combout\(2));

-- Location: PIN_F8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\input_B[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_input_B(0),
	combout => \input_B~combout\(0));

-- Location: PIN_F10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\aluop[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_aluop(1),
	combout => \aluop~combout\(1));

-- Location: PIN_D8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\input_A[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_input_A(0),
	combout => \input_A~combout\(0));

-- Location: LCCOMB_X8_Y10_N26
\func_mux_unit|Mux31~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \func_mux_unit|Mux31~1_combout\ = (\aluop~combout\(1) & ((\aluop~combout\(0)) # (\input_B~combout\(0) $ (\input_A~combout\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011000011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \aluop~combout\(0),
	datab => \input_B~combout\(0),
	datac => \aluop~combout\(1),
	datad => \input_A~combout\(0),
	combout => \func_mux_unit|Mux31~1_combout\);

-- Location: LCCOMB_X8_Y10_N24
\func_mux_unit|Mux31~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \func_mux_unit|Mux31~0_combout\ = (\aluop~combout\(0) & ((\input_B~combout\(0)) # ((\aluop~combout\(1)) # (\input_A~combout\(0))))) # (!\aluop~combout\(0) & (\input_B~combout\(0) & (!\aluop~combout\(1) & \input_A~combout\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \aluop~combout\(0),
	datab => \input_B~combout\(0),
	datac => \aluop~combout\(1),
	datad => \input_A~combout\(0),
	combout => \func_mux_unit|Mux31~0_combout\);

-- Location: PIN_T9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\input_A[31]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_input_A(31),
	combout => \input_A~combout\(31));

-- Location: PIN_A8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\input_B[30]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_input_B(30),
	combout => \input_B~combout\(30));

-- Location: PIN_N9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\input_A[29]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_input_A(29),
	combout => \input_A~combout\(29));

-- Location: PIN_T11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\input_A[28]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_input_A(28),
	combout => \input_A~combout\(28));

-- Location: PIN_F16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\input_B[27]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_input_B(27),
	combout => \input_B~combout\(27));

-- Location: PIN_B9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\input_B[26]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_input_B(26),
	combout => \input_B~combout\(26));

-- Location: PIN_P11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\input_B[25]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_input_B(25),
	combout => \input_B~combout\(25));

-- Location: PIN_D10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\input_B[24]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_input_B(24),
	combout => \input_B~combout\(24));

-- Location: PIN_R10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\input_A[23]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_input_A(23),
	combout => \input_A~combout\(23));

-- Location: PIN_A11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\input_B[22]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_input_B(22),
	combout => \input_B~combout\(22));

-- Location: PIN_B12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\input_B[21]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_input_B(21),
	combout => \input_B~combout\(21));

-- Location: PIN_G10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\input_B[20]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_input_B(20),
	combout => \input_B~combout\(20));

-- Location: PIN_D16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\input_B[19]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_input_B(19),
	combout => \input_B~combout\(19));

-- Location: PIN_J11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\input_A[18]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_input_A(18),
	combout => \input_A~combout\(18));

-- Location: PIN_G12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\input_A[17]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_input_A(17),
	combout => \input_A~combout\(17));

-- Location: PIN_R9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\input_B[16]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_input_B(16),
	combout => \input_B~combout\(16));

-- Location: PIN_C5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\input_B[15]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_input_B(15),
	combout => \input_B~combout\(15));

-- Location: PIN_C4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\input_A[14]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_input_A(14),
	combout => \input_A~combout\(14));

-- Location: PIN_D6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\input_B[13]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_input_B(13),
	combout => \input_B~combout\(13));

-- Location: PIN_A6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\input_A[12]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_input_A(12),
	combout => \input_A~combout\(12));

-- Location: PIN_E5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\input_B[11]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_input_B(11),
	combout => \input_B~combout\(11));

-- Location: PIN_D3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\input_B[10]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_input_B(10),
	combout => \input_B~combout\(10));

-- Location: PIN_E3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\input_A[9]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_input_A(9),
	combout => \input_A~combout\(9));

-- Location: PIN_N2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\input_A[8]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_input_A(8),
	combout => \input_A~combout\(8));

-- Location: PIN_L1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\input_A[7]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_input_A(7),
	combout => \input_A~combout\(7));

-- Location: PIN_D5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\input_B[6]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_input_B(6),
	combout => \input_B~combout\(6));

-- Location: PIN_H1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\input_A[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_input_A(5),
	combout => \input_A~combout\(5));

-- Location: PIN_J1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\input_A[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_input_A(4),
	combout => \input_A~combout\(4));

-- Location: PIN_E6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\input_A[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_input_A(3),
	combout => \input_A~combout\(3));

-- Location: PIN_E1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\input_B[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_input_B(2),
	combout => \input_B~combout\(2));

-- Location: PIN_B3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\input_B[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_input_B(1),
	combout => \input_B~combout\(1));

-- Location: LCCOMB_X9_Y11_N0
\slt_unit|LessThan0~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \slt_unit|LessThan0~1_cout\ = CARRY((\input_A~combout\(0) & !\input_B~combout\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \input_A~combout\(0),
	datab => \input_B~combout\(0),
	datad => VCC,
	cout => \slt_unit|LessThan0~1_cout\);

-- Location: LCCOMB_X9_Y11_N2
\slt_unit|LessThan0~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \slt_unit|LessThan0~3_cout\ = CARRY((\input_A~combout\(1) & (\input_B~combout\(1) & !\slt_unit|LessThan0~1_cout\)) # (!\input_A~combout\(1) & ((\input_B~combout\(1)) # (!\slt_unit|LessThan0~1_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \input_A~combout\(1),
	datab => \input_B~combout\(1),
	datad => VCC,
	cin => \slt_unit|LessThan0~1_cout\,
	cout => \slt_unit|LessThan0~3_cout\);

-- Location: LCCOMB_X9_Y11_N4
\slt_unit|LessThan0~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \slt_unit|LessThan0~5_cout\ = CARRY((\input_A~combout\(2) & ((!\slt_unit|LessThan0~3_cout\) # (!\input_B~combout\(2)))) # (!\input_A~combout\(2) & (!\input_B~combout\(2) & !\slt_unit|LessThan0~3_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \input_A~combout\(2),
	datab => \input_B~combout\(2),
	datad => VCC,
	cin => \slt_unit|LessThan0~3_cout\,
	cout => \slt_unit|LessThan0~5_cout\);

-- Location: LCCOMB_X9_Y11_N6
\slt_unit|LessThan0~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \slt_unit|LessThan0~7_cout\ = CARRY((\input_B~combout\(3) & ((!\slt_unit|LessThan0~5_cout\) # (!\input_A~combout\(3)))) # (!\input_B~combout\(3) & (!\input_A~combout\(3) & !\slt_unit|LessThan0~5_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \input_B~combout\(3),
	datab => \input_A~combout\(3),
	datad => VCC,
	cin => \slt_unit|LessThan0~5_cout\,
	cout => \slt_unit|LessThan0~7_cout\);

-- Location: LCCOMB_X9_Y11_N8
\slt_unit|LessThan0~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \slt_unit|LessThan0~9_cout\ = CARRY((\input_B~combout\(4) & (\input_A~combout\(4) & !\slt_unit|LessThan0~7_cout\)) # (!\input_B~combout\(4) & ((\input_A~combout\(4)) # (!\slt_unit|LessThan0~7_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \input_B~combout\(4),
	datab => \input_A~combout\(4),
	datad => VCC,
	cin => \slt_unit|LessThan0~7_cout\,
	cout => \slt_unit|LessThan0~9_cout\);

-- Location: LCCOMB_X9_Y11_N10
\slt_unit|LessThan0~11\ : cycloneii_lcell_comb
-- Equation(s):
-- \slt_unit|LessThan0~11_cout\ = CARRY((\input_B~combout\(5) & ((!\slt_unit|LessThan0~9_cout\) # (!\input_A~combout\(5)))) # (!\input_B~combout\(5) & (!\input_A~combout\(5) & !\slt_unit|LessThan0~9_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \input_B~combout\(5),
	datab => \input_A~combout\(5),
	datad => VCC,
	cin => \slt_unit|LessThan0~9_cout\,
	cout => \slt_unit|LessThan0~11_cout\);

-- Location: LCCOMB_X9_Y11_N12
\slt_unit|LessThan0~13\ : cycloneii_lcell_comb
-- Equation(s):
-- \slt_unit|LessThan0~13_cout\ = CARRY((\input_A~combout\(6) & ((!\slt_unit|LessThan0~11_cout\) # (!\input_B~combout\(6)))) # (!\input_A~combout\(6) & (!\input_B~combout\(6) & !\slt_unit|LessThan0~11_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \input_A~combout\(6),
	datab => \input_B~combout\(6),
	datad => VCC,
	cin => \slt_unit|LessThan0~11_cout\,
	cout => \slt_unit|LessThan0~13_cout\);

-- Location: LCCOMB_X9_Y11_N14
\slt_unit|LessThan0~15\ : cycloneii_lcell_comb
-- Equation(s):
-- \slt_unit|LessThan0~15_cout\ = CARRY((\input_B~combout\(7) & ((!\slt_unit|LessThan0~13_cout\) # (!\input_A~combout\(7)))) # (!\input_B~combout\(7) & (!\input_A~combout\(7) & !\slt_unit|LessThan0~13_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \input_B~combout\(7),
	datab => \input_A~combout\(7),
	datad => VCC,
	cin => \slt_unit|LessThan0~13_cout\,
	cout => \slt_unit|LessThan0~15_cout\);

-- Location: LCCOMB_X9_Y11_N16
\slt_unit|LessThan0~17\ : cycloneii_lcell_comb
-- Equation(s):
-- \slt_unit|LessThan0~17_cout\ = CARRY((\input_B~combout\(8) & (\input_A~combout\(8) & !\slt_unit|LessThan0~15_cout\)) # (!\input_B~combout\(8) & ((\input_A~combout\(8)) # (!\slt_unit|LessThan0~15_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \input_B~combout\(8),
	datab => \input_A~combout\(8),
	datad => VCC,
	cin => \slt_unit|LessThan0~15_cout\,
	cout => \slt_unit|LessThan0~17_cout\);

-- Location: LCCOMB_X9_Y11_N18
\slt_unit|LessThan0~19\ : cycloneii_lcell_comb
-- Equation(s):
-- \slt_unit|LessThan0~19_cout\ = CARRY((\input_B~combout\(9) & ((!\slt_unit|LessThan0~17_cout\) # (!\input_A~combout\(9)))) # (!\input_B~combout\(9) & (!\input_A~combout\(9) & !\slt_unit|LessThan0~17_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \input_B~combout\(9),
	datab => \input_A~combout\(9),
	datad => VCC,
	cin => \slt_unit|LessThan0~17_cout\,
	cout => \slt_unit|LessThan0~19_cout\);

-- Location: LCCOMB_X9_Y11_N20
\slt_unit|LessThan0~21\ : cycloneii_lcell_comb
-- Equation(s):
-- \slt_unit|LessThan0~21_cout\ = CARRY((\input_A~combout\(10) & ((!\slt_unit|LessThan0~19_cout\) # (!\input_B~combout\(10)))) # (!\input_A~combout\(10) & (!\input_B~combout\(10) & !\slt_unit|LessThan0~19_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \input_A~combout\(10),
	datab => \input_B~combout\(10),
	datad => VCC,
	cin => \slt_unit|LessThan0~19_cout\,
	cout => \slt_unit|LessThan0~21_cout\);

-- Location: LCCOMB_X9_Y11_N22
\slt_unit|LessThan0~23\ : cycloneii_lcell_comb
-- Equation(s):
-- \slt_unit|LessThan0~23_cout\ = CARRY((\input_A~combout\(11) & (\input_B~combout\(11) & !\slt_unit|LessThan0~21_cout\)) # (!\input_A~combout\(11) & ((\input_B~combout\(11)) # (!\slt_unit|LessThan0~21_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \input_A~combout\(11),
	datab => \input_B~combout\(11),
	datad => VCC,
	cin => \slt_unit|LessThan0~21_cout\,
	cout => \slt_unit|LessThan0~23_cout\);

-- Location: LCCOMB_X9_Y11_N24
\slt_unit|LessThan0~25\ : cycloneii_lcell_comb
-- Equation(s):
-- \slt_unit|LessThan0~25_cout\ = CARRY((\input_B~combout\(12) & (\input_A~combout\(12) & !\slt_unit|LessThan0~23_cout\)) # (!\input_B~combout\(12) & ((\input_A~combout\(12)) # (!\slt_unit|LessThan0~23_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \input_B~combout\(12),
	datab => \input_A~combout\(12),
	datad => VCC,
	cin => \slt_unit|LessThan0~23_cout\,
	cout => \slt_unit|LessThan0~25_cout\);

-- Location: LCCOMB_X9_Y11_N26
\slt_unit|LessThan0~27\ : cycloneii_lcell_comb
-- Equation(s):
-- \slt_unit|LessThan0~27_cout\ = CARRY((\input_A~combout\(13) & (\input_B~combout\(13) & !\slt_unit|LessThan0~25_cout\)) # (!\input_A~combout\(13) & ((\input_B~combout\(13)) # (!\slt_unit|LessThan0~25_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \input_A~combout\(13),
	datab => \input_B~combout\(13),
	datad => VCC,
	cin => \slt_unit|LessThan0~25_cout\,
	cout => \slt_unit|LessThan0~27_cout\);

-- Location: LCCOMB_X9_Y11_N28
\slt_unit|LessThan0~29\ : cycloneii_lcell_comb
-- Equation(s):
-- \slt_unit|LessThan0~29_cout\ = CARRY((\input_B~combout\(14) & (\input_A~combout\(14) & !\slt_unit|LessThan0~27_cout\)) # (!\input_B~combout\(14) & ((\input_A~combout\(14)) # (!\slt_unit|LessThan0~27_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \input_B~combout\(14),
	datab => \input_A~combout\(14),
	datad => VCC,
	cin => \slt_unit|LessThan0~27_cout\,
	cout => \slt_unit|LessThan0~29_cout\);

-- Location: LCCOMB_X9_Y11_N30
\slt_unit|LessThan0~31\ : cycloneii_lcell_comb
-- Equation(s):
-- \slt_unit|LessThan0~31_cout\ = CARRY((\input_A~combout\(15) & (\input_B~combout\(15) & !\slt_unit|LessThan0~29_cout\)) # (!\input_A~combout\(15) & ((\input_B~combout\(15)) # (!\slt_unit|LessThan0~29_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \input_A~combout\(15),
	datab => \input_B~combout\(15),
	datad => VCC,
	cin => \slt_unit|LessThan0~29_cout\,
	cout => \slt_unit|LessThan0~31_cout\);

-- Location: LCCOMB_X9_Y10_N0
\slt_unit|LessThan0~33\ : cycloneii_lcell_comb
-- Equation(s):
-- \slt_unit|LessThan0~33_cout\ = CARRY((\input_A~combout\(16) & ((!\slt_unit|LessThan0~31_cout\) # (!\input_B~combout\(16)))) # (!\input_A~combout\(16) & (!\input_B~combout\(16) & !\slt_unit|LessThan0~31_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \input_A~combout\(16),
	datab => \input_B~combout\(16),
	datad => VCC,
	cin => \slt_unit|LessThan0~31_cout\,
	cout => \slt_unit|LessThan0~33_cout\);

-- Location: LCCOMB_X9_Y10_N2
\slt_unit|LessThan0~35\ : cycloneii_lcell_comb
-- Equation(s):
-- \slt_unit|LessThan0~35_cout\ = CARRY((\input_B~combout\(17) & ((!\slt_unit|LessThan0~33_cout\) # (!\input_A~combout\(17)))) # (!\input_B~combout\(17) & (!\input_A~combout\(17) & !\slt_unit|LessThan0~33_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \input_B~combout\(17),
	datab => \input_A~combout\(17),
	datad => VCC,
	cin => \slt_unit|LessThan0~33_cout\,
	cout => \slt_unit|LessThan0~35_cout\);

-- Location: LCCOMB_X9_Y10_N4
\slt_unit|LessThan0~37\ : cycloneii_lcell_comb
-- Equation(s):
-- \slt_unit|LessThan0~37_cout\ = CARRY((\input_B~combout\(18) & (\input_A~combout\(18) & !\slt_unit|LessThan0~35_cout\)) # (!\input_B~combout\(18) & ((\input_A~combout\(18)) # (!\slt_unit|LessThan0~35_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \input_B~combout\(18),
	datab => \input_A~combout\(18),
	datad => VCC,
	cin => \slt_unit|LessThan0~35_cout\,
	cout => \slt_unit|LessThan0~37_cout\);

-- Location: LCCOMB_X9_Y10_N6
\slt_unit|LessThan0~39\ : cycloneii_lcell_comb
-- Equation(s):
-- \slt_unit|LessThan0~39_cout\ = CARRY((\input_A~combout\(19) & (\input_B~combout\(19) & !\slt_unit|LessThan0~37_cout\)) # (!\input_A~combout\(19) & ((\input_B~combout\(19)) # (!\slt_unit|LessThan0~37_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \input_A~combout\(19),
	datab => \input_B~combout\(19),
	datad => VCC,
	cin => \slt_unit|LessThan0~37_cout\,
	cout => \slt_unit|LessThan0~39_cout\);

-- Location: LCCOMB_X9_Y10_N8
\slt_unit|LessThan0~41\ : cycloneii_lcell_comb
-- Equation(s):
-- \slt_unit|LessThan0~41_cout\ = CARRY((\input_A~combout\(20) & ((!\slt_unit|LessThan0~39_cout\) # (!\input_B~combout\(20)))) # (!\input_A~combout\(20) & (!\input_B~combout\(20) & !\slt_unit|LessThan0~39_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \input_A~combout\(20),
	datab => \input_B~combout\(20),
	datad => VCC,
	cin => \slt_unit|LessThan0~39_cout\,
	cout => \slt_unit|LessThan0~41_cout\);

-- Location: LCCOMB_X9_Y10_N10
\slt_unit|LessThan0~43\ : cycloneii_lcell_comb
-- Equation(s):
-- \slt_unit|LessThan0~43_cout\ = CARRY((\input_A~combout\(21) & (\input_B~combout\(21) & !\slt_unit|LessThan0~41_cout\)) # (!\input_A~combout\(21) & ((\input_B~combout\(21)) # (!\slt_unit|LessThan0~41_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \input_A~combout\(21),
	datab => \input_B~combout\(21),
	datad => VCC,
	cin => \slt_unit|LessThan0~41_cout\,
	cout => \slt_unit|LessThan0~43_cout\);

-- Location: LCCOMB_X9_Y10_N12
\slt_unit|LessThan0~45\ : cycloneii_lcell_comb
-- Equation(s):
-- \slt_unit|LessThan0~45_cout\ = CARRY((\input_A~combout\(22) & ((!\slt_unit|LessThan0~43_cout\) # (!\input_B~combout\(22)))) # (!\input_A~combout\(22) & (!\input_B~combout\(22) & !\slt_unit|LessThan0~43_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \input_A~combout\(22),
	datab => \input_B~combout\(22),
	datad => VCC,
	cin => \slt_unit|LessThan0~43_cout\,
	cout => \slt_unit|LessThan0~45_cout\);

-- Location: LCCOMB_X9_Y10_N14
\slt_unit|LessThan0~47\ : cycloneii_lcell_comb
-- Equation(s):
-- \slt_unit|LessThan0~47_cout\ = CARRY((\input_B~combout\(23) & ((!\slt_unit|LessThan0~45_cout\) # (!\input_A~combout\(23)))) # (!\input_B~combout\(23) & (!\input_A~combout\(23) & !\slt_unit|LessThan0~45_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \input_B~combout\(23),
	datab => \input_A~combout\(23),
	datad => VCC,
	cin => \slt_unit|LessThan0~45_cout\,
	cout => \slt_unit|LessThan0~47_cout\);

-- Location: LCCOMB_X9_Y10_N16
\slt_unit|LessThan0~49\ : cycloneii_lcell_comb
-- Equation(s):
-- \slt_unit|LessThan0~49_cout\ = CARRY((\input_A~combout\(24) & ((!\slt_unit|LessThan0~47_cout\) # (!\input_B~combout\(24)))) # (!\input_A~combout\(24) & (!\input_B~combout\(24) & !\slt_unit|LessThan0~47_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \input_A~combout\(24),
	datab => \input_B~combout\(24),
	datad => VCC,
	cin => \slt_unit|LessThan0~47_cout\,
	cout => \slt_unit|LessThan0~49_cout\);

-- Location: LCCOMB_X9_Y10_N18
\slt_unit|LessThan0~51\ : cycloneii_lcell_comb
-- Equation(s):
-- \slt_unit|LessThan0~51_cout\ = CARRY((\input_A~combout\(25) & (\input_B~combout\(25) & !\slt_unit|LessThan0~49_cout\)) # (!\input_A~combout\(25) & ((\input_B~combout\(25)) # (!\slt_unit|LessThan0~49_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \input_A~combout\(25),
	datab => \input_B~combout\(25),
	datad => VCC,
	cin => \slt_unit|LessThan0~49_cout\,
	cout => \slt_unit|LessThan0~51_cout\);

-- Location: LCCOMB_X9_Y10_N20
\slt_unit|LessThan0~53\ : cycloneii_lcell_comb
-- Equation(s):
-- \slt_unit|LessThan0~53_cout\ = CARRY((\input_A~combout\(26) & ((!\slt_unit|LessThan0~51_cout\) # (!\input_B~combout\(26)))) # (!\input_A~combout\(26) & (!\input_B~combout\(26) & !\slt_unit|LessThan0~51_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \input_A~combout\(26),
	datab => \input_B~combout\(26),
	datad => VCC,
	cin => \slt_unit|LessThan0~51_cout\,
	cout => \slt_unit|LessThan0~53_cout\);

-- Location: LCCOMB_X9_Y10_N22
\slt_unit|LessThan0~55\ : cycloneii_lcell_comb
-- Equation(s):
-- \slt_unit|LessThan0~55_cout\ = CARRY((\input_A~combout\(27) & (\input_B~combout\(27) & !\slt_unit|LessThan0~53_cout\)) # (!\input_A~combout\(27) & ((\input_B~combout\(27)) # (!\slt_unit|LessThan0~53_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \input_A~combout\(27),
	datab => \input_B~combout\(27),
	datad => VCC,
	cin => \slt_unit|LessThan0~53_cout\,
	cout => \slt_unit|LessThan0~55_cout\);

-- Location: LCCOMB_X9_Y10_N24
\slt_unit|LessThan0~57\ : cycloneii_lcell_comb
-- Equation(s):
-- \slt_unit|LessThan0~57_cout\ = CARRY((\input_B~combout\(28) & (\input_A~combout\(28) & !\slt_unit|LessThan0~55_cout\)) # (!\input_B~combout\(28) & ((\input_A~combout\(28)) # (!\slt_unit|LessThan0~55_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \input_B~combout\(28),
	datab => \input_A~combout\(28),
	datad => VCC,
	cin => \slt_unit|LessThan0~55_cout\,
	cout => \slt_unit|LessThan0~57_cout\);

-- Location: LCCOMB_X9_Y10_N26
\slt_unit|LessThan0~59\ : cycloneii_lcell_comb
-- Equation(s):
-- \slt_unit|LessThan0~59_cout\ = CARRY((\input_B~combout\(29) & ((!\slt_unit|LessThan0~57_cout\) # (!\input_A~combout\(29)))) # (!\input_B~combout\(29) & (!\input_A~combout\(29) & !\slt_unit|LessThan0~57_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \input_B~combout\(29),
	datab => \input_A~combout\(29),
	datad => VCC,
	cin => \slt_unit|LessThan0~57_cout\,
	cout => \slt_unit|LessThan0~59_cout\);

-- Location: LCCOMB_X9_Y10_N28
\slt_unit|LessThan0~61\ : cycloneii_lcell_comb
-- Equation(s):
-- \slt_unit|LessThan0~61_cout\ = CARRY((\input_A~combout\(30) & ((!\slt_unit|LessThan0~59_cout\) # (!\input_B~combout\(30)))) # (!\input_A~combout\(30) & (!\input_B~combout\(30) & !\slt_unit|LessThan0~59_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \input_A~combout\(30),
	datab => \input_B~combout\(30),
	datad => VCC,
	cin => \slt_unit|LessThan0~59_cout\,
	cout => \slt_unit|LessThan0~61_cout\);

-- Location: LCCOMB_X9_Y10_N30
\slt_unit|LessThan0~62\ : cycloneii_lcell_comb
-- Equation(s):
-- \slt_unit|LessThan0~62_combout\ = (\input_B~combout\(31) & (\input_A~combout\(31) & \slt_unit|LessThan0~61_cout\)) # (!\input_B~combout\(31) & ((\input_A~combout\(31)) # (\slt_unit|LessThan0~61_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101010011010100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \input_B~combout\(31),
	datab => \input_A~combout\(31),
	cin => \slt_unit|LessThan0~61_cout\,
	combout => \slt_unit|LessThan0~62_combout\);

-- Location: LCCOMB_X8_Y10_N20
\func_mux_unit|Mux31~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \func_mux_unit|Mux31~2_combout\ = (\aluop~combout\(2) & (\func_mux_unit|Mux31~1_combout\ & ((\slt_unit|LessThan0~62_combout\) # (!\func_mux_unit|Mux31~0_combout\)))) # (!\aluop~combout\(2) & (\func_mux_unit|Mux31~1_combout\ $ 
-- ((\func_mux_unit|Mux31~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001110000011100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \aluop~combout\(2),
	datab => \func_mux_unit|Mux31~1_combout\,
	datac => \func_mux_unit|Mux31~0_combout\,
	datad => \slt_unit|LessThan0~62_combout\,
	combout => \func_mux_unit|Mux31~2_combout\);

-- Location: PIN_F9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\aluop[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_aluop(0),
	combout => \aluop~combout\(0));

-- Location: LCCOMB_X18_Y10_N16
\func_mux_unit|Mux30~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \func_mux_unit|Mux30~2_combout\ = (!\aluop~combout\(1) & (!\aluop~combout\(2) & \aluop~combout\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \aluop~combout\(1),
	datac => \aluop~combout\(2),
	datad => \aluop~combout\(0),
	combout => \func_mux_unit|Mux30~2_combout\);

-- Location: LCCOMB_X8_Y10_N18
\addsub_unit|addder|bit_0|and_1|output\ : cycloneii_lcell_comb
-- Equation(s):
-- \addsub_unit|addder|bit_0|and_1|output~combout\ = (\input_A~combout\(0) & (\input_B~combout\(0) $ (\aluop~combout\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \input_A~combout\(0),
	datac => \input_B~combout\(0),
	datad => \aluop~combout\(2),
	combout => \addsub_unit|addder|bit_0|and_1|output~combout\);

-- Location: LCCOMB_X8_Y10_N16
\addsub_unit|sub_inv|output[1]\ : cycloneii_lcell_comb
-- Equation(s):
-- \addsub_unit|sub_inv|output\(1) = \input_B~combout\(1) $ (\aluop~combout\(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \input_B~combout\(1),
	datad => \aluop~combout\(2),
	combout => \addsub_unit|sub_inv|output\(1));

-- Location: PIN_R8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\input_A[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_input_A(1),
	combout => \input_A~combout\(1));

-- Location: LCCOMB_X8_Y10_N14
\addsub_unit|addder|bit_1|xor_2|output\ : cycloneii_lcell_comb
-- Equation(s):
-- \addsub_unit|addder|bit_1|xor_2|output~combout\ = \addsub_unit|sub_inv|output\(1) $ (\input_A~combout\(1) $ (((\addsub_unit|addder|bit_0|and_2|output~combout\) # (\addsub_unit|addder|bit_0|and_1|output~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100011110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \addsub_unit|addder|bit_0|and_2|output~combout\,
	datab => \addsub_unit|addder|bit_0|and_1|output~combout\,
	datac => \addsub_unit|sub_inv|output\(1),
	datad => \input_A~combout\(1),
	combout => \addsub_unit|addder|bit_1|xor_2|output~combout\);

-- Location: LCCOMB_X8_Y10_N0
\func_mux_unit|Mux30~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \func_mux_unit|Mux30~1_combout\ = (!\aluop~combout\(0) & ((\func_mux_unit|Mux30~0_combout\) # ((\addsub_unit|addder|bit_1|xor_2|output~combout\ & \aluop~combout\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \func_mux_unit|Mux30~0_combout\,
	datab => \addsub_unit|addder|bit_1|xor_2|output~combout\,
	datac => \aluop~combout\(1),
	datad => \aluop~combout\(0),
	combout => \func_mux_unit|Mux30~1_combout\);

-- Location: LCCOMB_X8_Y10_N10
\func_mux_unit|Mux30~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \func_mux_unit|Mux30~3_combout\ = (\func_mux_unit|Mux30~1_combout\) # ((\func_mux_unit|Mux30~2_combout\ & ((\input_B~combout\(1)) # (\input_A~combout\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \func_mux_unit|Mux30~2_combout\,
	datab => \func_mux_unit|Mux30~1_combout\,
	datac => \input_B~combout\(1),
	datad => \input_A~combout\(1),
	combout => \func_mux_unit|Mux30~3_combout\);

-- Location: PIN_D4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\input_A[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_input_A(2),
	combout => \input_A~combout\(2));

-- Location: LCCOMB_X8_Y10_N28
\addsub_unit|addder|bit_1|or_1|output~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \addsub_unit|addder|bit_1|or_1|output~0_combout\ = (\addsub_unit|sub_inv|output\(1) & ((\addsub_unit|addder|bit_0|and_2|output~combout\) # ((\addsub_unit|addder|bit_0|and_1|output~combout\) # (\input_A~combout\(1))))) # (!\addsub_unit|sub_inv|output\(1) & 
-- (\input_A~combout\(1) & ((\addsub_unit|addder|bit_0|and_2|output~combout\) # (\addsub_unit|addder|bit_0|and_1|output~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \addsub_unit|addder|bit_0|and_2|output~combout\,
	datab => \addsub_unit|addder|bit_0|and_1|output~combout\,
	datac => \addsub_unit|sub_inv|output\(1),
	datad => \input_A~combout\(1),
	combout => \addsub_unit|addder|bit_1|or_1|output~0_combout\);

-- Location: LCCOMB_X8_Y11_N20
\func_mux_unit|Mux29~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \func_mux_unit|Mux29~1_combout\ = (\aluop~combout\(1) & (\input_A~combout\(2) $ (\aluop~combout\(2) $ (\input_B~combout\(2))))) # (!\aluop~combout\(1) & (\input_A~combout\(2) & (!\aluop~combout\(2) & \input_B~combout\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000011000101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \aluop~combout\(1),
	datab => \input_A~combout\(2),
	datac => \aluop~combout\(2),
	datad => \input_B~combout\(2),
	combout => \func_mux_unit|Mux29~1_combout\);

-- Location: LCCOMB_X8_Y11_N14
\func_mux_unit|Mux29~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \func_mux_unit|Mux29~2_combout\ = (!\aluop~combout\(0) & (\func_mux_unit|Mux29~1_combout\ $ (((\aluop~combout\(1) & \addsub_unit|addder|bit_1|or_1|output~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \aluop~combout\(1),
	datab => \addsub_unit|addder|bit_1|or_1|output~0_combout\,
	datac => \func_mux_unit|Mux29~1_combout\,
	datad => \aluop~combout\(0),
	combout => \func_mux_unit|Mux29~2_combout\);

-- Location: LCCOMB_X8_Y11_N16
\func_mux_unit|Mux29~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \func_mux_unit|Mux29~0_combout\ = (\func_mux_unit|Mux29~2_combout\) # ((\func_mux_unit|Mux30~2_combout\ & ((\input_B~combout\(2)) # (\input_A~combout\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \input_B~combout\(2),
	datab => \input_A~combout\(2),
	datac => \func_mux_unit|Mux29~2_combout\,
	datad => \func_mux_unit|Mux30~2_combout\,
	combout => \func_mux_unit|Mux29~0_combout\);

-- Location: LCCOMB_X8_Y11_N2
\addsub_unit|addder|bit_2|or_1|output~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \addsub_unit|addder|bit_2|or_1|output~0_combout\ = (\input_A~combout\(2) & ((\addsub_unit|addder|bit_1|or_1|output~0_combout\) # (\input_B~combout\(2) $ (\aluop~combout\(2))))) # (!\input_A~combout\(2) & (\addsub_unit|addder|bit_1|or_1|output~0_combout\ & 
-- (\input_B~combout\(2) $ (\aluop~combout\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111001001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \input_B~combout\(2),
	datab => \input_A~combout\(2),
	datac => \aluop~combout\(2),
	datad => \addsub_unit|addder|bit_1|or_1|output~0_combout\,
	combout => \addsub_unit|addder|bit_2|or_1|output~0_combout\);

-- Location: LCCOMB_X8_Y11_N8
\func_mux_unit|Mux28~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \func_mux_unit|Mux28~1_combout\ = (\aluop~combout\(1) & (\input_B~combout\(3) $ (\aluop~combout\(2) $ (\input_A~combout\(3))))) # (!\aluop~combout\(1) & (\input_B~combout\(3) & (!\aluop~combout\(2) & \input_A~combout\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001001001100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \input_B~combout\(3),
	datab => \aluop~combout\(2),
	datac => \aluop~combout\(1),
	datad => \input_A~combout\(3),
	combout => \func_mux_unit|Mux28~1_combout\);

-- Location: LCCOMB_X8_Y11_N26
\func_mux_unit|Mux28~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \func_mux_unit|Mux28~2_combout\ = (!\aluop~combout\(0) & (\func_mux_unit|Mux28~1_combout\ $ (((\aluop~combout\(1) & \addsub_unit|addder|bit_2|or_1|output~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \aluop~combout\(1),
	datab => \addsub_unit|addder|bit_2|or_1|output~0_combout\,
	datac => \func_mux_unit|Mux28~1_combout\,
	datad => \aluop~combout\(0),
	combout => \func_mux_unit|Mux28~2_combout\);

-- Location: PIN_F3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\input_B[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_input_B(3),
	combout => \input_B~combout\(3));

-- Location: LCCOMB_X8_Y11_N4
\func_mux_unit|Mux28~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \func_mux_unit|Mux28~0_combout\ = (\func_mux_unit|Mux28~2_combout\) # ((\func_mux_unit|Mux30~2_combout\ & ((\input_A~combout\(3)) # (\input_B~combout\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \input_A~combout\(3),
	datab => \func_mux_unit|Mux28~2_combout\,
	datac => \input_B~combout\(3),
	datad => \func_mux_unit|Mux30~2_combout\,
	combout => \func_mux_unit|Mux28~0_combout\);

-- Location: LCCOMB_X8_Y11_N22
\addsub_unit|addder|bit_3|or_1|output~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \addsub_unit|addder|bit_3|or_1|output~0_combout\ = (\input_A~combout\(3) & ((\addsub_unit|addder|bit_2|or_1|output~0_combout\) # (\input_B~combout\(3) $ (\aluop~combout\(2))))) # (!\input_A~combout\(3) & (\addsub_unit|addder|bit_2|or_1|output~0_combout\ & 
-- (\input_B~combout\(3) $ (\aluop~combout\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111001001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \input_B~combout\(3),
	datab => \input_A~combout\(3),
	datac => \aluop~combout\(2),
	datad => \addsub_unit|addder|bit_2|or_1|output~0_combout\,
	combout => \addsub_unit|addder|bit_3|or_1|output~0_combout\);

-- Location: LCCOMB_X8_Y11_N30
\func_mux_unit|Mux27~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \func_mux_unit|Mux27~2_combout\ = (!\aluop~combout\(0) & (\func_mux_unit|Mux27~1_combout\ $ (((\addsub_unit|addder|bit_3|or_1|output~0_combout\ & \aluop~combout\(1))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \func_mux_unit|Mux27~1_combout\,
	datab => \addsub_unit|addder|bit_3|or_1|output~0_combout\,
	datac => \aluop~combout\(1),
	datad => \aluop~combout\(0),
	combout => \func_mux_unit|Mux27~2_combout\);

-- Location: PIN_J2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\input_B[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_input_B(4),
	combout => \input_B~combout\(4));

-- Location: LCCOMB_X8_Y11_N0
\func_mux_unit|Mux27~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \func_mux_unit|Mux27~0_combout\ = (\func_mux_unit|Mux27~2_combout\) # ((\func_mux_unit|Mux30~2_combout\ & ((\input_A~combout\(4)) # (\input_B~combout\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \input_A~combout\(4),
	datab => \func_mux_unit|Mux27~2_combout\,
	datac => \input_B~combout\(4),
	datad => \func_mux_unit|Mux30~2_combout\,
	combout => \func_mux_unit|Mux27~0_combout\);

-- Location: LCCOMB_X8_Y11_N18
\addsub_unit|addder|bit_4|or_1|output~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \addsub_unit|addder|bit_4|or_1|output~0_combout\ = (\input_A~combout\(4) & ((\addsub_unit|addder|bit_3|or_1|output~0_combout\) # (\input_B~combout\(4) $ (\aluop~combout\(2))))) # (!\input_A~combout\(4) & (\addsub_unit|addder|bit_3|or_1|output~0_combout\ & 
-- (\input_B~combout\(4) $ (\aluop~combout\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011111000101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \input_A~combout\(4),
	datab => \input_B~combout\(4),
	datac => \aluop~combout\(2),
	datad => \addsub_unit|addder|bit_3|or_1|output~0_combout\,
	combout => \addsub_unit|addder|bit_4|or_1|output~0_combout\);

-- Location: PIN_H2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\input_B[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_input_B(5),
	combout => \input_B~combout\(5));

-- Location: LCCOMB_X8_Y11_N24
\func_mux_unit|Mux26~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \func_mux_unit|Mux26~1_combout\ = (\aluop~combout\(1) & (\input_B~combout\(5) $ (\aluop~combout\(2) $ (\input_A~combout\(5))))) # (!\aluop~combout\(1) & (\input_B~combout\(5) & (!\aluop~combout\(2) & \input_A~combout\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000011000101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \aluop~combout\(1),
	datab => \input_B~combout\(5),
	datac => \aluop~combout\(2),
	datad => \input_A~combout\(5),
	combout => \func_mux_unit|Mux26~1_combout\);

-- Location: LCCOMB_X8_Y11_N10
\func_mux_unit|Mux26~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \func_mux_unit|Mux26~2_combout\ = (!\aluop~combout\(0) & (\func_mux_unit|Mux26~1_combout\ $ (((\aluop~combout\(1) & \addsub_unit|addder|bit_4|or_1|output~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \aluop~combout\(1),
	datab => \addsub_unit|addder|bit_4|or_1|output~0_combout\,
	datac => \func_mux_unit|Mux26~1_combout\,
	datad => \aluop~combout\(0),
	combout => \func_mux_unit|Mux26~2_combout\);

-- Location: LCCOMB_X8_Y11_N28
\func_mux_unit|Mux26~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \func_mux_unit|Mux26~0_combout\ = (\func_mux_unit|Mux26~2_combout\) # ((\func_mux_unit|Mux30~2_combout\ & ((\input_B~combout\(5)) # (\input_A~combout\(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \func_mux_unit|Mux26~2_combout\,
	datab => \input_B~combout\(5),
	datac => \input_A~combout\(5),
	datad => \func_mux_unit|Mux30~2_combout\,
	combout => \func_mux_unit|Mux26~0_combout\);

-- Location: PIN_E4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\input_A[6]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_input_A(6),
	combout => \input_A~combout\(6));

-- Location: LCCOMB_X8_Y9_N22
\func_mux_unit|Mux25~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \func_mux_unit|Mux25~1_combout\ = (\aluop~combout\(1) & (\aluop~combout\(2) $ (\input_B~combout\(6) $ (\input_A~combout\(6))))) # (!\aluop~combout\(1) & (!\aluop~combout\(2) & (\input_B~combout\(6) & \input_A~combout\(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \aluop~combout\(2),
	datab => \input_B~combout\(6),
	datac => \input_A~combout\(6),
	datad => \aluop~combout\(1),
	combout => \func_mux_unit|Mux25~1_combout\);

-- Location: LCCOMB_X8_Y9_N16
\func_mux_unit|Mux25~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \func_mux_unit|Mux25~2_combout\ = (!\aluop~combout\(0) & (\func_mux_unit|Mux25~1_combout\ $ (((\addsub_unit|addder|bit_5|or_1|output~0_combout\ & \aluop~combout\(1))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000011000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \addsub_unit|addder|bit_5|or_1|output~0_combout\,
	datab => \func_mux_unit|Mux25~1_combout\,
	datac => \aluop~combout\(0),
	datad => \aluop~combout\(1),
	combout => \func_mux_unit|Mux25~2_combout\);

-- Location: LCCOMB_X8_Y9_N0
\func_mux_unit|Mux25~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \func_mux_unit|Mux25~0_combout\ = (\func_mux_unit|Mux25~2_combout\) # ((\func_mux_unit|Mux30~2_combout\ & ((\input_B~combout\(6)) # (\input_A~combout\(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \func_mux_unit|Mux25~2_combout\,
	datab => \input_B~combout\(6),
	datac => \input_A~combout\(6),
	datad => \func_mux_unit|Mux30~2_combout\,
	combout => \func_mux_unit|Mux25~0_combout\);

-- Location: PIN_M3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\input_B[7]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_input_B(7),
	combout => \input_B~combout\(7));

-- Location: LCCOMB_X8_Y9_N26
\func_mux_unit|Mux24~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \func_mux_unit|Mux24~1_combout\ = (\aluop~combout\(1) & (\input_B~combout\(7) $ (\aluop~combout\(2) $ (\input_A~combout\(7))))) # (!\aluop~combout\(1) & (\input_B~combout\(7) & (!\aluop~combout\(2) & \input_A~combout\(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \input_B~combout\(7),
	datab => \aluop~combout\(2),
	datac => \input_A~combout\(7),
	datad => \aluop~combout\(1),
	combout => \func_mux_unit|Mux24~1_combout\);

-- Location: LCCOMB_X8_Y9_N2
\addsub_unit|addder|bit_6|or_1|output~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \addsub_unit|addder|bit_6|or_1|output~0_combout\ = (\addsub_unit|addder|bit_5|or_1|output~0_combout\ & ((\input_A~combout\(6)) # (\input_B~combout\(6) $ (\aluop~combout\(2))))) # (!\addsub_unit|addder|bit_5|or_1|output~0_combout\ & (\input_A~combout\(6) & 
-- (\input_B~combout\(6) $ (\aluop~combout\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011001011101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \addsub_unit|addder|bit_5|or_1|output~0_combout\,
	datab => \input_B~combout\(6),
	datac => \input_A~combout\(6),
	datad => \aluop~combout\(2),
	combout => \addsub_unit|addder|bit_6|or_1|output~0_combout\);

-- Location: LCCOMB_X8_Y9_N28
\func_mux_unit|Mux24~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \func_mux_unit|Mux24~2_combout\ = (!\aluop~combout\(0) & (\func_mux_unit|Mux24~1_combout\ $ (((\aluop~combout\(1) & \addsub_unit|addder|bit_6|or_1|output~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000011000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \aluop~combout\(1),
	datab => \func_mux_unit|Mux24~1_combout\,
	datac => \aluop~combout\(0),
	datad => \addsub_unit|addder|bit_6|or_1|output~0_combout\,
	combout => \func_mux_unit|Mux24~2_combout\);

-- Location: LCCOMB_X8_Y9_N4
\func_mux_unit|Mux24~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \func_mux_unit|Mux24~0_combout\ = (\func_mux_unit|Mux24~2_combout\) # ((\func_mux_unit|Mux30~2_combout\ & ((\input_B~combout\(7)) # (\input_A~combout\(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \input_B~combout\(7),
	datab => \func_mux_unit|Mux24~2_combout\,
	datac => \input_A~combout\(7),
	datad => \func_mux_unit|Mux30~2_combout\,
	combout => \func_mux_unit|Mux24~0_combout\);

-- Location: LCCOMB_X8_Y9_N30
\addsub_unit|addder|bit_7|or_1|output~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \addsub_unit|addder|bit_7|or_1|output~0_combout\ = (\addsub_unit|addder|bit_6|or_1|output~0_combout\ & ((\input_A~combout\(7)) # (\input_B~combout\(7) $ (\aluop~combout\(2))))) # (!\addsub_unit|addder|bit_6|or_1|output~0_combout\ & (\input_A~combout\(7) & 
-- (\input_B~combout\(7) $ (\aluop~combout\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101010011101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \input_B~combout\(7),
	datab => \addsub_unit|addder|bit_6|or_1|output~0_combout\,
	datac => \input_A~combout\(7),
	datad => \aluop~combout\(2),
	combout => \addsub_unit|addder|bit_7|or_1|output~0_combout\);

-- Location: LCCOMB_X8_Y9_N24
\func_mux_unit|Mux23~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \func_mux_unit|Mux23~2_combout\ = (!\aluop~combout\(0) & (\func_mux_unit|Mux23~1_combout\ $ (((\addsub_unit|addder|bit_7|or_1|output~0_combout\ & \aluop~combout\(1))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000011000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \func_mux_unit|Mux23~1_combout\,
	datab => \addsub_unit|addder|bit_7|or_1|output~0_combout\,
	datac => \aluop~combout\(0),
	datad => \aluop~combout\(1),
	combout => \func_mux_unit|Mux23~2_combout\);

-- Location: PIN_J4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\input_B[8]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_input_B(8),
	combout => \input_B~combout\(8));

-- Location: LCCOMB_X8_Y9_N8
\func_mux_unit|Mux23~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \func_mux_unit|Mux23~0_combout\ = (\func_mux_unit|Mux23~2_combout\) # ((\func_mux_unit|Mux30~2_combout\ & ((\input_A~combout\(8)) # (\input_B~combout\(8)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \func_mux_unit|Mux23~2_combout\,
	datab => \input_A~combout\(8),
	datac => \input_B~combout\(8),
	datad => \func_mux_unit|Mux30~2_combout\,
	combout => \func_mux_unit|Mux23~0_combout\);

-- Location: PIN_L8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\input_B[9]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_input_B(9),
	combout => \input_B~combout\(9));

-- Location: LCCOMB_X8_Y9_N18
\addsub_unit|addder|bit_8|or_1|output~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \addsub_unit|addder|bit_8|or_1|output~0_combout\ = (\input_A~combout\(8) & ((\addsub_unit|addder|bit_7|or_1|output~0_combout\) # (\aluop~combout\(2) $ (\input_B~combout\(8))))) # (!\input_A~combout\(8) & (\addsub_unit|addder|bit_7|or_1|output~0_combout\ & 
-- (\aluop~combout\(2) $ (\input_B~combout\(8)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111001001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \aluop~combout\(2),
	datab => \input_A~combout\(8),
	datac => \input_B~combout\(8),
	datad => \addsub_unit|addder|bit_7|or_1|output~0_combout\,
	combout => \addsub_unit|addder|bit_8|or_1|output~0_combout\);

-- Location: LCCOMB_X9_Y9_N20
\func_mux_unit|Mux22~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \func_mux_unit|Mux22~1_combout\ = (\aluop~combout\(1) & (\input_B~combout\(9) $ (\input_A~combout\(9) $ (\aluop~combout\(2))))) # (!\aluop~combout\(1) & (\input_B~combout\(9) & (\input_A~combout\(9) & !\aluop~combout\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001000001101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \input_B~combout\(9),
	datab => \input_A~combout\(9),
	datac => \aluop~combout\(1),
	datad => \aluop~combout\(2),
	combout => \func_mux_unit|Mux22~1_combout\);

-- Location: LCCOMB_X9_Y9_N14
\func_mux_unit|Mux22~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \func_mux_unit|Mux22~2_combout\ = (!\aluop~combout\(0) & (\func_mux_unit|Mux22~1_combout\ $ (((\aluop~combout\(1) & \addsub_unit|addder|bit_8|or_1|output~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \aluop~combout\(1),
	datab => \addsub_unit|addder|bit_8|or_1|output~0_combout\,
	datac => \func_mux_unit|Mux22~1_combout\,
	datad => \aluop~combout\(0),
	combout => \func_mux_unit|Mux22~2_combout\);

-- Location: LCCOMB_X9_Y9_N16
\func_mux_unit|Mux22~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \func_mux_unit|Mux22~0_combout\ = (\func_mux_unit|Mux22~2_combout\) # ((\func_mux_unit|Mux30~2_combout\ & ((\input_B~combout\(9)) # (\input_A~combout\(9)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \input_B~combout\(9),
	datab => \func_mux_unit|Mux22~2_combout\,
	datac => \input_A~combout\(9),
	datad => \func_mux_unit|Mux30~2_combout\,
	combout => \func_mux_unit|Mux22~0_combout\);

-- Location: PIN_F7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\input_A[10]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_input_A(10),
	combout => \input_A~combout\(10));

-- Location: LCCOMB_X9_Y9_N0
\func_mux_unit|Mux21~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \func_mux_unit|Mux21~1_combout\ = (\aluop~combout\(1) & (\aluop~combout\(2) $ (\input_A~combout\(10) $ (\input_B~combout\(10))))) # (!\aluop~combout\(1) & (!\aluop~combout\(2) & (\input_A~combout\(10) & \input_B~combout\(10))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001010001100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \aluop~combout\(2),
	datab => \input_A~combout\(10),
	datac => \aluop~combout\(1),
	datad => \input_B~combout\(10),
	combout => \func_mux_unit|Mux21~1_combout\);

-- Location: LCCOMB_X9_Y9_N26
\func_mux_unit|Mux21~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \func_mux_unit|Mux21~2_combout\ = (!\aluop~combout\(0) & (\func_mux_unit|Mux21~1_combout\ $ (((\addsub_unit|addder|bit_9|or_1|output~0_combout\ & \aluop~combout\(1))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \addsub_unit|addder|bit_9|or_1|output~0_combout\,
	datab => \func_mux_unit|Mux21~1_combout\,
	datac => \aluop~combout\(1),
	datad => \aluop~combout\(0),
	combout => \func_mux_unit|Mux21~2_combout\);

-- Location: LCCOMB_X9_Y9_N12
\func_mux_unit|Mux21~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \func_mux_unit|Mux21~0_combout\ = (\func_mux_unit|Mux21~2_combout\) # ((\func_mux_unit|Mux30~2_combout\ & ((\input_A~combout\(10)) # (\input_B~combout\(10)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \func_mux_unit|Mux30~2_combout\,
	datab => \func_mux_unit|Mux21~2_combout\,
	datac => \input_A~combout\(10),
	datad => \input_B~combout\(10),
	combout => \func_mux_unit|Mux21~0_combout\);

-- Location: PIN_M2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\input_A[11]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_input_A(11),
	combout => \input_A~combout\(11));

-- Location: LCCOMB_X9_Y9_N30
\addsub_unit|addder|bit_10|or_1|output~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \addsub_unit|addder|bit_10|or_1|output~0_combout\ = (\addsub_unit|addder|bit_9|or_1|output~0_combout\ & ((\input_A~combout\(10)) # (\input_B~combout\(10) $ (\aluop~combout\(2))))) # (!\addsub_unit|addder|bit_9|or_1|output~0_combout\ & 
-- (\input_A~combout\(10) & (\input_B~combout\(10) $ (\aluop~combout\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011001011101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \addsub_unit|addder|bit_9|or_1|output~0_combout\,
	datab => \input_B~combout\(10),
	datac => \input_A~combout\(10),
	datad => \aluop~combout\(2),
	combout => \addsub_unit|addder|bit_10|or_1|output~0_combout\);

-- Location: LCCOMB_X9_Y9_N22
\func_mux_unit|Mux20~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \func_mux_unit|Mux20~2_combout\ = (!\aluop~combout\(0) & (\func_mux_unit|Mux20~1_combout\ $ (((\addsub_unit|addder|bit_10|or_1|output~0_combout\ & \aluop~combout\(1))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \func_mux_unit|Mux20~1_combout\,
	datab => \addsub_unit|addder|bit_10|or_1|output~0_combout\,
	datac => \aluop~combout\(1),
	datad => \aluop~combout\(0),
	combout => \func_mux_unit|Mux20~2_combout\);

-- Location: LCCOMB_X9_Y9_N8
\func_mux_unit|Mux20~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \func_mux_unit|Mux20~0_combout\ = (\func_mux_unit|Mux20~2_combout\) # ((\func_mux_unit|Mux30~2_combout\ & ((\input_A~combout\(11)) # (\input_B~combout\(11)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \input_A~combout\(11),
	datab => \func_mux_unit|Mux20~2_combout\,
	datac => \input_B~combout\(11),
	datad => \func_mux_unit|Mux30~2_combout\,
	combout => \func_mux_unit|Mux20~0_combout\);

-- Location: PIN_E2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\input_B[12]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_input_B(12),
	combout => \input_B~combout\(12));

-- Location: LCCOMB_X9_Y9_N18
\addsub_unit|addder|bit_11|or_1|output~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \addsub_unit|addder|bit_11|or_1|output~0_combout\ = (\input_A~combout\(11) & ((\addsub_unit|addder|bit_10|or_1|output~0_combout\) # (\input_B~combout\(11) $ (\aluop~combout\(2))))) # (!\input_A~combout\(11) & 
-- (\addsub_unit|addder|bit_10|or_1|output~0_combout\ & (\input_B~combout\(11) $ (\aluop~combout\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000111011101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \input_A~combout\(11),
	datab => \addsub_unit|addder|bit_10|or_1|output~0_combout\,
	datac => \input_B~combout\(11),
	datad => \aluop~combout\(2),
	combout => \addsub_unit|addder|bit_11|or_1|output~0_combout\);

-- Location: LCCOMB_X9_Y9_N24
\func_mux_unit|Mux19~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \func_mux_unit|Mux19~1_combout\ = (\aluop~combout\(1) & (\input_A~combout\(12) $ (\input_B~combout\(12) $ (\aluop~combout\(2))))) # (!\aluop~combout\(1) & (\input_A~combout\(12) & (\input_B~combout\(12) & !\aluop~combout\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001000001101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \input_A~combout\(12),
	datab => \input_B~combout\(12),
	datac => \aluop~combout\(1),
	datad => \aluop~combout\(2),
	combout => \func_mux_unit|Mux19~1_combout\);

-- Location: LCCOMB_X9_Y9_N2
\func_mux_unit|Mux19~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \func_mux_unit|Mux19~2_combout\ = (!\aluop~combout\(0) & (\func_mux_unit|Mux19~1_combout\ $ (((\aluop~combout\(1) & \addsub_unit|addder|bit_11|or_1|output~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \aluop~combout\(1),
	datab => \addsub_unit|addder|bit_11|or_1|output~0_combout\,
	datac => \func_mux_unit|Mux19~1_combout\,
	datad => \aluop~combout\(0),
	combout => \func_mux_unit|Mux19~2_combout\);

-- Location: LCCOMB_X9_Y9_N4
\func_mux_unit|Mux19~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \func_mux_unit|Mux19~0_combout\ = (\func_mux_unit|Mux19~2_combout\) # ((\func_mux_unit|Mux30~2_combout\ & ((\input_B~combout\(12)) # (\input_A~combout\(12)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \input_B~combout\(12),
	datab => \func_mux_unit|Mux19~2_combout\,
	datac => \input_A~combout\(12),
	datad => \func_mux_unit|Mux30~2_combout\,
	combout => \func_mux_unit|Mux19~0_combout\);

-- Location: PIN_F6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\input_A[13]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_input_A(13),
	combout => \input_A~combout\(13));

-- Location: LCCOMB_X7_Y10_N8
\func_mux_unit|Mux18~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \func_mux_unit|Mux18~1_combout\ = (\aluop~combout\(1) & (\aluop~combout\(2) $ (\input_B~combout\(13) $ (\input_A~combout\(13))))) # (!\aluop~combout\(1) & (!\aluop~combout\(2) & (\input_B~combout\(13) & \input_A~combout\(13))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001010001100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \aluop~combout\(2),
	datab => \input_B~combout\(13),
	datac => \aluop~combout\(1),
	datad => \input_A~combout\(13),
	combout => \func_mux_unit|Mux18~1_combout\);

-- Location: LCCOMB_X7_Y10_N0
\addsub_unit|addder|bit_12|or_1|output~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \addsub_unit|addder|bit_12|or_1|output~0_combout\ = (\addsub_unit|addder|bit_11|or_1|output~0_combout\ & ((\input_A~combout\(12)) # (\input_B~combout\(12) $ (\aluop~combout\(2))))) # (!\addsub_unit|addder|bit_11|or_1|output~0_combout\ & 
-- (\input_A~combout\(12) & (\input_B~combout\(12) $ (\aluop~combout\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000111011101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \addsub_unit|addder|bit_11|or_1|output~0_combout\,
	datab => \input_A~combout\(12),
	datac => \input_B~combout\(12),
	datad => \aluop~combout\(2),
	combout => \addsub_unit|addder|bit_12|or_1|output~0_combout\);

-- Location: LCCOMB_X7_Y10_N2
\func_mux_unit|Mux18~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \func_mux_unit|Mux18~2_combout\ = (!\aluop~combout\(0) & (\func_mux_unit|Mux18~1_combout\ $ (((\aluop~combout\(1) & \addsub_unit|addder|bit_12|or_1|output~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001010001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \aluop~combout\(0),
	datab => \func_mux_unit|Mux18~1_combout\,
	datac => \aluop~combout\(1),
	datad => \addsub_unit|addder|bit_12|or_1|output~0_combout\,
	combout => \func_mux_unit|Mux18~2_combout\);

-- Location: LCCOMB_X7_Y10_N10
\func_mux_unit|Mux18~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \func_mux_unit|Mux18~0_combout\ = (\func_mux_unit|Mux18~2_combout\) # ((\func_mux_unit|Mux30~2_combout\ & ((\input_B~combout\(13)) # (\input_A~combout\(13)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \func_mux_unit|Mux30~2_combout\,
	datab => \input_B~combout\(13),
	datac => \func_mux_unit|Mux18~2_combout\,
	datad => \input_A~combout\(13),
	combout => \func_mux_unit|Mux18~0_combout\);

-- Location: PIN_B4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\input_B[14]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_input_B(14),
	combout => \input_B~combout\(14));

-- Location: LCCOMB_X7_Y10_N28
\addsub_unit|addder|bit_13|or_1|output~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \addsub_unit|addder|bit_13|or_1|output~0_combout\ = (\input_A~combout\(13) & ((\addsub_unit|addder|bit_12|or_1|output~0_combout\) # (\aluop~combout\(2) $ (\input_B~combout\(13))))) # (!\input_A~combout\(13) & 
-- (\addsub_unit|addder|bit_12|or_1|output~0_combout\ & (\aluop~combout\(2) $ (\input_B~combout\(13)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011001100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \aluop~combout\(2),
	datab => \input_B~combout\(13),
	datac => \input_A~combout\(13),
	datad => \addsub_unit|addder|bit_12|or_1|output~0_combout\,
	combout => \addsub_unit|addder|bit_13|or_1|output~0_combout\);

-- Location: LCCOMB_X7_Y10_N30
\func_mux_unit|Mux17~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \func_mux_unit|Mux17~2_combout\ = (!\aluop~combout\(0) & (\func_mux_unit|Mux17~1_combout\ $ (((\addsub_unit|addder|bit_13|or_1|output~0_combout\ & \aluop~combout\(1))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \func_mux_unit|Mux17~1_combout\,
	datab => \addsub_unit|addder|bit_13|or_1|output~0_combout\,
	datac => \aluop~combout\(1),
	datad => \aluop~combout\(0),
	combout => \func_mux_unit|Mux17~2_combout\);

-- Location: LCCOMB_X7_Y10_N22
\func_mux_unit|Mux17~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \func_mux_unit|Mux17~0_combout\ = (\func_mux_unit|Mux17~2_combout\) # ((\func_mux_unit|Mux30~2_combout\ & ((\input_B~combout\(14)) # (\input_A~combout\(14)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \input_B~combout\(14),
	datab => \func_mux_unit|Mux17~2_combout\,
	datac => \input_A~combout\(14),
	datad => \func_mux_unit|Mux30~2_combout\,
	combout => \func_mux_unit|Mux17~0_combout\);

-- Location: LCCOMB_X7_Y10_N24
\addsub_unit|addder|bit_14|or_1|output~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \addsub_unit|addder|bit_14|or_1|output~0_combout\ = (\addsub_unit|addder|bit_13|or_1|output~0_combout\ & ((\input_A~combout\(14)) # (\input_B~combout\(14) $ (\aluop~combout\(2))))) # (!\addsub_unit|addder|bit_13|or_1|output~0_combout\ & 
-- (\input_A~combout\(14) & (\input_B~combout\(14) $ (\aluop~combout\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101010011101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \input_B~combout\(14),
	datab => \addsub_unit|addder|bit_13|or_1|output~0_combout\,
	datac => \input_A~combout\(14),
	datad => \aluop~combout\(2),
	combout => \addsub_unit|addder|bit_14|or_1|output~0_combout\);

-- Location: LCCOMB_X7_Y10_N26
\func_mux_unit|Mux16~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \func_mux_unit|Mux16~2_combout\ = (!\aluop~combout\(0) & (\func_mux_unit|Mux16~1_combout\ $ (((\aluop~combout\(1) & \addsub_unit|addder|bit_14|or_1|output~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \func_mux_unit|Mux16~1_combout\,
	datab => \aluop~combout\(1),
	datac => \addsub_unit|addder|bit_14|or_1|output~0_combout\,
	datad => \aluop~combout\(0),
	combout => \func_mux_unit|Mux16~2_combout\);

-- Location: PIN_G6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\input_A[15]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_input_A(15),
	combout => \input_A~combout\(15));

-- Location: LCCOMB_X7_Y10_N18
\func_mux_unit|Mux16~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \func_mux_unit|Mux16~0_combout\ = (\func_mux_unit|Mux16~2_combout\) # ((\func_mux_unit|Mux30~2_combout\ & ((\input_A~combout\(15)) # (\input_B~combout\(15)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \func_mux_unit|Mux30~2_combout\,
	datab => \func_mux_unit|Mux16~2_combout\,
	datac => \input_A~combout\(15),
	datad => \input_B~combout\(15),
	combout => \func_mux_unit|Mux16~0_combout\);

-- Location: PIN_T8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\input_A[16]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_input_A(16),
	combout => \input_A~combout\(16));

-- Location: LCCOMB_X13_Y10_N10
\func_mux_unit|Mux15~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \func_mux_unit|Mux15~1_combout\ = (\aluop~combout\(1) & (\input_A~combout\(16) $ (\aluop~combout\(2) $ (\input_B~combout\(16))))) # (!\aluop~combout\(1) & (\input_A~combout\(16) & (!\aluop~combout\(2) & \input_B~combout\(16))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \input_A~combout\(16),
	datab => \aluop~combout\(2),
	datac => \input_B~combout\(16),
	datad => \aluop~combout\(1),
	combout => \func_mux_unit|Mux15~1_combout\);

-- Location: LCCOMB_X13_Y10_N4
\func_mux_unit|Mux15~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \func_mux_unit|Mux15~2_combout\ = (!\aluop~combout\(0) & (\func_mux_unit|Mux15~1_combout\ $ (((\addsub_unit|addder|bit_15|or_1|output~0_combout\ & \aluop~combout\(1))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \addsub_unit|addder|bit_15|or_1|output~0_combout\,
	datab => \aluop~combout\(1),
	datac => \func_mux_unit|Mux15~1_combout\,
	datad => \aluop~combout\(0),
	combout => \func_mux_unit|Mux15~2_combout\);

-- Location: LCCOMB_X13_Y10_N24
\func_mux_unit|Mux15~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \func_mux_unit|Mux15~0_combout\ = (\func_mux_unit|Mux15~2_combout\) # ((\func_mux_unit|Mux30~2_combout\ & ((\input_A~combout\(16)) # (\input_B~combout\(16)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \input_A~combout\(16),
	datab => \func_mux_unit|Mux30~2_combout\,
	datac => \input_B~combout\(16),
	datad => \func_mux_unit|Mux15~2_combout\,
	combout => \func_mux_unit|Mux15~0_combout\);

-- Location: LCCOMB_X7_Y10_N4
\addsub_unit|addder|bit_15|or_1|output~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \addsub_unit|addder|bit_15|or_1|output~0_combout\ = (\addsub_unit|addder|bit_14|or_1|output~0_combout\ & ((\input_A~combout\(15)) # (\input_B~combout\(15) $ (\aluop~combout\(2))))) # (!\addsub_unit|addder|bit_14|or_1|output~0_combout\ & 
-- (\input_A~combout\(15) & (\input_B~combout\(15) $ (\aluop~combout\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011001011101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \addsub_unit|addder|bit_14|or_1|output~0_combout\,
	datab => \input_B~combout\(15),
	datac => \input_A~combout\(15),
	datad => \aluop~combout\(2),
	combout => \addsub_unit|addder|bit_15|or_1|output~0_combout\);

-- Location: LCCOMB_X13_Y10_N18
\addsub_unit|addder|bit_16|or_1|output~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \addsub_unit|addder|bit_16|or_1|output~0_combout\ = (\input_A~combout\(16) & ((\addsub_unit|addder|bit_15|or_1|output~0_combout\) # (\aluop~combout\(2) $ (\input_B~combout\(16))))) # (!\input_A~combout\(16) & 
-- (\addsub_unit|addder|bit_15|or_1|output~0_combout\ & (\aluop~combout\(2) $ (\input_B~combout\(16)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011111000101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \input_A~combout\(16),
	datab => \aluop~combout\(2),
	datac => \input_B~combout\(16),
	datad => \addsub_unit|addder|bit_15|or_1|output~0_combout\,
	combout => \addsub_unit|addder|bit_16|or_1|output~0_combout\);

-- Location: PIN_B11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\input_B[17]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_input_B(17),
	combout => \input_B~combout\(17));

-- Location: LCCOMB_X18_Y10_N4
\func_mux_unit|Mux14~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \func_mux_unit|Mux14~1_combout\ = (\aluop~combout\(1) & (\input_B~combout\(17) $ (\aluop~combout\(2) $ (\input_A~combout\(17))))) # (!\aluop~combout\(1) & (\input_B~combout\(17) & (!\aluop~combout\(2) & \input_A~combout\(17))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000011000101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \aluop~combout\(1),
	datab => \input_B~combout\(17),
	datac => \aluop~combout\(2),
	datad => \input_A~combout\(17),
	combout => \func_mux_unit|Mux14~1_combout\);

-- Location: LCCOMB_X18_Y10_N6
\func_mux_unit|Mux14~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \func_mux_unit|Mux14~2_combout\ = (!\aluop~combout\(0) & (\func_mux_unit|Mux14~1_combout\ $ (((\aluop~combout\(1) & \addsub_unit|addder|bit_16|or_1|output~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \aluop~combout\(1),
	datab => \addsub_unit|addder|bit_16|or_1|output~0_combout\,
	datac => \func_mux_unit|Mux14~1_combout\,
	datad => \aluop~combout\(0),
	combout => \func_mux_unit|Mux14~2_combout\);

-- Location: LCCOMB_X18_Y10_N2
\func_mux_unit|Mux14~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \func_mux_unit|Mux14~0_combout\ = (\func_mux_unit|Mux14~2_combout\) # ((\func_mux_unit|Mux30~2_combout\ & ((\input_B~combout\(17)) # (\input_A~combout\(17)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \func_mux_unit|Mux14~2_combout\,
	datab => \input_B~combout\(17),
	datac => \func_mux_unit|Mux30~2_combout\,
	datad => \input_A~combout\(17),
	combout => \func_mux_unit|Mux14~0_combout\);

-- Location: PIN_B14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\input_B[18]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_input_B(18),
	combout => \input_B~combout\(18));

-- Location: LCCOMB_X18_Y10_N24
\func_mux_unit|Mux13~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \func_mux_unit|Mux13~1_combout\ = (\aluop~combout\(1) & (\input_A~combout\(18) $ (\aluop~combout\(2) $ (\input_B~combout\(18))))) # (!\aluop~combout\(1) & (\input_A~combout\(18) & (!\aluop~combout\(2) & \input_B~combout\(18))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000011000101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \aluop~combout\(1),
	datab => \input_A~combout\(18),
	datac => \aluop~combout\(2),
	datad => \input_B~combout\(18),
	combout => \func_mux_unit|Mux13~1_combout\);

-- Location: LCCOMB_X18_Y10_N26
\func_mux_unit|Mux13~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \func_mux_unit|Mux13~2_combout\ = (!\aluop~combout\(0) & (\func_mux_unit|Mux13~1_combout\ $ (((\addsub_unit|addder|bit_17|or_1|output~0_combout\ & \aluop~combout\(1))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001001000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \addsub_unit|addder|bit_17|or_1|output~0_combout\,
	datab => \aluop~combout\(0),
	datac => \func_mux_unit|Mux13~1_combout\,
	datad => \aluop~combout\(1),
	combout => \func_mux_unit|Mux13~2_combout\);

-- Location: LCCOMB_X18_Y10_N22
\func_mux_unit|Mux13~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \func_mux_unit|Mux13~0_combout\ = (\func_mux_unit|Mux13~2_combout\) # ((\func_mux_unit|Mux30~2_combout\ & ((\input_B~combout\(18)) # (\input_A~combout\(18)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \input_B~combout\(18),
	datab => \func_mux_unit|Mux13~2_combout\,
	datac => \func_mux_unit|Mux30~2_combout\,
	datad => \input_A~combout\(18),
	combout => \func_mux_unit|Mux13~0_combout\);

-- Location: LCCOMB_X18_Y10_N0
\addsub_unit|addder|bit_18|or_1|output~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \addsub_unit|addder|bit_18|or_1|output~0_combout\ = (\addsub_unit|addder|bit_17|or_1|output~0_combout\ & ((\input_A~combout\(18)) # (\aluop~combout\(2) $ (\input_B~combout\(18))))) # (!\addsub_unit|addder|bit_17|or_1|output~0_combout\ & 
-- (\input_A~combout\(18) & (\aluop~combout\(2) $ (\input_B~combout\(18)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000111011101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \addsub_unit|addder|bit_17|or_1|output~0_combout\,
	datab => \input_A~combout\(18),
	datac => \aluop~combout\(2),
	datad => \input_B~combout\(18),
	combout => \addsub_unit|addder|bit_18|or_1|output~0_combout\);

-- Location: LCCOMB_X18_Y10_N30
\func_mux_unit|Mux12~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \func_mux_unit|Mux12~2_combout\ = (!\aluop~combout\(0) & (\func_mux_unit|Mux12~1_combout\ $ (((\aluop~combout\(1) & \addsub_unit|addder|bit_18|or_1|output~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001001000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \func_mux_unit|Mux12~1_combout\,
	datab => \aluop~combout\(0),
	datac => \aluop~combout\(1),
	datad => \addsub_unit|addder|bit_18|or_1|output~0_combout\,
	combout => \func_mux_unit|Mux12~2_combout\);

-- Location: PIN_H11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\input_A[19]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_input_A(19),
	combout => \input_A~combout\(19));

-- Location: LCCOMB_X18_Y10_N18
\func_mux_unit|Mux12~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \func_mux_unit|Mux12~0_combout\ = (\func_mux_unit|Mux12~2_combout\) # ((\func_mux_unit|Mux30~2_combout\ & ((\input_A~combout\(19)) # (\input_B~combout\(19)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \func_mux_unit|Mux30~2_combout\,
	datab => \func_mux_unit|Mux12~2_combout\,
	datac => \input_A~combout\(19),
	datad => \input_B~combout\(19),
	combout => \func_mux_unit|Mux12~0_combout\);

-- Location: LCCOMB_X18_Y10_N28
\addsub_unit|addder|bit_19|or_1|output~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \addsub_unit|addder|bit_19|or_1|output~0_combout\ = (\input_A~combout\(19) & ((\addsub_unit|addder|bit_18|or_1|output~0_combout\) # (\aluop~combout\(2) $ (\input_B~combout\(19))))) # (!\input_A~combout\(19) & 
-- (\addsub_unit|addder|bit_18|or_1|output~0_combout\ & (\aluop~combout\(2) $ (\input_B~combout\(19)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000111011101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \input_A~combout\(19),
	datab => \addsub_unit|addder|bit_18|or_1|output~0_combout\,
	datac => \aluop~combout\(2),
	datad => \input_B~combout\(19),
	combout => \addsub_unit|addder|bit_19|or_1|output~0_combout\);

-- Location: LCCOMB_X18_Y10_N10
\func_mux_unit|Mux11~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \func_mux_unit|Mux11~2_combout\ = (!\aluop~combout\(0) & (\func_mux_unit|Mux11~1_combout\ $ (((\aluop~combout\(1) & \addsub_unit|addder|bit_19|or_1|output~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001001000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \func_mux_unit|Mux11~1_combout\,
	datab => \aluop~combout\(0),
	datac => \aluop~combout\(1),
	datad => \addsub_unit|addder|bit_19|or_1|output~0_combout\,
	combout => \func_mux_unit|Mux11~2_combout\);

-- Location: PIN_C11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\input_A[20]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_input_A(20),
	combout => \input_A~combout\(20));

-- Location: LCCOMB_X18_Y10_N14
\func_mux_unit|Mux11~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \func_mux_unit|Mux11~0_combout\ = (\func_mux_unit|Mux11~2_combout\) # ((\func_mux_unit|Mux30~2_combout\ & ((\input_A~combout\(20)) # (\input_B~combout\(20)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \func_mux_unit|Mux11~2_combout\,
	datab => \input_A~combout\(20),
	datac => \func_mux_unit|Mux30~2_combout\,
	datad => \input_B~combout\(20),
	combout => \func_mux_unit|Mux11~0_combout\);

-- Location: LCCOMB_X17_Y11_N0
\addsub_unit|addder|bit_20|or_1|output~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \addsub_unit|addder|bit_20|or_1|output~0_combout\ = (\addsub_unit|addder|bit_19|or_1|output~0_combout\ & ((\input_A~combout\(20)) # (\aluop~combout\(2) $ (\input_B~combout\(20))))) # (!\addsub_unit|addder|bit_19|or_1|output~0_combout\ & 
-- (\input_A~combout\(20) & (\aluop~combout\(2) $ (\input_B~combout\(20)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000111011101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \addsub_unit|addder|bit_19|or_1|output~0_combout\,
	datab => \input_A~combout\(20),
	datac => \aluop~combout\(2),
	datad => \input_B~combout\(20),
	combout => \addsub_unit|addder|bit_20|or_1|output~0_combout\);

-- Location: LCCOMB_X17_Y11_N28
\func_mux_unit|Mux10~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \func_mux_unit|Mux10~2_combout\ = (!\aluop~combout\(0) & (\func_mux_unit|Mux10~1_combout\ $ (((\aluop~combout\(1) & \addsub_unit|addder|bit_20|or_1|output~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000011000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \func_mux_unit|Mux10~1_combout\,
	datab => \aluop~combout\(1),
	datac => \aluop~combout\(0),
	datad => \addsub_unit|addder|bit_20|or_1|output~0_combout\,
	combout => \func_mux_unit|Mux10~2_combout\);

-- Location: PIN_B13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\input_A[21]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_input_A(21),
	combout => \input_A~combout\(21));

-- Location: LCCOMB_X17_Y11_N2
\func_mux_unit|Mux10~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \func_mux_unit|Mux10~0_combout\ = (\func_mux_unit|Mux10~2_combout\) # ((\func_mux_unit|Mux30~2_combout\ & ((\input_B~combout\(21)) # (\input_A~combout\(21)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \func_mux_unit|Mux30~2_combout\,
	datab => \func_mux_unit|Mux10~2_combout\,
	datac => \input_B~combout\(21),
	datad => \input_A~combout\(21),
	combout => \func_mux_unit|Mux10~0_combout\);

-- Location: LCCOMB_X17_Y11_N4
\addsub_unit|addder|bit_21|or_1|output~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \addsub_unit|addder|bit_21|or_1|output~0_combout\ = (\input_A~combout\(21) & ((\addsub_unit|addder|bit_20|or_1|output~0_combout\) # (\aluop~combout\(2) $ (\input_B~combout\(21))))) # (!\input_A~combout\(21) & 
-- (\addsub_unit|addder|bit_20|or_1|output~0_combout\ & (\aluop~combout\(2) $ (\input_B~combout\(21)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011111000101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \input_A~combout\(21),
	datab => \aluop~combout\(2),
	datac => \input_B~combout\(21),
	datad => \addsub_unit|addder|bit_20|or_1|output~0_combout\,
	combout => \addsub_unit|addder|bit_21|or_1|output~0_combout\);

-- Location: LCCOMB_X17_Y11_N8
\func_mux_unit|Mux9~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \func_mux_unit|Mux9~2_combout\ = (!\aluop~combout\(0) & (\func_mux_unit|Mux9~1_combout\ $ (((\aluop~combout\(1) & \addsub_unit|addder|bit_21|or_1|output~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \func_mux_unit|Mux9~1_combout\,
	datab => \aluop~combout\(1),
	datac => \addsub_unit|addder|bit_21|or_1|output~0_combout\,
	datad => \aluop~combout\(0),
	combout => \func_mux_unit|Mux9~2_combout\);

-- Location: PIN_D11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\input_A[22]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_input_A(22),
	combout => \input_A~combout\(22));

-- Location: LCCOMB_X17_Y11_N14
\func_mux_unit|Mux9~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \func_mux_unit|Mux9~0_combout\ = (\func_mux_unit|Mux9~2_combout\) # ((\func_mux_unit|Mux30~2_combout\ & ((\input_A~combout\(22)) # (\input_B~combout\(22)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \func_mux_unit|Mux30~2_combout\,
	datab => \func_mux_unit|Mux9~2_combout\,
	datac => \input_A~combout\(22),
	datad => \input_B~combout\(22),
	combout => \func_mux_unit|Mux9~0_combout\);

-- Location: LCCOMB_X17_Y11_N24
\addsub_unit|addder|bit_22|or_1|output~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \addsub_unit|addder|bit_22|or_1|output~0_combout\ = (\input_A~combout\(22) & ((\addsub_unit|addder|bit_21|or_1|output~0_combout\) # (\aluop~combout\(2) $ (\input_B~combout\(22))))) # (!\input_A~combout\(22) & 
-- (\addsub_unit|addder|bit_21|or_1|output~0_combout\ & (\aluop~combout\(2) $ (\input_B~combout\(22)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000111011101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \input_A~combout\(22),
	datab => \addsub_unit|addder|bit_21|or_1|output~0_combout\,
	datac => \aluop~combout\(2),
	datad => \input_B~combout\(22),
	combout => \addsub_unit|addder|bit_22|or_1|output~0_combout\);

-- Location: LCCOMB_X17_Y11_N20
\func_mux_unit|Mux8~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \func_mux_unit|Mux8~2_combout\ = (!\aluop~combout\(0) & (\func_mux_unit|Mux8~1_combout\ $ (((\aluop~combout\(1) & \addsub_unit|addder|bit_22|or_1|output~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \func_mux_unit|Mux8~1_combout\,
	datab => \aluop~combout\(1),
	datac => \addsub_unit|addder|bit_22|or_1|output~0_combout\,
	datad => \aluop~combout\(0),
	combout => \func_mux_unit|Mux8~2_combout\);

-- Location: PIN_A12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\input_B[23]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_input_B(23),
	combout => \input_B~combout\(23));

-- Location: LCCOMB_X17_Y11_N18
\func_mux_unit|Mux8~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \func_mux_unit|Mux8~0_combout\ = (\func_mux_unit|Mux8~2_combout\) # ((\func_mux_unit|Mux30~2_combout\ & ((\input_B~combout\(23)) # (\input_A~combout\(23)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \func_mux_unit|Mux8~2_combout\,
	datab => \input_B~combout\(23),
	datac => \input_A~combout\(23),
	datad => \func_mux_unit|Mux30~2_combout\,
	combout => \func_mux_unit|Mux8~0_combout\);

-- Location: LCCOMB_X17_Y11_N12
\addsub_unit|addder|bit_23|or_1|output~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \addsub_unit|addder|bit_23|or_1|output~0_combout\ = (\addsub_unit|addder|bit_22|or_1|output~0_combout\ & ((\input_A~combout\(23)) # (\aluop~combout\(2) $ (\input_B~combout\(23))))) # (!\addsub_unit|addder|bit_22|or_1|output~0_combout\ & 
-- (\input_A~combout\(23) & (\aluop~combout\(2) $ (\input_B~combout\(23)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011001011101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \addsub_unit|addder|bit_22|or_1|output~0_combout\,
	datab => \aluop~combout\(2),
	datac => \input_A~combout\(23),
	datad => \input_B~combout\(23),
	combout => \addsub_unit|addder|bit_23|or_1|output~0_combout\);

-- Location: LCCOMB_X17_Y10_N6
\func_mux_unit|Mux7~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \func_mux_unit|Mux7~2_combout\ = (!\aluop~combout\(0) & (\func_mux_unit|Mux7~1_combout\ $ (((\aluop~combout\(1) & \addsub_unit|addder|bit_23|or_1|output~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \func_mux_unit|Mux7~1_combout\,
	datab => \aluop~combout\(1),
	datac => \addsub_unit|addder|bit_23|or_1|output~0_combout\,
	datad => \aluop~combout\(0),
	combout => \func_mux_unit|Mux7~2_combout\);

-- Location: PIN_G11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\input_A[24]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_input_A(24),
	combout => \input_A~combout\(24));

-- Location: LCCOMB_X17_Y11_N22
\func_mux_unit|Mux7~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \func_mux_unit|Mux7~0_combout\ = (\func_mux_unit|Mux7~2_combout\) # ((\func_mux_unit|Mux30~2_combout\ & ((\input_B~combout\(24)) # (\input_A~combout\(24)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \func_mux_unit|Mux30~2_combout\,
	datab => \func_mux_unit|Mux7~2_combout\,
	datac => \input_B~combout\(24),
	datad => \input_A~combout\(24),
	combout => \func_mux_unit|Mux7~0_combout\);

-- Location: PIN_A10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\input_A[25]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_input_A(25),
	combout => \input_A~combout\(25));

-- Location: LCCOMB_X17_Y10_N24
\func_mux_unit|Mux6~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \func_mux_unit|Mux6~1_combout\ = (\aluop~combout\(1) & (\input_A~combout\(25) $ (\aluop~combout\(2) $ (\input_B~combout\(25))))) # (!\aluop~combout\(1) & (\input_A~combout\(25) & (!\aluop~combout\(2) & \input_B~combout\(25))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \input_A~combout\(25),
	datab => \aluop~combout\(2),
	datac => \input_B~combout\(25),
	datad => \aluop~combout\(1),
	combout => \func_mux_unit|Mux6~1_combout\);

-- Location: LCCOMB_X17_Y10_N26
\func_mux_unit|Mux6~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \func_mux_unit|Mux6~2_combout\ = (!\aluop~combout\(0) & (\func_mux_unit|Mux6~1_combout\ $ (((\addsub_unit|addder|bit_24|or_1|output~0_combout\ & \aluop~combout\(1))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \addsub_unit|addder|bit_24|or_1|output~0_combout\,
	datab => \aluop~combout\(1),
	datac => \func_mux_unit|Mux6~1_combout\,
	datad => \aluop~combout\(0),
	combout => \func_mux_unit|Mux6~2_combout\);

-- Location: LCCOMB_X17_Y10_N18
\func_mux_unit|Mux6~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \func_mux_unit|Mux6~0_combout\ = (\func_mux_unit|Mux6~2_combout\) # ((\func_mux_unit|Mux30~2_combout\ & ((\input_A~combout\(25)) # (\input_B~combout\(25)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \input_A~combout\(25),
	datab => \func_mux_unit|Mux6~2_combout\,
	datac => \func_mux_unit|Mux30~2_combout\,
	datad => \input_B~combout\(25),
	combout => \func_mux_unit|Mux6~0_combout\);

-- Location: LCCOMB_X17_Y10_N20
\addsub_unit|addder|bit_25|or_1|output~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \addsub_unit|addder|bit_25|or_1|output~0_combout\ = (\addsub_unit|addder|bit_24|or_1|output~0_combout\ & ((\input_A~combout\(25)) # (\aluop~combout\(2) $ (\input_B~combout\(25))))) # (!\addsub_unit|addder|bit_24|or_1|output~0_combout\ & 
-- (\input_A~combout\(25) & (\aluop~combout\(2) $ (\input_B~combout\(25)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011001011101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \addsub_unit|addder|bit_24|or_1|output~0_combout\,
	datab => \aluop~combout\(2),
	datac => \input_A~combout\(25),
	datad => \input_B~combout\(25),
	combout => \addsub_unit|addder|bit_25|or_1|output~0_combout\);

-- Location: LCCOMB_X17_Y10_N14
\func_mux_unit|Mux5~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \func_mux_unit|Mux5~2_combout\ = (!\aluop~combout\(0) & (\func_mux_unit|Mux5~1_combout\ $ (((\aluop~combout\(1) & \addsub_unit|addder|bit_25|or_1|output~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \func_mux_unit|Mux5~1_combout\,
	datab => \aluop~combout\(1),
	datac => \addsub_unit|addder|bit_25|or_1|output~0_combout\,
	datad => \aluop~combout\(0),
	combout => \func_mux_unit|Mux5~2_combout\);

-- Location: PIN_C12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\input_A[26]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_input_A(26),
	combout => \input_A~combout\(26));

-- Location: LCCOMB_X17_Y10_N22
\func_mux_unit|Mux5~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \func_mux_unit|Mux5~0_combout\ = (\func_mux_unit|Mux5~2_combout\) # ((\func_mux_unit|Mux30~2_combout\ & ((\input_B~combout\(26)) # (\input_A~combout\(26)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \input_B~combout\(26),
	datab => \func_mux_unit|Mux5~2_combout\,
	datac => \func_mux_unit|Mux30~2_combout\,
	datad => \input_A~combout\(26),
	combout => \func_mux_unit|Mux5~0_combout\);

-- Location: PIN_L10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\input_A[27]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_input_A(27),
	combout => \input_A~combout\(27));

-- Location: LCCOMB_X17_Y10_N8
\addsub_unit|addder|bit_26|or_1|output~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \addsub_unit|addder|bit_26|or_1|output~0_combout\ = (\addsub_unit|addder|bit_25|or_1|output~0_combout\ & ((\input_A~combout\(26)) # (\aluop~combout\(2) $ (\input_B~combout\(26))))) # (!\addsub_unit|addder|bit_25|or_1|output~0_combout\ & 
-- (\input_A~combout\(26) & (\aluop~combout\(2) $ (\input_B~combout\(26)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011111000101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \addsub_unit|addder|bit_25|or_1|output~0_combout\,
	datab => \aluop~combout\(2),
	datac => \input_B~combout\(26),
	datad => \input_A~combout\(26),
	combout => \addsub_unit|addder|bit_26|or_1|output~0_combout\);

-- Location: LCCOMB_X17_Y10_N2
\func_mux_unit|Mux4~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \func_mux_unit|Mux4~2_combout\ = (!\aluop~combout\(0) & (\func_mux_unit|Mux4~1_combout\ $ (((\aluop~combout\(1) & \addsub_unit|addder|bit_26|or_1|output~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \func_mux_unit|Mux4~1_combout\,
	datab => \aluop~combout\(1),
	datac => \addsub_unit|addder|bit_26|or_1|output~0_combout\,
	datad => \aluop~combout\(0),
	combout => \func_mux_unit|Mux4~2_combout\);

-- Location: LCCOMB_X17_Y10_N10
\func_mux_unit|Mux4~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \func_mux_unit|Mux4~0_combout\ = (\func_mux_unit|Mux4~2_combout\) # ((\func_mux_unit|Mux30~2_combout\ & ((\input_A~combout\(27)) # (\input_B~combout\(27)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \input_A~combout\(27),
	datab => \func_mux_unit|Mux4~2_combout\,
	datac => \func_mux_unit|Mux30~2_combout\,
	datad => \input_B~combout\(27),
	combout => \func_mux_unit|Mux4~0_combout\);

-- Location: LCCOMB_X13_Y10_N14
\func_mux_unit|Mux3~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \func_mux_unit|Mux3~3_combout\ = (\aluop~combout\(1) & !\aluop~combout\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \aluop~combout\(1),
	datad => \aluop~combout\(0),
	combout => \func_mux_unit|Mux3~3_combout\);

-- Location: LCCOMB_X13_Y10_N28
\func_mux_unit|Mux3~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \func_mux_unit|Mux3~0_combout\ = (!\aluop~combout\(1) & (!\aluop~combout\(2) & !\aluop~combout\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \aluop~combout\(1),
	datac => \aluop~combout\(2),
	datad => \aluop~combout\(0),
	combout => \func_mux_unit|Mux3~0_combout\);

-- Location: PIN_R11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\input_B[28]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_input_B(28),
	combout => \input_B~combout\(28));

-- Location: LCCOMB_X14_Y10_N0
\func_mux_unit|Mux3~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \func_mux_unit|Mux3~1_combout\ = (\func_mux_unit|Mux3~0_combout\ & (\input_A~combout\(28) & \input_B~combout\(28)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \func_mux_unit|Mux3~0_combout\,
	datac => \input_A~combout\(28),
	datad => \input_B~combout\(28),
	combout => \func_mux_unit|Mux3~1_combout\);

-- Location: LCCOMB_X14_Y10_N28
\addsub_unit|addder|bit_28|xor_2|output~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \addsub_unit|addder|bit_28|xor_2|output~0_combout\ = \addsub_unit|addder|bit_27|or_1|output~0_combout\ $ (\input_A~combout\(28) $ (\aluop~combout\(2) $ (\input_B~combout\(28))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \addsub_unit|addder|bit_27|or_1|output~0_combout\,
	datab => \input_A~combout\(28),
	datac => \aluop~combout\(2),
	datad => \input_B~combout\(28),
	combout => \addsub_unit|addder|bit_28|xor_2|output~0_combout\);

-- Location: LCCOMB_X14_Y10_N26
\func_mux_unit|Mux3~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \func_mux_unit|Mux3~2_combout\ = (\func_mux_unit|Mux30~2_combout\ & ((\input_B~combout\(28)) # (\input_A~combout\(28))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \input_B~combout\(28),
	datac => \input_A~combout\(28),
	datad => \func_mux_unit|Mux30~2_combout\,
	combout => \func_mux_unit|Mux3~2_combout\);

-- Location: LCCOMB_X14_Y10_N22
\func_mux_unit|Mux3~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \func_mux_unit|Mux3~4_combout\ = (\func_mux_unit|Mux3~1_combout\) # ((\func_mux_unit|Mux3~2_combout\) # ((\func_mux_unit|Mux3~3_combout\ & \addsub_unit|addder|bit_28|xor_2|output~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \func_mux_unit|Mux3~3_combout\,
	datab => \func_mux_unit|Mux3~1_combout\,
	datac => \addsub_unit|addder|bit_28|xor_2|output~0_combout\,
	datad => \func_mux_unit|Mux3~2_combout\,
	combout => \func_mux_unit|Mux3~4_combout\);

-- Location: LCCOMB_X14_Y10_N2
\func_mux_unit|Mux2~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \func_mux_unit|Mux2~1_combout\ = (\func_mux_unit|Mux30~2_combout\ & ((\input_B~combout\(29)) # (\input_A~combout\(29))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \input_B~combout\(29),
	datac => \input_A~combout\(29),
	datad => \func_mux_unit|Mux30~2_combout\,
	combout => \func_mux_unit|Mux2~1_combout\);

-- Location: PIN_N10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\input_B[29]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_input_B(29),
	combout => \input_B~combout\(29));

-- Location: LCCOMB_X14_Y10_N24
\func_mux_unit|Mux2~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \func_mux_unit|Mux2~0_combout\ = (\func_mux_unit|Mux3~0_combout\ & (\input_A~combout\(29) & \input_B~combout\(29)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \func_mux_unit|Mux3~0_combout\,
	datac => \input_A~combout\(29),
	datad => \input_B~combout\(29),
	combout => \func_mux_unit|Mux2~0_combout\);

-- Location: LCCOMB_X14_Y10_N12
\addsub_unit|addder|bit_28|or_1|output~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \addsub_unit|addder|bit_28|or_1|output~0_combout\ = (\addsub_unit|addder|bit_27|or_1|output~0_combout\ & ((\input_A~combout\(28)) # (\aluop~combout\(2) $ (\input_B~combout\(28))))) # (!\addsub_unit|addder|bit_27|or_1|output~0_combout\ & 
-- (\input_A~combout\(28) & (\aluop~combout\(2) $ (\input_B~combout\(28)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000111011101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \addsub_unit|addder|bit_27|or_1|output~0_combout\,
	datab => \input_A~combout\(28),
	datac => \aluop~combout\(2),
	datad => \input_B~combout\(28),
	combout => \addsub_unit|addder|bit_28|or_1|output~0_combout\);

-- Location: LCCOMB_X14_Y10_N6
\addsub_unit|addder|bit_29|xor_2|output~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \addsub_unit|addder|bit_29|xor_2|output~0_combout\ = \input_B~combout\(29) $ (\aluop~combout\(2) $ (\input_A~combout\(29) $ (\addsub_unit|addder|bit_28|or_1|output~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \input_B~combout\(29),
	datab => \aluop~combout\(2),
	datac => \input_A~combout\(29),
	datad => \addsub_unit|addder|bit_28|or_1|output~0_combout\,
	combout => \addsub_unit|addder|bit_29|xor_2|output~0_combout\);

-- Location: LCCOMB_X14_Y10_N16
\func_mux_unit|Mux2~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \func_mux_unit|Mux2~2_combout\ = (\func_mux_unit|Mux2~1_combout\) # ((\func_mux_unit|Mux2~0_combout\) # ((\func_mux_unit|Mux3~3_combout\ & \addsub_unit|addder|bit_29|xor_2|output~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \func_mux_unit|Mux3~3_combout\,
	datab => \func_mux_unit|Mux2~1_combout\,
	datac => \func_mux_unit|Mux2~0_combout\,
	datad => \addsub_unit|addder|bit_29|xor_2|output~0_combout\,
	combout => \func_mux_unit|Mux2~2_combout\);

-- Location: PIN_L9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\input_A[30]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_input_A(30),
	combout => \input_A~combout\(30));

-- Location: LCCOMB_X13_Y10_N16
\func_mux_unit|Mux1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \func_mux_unit|Mux1~0_combout\ = (\func_mux_unit|Mux30~2_combout\ & ((\input_B~combout\(30)) # ((\input_A~combout\(30)) # (!\aluop~combout\(2))))) # (!\func_mux_unit|Mux30~2_combout\ & (\input_B~combout\(30) $ (\aluop~combout\(2) $ 
-- (!\input_A~combout\(30)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011010111001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \input_B~combout\(30),
	datab => \aluop~combout\(2),
	datac => \func_mux_unit|Mux30~2_combout\,
	datad => \input_A~combout\(30),
	combout => \func_mux_unit|Mux1~0_combout\);

-- Location: LCCOMB_X14_Y10_N10
\addsub_unit|addder|bit_29|or_1|output~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \addsub_unit|addder|bit_29|or_1|output~0_combout\ = (\input_A~combout\(29) & ((\addsub_unit|addder|bit_28|or_1|output~0_combout\) # (\input_B~combout\(29) $ (\aluop~combout\(2))))) # (!\input_A~combout\(29) & 
-- (\addsub_unit|addder|bit_28|or_1|output~0_combout\ & (\input_B~combout\(29) $ (\aluop~combout\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011001100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \input_B~combout\(29),
	datab => \aluop~combout\(2),
	datac => \input_A~combout\(29),
	datad => \addsub_unit|addder|bit_28|or_1|output~0_combout\,
	combout => \addsub_unit|addder|bit_29|or_1|output~0_combout\);

-- Location: LCCOMB_X13_Y10_N26
\func_mux_unit|Mux1~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \func_mux_unit|Mux1~1_combout\ = (\input_B~combout\(30) & ((\func_mux_unit|Mux30~2_combout\) # ((\input_A~combout\(30) & \func_mux_unit|Mux3~0_combout\)))) # (!\input_B~combout\(30) & (\input_A~combout\(30) & (\func_mux_unit|Mux30~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110100011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \input_B~combout\(30),
	datab => \input_A~combout\(30),
	datac => \func_mux_unit|Mux30~2_combout\,
	datad => \func_mux_unit|Mux3~0_combout\,
	combout => \func_mux_unit|Mux1~1_combout\);

-- Location: LCCOMB_X13_Y10_N12
\func_mux_unit|Mux1~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \func_mux_unit|Mux1~2_combout\ = (\func_mux_unit|Mux1~1_combout\) # ((\func_mux_unit|Mux3~3_combout\ & (\func_mux_unit|Mux1~0_combout\ $ (!\addsub_unit|addder|bit_29|or_1|output~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \func_mux_unit|Mux1~0_combout\,
	datab => \addsub_unit|addder|bit_29|or_1|output~0_combout\,
	datac => \func_mux_unit|Mux3~3_combout\,
	datad => \func_mux_unit|Mux1~1_combout\,
	combout => \func_mux_unit|Mux1~2_combout\);

-- Location: LCCOMB_X13_Y10_N6
\addsub_unit|addder|bit_30|or_1|output~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \addsub_unit|addder|bit_30|or_1|output~0_combout\ = (\addsub_unit|addder|bit_29|or_1|output~0_combout\ & ((\input_A~combout\(30)) # (\input_B~combout\(30) $ (\aluop~combout\(2))))) # (!\addsub_unit|addder|bit_29|or_1|output~0_combout\ & 
-- (\input_A~combout\(30) & (\input_B~combout\(30) $ (\aluop~combout\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111001001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \input_B~combout\(30),
	datab => \addsub_unit|addder|bit_29|or_1|output~0_combout\,
	datac => \aluop~combout\(2),
	datad => \input_A~combout\(30),
	combout => \addsub_unit|addder|bit_30|or_1|output~0_combout\);

-- Location: LCCOMB_X13_Y10_N8
\func_mux_unit|Mux0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \func_mux_unit|Mux0~0_combout\ = (\func_mux_unit|Mux30~2_combout\ & ((\input_B~combout\(31)) # ((\input_A~combout\(31)) # (!\aluop~combout\(2))))) # (!\func_mux_unit|Mux30~2_combout\ & (\input_B~combout\(31) $ (\aluop~combout\(2) $ 
-- (!\input_A~combout\(31)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011010111001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \input_B~combout\(31),
	datab => \aluop~combout\(2),
	datac => \func_mux_unit|Mux30~2_combout\,
	datad => \input_A~combout\(31),
	combout => \func_mux_unit|Mux0~0_combout\);

-- Location: LCCOMB_X13_Y10_N2
\func_mux_unit|Mux0~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \func_mux_unit|Mux0~1_combout\ = (\input_B~combout\(31) & ((\func_mux_unit|Mux30~2_combout\) # ((\input_A~combout\(31) & \func_mux_unit|Mux3~0_combout\)))) # (!\input_B~combout\(31) & (\input_A~combout\(31) & (\func_mux_unit|Mux30~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110100011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \input_B~combout\(31),
	datab => \input_A~combout\(31),
	datac => \func_mux_unit|Mux30~2_combout\,
	datad => \func_mux_unit|Mux3~0_combout\,
	combout => \func_mux_unit|Mux0~1_combout\);

-- Location: LCCOMB_X13_Y10_N20
\func_mux_unit|Mux0~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \func_mux_unit|Mux0~2_combout\ = (\func_mux_unit|Mux0~1_combout\) # ((\func_mux_unit|Mux3~3_combout\ & (\addsub_unit|addder|bit_30|or_1|output~0_combout\ $ (!\func_mux_unit|Mux0~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \addsub_unit|addder|bit_30|or_1|output~0_combout\,
	datab => \func_mux_unit|Mux0~0_combout\,
	datac => \func_mux_unit|Mux3~3_combout\,
	datad => \func_mux_unit|Mux0~1_combout\,
	combout => \func_mux_unit|Mux0~2_combout\);

-- Location: LCCOMB_X17_Y10_N30
\Equal0~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \Equal0~8_combout\ = (!\func_mux_unit|Mux4~0_combout\ & (!\func_mux_unit|Mux5~0_combout\ & (!\func_mux_unit|Mux3~4_combout\ & !\func_mux_unit|Mux6~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \func_mux_unit|Mux4~0_combout\,
	datab => \func_mux_unit|Mux5~0_combout\,
	datac => \func_mux_unit|Mux3~4_combout\,
	datad => \func_mux_unit|Mux6~0_combout\,
	combout => \Equal0~8_combout\);

-- Location: LCCOMB_X8_Y10_N4
\Equal0~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \Equal0~9_combout\ = (!\func_mux_unit|Mux30~3_combout\ & (!\func_mux_unit|Mux2~2_combout\ & (!\func_mux_unit|Mux1~2_combout\ & \Equal0~8_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \func_mux_unit|Mux30~3_combout\,
	datab => \func_mux_unit|Mux2~2_combout\,
	datac => \func_mux_unit|Mux1~2_combout\,
	datad => \Equal0~8_combout\,
	combout => \Equal0~9_combout\);

-- Location: LCCOMB_X8_Y10_N22
\Equal0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Equal0~0_combout\ = (!\func_mux_unit|Mux28~0_combout\ & (!\func_mux_unit|Mux27~0_combout\ & (!\func_mux_unit|Mux29~0_combout\ & !\func_mux_unit|Mux31~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \func_mux_unit|Mux28~0_combout\,
	datab => \func_mux_unit|Mux27~0_combout\,
	datac => \func_mux_unit|Mux29~0_combout\,
	datad => \func_mux_unit|Mux31~2_combout\,
	combout => \Equal0~0_combout\);

-- Location: LCCOMB_X8_Y9_N20
\Equal0~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Equal0~1_combout\ = (!\func_mux_unit|Mux23~0_combout\ & (!\func_mux_unit|Mux24~0_combout\ & (!\func_mux_unit|Mux26~0_combout\ & !\func_mux_unit|Mux25~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \func_mux_unit|Mux23~0_combout\,
	datab => \func_mux_unit|Mux24~0_combout\,
	datac => \func_mux_unit|Mux26~0_combout\,
	datad => \func_mux_unit|Mux25~0_combout\,
	combout => \Equal0~1_combout\);

-- Location: LCCOMB_X9_Y9_N6
\Equal0~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \Equal0~2_combout\ = (!\func_mux_unit|Mux21~0_combout\ & (!\func_mux_unit|Mux19~0_combout\ & (!\func_mux_unit|Mux20~0_combout\ & !\func_mux_unit|Mux22~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \func_mux_unit|Mux21~0_combout\,
	datab => \func_mux_unit|Mux19~0_combout\,
	datac => \func_mux_unit|Mux20~0_combout\,
	datad => \func_mux_unit|Mux22~0_combout\,
	combout => \Equal0~2_combout\);

-- Location: LCCOMB_X8_Y10_N8
\Equal0~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \Equal0~4_combout\ = (\Equal0~3_combout\ & (\Equal0~0_combout\ & (\Equal0~1_combout\ & \Equal0~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal0~3_combout\,
	datab => \Equal0~0_combout\,
	datac => \Equal0~1_combout\,
	datad => \Equal0~2_combout\,
	combout => \Equal0~4_combout\);

-- Location: LCCOMB_X18_Y10_N8
\Equal0~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \Equal0~5_combout\ = (!\func_mux_unit|Mux12~0_combout\ & (!\func_mux_unit|Mux13~0_combout\ & (!\func_mux_unit|Mux11~0_combout\ & !\func_mux_unit|Mux14~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \func_mux_unit|Mux12~0_combout\,
	datab => \func_mux_unit|Mux13~0_combout\,
	datac => \func_mux_unit|Mux11~0_combout\,
	datad => \func_mux_unit|Mux14~0_combout\,
	combout => \Equal0~5_combout\);

-- Location: LCCOMB_X8_Y10_N2
\Equal0~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \Equal0~7_combout\ = (\Equal0~6_combout\ & \Equal0~5_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal0~6_combout\,
	datad => \Equal0~5_combout\,
	combout => \Equal0~7_combout\);

-- Location: LCCOMB_X8_Y10_N6
\Equal0~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \Equal0~10_combout\ = (!\func_mux_unit|Mux0~2_combout\ & (\Equal0~9_combout\ & (\Equal0~4_combout\ & \Equal0~7_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \func_mux_unit|Mux0~2_combout\,
	datab => \Equal0~9_combout\,
	datac => \Equal0~4_combout\,
	datad => \Equal0~7_combout\,
	combout => \Equal0~10_combout\);

-- Location: PIN_B7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\input_B[31]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_input_B(31),
	combout => \input_B~combout\(31));

-- Location: LCCOMB_X13_Y10_N22
\addsub_unit|usigned_of_det|flag_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \addsub_unit|usigned_of_det|flag_out~0_combout\ = (\input_A~combout\(31) & ((\addsub_unit|addder|bit_30|or_1|output~0_combout\ & ((!\aluop~combout\(2)))) # (!\addsub_unit|addder|bit_30|or_1|output~0_combout\ & (\input_B~combout\(31))))) # 
-- (!\input_A~combout\(31) & ((\addsub_unit|addder|bit_30|or_1|output~0_combout\ & (\input_B~combout\(31))) # (!\addsub_unit|addder|bit_30|or_1|output~0_combout\ & ((\aluop~combout\(2))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010111010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \input_B~combout\(31),
	datab => \input_A~combout\(31),
	datac => \aluop~combout\(2),
	datad => \addsub_unit|addder|bit_30|or_1|output~0_combout\,
	combout => \addsub_unit|usigned_of_det|flag_out~0_combout\);

-- Location: LCCOMB_X13_Y10_N0
\addsub_unit|signed_of_det|flag_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \addsub_unit|signed_of_det|flag_out~0_combout\ = (\input_A~combout\(31) & ((\addsub_unit|addder|bit_30|or_1|output~0_combout\) # (\input_B~combout\(31) $ (!\aluop~combout\(2))))) # (!\input_A~combout\(31) & ((\input_B~combout\(31) $ (\aluop~combout\(2))) 
-- # (!\addsub_unit|addder|bit_30|or_1|output~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111010110111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \input_B~combout\(31),
	datab => \input_A~combout\(31),
	datac => \aluop~combout\(2),
	datad => \addsub_unit|addder|bit_30|or_1|output~0_combout\,
	combout => \addsub_unit|signed_of_det|flag_out~0_combout\);

-- Location: PIN_T6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\output[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \func_mux_unit|Mux31~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_output(0));

-- Location: PIN_A5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\output[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \func_mux_unit|Mux30~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_output(1));

-- Location: PIN_G7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\output[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \func_mux_unit|Mux29~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_output(2));

-- Location: PIN_B6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\output[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \func_mux_unit|Mux28~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_output(3));

-- Location: PIN_B5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\output[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \func_mux_unit|Mux27~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_output(4));

-- Location: PIN_L2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\output[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \func_mux_unit|Mux26~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_output(5));

-- Location: PIN_K4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\output[6]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \func_mux_unit|Mux25~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_output(6));

-- Location: PIN_K2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\output[7]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \func_mux_unit|Mux24~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_output(7));

-- Location: PIN_K5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\output[8]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \func_mux_unit|Mux23~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_output(8));

-- Location: PIN_R7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\output[9]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \func_mux_unit|Mux22~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_output(9));

-- Location: PIN_L7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\output[10]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \func_mux_unit|Mux21~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_output(10));

-- Location: PIN_K1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\output[11]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \func_mux_unit|Mux20~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_output(11));

-- Location: PIN_T7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\output[12]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \func_mux_unit|Mux19~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_output(12));

-- Location: PIN_C6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\output[13]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \func_mux_unit|Mux18~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_output(13));

-- Location: PIN_A4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\output[14]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \func_mux_unit|Mux17~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_output(14));

-- Location: PIN_M1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\output[15]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \func_mux_unit|Mux16~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_output(15));

-- Location: PIN_N8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\output[16]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \func_mux_unit|Mux15~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_output(16));

-- Location: PIN_C13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\output[17]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \func_mux_unit|Mux14~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_output(17));

-- Location: PIN_H12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\output[18]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \func_mux_unit|Mux13~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_output(18));

-- Location: PIN_J12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\output[19]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \func_mux_unit|Mux12~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_output(19));

-- Location: PIN_A14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\output[20]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \func_mux_unit|Mux11~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_output(20));

-- Location: PIN_D15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\output[21]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \func_mux_unit|Mux10~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_output(21));

-- Location: PIN_A13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\output[22]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \func_mux_unit|Mux9~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_output(22));

-- Location: PIN_G13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\output[23]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \func_mux_unit|Mux8~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_output(23));

-- Location: PIN_H13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\output[24]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \func_mux_unit|Mux7~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_output(24));

-- Location: PIN_F15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\output[25]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \func_mux_unit|Mux6~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_output(25));

-- Location: PIN_K16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\output[26]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \func_mux_unit|Mux5~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_output(26));

-- Location: PIN_E16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\output[27]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \func_mux_unit|Mux4~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_output(27));

-- Location: PIN_G15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\output[28]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \func_mux_unit|Mux3~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_output(28));

-- Location: PIN_G16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\output[29]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \func_mux_unit|Mux2~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_output(29));

-- Location: PIN_R5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\output[30]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \func_mux_unit|Mux1~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_output(30));

-- Location: PIN_T5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\output[31]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \func_mux_unit|Mux0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_output(31));

-- Location: PIN_L3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\zero~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \Equal0~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_zero);

-- Location: PIN_A7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\unsigned_overflow~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \addsub_unit|usigned_of_det|flag_out~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_unsigned_overflow);

-- Location: PIN_A9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\signed_overflow~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \addsub_unit|signed_of_det|ALT_INV_flag_out~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_signed_overflow);
END structure;


