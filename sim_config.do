
view structure
view signals

add wave *

#add wave -position end -label ivs				sim:/tb/dut/inst_ant_logic/ivs
##add wave -position end  sim:/tb/dut/inst_ant_logic/ihs
##add wave -position end  sim:/tb/dut/inst_ant_logic/ipix_active
#
#add wave -position end -label state				sim:/tb/dut/inst_ant_logic/inst_logic_fsm/state
#add wave -position end -label color		sim:/tb/dut/inst_ant_logic/inst_logic_fsm/cell_color
#add wave -position end -label direction		sim:/tb/dut/inst_ant_logic/inst_logic_fsm/direction
#add wave -position end -label rotation			sim:/tb/dut/inst_ant_logic/inst_logic_fsm/rotation
#
##add wave -position end  sim:/tb/dut/R
##add wave -position end  sim:/tb/dut/vga_active
##add wave -position end  sim:/tb/dut/vga_x
##add wave -position end  sim:/tb/dut/vga_y
#add wave -position end -label ram										sim:/tb/dut/inst_ant_logic/inst_field/ram
#
#
#add wave -position end -label cur_pos_x	-radix decimal			sim:/tb/dut/inst_ant_logic/inst_logic_fsm/cur_pos_x
#add wave -position end -label cur_pos_y	-radix decimal			sim:/tb/dut/inst_ant_logic/inst_logic_fsm/cur_pos_y
#add wave -position end -label next_pos_x	-radix decimal			sim:/tb/dut/inst_ant_logic/inst_logic_fsm/next_pos_x
#add wave -position end -label next_pos_y	-radix decimal			sim:/tb/dut/inst_ant_logic/inst_logic_fsm/next_pos_y
#
#add wave -position end -label write-addr	-radix decimal			sim:/tb/dut/inst_ant_logic/inst_logic_fsm/oaddr_wr
#add wave -position end -label write-is									sim:/tb/dut/inst_ant_logic/inst_logic_fsm/owr_en
#add wave -position end -label write-value	-radix decimal			sim:/tb/dut/inst_ant_logic/inst_logic_fsm/owr_data
#
#add wave -position end -label read-addr	-radix decimal			sim:/tb/dut/inst_ant_logic/inst_logic_fsm/oaddr_rd
#add wave -position end -label read-is									sim:/tb/dut/inst_ant_logic/inst_logic_fsm/ord_en
#add wave -position end -label read-value								sim:/tb/dut/inst_ant_logic/inst_logic_fsm/ird_data
##add wave -position end  sim:/tb/dut/inst_ant_logic/inst_field/ord_data_valid


#add wave -position end -label ant_x	-radix decimal sim:/tb/dut/inst_ant_body/ant_x
#add wave -position end -label ant_y	-radix decimal sim:/tb/dut/inst_ant_body/ant_y
#add wave -position end -label cur_pos_x	-radix decimal sim:/tb/dut/inst_ant_body/cur_pos_x
#add wave -position end -label cur_pos_y	-radix decimal sim:/tb/dut/inst_ant_body/cur_pos_y
#add wave -position end -label active_en  sim:/tb/dut/inst_vga/active_en

add wave -position end -label ivs   sim:/tb/dut/inst_ant_logic/ivs
add wave -position end  -label line    -radix decimal sim:/tb/dut/inst_ant_logic/line
add wave -position end  -label column    -radix decimal sim:/tb/dut/inst_ant_logic/column
add wave -position end  -label field_ord_data    -radix decimal sim:/tb/dut/inst_ant_logic/field_ord_data
add wave -position end  -label ram    -radix decimal sim:/tb/dut/inst_ant_logic/inst_field/ram


add wave -position end -radix decimal  sim:/tb/dut/inst_cell_math/ivga_x
add wave -position end -radix decimal  sim:/tb/dut/inst_cell_math/ivga_y
add wave -position end -radix decimal  sim:/tb/dut/inst_cell_math/line
add wave -position end -radix decimal  sim:/tb/dut/inst_cell_math/column
add wave -position end -radix decimal  sim:/tb/dut/inst_cell_math/rx
add wave -position end -radix decimal  sim:/tb/dut/inst_cell_math/ry



add wave -position end  sim:/tb/dut/inst_vga/hsync


run 10000 ms