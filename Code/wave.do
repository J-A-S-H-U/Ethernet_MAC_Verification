onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -group PROC /top_tb/proc/wb_clk_i
add wave -noupdate -group PROC /top_tb/proc/wb_rst_i
add wave -noupdate -group PROC /top_tb/proc/wb_dat_i
add wave -noupdate -group PROC /top_tb/proc/wb_dat_o
add wave -noupdate -group PROC /top_tb/proc/wb_err_o
add wave -noupdate -group PROC /top_tb/proc/wb_adr_i
add wave -noupdate -group PROC /top_tb/proc/wb_sel_i
add wave -noupdate -group PROC /top_tb/proc/wb_we_i
add wave -noupdate -group PROC /top_tb/proc/wb_cyc_i
add wave -noupdate -group PROC /top_tb/proc/wb_stb_i
add wave -noupdate -group PROC /top_tb/proc/wb_ack_o
add wave -noupdate -group MEM /top_tb/mem/m_wb_adr_o
add wave -noupdate -group MEM /top_tb/mem/m_wb_sel_o
add wave -noupdate -group MEM /top_tb/mem/m_wb_we_o
add wave -noupdate -group MEM /top_tb/mem/m_wb_dat_i
add wave -noupdate -group MEM /top_tb/mem/m_wb_dat_o
add wave -noupdate -group MEM /top_tb/mem/m_wb_cyc_o
add wave -noupdate -group MEM /top_tb/mem/m_wb_stb_o
add wave -noupdate -group MEM /top_tb/mem/m_wb_ack_i
add wave -noupdate -group MEM /top_tb/mem/m_wb_err_i
add wave -noupdate -group PHY /top_tb/phy/mtx_clk_pad_i
add wave -noupdate -group PHY /top_tb/phy/mtxd_pad_o
add wave -noupdate -group PHY /top_tb/phy/mtxen_pad_o
add wave -noupdate -group PHY /top_tb/phy/mtxerr_pad_o
add wave -noupdate -group PHY /top_tb/phy/mrx_clk_pad_i
add wave -noupdate -group PHY /top_tb/phy/mrxd_pad_i
add wave -noupdate -group PHY /top_tb/phy/mrxdv_pad_i
add wave -noupdate -group PHY /top_tb/phy/mrxerr_pad_i
add wave -noupdate -group PHY /top_tb/phy/mcoll_pad_i
add wave -noupdate -group PHY /top_tb/phy/mcrs_pad_i
add wave -noupdate -group MII /top_tb/mii/md_pad_i
add wave -noupdate -group MII /top_tb/mii/mdc_pad_o
add wave -noupdate -group MII /top_tb/mii/md_pad_o
add wave -noupdate -group MII /top_tb/mii/md_padoe_o
add wave -noupdate -group MII /top_tb/mii/int_o
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {114 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 89
configure wave -valuecolwidth 40
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {5591 ns}
