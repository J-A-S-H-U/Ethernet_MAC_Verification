vlib work

#vlog RTL/*.v

vlog +acc +define+ETH_REGISTERED_OUTPUTS +incdir+./RTL ./TB/top_tb.sv

vsim work.top_tb

do wave.do 

run -all

add log -r /*