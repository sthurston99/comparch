transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/CompArch/decoder_5to32 {D:/CompArch/decoder_5to32/decoder_5to32.v}
vlog -vlog01compat -work work +incdir+D:/CompArch/reg_64 {D:/CompArch/reg_64/reg_64.v}
vlog -vlog01compat -work work +incdir+D:/CompArch/mux_32to1_64 {D:/CompArch/mux_32to1_64/mux_32to1_64.v}
vlog -vlog01compat -work work +incdir+D:/CompArch/shifter_64 {D:/CompArch/shifter_64/shifter_64.v}
vlog -vlog01compat -work work +incdir+D:/CompArch/adder_64 {D:/CompArch/adder_64/adder_64.v}
vlog -vlog01compat -work work +incdir+D:/CompArch/mux_8to1_64 {D:/CompArch/mux_8to1_64/mux_8to1_64.v}
vlog -vlog01compat -work work +incdir+D:/CompArch/ram_256x64 {D:/CompArch/ram_256x64/ram_256x64.v}
vlog -vlog01compat -work work +incdir+D:/CompArch/tsb_64 {D:/CompArch/tsb_64/tsb_64.v}
vlog -vlog01compat -work work +incdir+D:/CompArch/mux_2to1_64 {D:/CompArch/mux_2to1_64/mux_2to1_64.v}
vlog -vlog01compat -work work +incdir+D:/CompArch/regfile_32x64 {D:/CompArch/regfile_32x64/regfile_32x64.v}
vlog -vlog01compat -work work +incdir+D:/CompArch/alu_legv8 {D:/CompArch/alu_legv8/alu_legv8.v}
vlog -vlog01compat -work work +incdir+D:/CompArch/datapath_legv8 {D:/CompArch/datapath_legv8/datapath_legv8.v}

vlog -vlog01compat -work work +incdir+D:/CompArch/datapath_legv8 {D:/CompArch/datapath_legv8/datapath_legv8_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L fiftyfivenm_ver -L rtl_work -L work -voptargs="+acc"  datapath_legv8_tb

add wave *
view structure
view signals
run -all
