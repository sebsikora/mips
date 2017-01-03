transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {/home/sebsikora/altera/projects/mips/one_cycle/utils/register_32.vhd}
vcom -93 -work work {/home/sebsikora/altera/projects/mips/one_cycle/utils/mux_32_to_1_by_32.vhd}
vcom -93 -work work {/home/sebsikora/altera/projects/mips/one_cycle/utils/decoder_5_to_32.vhd}
vcom -93 -work work {/home/sebsikora/altera/projects/mips/one_cycle/regfile/regfile_32_by_32.vhd}

