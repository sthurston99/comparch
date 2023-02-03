transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/CompArch/inst_reg {D:/CompArch/inst_reg/inst_reg.v}
vlog -vlog01compat -work work +incdir+D:/CompArch/prog_cnt {D:/CompArch/prog_cnt/prog_cnt.v}

vlog -vlog01compat -work work +incdir+D:/CompArch/prog_cnt {D:/CompArch/prog_cnt/prog_cnt_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L fiftyfivenm_ver -L rtl_work -L work -voptargs="+acc"  prog_cnt_tb

add wave *
view structure
view signals
run -all
