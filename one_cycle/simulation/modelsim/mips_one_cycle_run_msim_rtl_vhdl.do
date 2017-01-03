transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {/home/sebsikora/altera/projects/mips/one_cycle/alu/s32addsub_one_bit_full_adder.vhd}
vcom -93 -work work {/home/sebsikora/altera/projects/mips/one_cycle/utils/basic_gates.vhd}
vcom -93 -work work {/home/sebsikora/altera/projects/mips/one_cycle/ins_cache/ins_cache_m4k_ram_block.vhd}
vcom -93 -work work {/home/sebsikora/altera/projects/mips/one_cycle/dat_cache/dat_cache_m4k_ram_block.vhd}
vcom -93 -work work {/home/sebsikora/altera/projects/mips/one_cycle/mips_one_cycle.vhd}
vcom -93 -work work {/home/sebsikora/altera/projects/mips/one_cycle/regfile/regfile_32_by_32.vhd}
vcom -93 -work work {/home/sebsikora/altera/projects/mips/one_cycle/alu/set_on_less_than.vhd}
vcom -93 -work work {/home/sebsikora/altera/projects/mips/one_cycle/alu/or_block.vhd}
vcom -93 -work work {/home/sebsikora/altera/projects/mips/one_cycle/alu/mips_32_bit_alu.vhd}
vcom -93 -work work {/home/sebsikora/altera/projects/mips/one_cycle/alu/func_mux.vhd}
vcom -93 -work work {/home/sebsikora/altera/projects/mips/one_cycle/alu/and_block.vhd}
vcom -93 -work work {/home/sebsikora/altera/projects/mips/one_cycle/alu/signed_32bit_add_subtract.vhd}
vcom -93 -work work {/home/sebsikora/altera/projects/mips/one_cycle/alu/s32addsub_unsigned_overflow_detect.vhd}
vcom -93 -work work {/home/sebsikora/altera/projects/mips/one_cycle/alu/s32addsub_signed_overflow_detect.vhd}
vcom -93 -work work {/home/sebsikora/altera/projects/mips/one_cycle/alu/s32addsub_full_adder.vhd}
vcom -93 -work work {/home/sebsikora/altera/projects/mips/one_cycle/alu/s32addsub_subtractor_inverter.vhd}
vcom -93 -work work {/home/sebsikora/altera/projects/mips/one_cycle/utils/register_32.vhd}
vcom -93 -work work {/home/sebsikora/altera/projects/mips/one_cycle/utils/decoder_5_to_32.vhd}
vcom -93 -work work {/home/sebsikora/altera/projects/mips/one_cycle/utils/mux_32_to_1_by_32.vhd}
vcom -93 -work work {/home/sebsikora/altera/projects/mips/one_cycle/dat_cache/dat_cache.vhd}
vcom -93 -work work {/home/sebsikora/altera/projects/mips/one_cycle/utils/mux_2_to_1_by_32.vhd}
vcom -93 -work work {/home/sebsikora/altera/projects/mips/one_cycle/utils/sign_extender_16_to_32.vhd}
vcom -93 -work work {/home/sebsikora/altera/projects/mips/one_cycle/utils/mux_2_to_1_by_5.vhd}
vcom -93 -work work {/home/sebsikora/altera/projects/mips/one_cycle/utils/control_box.vhd}
vcom -93 -work work {/home/sebsikora/altera/projects/mips/one_cycle/ins_cache/ins_cache.vhd}

