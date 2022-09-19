transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/lenovo/Desktop/Logic2_project {C:/Users/lenovo/Desktop/Logic2_project/s_box.v}
vlog -vlog01compat -work work +incdir+C:/Users/lenovo/Desktop/Logic2_project {C:/Users/lenovo/Desktop/Logic2_project/subByte.v}
vlog -vlog01compat -work work +incdir+C:/Users/lenovo/Desktop/Logic2_project {C:/Users/lenovo/Desktop/Logic2_project/add_round_key.v}
vlog -vlog01compat -work work +incdir+C:/Users/lenovo/Desktop/Logic2_project {C:/Users/lenovo/Desktop/Logic2_project/shift_rows.v}
vlog -vlog01compat -work work +incdir+C:/Users/lenovo/Desktop/Logic2_project {C:/Users/lenovo/Desktop/Logic2_project/mix_columns.v}
vlog -vlog01compat -work work +incdir+C:/Users/lenovo/Desktop/Logic2_project {C:/Users/lenovo/Desktop/Logic2_project/key_expansion.v}
vlog -vlog01compat -work work +incdir+C:/Users/lenovo/Desktop/Logic2_project {C:/Users/lenovo/Desktop/Logic2_project/inv_sbox.v}
vlog -vlog01compat -work work +incdir+C:/Users/lenovo/Desktop/Logic2_project {C:/Users/lenovo/Desktop/Logic2_project/inv_subByte.v}
vlog -vlog01compat -work work +incdir+C:/Users/lenovo/Desktop/Logic2_project {C:/Users/lenovo/Desktop/Logic2_project/inv_shift_rows.v}
vlog -vlog01compat -work work +incdir+C:/Users/lenovo/Desktop/Logic2_project {C:/Users/lenovo/Desktop/Logic2_project/inv_mix_columns.v}
vlog -vlog01compat -work work +incdir+C:/Users/lenovo/Desktop/Logic2_project {C:/Users/lenovo/Desktop/Logic2_project/key_expansion_192.v}
vlog -vlog01compat -work work +incdir+C:/Users/lenovo/Desktop/Logic2_project {C:/Users/lenovo/Desktop/Logic2_project/key_expansion_256.v}
vlog -vlog01compat -work work +incdir+C:/Users/lenovo/Desktop/Logic2_project {C:/Users/lenovo/Desktop/Logic2_project/encryption_layer128.v}
vlog -vlog01compat -work work +incdir+C:/Users/lenovo/Desktop/Logic2_project {C:/Users/lenovo/Desktop/Logic2_project/decryption_layer128.v}
vlog -vlog01compat -work work +incdir+C:/Users/lenovo/Desktop/Logic2_project {C:/Users/lenovo/Desktop/Logic2_project/encryption_layer192.v}
vlog -vlog01compat -work work +incdir+C:/Users/lenovo/Desktop/Logic2_project {C:/Users/lenovo/Desktop/Logic2_project/decryption_layer192.v}
vlog -vlog01compat -work work +incdir+C:/Users/lenovo/Desktop/Logic2_project {C:/Users/lenovo/Desktop/Logic2_project/encryption_layer256.v}
vlog -vlog01compat -work work +incdir+C:/Users/lenovo/Desktop/Logic2_project {C:/Users/lenovo/Desktop/Logic2_project/decryption_layer256.v}
vlog -vlog01compat -work work +incdir+C:/Users/lenovo/Desktop/Logic2_project {C:/Users/lenovo/Desktop/Logic2_project/wrapper.v}

vlog -vlog01compat -work work +incdir+C:/Users/lenovo/Desktop/Logic2_project {C:/Users/lenovo/Desktop/Logic2_project/wrapper_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  wrapper_tb

add wave *
view structure
view signals
run -all
