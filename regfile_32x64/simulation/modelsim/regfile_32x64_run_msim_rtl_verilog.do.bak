transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/CompArch/mux_32to1_64 {D:/CompArch/mux_32to1_64/mux_32to1_64.v}
vlog -vlog01compat -work work +incdir+D:/CompArch/reg_64 {D:/CompArch/reg_64/reg_64.v}
vlog -vlog01compat -work work +incdir+D:/CompArch/decoder_5to32 {D:/CompArch/decoder_5to32/decoder_5to32.v}
vlog -vlog01compat -work work +incdir+D:/CompArch/regfile_32x64 {D:/CompArch/regfile_32x64/regfile_32x64.v}

vlog -vlog01compat -work work +incdir+D:/CompArch/regfile_32x64 {D:/CompArch/regfile_32x64/regfile_32x64_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L fiftyfivenm_ver -L rtl_work -L work -voptargs="+acc"  regfile_32x64_tb

add wave *
view structure
view signals
run -all
