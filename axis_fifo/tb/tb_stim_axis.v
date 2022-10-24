////////////////////////////////////////////////////////////////////////////////
// @file    tb_stim_axis.v
// @author  JAY CONVERTINO
// @date    2022.10.24
// @brief   Generic AXIS test bench modules (stimulators) with verification.
// @details All modules for AXIS test bench top are here. There will be loop of
//          tests the axis core must pass. In these tests is where the end user
//          must alter the checks if the input does not equal the output. As 
//          these were designed with a FIFO in mind.
////////////////////////////////////////////////////////////////////////////////

`timescale 1 ns/10 ps

// constant clock generator
module clk_stimulator #(
    parameter CLOCKS = 2, // # of clocks
    parameter CLOCK_BASE = 1000000, // clock time base mhz
    parameter CLOCK_DIFFS = 100, // clock time diff mhz
    parameter RESETS = 2, // # of resets
    parameter RESET_BASE = 200, // time to stay in reset
    parameter RESET_DIFFS = 100 // time diff for other resets
  ) clk_stim
  (
    //clk out ... maybe a vector of clks with diff speeds.
    .clkv(tb_dut_clk, tb_stim_clk),
    //rstn out ... maybe a vector of rsts with different off times
    .rstnv(tb_dut_rstn, tb_stim_rstn),
    .rstv()
  );
endmodule
  
// test case stimulator for axis core.
module axis_stimulator #(
    parameter BUS_WIDTH = 1,
    parameter USER_WIDTH = 1,
    parameter DEST_WIDTH = 1,
    parameter FILE_IN = in.bin,
    parameter FILE_OUT = out.bin
  ) axis_stim
  (
    // read
    .m_axis_aclk(tb_stim_clk),
    .m_axis_arstn(tb_stim_rstn),
    .m_axis_tvalid(tb_stim_valid),
    .m_axis_tready(tb_stim_ready),
    .m_axis_tdata(tb_stim_data),
    .m_axis_tkeep(tb_stim_keep),
    .m_axis_tlast(tb_stim_last),
    .m_axis_tuser(tb_stim_user),
    .m_axis_tdest(tb_stim_dest),
    // write
    .s_axis_aclk(tb_dut_clk),
    .s_axis_arstn(tb_dut_rstn),
    .s_axis_tvalid(tb_dut_valid),
    .s_axis_tready(tb_dut_ready),
    .s_axis_tdata(tb_dut_data),
    .s_axis_tkeep(tb_dut_keep),
    .s_axis_tlast(tb_dut_last),
    .s_axis_tuser(tb_dut_user),
    .s_axis_tdest(tb_dut_dest)
  );
endmodule

