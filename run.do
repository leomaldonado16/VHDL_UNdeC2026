vdel -all
vlib work
vmap work work
vcom rtl/mux.vhd
vcom tb/mux_tb.vhd
vsim -voptargs=+acc work.mux_tb
add wave -r /*
run 50ms

# vsim -do run.do