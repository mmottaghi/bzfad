#--------------------------------------------
#-- Provided by Mohammad Mottaghi          --
#--                                        --
#--                           2007 	   --
#--------------------------------------------

#-- local variable definitions
set clk_period 6
set topname evlpMultiplier16
set prj_name byzfad16
set period 24

#-----------------------------------------------------------------------
#---- P O W E R   E S T I M E T I O N   U S I N G   0.13 UM   T E C H .
#-----------------------------------------------------------------------

#-- resetting the shell memory:
remove_design -all

#-- script local variables
set TECH_LIB /home/cad/TSMC/13/synopsys

#-- library setting
set target_library "$TECH_LIB/typical.db"
set link_library "$TECH_LIB/typical.db ./source/$prj_name.v"

#-- read the design:
read_verilog ./source/$prj_name.v


################################################## LP
#-- specifying the current design:
current_design $topname

link

#-- clock definition:
create_clock -p $period [find port "clk"]

#set_load 5 [all_outputs]
#set_resistance 6 [all_outputs]
#-- read the VCD file
read_vcd -strip_path aatestbench/mul  ./source/$prj_name.vcd

#-- power calculation:
calculate_power -waveform

#-- report results
report_power > ./report/pow_$prj_name.txt


