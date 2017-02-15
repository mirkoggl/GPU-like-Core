-- ------------------------------------------------------------------------- 
-- Altera DSP Builder Advanced Flow Tools Release Version 14.1
-- Quartus II development tool and MATLAB/Simulink Interface
-- 
-- Legal Notice: Copyright 2014 Altera Corporation.  All rights reserved.
-- Your use of  Altera  Corporation's design tools,  logic functions and other
-- software and tools,  and its AMPP  partner logic functions, and  any output
-- files  any of the  foregoing  device programming or simulation files),  and
-- any associated  documentation or information are expressly subject  to  the
-- terms and conditions  of the Altera Program License Subscription Agreement,
-- Altera  MegaCore  Function  License  Agreement, or other applicable license
-- agreement,  including,  without limitation,  that your use  is for the sole
-- purpose of  programming  logic  devices  manufactured by Altera and sold by
-- Altera or its authorized  distributors.  Please  refer  to  the  applicable
-- agreement for further details.
-- ---------------------------------------------------------------------------

-- VHDL created from floatComponent_rint_dut_prim_rintBlock_typeSFloat_23_8_typeSFloat_23_8_310cu3u78A0Zs0i226123642i229755y
-- VHDL created on Mon Apr 20 12:06:18 2015


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.all;
use std.TextIO.all;
use work.dspba_library_package.all;

LIBRARY altera_mf;
USE altera_mf.altera_mf_components.all;
LIBRARY altera_lnsim;
USE altera_lnsim.altera_lnsim_components.altera_syncram;
LIBRARY lpm;
USE lpm.lpm_components.all;

USE work.rint_dut_safe_path.all;
entity floatComponent_rint_dut_prim_rintBlock_typeSFloat_23_8_typeSFloat_23_8_310cu3u78A0Zs0i226123642i229755y is
    port (
        in_0 : in std_logic_vector(31 downto 0);  -- float32_m23
        out_primWireOut : out std_logic_vector(31 downto 0);  -- float32_m23
        clk : in std_logic;
        areset : in std_logic
    );
end floatComponent_rint_dut_prim_rintBlock_typeSFloat_23_8_typeSFloat_23_8_310cu3u78A0Zs0i226123642i229755y;

architecture normal of floatComponent_rint_dut_prim_rintBlock_typeSFloat_23_8_typeSFloat_23_8_310cu3u78A0Zs0i226123642i229755y is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal cstAllZWF_uid9_block_rsrvd_fix_q : STD_LOGIC_VECTOR (22 downto 0);
    signal cstNaNWF_uid10_block_rsrvd_fix_q : STD_LOGIC_VECTOR (22 downto 0);
    signal cstAllZWE_uid11_block_rsrvd_fix_q : STD_LOGIC_VECTOR (7 downto 0);
    signal cstAllOWE_uid12_block_rsrvd_fix_q : STD_LOGIC_VECTOR (7 downto 0);
    signal cstBiasM2_uid13_block_rsrvd_fix_q : STD_LOGIC_VECTOR (7 downto 0);
    signal cstBiasM1_uid14_block_rsrvd_fix_q : STD_LOGIC_VECTOR (7 downto 0);
    signal cstBiasPwF_uid15_block_rsrvd_fix_q : STD_LOGIC_VECTOR (7 downto 0);
    signal cstBiasPwFM1_uid16_block_rsrvd_fix_q : STD_LOGIC_VECTOR (7 downto 0);
    signal fracXIsZero_uid28_block_rsrvd_fix_a : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid28_block_rsrvd_fix_q_i : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid28_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal xIsInt_uid40_block_rsrvd_fix_a : STD_LOGIC_VECTOR (10 downto 0);
    signal xIsInt_uid40_block_rsrvd_fix_b : STD_LOGIC_VECTOR (10 downto 0);
    signal xIsInt_uid40_block_rsrvd_fix_o : STD_LOGIC_VECTOR (10 downto 0);
    signal xIsInt_uid40_block_rsrvd_fix_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal xIsInt_uid40_block_rsrvd_fix_n : STD_LOGIC_VECTOR (0 downto 0);
    signal xIsSmallFrac_uid44_block_rsrvd_fix_a : STD_LOGIC_VECTOR (0 downto 0);
    signal xIsSmallFrac_uid44_block_rsrvd_fix_b : STD_LOGIC_VECTOR (0 downto 0);
    signal xIsSmallFrac_uid44_block_rsrvd_fix_q_i : STD_LOGIC_VECTOR (0 downto 0);
    signal xIsSmallFrac_uid44_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal maskTab_uid47_block_rsrvd_fix_q : STD_LOGIC_VECTOR (23 downto 0);
    signal fracPostMask_uid48_block_rsrvd_fix_a : STD_LOGIC_VECTOR (23 downto 0);
    signal fracPostMask_uid48_block_rsrvd_fix_b : STD_LOGIC_VECTOR (23 downto 0);
    signal fracPostMask_uid48_block_rsrvd_fix_q_i : STD_LOGIC_VECTOR (23 downto 0);
    signal fracPostMask_uid48_block_rsrvd_fix_q : STD_LOGIC_VECTOR (23 downto 0);
    signal maskIncTab_uid52_block_rsrvd_fix_q : STD_LOGIC_VECTOR (23 downto 0);
    signal rnd_uid54_block_rsrvd_fix_a : STD_LOGIC_VECTOR (26 downto 0);
    signal rnd_uid54_block_rsrvd_fix_b : STD_LOGIC_VECTOR (26 downto 0);
    signal rnd_uid54_block_rsrvd_fix_o : STD_LOGIC_VECTOR (26 downto 0);
    signal rnd_uid54_block_rsrvd_fix_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal rnd_uid54_block_rsrvd_fix_c : STD_LOGIC_VECTOR (0 downto 0);
    signal InvStk_uid59_block_rsrvd_fix_a : STD_LOGIC_VECTOR (0 downto 0);
    signal InvStk_uid59_block_rsrvd_fix_q_i : STD_LOGIC_VECTOR (0 downto 0);
    signal InvStk_uid59_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvLsb_uid60_block_rsrvd_fix_a : STD_LOGIC_VECTOR (0 downto 0);
    signal InvLsb_uid60_block_rsrvd_fix_q_i : STD_LOGIC_VECTOR (0 downto 0);
    signal InvLsb_uid60_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal maskIncTabPostAnd_uid63_block_rsrvd_fix_a : STD_LOGIC_VECTOR (23 downto 0);
    signal maskIncTabPostAnd_uid63_block_rsrvd_fix_b : STD_LOGIC_VECTOR (23 downto 0);
    signal maskIncTabPostAnd_uid63_block_rsrvd_fix_q_i : STD_LOGIC_VECTOR (23 downto 0);
    signal maskIncTabPostAnd_uid63_block_rsrvd_fix_q : STD_LOGIC_VECTOR (23 downto 0);
    signal fracPostRnd_uid66_block_rsrvd_fix_a : STD_LOGIC_VECTOR (24 downto 0);
    signal fracPostRnd_uid66_block_rsrvd_fix_b : STD_LOGIC_VECTOR (24 downto 0);
    signal fracPostRnd_uid66_block_rsrvd_fix_q_i : STD_LOGIC_VECTOR (24 downto 0);
    signal fracPostRnd_uid66_block_rsrvd_fix_q : STD_LOGIC_VECTOR (24 downto 0);
    signal redist0_q : STD_LOGIC_VECTOR (23 downto 0);
    signal redist1_q : STD_LOGIC_VECTOR (23 downto 0);
    signal redist2_q : STD_LOGIC_VECTOR (23 downto 0);
    signal redist3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist5_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist6_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist7_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist8_q : STD_LOGIC_VECTOR (7 downto 0);
    signal fracXIsNotZero_uid27_block_rsrvd_fix_a : STD_LOGIC_VECTOR (25 downto 0);
    signal fracXIsNotZero_uid27_block_rsrvd_fix_b : STD_LOGIC_VECTOR (25 downto 0);
    signal fracXIsNotZero_uid27_block_rsrvd_fix_o : STD_LOGIC_VECTOR (25 downto 0);
    signal fracXIsNotZero_uid27_block_rsrvd_fix_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid27_block_rsrvd_fix_n : STD_LOGIC_VECTOR (0 downto 0);
    signal updatedY_uid37_block_rsrvd_fix_q : STD_LOGIC_VECTOR (23 downto 0);
    signal xIsLessThanHalf_uid43_block_rsrvd_fix_a : STD_LOGIC_VECTOR (10 downto 0);
    signal xIsLessThanHalf_uid43_block_rsrvd_fix_b : STD_LOGIC_VECTOR (10 downto 0);
    signal xIsLessThanHalf_uid43_block_rsrvd_fix_o : STD_LOGIC_VECTOR (10 downto 0);
    signal xIsLessThanHalf_uid43_block_rsrvd_fix_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal xIsLessThanHalf_uid43_block_rsrvd_fix_n : STD_LOGIC_VECTOR (0 downto 0);
    signal maskTableZ_uid65_block_rsrvd_fix_q : STD_LOGIC_VECTOR (24 downto 0);
    signal expXIsZero_uid23_block_rsrvd_fix_a : STD_LOGIC_VECTOR (7 downto 0);
    signal expXIsZero_uid23_block_rsrvd_fix_b : STD_LOGIC_VECTOR (7 downto 0);
    signal expXIsZero_uid23_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid25_block_rsrvd_fix_a : STD_LOGIC_VECTOR (7 downto 0);
    signal expXIsMax_uid25_block_rsrvd_fix_b : STD_LOGIC_VECTOR (7 downto 0);
    signal expXIsMax_uid25_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal exc_I_uid29_block_rsrvd_fix_a : STD_LOGIC_VECTOR (0 downto 0);
    signal exc_I_uid29_block_rsrvd_fix_b : STD_LOGIC_VECTOR (0 downto 0);
    signal exc_I_uid29_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvFracXIsZero_uid30_block_rsrvd_fix_a : STD_LOGIC_VECTOR (0 downto 0);
    signal InvFracXIsZero_uid30_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal exc_N_uid31_block_rsrvd_fix_a : STD_LOGIC_VECTOR (0 downto 0);
    signal exc_N_uid31_block_rsrvd_fix_b : STD_LOGIC_VECTOR (0 downto 0);
    signal exc_N_uid31_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid36_block_rsrvd_fix_a : STD_LOGIC_VECTOR (23 downto 0);
    signal fracXIsZero_uid36_block_rsrvd_fix_b : STD_LOGIC_VECTOR (23 downto 0);
    signal fracXIsZero_uid36_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsBiasM1_uid41_block_rsrvd_fix_a : STD_LOGIC_VECTOR (7 downto 0);
    signal expXIsBiasM1_uid41_block_rsrvd_fix_b : STD_LOGIC_VECTOR (7 downto 0);
    signal expXIsBiasM1_uid41_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal inputIsHalf_uid42_block_rsrvd_fix_a : STD_LOGIC_VECTOR (0 downto 0);
    signal inputIsHalf_uid42_block_rsrvd_fix_b : STD_LOGIC_VECTOR (0 downto 0);
    signal inputIsHalf_uid42_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvMaskTab_uid49_block_rsrvd_fix_a : STD_LOGIC_VECTOR (23 downto 0);
    signal InvMaskTab_uid49_block_rsrvd_fix_q : STD_LOGIC_VECTOR (23 downto 0);
    signal rndAMask_uid61_block_rsrvd_fix_a : STD_LOGIC_VECTOR (0 downto 0);
    signal rndAMask_uid61_block_rsrvd_fix_b : STD_LOGIC_VECTOR (0 downto 0);
    signal rndAMask_uid61_block_rsrvd_fix_c : STD_LOGIC_VECTOR (0 downto 0);
    signal rndAMask_uid61_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal rndANDMask_uid62_block_rsrvd_fix_a : STD_LOGIC_VECTOR (0 downto 0);
    signal rndANDMask_uid62_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracPostRnd0_uid64_block_rsrvd_fix_a : STD_LOGIC_VECTOR (24 downto 0);
    signal fracPostRnd0_uid64_block_rsrvd_fix_b : STD_LOGIC_VECTOR (24 downto 0);
    signal fracPostRnd0_uid64_block_rsrvd_fix_o : STD_LOGIC_VECTOR (24 downto 0);
    signal fracPostRnd0_uid64_block_rsrvd_fix_q : STD_LOGIC_VECTOR (24 downto 0);
    signal excRZero_uid73_block_rsrvd_fix_a : STD_LOGIC_VECTOR (0 downto 0);
    signal excRZero_uid73_block_rsrvd_fix_b : STD_LOGIC_VECTOR (0 downto 0);
    signal excRZero_uid73_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExc_N_uid79_block_rsrvd_fix_a : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExc_N_uid79_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signR_uid80_block_rsrvd_fix_a : STD_LOGIC_VECTOR (0 downto 0);
    signal signR_uid80_block_rsrvd_fix_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signR_uid80_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal oFracX_uid39_uid39_block_rsrvd_fix_q : STD_LOGIC_VECTOR (23 downto 0);
    signal expX_uid6_block_rsrvd_fix_in : STD_LOGIC_VECTOR (31 downto 0);
    signal expX_uid6_block_rsrvd_fix_b : STD_LOGIC_VECTOR (7 downto 0);
    signal fracX_uid7_block_rsrvd_fix_in : STD_LOGIC_VECTOR (31 downto 0);
    signal fracX_uid7_block_rsrvd_fix_b : STD_LOGIC_VECTOR (22 downto 0);
    signal signX_uid8_block_rsrvd_fix_in : STD_LOGIC_VECTOR (31 downto 0);
    signal signX_uid8_block_rsrvd_fix_b : STD_LOGIC_VECTOR (0 downto 0);
    signal tableAddrExt_uid45_block_rsrvd_fix_a : STD_LOGIC_VECTOR (8 downto 0);
    signal tableAddrExt_uid45_block_rsrvd_fix_b : STD_LOGIC_VECTOR (8 downto 0);
    signal tableAddrExt_uid45_block_rsrvd_fix_o : STD_LOGIC_VECTOR (8 downto 0);
    signal tableAddrExt_uid45_block_rsrvd_fix_q : STD_LOGIC_VECTOR (8 downto 0);
    signal selBitsEpilogue_uid74_block_rsrvd_fix_q : STD_LOGIC_VECTOR (4 downto 0);
    signal fracPostRndMask_uid53_block_rsrvd_fix_a : STD_LOGIC_VECTOR (23 downto 0);
    signal fracPostRndMask_uid53_block_rsrvd_fix_b : STD_LOGIC_VECTOR (23 downto 0);
    signal fracPostRndMask_uid53_block_rsrvd_fix_q : STD_LOGIC_VECTOR (23 downto 0);
    signal maksIncTabBottom_uid55_block_rsrvd_fix_in : STD_LOGIC_VECTOR (22 downto 0);
    signal maksIncTabBottom_uid55_block_rsrvd_fix_b : STD_LOGIC_VECTOR (22 downto 0);
    signal normBit_uid67_block_rsrvd_fix_in : STD_LOGIC_VECTOR (24 downto 0);
    signal normBit_uid67_block_rsrvd_fix_b : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRHigh_uid68_block_rsrvd_fix_in : STD_LOGIC_VECTOR (23 downto 0);
    signal fracRHigh_uid68_block_rsrvd_fix_b : STD_LOGIC_VECTOR (22 downto 0);
    signal fracRLow_uid69_block_rsrvd_fix_in : STD_LOGIC_VECTOR (22 downto 0);
    signal fracRLow_uid69_block_rsrvd_fix_b : STD_LOGIC_VECTOR (22 downto 0);
    signal expRExt_uid71_block_rsrvd_fix_a : STD_LOGIC_VECTOR (8 downto 0);
    signal expRExt_uid71_block_rsrvd_fix_b : STD_LOGIC_VECTOR (8 downto 0);
    signal expRExt_uid71_block_rsrvd_fix_o : STD_LOGIC_VECTOR (8 downto 0);
    signal expRExt_uid71_block_rsrvd_fix_q : STD_LOGIC_VECTOR (8 downto 0);
    signal fracPostInvMask_uid50_block_rsrvd_fix_a : STD_LOGIC_VECTOR (23 downto 0);
    signal fracPostInvMask_uid50_block_rsrvd_fix_b : STD_LOGIC_VECTOR (23 downto 0);
    signal fracPostInvMask_uid50_block_rsrvd_fix_q : STD_LOGIC_VECTOR (23 downto 0);
    signal tabAddr_uid46_block_rsrvd_fix_in : STD_LOGIC_VECTOR (4 downto 0);
    signal tabAddr_uid46_block_rsrvd_fix_b : STD_LOGIC_VECTOR (4 downto 0);
    signal fracSelBits_uid75_block_rsrvd_fix_q : STD_LOGIC_VECTOR (1 downto 0);
    signal expSelBits_uid76_block_rsrvd_fix_q : STD_LOGIC_VECTOR (1 downto 0);
    signal fracPostLsbMask_uid56_block_rsrvd_fix_q : STD_LOGIC_VECTOR (23 downto 0);
    signal fracR_uid70_block_rsrvd_fix_s : STD_LOGIC_VECTOR (0 downto 0);
    signal fracR_uid70_block_rsrvd_fix_q : STD_LOGIC_VECTOR (22 downto 0);
    signal expR_uid72_block_rsrvd_fix_in : STD_LOGIC_VECTOR (7 downto 0);
    signal expR_uid72_block_rsrvd_fix_b : STD_LOGIC_VECTOR (7 downto 0);
    signal stk_uid51_block_rsrvd_fix_a : STD_LOGIC_VECTOR (26 downto 0);
    signal stk_uid51_block_rsrvd_fix_b : STD_LOGIC_VECTOR (26 downto 0);
    signal stk_uid51_block_rsrvd_fix_o : STD_LOGIC_VECTOR (26 downto 0);
    signal stk_uid51_block_rsrvd_fix_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal stk_uid51_block_rsrvd_fix_c : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPostExc_uid77_block_rsrvd_fix_s : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRPostExc_uid77_block_rsrvd_fix_q : STD_LOGIC_VECTOR (22 downto 0);
    signal expRPostExc_uid78_block_rsrvd_fix_s : STD_LOGIC_VECTOR (1 downto 0);
    signal expRPostExc_uid78_block_rsrvd_fix_q : STD_LOGIC_VECTOR (7 downto 0);
    signal fracPostLsbMask_uid57_block_rsrvd_fix_a : STD_LOGIC_VECTOR (23 downto 0);
    signal fracPostLsbMask_uid57_block_rsrvd_fix_b : STD_LOGIC_VECTOR (23 downto 0);
    signal fracPostLsbMask_uid57_block_rsrvd_fix_q : STD_LOGIC_VECTOR (23 downto 0);
    signal r0_uid81_block_rsrvd_fix_q : STD_LOGIC_VECTOR (31 downto 0);
    signal lsb_uid58_block_rsrvd_fix_a : STD_LOGIC_VECTOR (26 downto 0);
    signal lsb_uid58_block_rsrvd_fix_b : STD_LOGIC_VECTOR (26 downto 0);
    signal lsb_uid58_block_rsrvd_fix_o : STD_LOGIC_VECTOR (26 downto 0);
    signal lsb_uid58_block_rsrvd_fix_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal lsb_uid58_block_rsrvd_fix_c : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- cstNaNWF_uid10_block_rsrvd_fix(CONSTANT,9)
    cstNaNWF_uid10_block_rsrvd_fix_q <= "00000000000000000000001";

    -- in_0(GPIN,3)@0

    -- fracX_uid7_block_rsrvd_fix(BITSELECT,6)@0
    fracX_uid7_block_rsrvd_fix_in <= in_0;
    fracX_uid7_block_rsrvd_fix_b <= fracX_uid7_block_rsrvd_fix_in(22 downto 0);

    -- redist4(DELAY,86)
    redist4 : dspba_delay
    GENERIC MAP ( width => 23, depth => 1 )
    PORT MAP ( xin => fracX_uid7_block_rsrvd_fix_b, xout => redist4_q, clk => clk, aclr => areset );

    -- redist5(DELAY,87)
    redist5 : dspba_delay
    GENERIC MAP ( width => 23, depth => 2 )
    PORT MAP ( xin => redist4_q, xout => redist5_q, clk => clk, aclr => areset );

    -- fracXIsNotZero_uid27_block_rsrvd_fix(COMPARE,26)@3
    fracXIsNotZero_uid27_block_rsrvd_fix_cin <= GND_q;
    fracXIsNotZero_uid27_block_rsrvd_fix_a <= STD_LOGIC_VECTOR("00" & redist5_q) & '0';
    fracXIsNotZero_uid27_block_rsrvd_fix_b <= STD_LOGIC_VECTOR("00" & cstNaNWF_uid10_block_rsrvd_fix_q) & fracXIsNotZero_uid27_block_rsrvd_fix_cin(0);
    fracXIsNotZero_uid27_block_rsrvd_fix_o <= STD_LOGIC_VECTOR(UNSIGNED(fracXIsNotZero_uid27_block_rsrvd_fix_a) - UNSIGNED(fracXIsNotZero_uid27_block_rsrvd_fix_b));
    fracXIsNotZero_uid27_block_rsrvd_fix_n(0) <= not (fracXIsNotZero_uid27_block_rsrvd_fix_o(25));

    -- fracXIsZero_uid28_block_rsrvd_fix(LOGICAL,27)@3
    fracXIsZero_uid28_block_rsrvd_fix_a <= fracXIsNotZero_uid27_block_rsrvd_fix_n;
    fracXIsZero_uid28_block_rsrvd_fix_q_i <= not (fracXIsZero_uid28_block_rsrvd_fix_a);
    fracXIsZero_uid28_block_rsrvd_fix_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => fracXIsZero_uid28_block_rsrvd_fix_q_i, xout => fracXIsZero_uid28_block_rsrvd_fix_q, clk => clk, aclr => areset );

    -- InvFracXIsZero_uid30_block_rsrvd_fix(LOGICAL,29)@4
    InvFracXIsZero_uid30_block_rsrvd_fix_a <= fracXIsZero_uid28_block_rsrvd_fix_q;
    InvFracXIsZero_uid30_block_rsrvd_fix_q <= not (InvFracXIsZero_uid30_block_rsrvd_fix_a);

    -- cstAllOWE_uid12_block_rsrvd_fix(CONSTANT,11)
    cstAllOWE_uid12_block_rsrvd_fix_q <= "11111111";

    -- expX_uid6_block_rsrvd_fix(BITSELECT,5)@0
    expX_uid6_block_rsrvd_fix_in <= in_0;
    expX_uid6_block_rsrvd_fix_b <= expX_uid6_block_rsrvd_fix_in(30 downto 23);

    -- redist7(DELAY,89)
    redist7 : dspba_delay
    GENERIC MAP ( width => 8, depth => 3 )
    PORT MAP ( xin => expX_uid6_block_rsrvd_fix_b, xout => redist7_q, clk => clk, aclr => areset );

    -- redist8(DELAY,90)
    redist8 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1 )
    PORT MAP ( xin => redist7_q, xout => redist8_q, clk => clk, aclr => areset );

    -- expXIsMax_uid25_block_rsrvd_fix(LOGICAL,24)@4
    expXIsMax_uid25_block_rsrvd_fix_a <= redist8_q;
    expXIsMax_uid25_block_rsrvd_fix_b <= cstAllOWE_uid12_block_rsrvd_fix_q;
    expXIsMax_uid25_block_rsrvd_fix_q <= "1" WHEN expXIsMax_uid25_block_rsrvd_fix_a = expXIsMax_uid25_block_rsrvd_fix_b ELSE "0";

    -- exc_N_uid31_block_rsrvd_fix(LOGICAL,30)@4
    exc_N_uid31_block_rsrvd_fix_a <= expXIsMax_uid25_block_rsrvd_fix_q;
    exc_N_uid31_block_rsrvd_fix_b <= InvFracXIsZero_uid30_block_rsrvd_fix_q;
    exc_N_uid31_block_rsrvd_fix_q <= exc_N_uid31_block_rsrvd_fix_a and exc_N_uid31_block_rsrvd_fix_b;

    -- InvExc_N_uid79_block_rsrvd_fix(LOGICAL,78)@4
    InvExc_N_uid79_block_rsrvd_fix_a <= exc_N_uid31_block_rsrvd_fix_q;
    InvExc_N_uid79_block_rsrvd_fix_q <= not (InvExc_N_uid79_block_rsrvd_fix_a);

    -- signX_uid8_block_rsrvd_fix(BITSELECT,7)@0
    signX_uid8_block_rsrvd_fix_in <= STD_LOGIC_VECTOR(in_0);
    signX_uid8_block_rsrvd_fix_b <= signX_uid8_block_rsrvd_fix_in(31 downto 31);

    -- redist3(DELAY,85)
    redist3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 4 )
    PORT MAP ( xin => signX_uid8_block_rsrvd_fix_b, xout => redist3_q, clk => clk, aclr => areset );

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- signR_uid80_block_rsrvd_fix(LOGICAL,79)@4
    signR_uid80_block_rsrvd_fix_a <= redist3_q;
    signR_uid80_block_rsrvd_fix_b <= InvExc_N_uid79_block_rsrvd_fix_q;
    signR_uid80_block_rsrvd_fix_q <= signR_uid80_block_rsrvd_fix_a and signR_uid80_block_rsrvd_fix_b;

    -- cstBiasPwFM1_uid16_block_rsrvd_fix(CONSTANT,15)
    cstBiasPwFM1_uid16_block_rsrvd_fix_q <= "10010101";

    -- tableAddrExt_uid45_block_rsrvd_fix(SUB,44)@0
    tableAddrExt_uid45_block_rsrvd_fix_a <= STD_LOGIC_VECTOR("0" & cstBiasPwFM1_uid16_block_rsrvd_fix_q);
    tableAddrExt_uid45_block_rsrvd_fix_b <= STD_LOGIC_VECTOR("0" & expX_uid6_block_rsrvd_fix_b);
    tableAddrExt_uid45_block_rsrvd_fix_o <= STD_LOGIC_VECTOR(UNSIGNED(tableAddrExt_uid45_block_rsrvd_fix_a) - UNSIGNED(tableAddrExt_uid45_block_rsrvd_fix_b));
    tableAddrExt_uid45_block_rsrvd_fix_q <= tableAddrExt_uid45_block_rsrvd_fix_o(8 downto 0);

    -- tabAddr_uid46_block_rsrvd_fix(BITSELECT,45)@0
    tabAddr_uid46_block_rsrvd_fix_in <= tableAddrExt_uid45_block_rsrvd_fix_q(4 downto 0);
    tabAddr_uid46_block_rsrvd_fix_b <= tabAddr_uid46_block_rsrvd_fix_in(4 downto 0);

    -- maskTab_uid47_block_rsrvd_fix(LOOKUP,46)@0
    maskTab_uid47_block_rsrvd_fix: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            maskTab_uid47_block_rsrvd_fix_q <= "111111111111111111111111";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (tabAddr_uid46_block_rsrvd_fix_b) IS
                WHEN "00000" => maskTab_uid47_block_rsrvd_fix_q <= "111111111111111111111111";
                WHEN "00001" => maskTab_uid47_block_rsrvd_fix_q <= "111111111111111111111110";
                WHEN "00010" => maskTab_uid47_block_rsrvd_fix_q <= "111111111111111111111100";
                WHEN "00011" => maskTab_uid47_block_rsrvd_fix_q <= "111111111111111111111000";
                WHEN "00100" => maskTab_uid47_block_rsrvd_fix_q <= "111111111111111111110000";
                WHEN "00101" => maskTab_uid47_block_rsrvd_fix_q <= "111111111111111111100000";
                WHEN "00110" => maskTab_uid47_block_rsrvd_fix_q <= "111111111111111111000000";
                WHEN "00111" => maskTab_uid47_block_rsrvd_fix_q <= "111111111111111110000000";
                WHEN "01000" => maskTab_uid47_block_rsrvd_fix_q <= "111111111111111100000000";
                WHEN "01001" => maskTab_uid47_block_rsrvd_fix_q <= "111111111111111000000000";
                WHEN "01010" => maskTab_uid47_block_rsrvd_fix_q <= "111111111111110000000000";
                WHEN "01011" => maskTab_uid47_block_rsrvd_fix_q <= "111111111111100000000000";
                WHEN "01100" => maskTab_uid47_block_rsrvd_fix_q <= "111111111111000000000000";
                WHEN "01101" => maskTab_uid47_block_rsrvd_fix_q <= "111111111110000000000000";
                WHEN "01110" => maskTab_uid47_block_rsrvd_fix_q <= "111111111100000000000000";
                WHEN "01111" => maskTab_uid47_block_rsrvd_fix_q <= "111111111000000000000000";
                WHEN "10000" => maskTab_uid47_block_rsrvd_fix_q <= "111111110000000000000000";
                WHEN "10001" => maskTab_uid47_block_rsrvd_fix_q <= "111111100000000000000000";
                WHEN "10010" => maskTab_uid47_block_rsrvd_fix_q <= "111111000000000000000000";
                WHEN "10011" => maskTab_uid47_block_rsrvd_fix_q <= "111110000000000000000000";
                WHEN "10100" => maskTab_uid47_block_rsrvd_fix_q <= "111100000000000000000000";
                WHEN "10101" => maskTab_uid47_block_rsrvd_fix_q <= "111000000000000000000000";
                WHEN "10110" => maskTab_uid47_block_rsrvd_fix_q <= "110000000000000000000000";
                WHEN "10111" => maskTab_uid47_block_rsrvd_fix_q <= "100000000000000000000000";
                WHEN OTHERS => maskTab_uid47_block_rsrvd_fix_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- redist2(DELAY,84)
    redist2 : dspba_delay
    GENERIC MAP ( width => 24, depth => 2 )
    PORT MAP ( xin => maskTab_uid47_block_rsrvd_fix_q, xout => redist2_q, clk => clk, aclr => areset );

    -- maskTableZ_uid65_block_rsrvd_fix(BITJOIN,64)@3
    maskTableZ_uid65_block_rsrvd_fix_q <= redist2_q & GND_q;

    -- InvMaskTab_uid49_block_rsrvd_fix(LOGICAL,48)@1
    InvMaskTab_uid49_block_rsrvd_fix_a <= maskTab_uid47_block_rsrvd_fix_q;
    InvMaskTab_uid49_block_rsrvd_fix_q <= not (InvMaskTab_uid49_block_rsrvd_fix_a);

    -- oFracX_uid39_uid39_block_rsrvd_fix(BITJOIN,38)@1
    oFracX_uid39_uid39_block_rsrvd_fix_q <= VCC_q & redist4_q;

    -- fracPostInvMask_uid50_block_rsrvd_fix(LOGICAL,49)@1
    fracPostInvMask_uid50_block_rsrvd_fix_a <= oFracX_uid39_uid39_block_rsrvd_fix_q;
    fracPostInvMask_uid50_block_rsrvd_fix_b <= InvMaskTab_uid49_block_rsrvd_fix_q;
    fracPostInvMask_uid50_block_rsrvd_fix_q <= fracPostInvMask_uid50_block_rsrvd_fix_a and fracPostInvMask_uid50_block_rsrvd_fix_b;

    -- stk_uid51_block_rsrvd_fix(COMPARE,50)@1
    stk_uid51_block_rsrvd_fix_cin <= GND_q;
    stk_uid51_block_rsrvd_fix_a <= STD_LOGIC_VECTOR("0000000000000000000000000" & GND_q) & '0';
    stk_uid51_block_rsrvd_fix_b <= STD_LOGIC_VECTOR("00" & fracPostInvMask_uid50_block_rsrvd_fix_q) & stk_uid51_block_rsrvd_fix_cin(0);
    stk_uid51_block_rsrvd_fix_o <= STD_LOGIC_VECTOR(UNSIGNED(stk_uid51_block_rsrvd_fix_a) - UNSIGNED(stk_uid51_block_rsrvd_fix_b));
    stk_uid51_block_rsrvd_fix_c(0) <= stk_uid51_block_rsrvd_fix_o(26);

    -- InvStk_uid59_block_rsrvd_fix(LOGICAL,58)@1
    InvStk_uid59_block_rsrvd_fix_a <= stk_uid51_block_rsrvd_fix_c;
    InvStk_uid59_block_rsrvd_fix_q_i <= not (InvStk_uid59_block_rsrvd_fix_a);
    InvStk_uid59_block_rsrvd_fix_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => InvStk_uid59_block_rsrvd_fix_q_i, xout => InvStk_uid59_block_rsrvd_fix_q, clk => clk, aclr => areset );

    -- maskIncTab_uid52_block_rsrvd_fix(LOOKUP,51)@0
    maskIncTab_uid52_block_rsrvd_fix: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            maskIncTab_uid52_block_rsrvd_fix_q <= "000000000000000000000001";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (tabAddr_uid46_block_rsrvd_fix_b) IS
                WHEN "00000" => maskIncTab_uid52_block_rsrvd_fix_q <= "000000000000000000000001";
                WHEN "00001" => maskIncTab_uid52_block_rsrvd_fix_q <= "000000000000000000000010";
                WHEN "00010" => maskIncTab_uid52_block_rsrvd_fix_q <= "000000000000000000000100";
                WHEN "00011" => maskIncTab_uid52_block_rsrvd_fix_q <= "000000000000000000001000";
                WHEN "00100" => maskIncTab_uid52_block_rsrvd_fix_q <= "000000000000000000010000";
                WHEN "00101" => maskIncTab_uid52_block_rsrvd_fix_q <= "000000000000000000100000";
                WHEN "00110" => maskIncTab_uid52_block_rsrvd_fix_q <= "000000000000000001000000";
                WHEN "00111" => maskIncTab_uid52_block_rsrvd_fix_q <= "000000000000000010000000";
                WHEN "01000" => maskIncTab_uid52_block_rsrvd_fix_q <= "000000000000000100000000";
                WHEN "01001" => maskIncTab_uid52_block_rsrvd_fix_q <= "000000000000001000000000";
                WHEN "01010" => maskIncTab_uid52_block_rsrvd_fix_q <= "000000000000010000000000";
                WHEN "01011" => maskIncTab_uid52_block_rsrvd_fix_q <= "000000000000100000000000";
                WHEN "01100" => maskIncTab_uid52_block_rsrvd_fix_q <= "000000000001000000000000";
                WHEN "01101" => maskIncTab_uid52_block_rsrvd_fix_q <= "000000000010000000000000";
                WHEN "01110" => maskIncTab_uid52_block_rsrvd_fix_q <= "000000000100000000000000";
                WHEN "01111" => maskIncTab_uid52_block_rsrvd_fix_q <= "000000001000000000000000";
                WHEN "10000" => maskIncTab_uid52_block_rsrvd_fix_q <= "000000010000000000000000";
                WHEN "10001" => maskIncTab_uid52_block_rsrvd_fix_q <= "000000100000000000000000";
                WHEN "10010" => maskIncTab_uid52_block_rsrvd_fix_q <= "000001000000000000000000";
                WHEN "10011" => maskIncTab_uid52_block_rsrvd_fix_q <= "000010000000000000000000";
                WHEN "10100" => maskIncTab_uid52_block_rsrvd_fix_q <= "000100000000000000000000";
                WHEN "10101" => maskIncTab_uid52_block_rsrvd_fix_q <= "001000000000000000000000";
                WHEN "10110" => maskIncTab_uid52_block_rsrvd_fix_q <= "010000000000000000000000";
                WHEN "10111" => maskIncTab_uid52_block_rsrvd_fix_q <= "100000000000000000000000";
                WHEN OTHERS => maskIncTab_uid52_block_rsrvd_fix_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- fracPostRndMask_uid53_block_rsrvd_fix(LOGICAL,52)@1
    fracPostRndMask_uid53_block_rsrvd_fix_a <= oFracX_uid39_uid39_block_rsrvd_fix_q;
    fracPostRndMask_uid53_block_rsrvd_fix_b <= maskIncTab_uid52_block_rsrvd_fix_q;
    fracPostRndMask_uid53_block_rsrvd_fix_q <= fracPostRndMask_uid53_block_rsrvd_fix_a and fracPostRndMask_uid53_block_rsrvd_fix_b;

    -- rnd_uid54_block_rsrvd_fix(COMPARE,53)@1
    rnd_uid54_block_rsrvd_fix_cin <= GND_q;
    rnd_uid54_block_rsrvd_fix_a <= STD_LOGIC_VECTOR("0000000000000000000000000" & GND_q) & '0';
    rnd_uid54_block_rsrvd_fix_b <= STD_LOGIC_VECTOR("00" & fracPostRndMask_uid53_block_rsrvd_fix_q) & rnd_uid54_block_rsrvd_fix_cin(0);
    rnd_uid54_block_rsrvd_fix: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            rnd_uid54_block_rsrvd_fix_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            rnd_uid54_block_rsrvd_fix_o <= STD_LOGIC_VECTOR(UNSIGNED(rnd_uid54_block_rsrvd_fix_a) - UNSIGNED(rnd_uid54_block_rsrvd_fix_b));
        END IF;
    END PROCESS;
    rnd_uid54_block_rsrvd_fix_c(0) <= rnd_uid54_block_rsrvd_fix_o(26);

    -- maksIncTabBottom_uid55_block_rsrvd_fix(BITSELECT,54)@1
    maksIncTabBottom_uid55_block_rsrvd_fix_in <= maskIncTab_uid52_block_rsrvd_fix_q(22 downto 0);
    maksIncTabBottom_uid55_block_rsrvd_fix_b <= maksIncTabBottom_uid55_block_rsrvd_fix_in(22 downto 0);

    -- fracPostLsbMask_uid56_block_rsrvd_fix(BITJOIN,55)@1
    fracPostLsbMask_uid56_block_rsrvd_fix_q <= maksIncTabBottom_uid55_block_rsrvd_fix_b & GND_q;

    -- fracPostLsbMask_uid57_block_rsrvd_fix(LOGICAL,56)@1
    fracPostLsbMask_uid57_block_rsrvd_fix_a <= oFracX_uid39_uid39_block_rsrvd_fix_q;
    fracPostLsbMask_uid57_block_rsrvd_fix_b <= fracPostLsbMask_uid56_block_rsrvd_fix_q;
    fracPostLsbMask_uid57_block_rsrvd_fix_q <= fracPostLsbMask_uid57_block_rsrvd_fix_a and fracPostLsbMask_uid57_block_rsrvd_fix_b;

    -- lsb_uid58_block_rsrvd_fix(COMPARE,57)@1
    lsb_uid58_block_rsrvd_fix_cin <= GND_q;
    lsb_uid58_block_rsrvd_fix_a <= STD_LOGIC_VECTOR("0000000000000000000000000" & GND_q) & '0';
    lsb_uid58_block_rsrvd_fix_b <= STD_LOGIC_VECTOR("00" & fracPostLsbMask_uid57_block_rsrvd_fix_q) & lsb_uid58_block_rsrvd_fix_cin(0);
    lsb_uid58_block_rsrvd_fix_o <= STD_LOGIC_VECTOR(UNSIGNED(lsb_uid58_block_rsrvd_fix_a) - UNSIGNED(lsb_uid58_block_rsrvd_fix_b));
    lsb_uid58_block_rsrvd_fix_c(0) <= lsb_uid58_block_rsrvd_fix_o(26);

    -- InvLsb_uid60_block_rsrvd_fix(LOGICAL,59)@1
    InvLsb_uid60_block_rsrvd_fix_a <= lsb_uid58_block_rsrvd_fix_c;
    InvLsb_uid60_block_rsrvd_fix_q_i <= not (InvLsb_uid60_block_rsrvd_fix_a);
    InvLsb_uid60_block_rsrvd_fix_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => InvLsb_uid60_block_rsrvd_fix_q_i, xout => InvLsb_uid60_block_rsrvd_fix_q, clk => clk, aclr => areset );

    -- rndAMask_uid61_block_rsrvd_fix(LOGICAL,60)@2
    rndAMask_uid61_block_rsrvd_fix_a <= InvLsb_uid60_block_rsrvd_fix_q;
    rndAMask_uid61_block_rsrvd_fix_b <= rnd_uid54_block_rsrvd_fix_c;
    rndAMask_uid61_block_rsrvd_fix_c <= InvStk_uid59_block_rsrvd_fix_q;
    rndAMask_uid61_block_rsrvd_fix_q <= rndAMask_uid61_block_rsrvd_fix_a and rndAMask_uid61_block_rsrvd_fix_b and rndAMask_uid61_block_rsrvd_fix_c;

    -- rndANDMask_uid62_block_rsrvd_fix(LOGICAL,61)@2
    rndANDMask_uid62_block_rsrvd_fix_a <= rndAMask_uid61_block_rsrvd_fix_q;
    rndANDMask_uid62_block_rsrvd_fix_q <= not (rndANDMask_uid62_block_rsrvd_fix_a);

    -- redist0(DELAY,82)
    redist0 : dspba_delay
    GENERIC MAP ( width => 24, depth => 1 )
    PORT MAP ( xin => maskIncTab_uid52_block_rsrvd_fix_q, xout => redist0_q, clk => clk, aclr => areset );

    -- maskIncTabPostAnd_uid63_block_rsrvd_fix(LOGICAL,62)@2
    maskIncTabPostAnd_uid63_block_rsrvd_fix_a <= redist0_q;
    maskIncTabPostAnd_uid63_block_rsrvd_fix_b <= STD_LOGIC_VECTOR((23 downto 1 => rndANDMask_uid62_block_rsrvd_fix_q(0)) & rndANDMask_uid62_block_rsrvd_fix_q);
    maskIncTabPostAnd_uid63_block_rsrvd_fix_q_i <= maskIncTabPostAnd_uid63_block_rsrvd_fix_a and maskIncTabPostAnd_uid63_block_rsrvd_fix_b;
    maskIncTabPostAnd_uid63_block_rsrvd_fix_delay : dspba_delay
    GENERIC MAP ( width => 24, depth => 1 )
    PORT MAP ( xin => maskIncTabPostAnd_uid63_block_rsrvd_fix_q_i, xout => maskIncTabPostAnd_uid63_block_rsrvd_fix_q, clk => clk, aclr => areset );

    -- fracPostMask_uid48_block_rsrvd_fix(LOGICAL,47)@1
    fracPostMask_uid48_block_rsrvd_fix_a <= oFracX_uid39_uid39_block_rsrvd_fix_q;
    fracPostMask_uid48_block_rsrvd_fix_b <= maskTab_uid47_block_rsrvd_fix_q;
    fracPostMask_uid48_block_rsrvd_fix_q_i <= fracPostMask_uid48_block_rsrvd_fix_a and fracPostMask_uid48_block_rsrvd_fix_b;
    fracPostMask_uid48_block_rsrvd_fix_delay : dspba_delay
    GENERIC MAP ( width => 24, depth => 1 )
    PORT MAP ( xin => fracPostMask_uid48_block_rsrvd_fix_q_i, xout => fracPostMask_uid48_block_rsrvd_fix_q, clk => clk, aclr => areset );

    -- redist1(DELAY,83)
    redist1 : dspba_delay
    GENERIC MAP ( width => 24, depth => 1 )
    PORT MAP ( xin => fracPostMask_uid48_block_rsrvd_fix_q, xout => redist1_q, clk => clk, aclr => areset );

    -- fracPostRnd0_uid64_block_rsrvd_fix(ADD,63)@3
    fracPostRnd0_uid64_block_rsrvd_fix_a <= STD_LOGIC_VECTOR("0" & redist1_q);
    fracPostRnd0_uid64_block_rsrvd_fix_b <= STD_LOGIC_VECTOR("0" & maskIncTabPostAnd_uid63_block_rsrvd_fix_q);
    fracPostRnd0_uid64_block_rsrvd_fix_o <= STD_LOGIC_VECTOR(UNSIGNED(fracPostRnd0_uid64_block_rsrvd_fix_a) + UNSIGNED(fracPostRnd0_uid64_block_rsrvd_fix_b));
    fracPostRnd0_uid64_block_rsrvd_fix_q <= fracPostRnd0_uid64_block_rsrvd_fix_o(24 downto 0);

    -- fracPostRnd_uid66_block_rsrvd_fix(LOGICAL,65)@3
    fracPostRnd_uid66_block_rsrvd_fix_a <= fracPostRnd0_uid64_block_rsrvd_fix_q;
    fracPostRnd_uid66_block_rsrvd_fix_b <= maskTableZ_uid65_block_rsrvd_fix_q;
    fracPostRnd_uid66_block_rsrvd_fix_q_i <= fracPostRnd_uid66_block_rsrvd_fix_a and fracPostRnd_uid66_block_rsrvd_fix_b;
    fracPostRnd_uid66_block_rsrvd_fix_delay : dspba_delay
    GENERIC MAP ( width => 25, depth => 1 )
    PORT MAP ( xin => fracPostRnd_uid66_block_rsrvd_fix_q_i, xout => fracPostRnd_uid66_block_rsrvd_fix_q, clk => clk, aclr => areset );

    -- normBit_uid67_block_rsrvd_fix(BITSELECT,66)@4
    normBit_uid67_block_rsrvd_fix_in <= STD_LOGIC_VECTOR(fracPostRnd_uid66_block_rsrvd_fix_q);
    normBit_uid67_block_rsrvd_fix_b <= normBit_uid67_block_rsrvd_fix_in(24 downto 24);

    -- expRExt_uid71_block_rsrvd_fix(ADD,70)@4
    expRExt_uid71_block_rsrvd_fix_a <= STD_LOGIC_VECTOR("0" & redist8_q);
    expRExt_uid71_block_rsrvd_fix_b <= STD_LOGIC_VECTOR("00000000" & normBit_uid67_block_rsrvd_fix_b);
    expRExt_uid71_block_rsrvd_fix_o <= STD_LOGIC_VECTOR(UNSIGNED(expRExt_uid71_block_rsrvd_fix_a) + UNSIGNED(expRExt_uid71_block_rsrvd_fix_b));
    expRExt_uid71_block_rsrvd_fix_q <= expRExt_uid71_block_rsrvd_fix_o(8 downto 0);

    -- expR_uid72_block_rsrvd_fix(BITSELECT,71)@4
    expR_uid72_block_rsrvd_fix_in <= expRExt_uid71_block_rsrvd_fix_q(7 downto 0);
    expR_uid72_block_rsrvd_fix_b <= expR_uid72_block_rsrvd_fix_in(7 downto 0);

    -- cstAllZWE_uid11_block_rsrvd_fix(CONSTANT,10)
    cstAllZWE_uid11_block_rsrvd_fix_q <= "00000000";

    -- cstBiasPwF_uid15_block_rsrvd_fix(CONSTANT,14)
    cstBiasPwF_uid15_block_rsrvd_fix_q <= "10010110";

    -- xIsInt_uid40_block_rsrvd_fix(COMPARE,39)@3
    xIsInt_uid40_block_rsrvd_fix_cin <= GND_q;
    xIsInt_uid40_block_rsrvd_fix_a <= STD_LOGIC_VECTOR("00" & redist7_q) & '0';
    xIsInt_uid40_block_rsrvd_fix_b <= STD_LOGIC_VECTOR("00" & cstBiasPwF_uid15_block_rsrvd_fix_q) & xIsInt_uid40_block_rsrvd_fix_cin(0);
    xIsInt_uid40_block_rsrvd_fix: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            xIsInt_uid40_block_rsrvd_fix_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            xIsInt_uid40_block_rsrvd_fix_o <= STD_LOGIC_VECTOR(UNSIGNED(xIsInt_uid40_block_rsrvd_fix_a) - UNSIGNED(xIsInt_uid40_block_rsrvd_fix_b));
        END IF;
    END PROCESS;
    xIsInt_uid40_block_rsrvd_fix_n(0) <= not (xIsInt_uid40_block_rsrvd_fix_o(10));

    -- cstBiasM1_uid14_block_rsrvd_fix(CONSTANT,13)
    cstBiasM1_uid14_block_rsrvd_fix_q <= "01111110";

    -- expXIsBiasM1_uid41_block_rsrvd_fix(LOGICAL,40)@3
    expXIsBiasM1_uid41_block_rsrvd_fix_a <= redist7_q;
    expXIsBiasM1_uid41_block_rsrvd_fix_b <= cstBiasM1_uid14_block_rsrvd_fix_q;
    expXIsBiasM1_uid41_block_rsrvd_fix_q <= "1" WHEN expXIsBiasM1_uid41_block_rsrvd_fix_a = expXIsBiasM1_uid41_block_rsrvd_fix_b ELSE "0";

    -- cstAllZWF_uid9_block_rsrvd_fix(CONSTANT,8)
    cstAllZWF_uid9_block_rsrvd_fix_q <= "00000000000000000000000";

    -- updatedY_uid37_block_rsrvd_fix(BITJOIN,36)@3
    updatedY_uid37_block_rsrvd_fix_q <= GND_q & cstAllZWF_uid9_block_rsrvd_fix_q;

    -- fracXIsZero_uid36_block_rsrvd_fix(LOGICAL,37)@3
    fracXIsZero_uid36_block_rsrvd_fix_a <= STD_LOGIC_VECTOR("0" & redist5_q);
    fracXIsZero_uid36_block_rsrvd_fix_b <= updatedY_uid37_block_rsrvd_fix_q;
    fracXIsZero_uid36_block_rsrvd_fix_q <= "1" WHEN fracXIsZero_uid36_block_rsrvd_fix_a = fracXIsZero_uid36_block_rsrvd_fix_b ELSE "0";

    -- inputIsHalf_uid42_block_rsrvd_fix(LOGICAL,41)@3
    inputIsHalf_uid42_block_rsrvd_fix_a <= fracXIsZero_uid36_block_rsrvd_fix_q;
    inputIsHalf_uid42_block_rsrvd_fix_b <= expXIsBiasM1_uid41_block_rsrvd_fix_q;
    inputIsHalf_uid42_block_rsrvd_fix_q <= inputIsHalf_uid42_block_rsrvd_fix_a and inputIsHalf_uid42_block_rsrvd_fix_b;

    -- cstBiasM2_uid13_block_rsrvd_fix(CONSTANT,12)
    cstBiasM2_uid13_block_rsrvd_fix_q <= "01111101";

    -- xIsLessThanHalf_uid43_block_rsrvd_fix(COMPARE,42)@3
    xIsLessThanHalf_uid43_block_rsrvd_fix_cin <= GND_q;
    xIsLessThanHalf_uid43_block_rsrvd_fix_a <= STD_LOGIC_VECTOR("00" & cstBiasM2_uid13_block_rsrvd_fix_q) & '0';
    xIsLessThanHalf_uid43_block_rsrvd_fix_b <= STD_LOGIC_VECTOR("00" & redist7_q) & xIsLessThanHalf_uid43_block_rsrvd_fix_cin(0);
    xIsLessThanHalf_uid43_block_rsrvd_fix_o <= STD_LOGIC_VECTOR(UNSIGNED(xIsLessThanHalf_uid43_block_rsrvd_fix_a) - UNSIGNED(xIsLessThanHalf_uid43_block_rsrvd_fix_b));
    xIsLessThanHalf_uid43_block_rsrvd_fix_n(0) <= not (xIsLessThanHalf_uid43_block_rsrvd_fix_o(10));

    -- xIsSmallFrac_uid44_block_rsrvd_fix(LOGICAL,43)@3
    xIsSmallFrac_uid44_block_rsrvd_fix_a <= xIsLessThanHalf_uid43_block_rsrvd_fix_n;
    xIsSmallFrac_uid44_block_rsrvd_fix_b <= inputIsHalf_uid42_block_rsrvd_fix_q;
    xIsSmallFrac_uid44_block_rsrvd_fix_q_i <= xIsSmallFrac_uid44_block_rsrvd_fix_a or xIsSmallFrac_uid44_block_rsrvd_fix_b;
    xIsSmallFrac_uid44_block_rsrvd_fix_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => xIsSmallFrac_uid44_block_rsrvd_fix_q_i, xout => xIsSmallFrac_uid44_block_rsrvd_fix_q, clk => clk, aclr => areset );

    -- exc_I_uid29_block_rsrvd_fix(LOGICAL,28)@4
    exc_I_uid29_block_rsrvd_fix_a <= expXIsMax_uid25_block_rsrvd_fix_q;
    exc_I_uid29_block_rsrvd_fix_b <= fracXIsZero_uid28_block_rsrvd_fix_q;
    exc_I_uid29_block_rsrvd_fix_q <= exc_I_uid29_block_rsrvd_fix_a and exc_I_uid29_block_rsrvd_fix_b;

    -- expXIsZero_uid23_block_rsrvd_fix(LOGICAL,22)@4
    expXIsZero_uid23_block_rsrvd_fix_a <= redist8_q;
    expXIsZero_uid23_block_rsrvd_fix_b <= cstAllZWE_uid11_block_rsrvd_fix_q;
    expXIsZero_uid23_block_rsrvd_fix_q <= "1" WHEN expXIsZero_uid23_block_rsrvd_fix_a = expXIsZero_uid23_block_rsrvd_fix_b ELSE "0";

    -- excRZero_uid73_block_rsrvd_fix(LOGICAL,72)@4
    excRZero_uid73_block_rsrvd_fix_a <= xIsSmallFrac_uid44_block_rsrvd_fix_q;
    excRZero_uid73_block_rsrvd_fix_b <= expXIsZero_uid23_block_rsrvd_fix_q;
    excRZero_uid73_block_rsrvd_fix_q <= excRZero_uid73_block_rsrvd_fix_a or excRZero_uid73_block_rsrvd_fix_b;

    -- selBitsEpilogue_uid74_block_rsrvd_fix(BITJOIN,73)@4
    selBitsEpilogue_uid74_block_rsrvd_fix_q <= xIsInt_uid40_block_rsrvd_fix_n & xIsSmallFrac_uid44_block_rsrvd_fix_q & exc_N_uid31_block_rsrvd_fix_q & exc_I_uid29_block_rsrvd_fix_q & excRZero_uid73_block_rsrvd_fix_q;

    -- expSelBits_uid76_block_rsrvd_fix(LOOKUP,75)@4
    expSelBits_uid76_block_rsrvd_fix: PROCESS (selBitsEpilogue_uid74_block_rsrvd_fix_q)
    BEGIN
        -- Begin reserved scope level
        CASE (selBitsEpilogue_uid74_block_rsrvd_fix_q) IS
            WHEN "00000" => expSelBits_uid76_block_rsrvd_fix_q <= "11";
            WHEN "00001" => expSelBits_uid76_block_rsrvd_fix_q <= "00";
            WHEN "00010" => expSelBits_uid76_block_rsrvd_fix_q <= "01";
            WHEN "00011" => expSelBits_uid76_block_rsrvd_fix_q <= "11";
            WHEN "00100" => expSelBits_uid76_block_rsrvd_fix_q <= "01";
            WHEN "00101" => expSelBits_uid76_block_rsrvd_fix_q <= "11";
            WHEN "00110" => expSelBits_uid76_block_rsrvd_fix_q <= "11";
            WHEN "00111" => expSelBits_uid76_block_rsrvd_fix_q <= "11";
            WHEN "01000" => expSelBits_uid76_block_rsrvd_fix_q <= "00";
            WHEN "01001" => expSelBits_uid76_block_rsrvd_fix_q <= "00";
            WHEN "01010" => expSelBits_uid76_block_rsrvd_fix_q <= "01";
            WHEN "01011" => expSelBits_uid76_block_rsrvd_fix_q <= "11";
            WHEN "01100" => expSelBits_uid76_block_rsrvd_fix_q <= "01";
            WHEN "01101" => expSelBits_uid76_block_rsrvd_fix_q <= "11";
            WHEN "01110" => expSelBits_uid76_block_rsrvd_fix_q <= "11";
            WHEN "01111" => expSelBits_uid76_block_rsrvd_fix_q <= "11";
            WHEN "10000" => expSelBits_uid76_block_rsrvd_fix_q <= "10";
            WHEN "10001" => expSelBits_uid76_block_rsrvd_fix_q <= "00";
            WHEN "10010" => expSelBits_uid76_block_rsrvd_fix_q <= "01";
            WHEN "10011" => expSelBits_uid76_block_rsrvd_fix_q <= "11";
            WHEN "10100" => expSelBits_uid76_block_rsrvd_fix_q <= "01";
            WHEN "10101" => expSelBits_uid76_block_rsrvd_fix_q <= "11";
            WHEN "10110" => expSelBits_uid76_block_rsrvd_fix_q <= "11";
            WHEN "10111" => expSelBits_uid76_block_rsrvd_fix_q <= "11";
            WHEN "11000" => expSelBits_uid76_block_rsrvd_fix_q <= "11";
            WHEN "11001" => expSelBits_uid76_block_rsrvd_fix_q <= "00";
            WHEN "11010" => expSelBits_uid76_block_rsrvd_fix_q <= "01";
            WHEN "11011" => expSelBits_uid76_block_rsrvd_fix_q <= "11";
            WHEN "11100" => expSelBits_uid76_block_rsrvd_fix_q <= "01";
            WHEN "11101" => expSelBits_uid76_block_rsrvd_fix_q <= "11";
            WHEN "11110" => expSelBits_uid76_block_rsrvd_fix_q <= "11";
            WHEN "11111" => expSelBits_uid76_block_rsrvd_fix_q <= "11";
            WHEN OTHERS => expSelBits_uid76_block_rsrvd_fix_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- expRPostExc_uid78_block_rsrvd_fix(MUX,77)@4
    expRPostExc_uid78_block_rsrvd_fix_s <= expSelBits_uid76_block_rsrvd_fix_q;
    expRPostExc_uid78_block_rsrvd_fix: PROCESS (expRPostExc_uid78_block_rsrvd_fix_s, cstAllZWE_uid11_block_rsrvd_fix_q, cstAllOWE_uid12_block_rsrvd_fix_q, redist8_q, expR_uid72_block_rsrvd_fix_b)
    BEGIN
        CASE (expRPostExc_uid78_block_rsrvd_fix_s) IS
            WHEN "00" => expRPostExc_uid78_block_rsrvd_fix_q <= cstAllZWE_uid11_block_rsrvd_fix_q;
            WHEN "01" => expRPostExc_uid78_block_rsrvd_fix_q <= cstAllOWE_uid12_block_rsrvd_fix_q;
            WHEN "10" => expRPostExc_uid78_block_rsrvd_fix_q <= redist8_q;
            WHEN "11" => expRPostExc_uid78_block_rsrvd_fix_q <= expR_uid72_block_rsrvd_fix_b;
            WHEN OTHERS => expRPostExc_uid78_block_rsrvd_fix_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- fracRHigh_uid68_block_rsrvd_fix(BITSELECT,67)@4
    fracRHigh_uid68_block_rsrvd_fix_in <= fracPostRnd_uid66_block_rsrvd_fix_q(23 downto 0);
    fracRHigh_uid68_block_rsrvd_fix_b <= fracRHigh_uid68_block_rsrvd_fix_in(23 downto 1);

    -- fracRLow_uid69_block_rsrvd_fix(BITSELECT,68)@4
    fracRLow_uid69_block_rsrvd_fix_in <= fracPostRnd_uid66_block_rsrvd_fix_q(22 downto 0);
    fracRLow_uid69_block_rsrvd_fix_b <= fracRLow_uid69_block_rsrvd_fix_in(22 downto 0);

    -- fracR_uid70_block_rsrvd_fix(MUX,69)@4
    fracR_uid70_block_rsrvd_fix_s <= normBit_uid67_block_rsrvd_fix_b;
    fracR_uid70_block_rsrvd_fix: PROCESS (fracR_uid70_block_rsrvd_fix_s, fracRLow_uid69_block_rsrvd_fix_b, fracRHigh_uid68_block_rsrvd_fix_b)
    BEGIN
        CASE (fracR_uid70_block_rsrvd_fix_s) IS
            WHEN "0" => fracR_uid70_block_rsrvd_fix_q <= fracRLow_uid69_block_rsrvd_fix_b;
            WHEN "1" => fracR_uid70_block_rsrvd_fix_q <= fracRHigh_uid68_block_rsrvd_fix_b;
            WHEN OTHERS => fracR_uid70_block_rsrvd_fix_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- redist6(DELAY,88)
    redist6 : dspba_delay
    GENERIC MAP ( width => 23, depth => 1 )
    PORT MAP ( xin => redist5_q, xout => redist6_q, clk => clk, aclr => areset );

    -- fracSelBits_uid75_block_rsrvd_fix(LOOKUP,74)@4
    fracSelBits_uid75_block_rsrvd_fix: PROCESS (selBitsEpilogue_uid74_block_rsrvd_fix_q)
    BEGIN
        -- Begin reserved scope level
        CASE (selBitsEpilogue_uid74_block_rsrvd_fix_q) IS
            WHEN "00000" => fracSelBits_uid75_block_rsrvd_fix_q <= "11";
            WHEN "00001" => fracSelBits_uid75_block_rsrvd_fix_q <= "00";
            WHEN "00010" => fracSelBits_uid75_block_rsrvd_fix_q <= "00";
            WHEN "00011" => fracSelBits_uid75_block_rsrvd_fix_q <= "11";
            WHEN "00100" => fracSelBits_uid75_block_rsrvd_fix_q <= "01";
            WHEN "00101" => fracSelBits_uid75_block_rsrvd_fix_q <= "11";
            WHEN "00110" => fracSelBits_uid75_block_rsrvd_fix_q <= "11";
            WHEN "00111" => fracSelBits_uid75_block_rsrvd_fix_q <= "11";
            WHEN "01000" => fracSelBits_uid75_block_rsrvd_fix_q <= "00";
            WHEN "01001" => fracSelBits_uid75_block_rsrvd_fix_q <= "00";
            WHEN "01010" => fracSelBits_uid75_block_rsrvd_fix_q <= "00";
            WHEN "01011" => fracSelBits_uid75_block_rsrvd_fix_q <= "11";
            WHEN "01100" => fracSelBits_uid75_block_rsrvd_fix_q <= "01";
            WHEN "01101" => fracSelBits_uid75_block_rsrvd_fix_q <= "11";
            WHEN "01110" => fracSelBits_uid75_block_rsrvd_fix_q <= "11";
            WHEN "01111" => fracSelBits_uid75_block_rsrvd_fix_q <= "11";
            WHEN "10000" => fracSelBits_uid75_block_rsrvd_fix_q <= "10";
            WHEN "10001" => fracSelBits_uid75_block_rsrvd_fix_q <= "00";
            WHEN "10010" => fracSelBits_uid75_block_rsrvd_fix_q <= "00";
            WHEN "10011" => fracSelBits_uid75_block_rsrvd_fix_q <= "11";
            WHEN "10100" => fracSelBits_uid75_block_rsrvd_fix_q <= "01";
            WHEN "10101" => fracSelBits_uid75_block_rsrvd_fix_q <= "11";
            WHEN "10110" => fracSelBits_uid75_block_rsrvd_fix_q <= "11";
            WHEN "10111" => fracSelBits_uid75_block_rsrvd_fix_q <= "11";
            WHEN "11000" => fracSelBits_uid75_block_rsrvd_fix_q <= "11";
            WHEN "11001" => fracSelBits_uid75_block_rsrvd_fix_q <= "00";
            WHEN "11010" => fracSelBits_uid75_block_rsrvd_fix_q <= "00";
            WHEN "11011" => fracSelBits_uid75_block_rsrvd_fix_q <= "11";
            WHEN "11100" => fracSelBits_uid75_block_rsrvd_fix_q <= "01";
            WHEN "11101" => fracSelBits_uid75_block_rsrvd_fix_q <= "11";
            WHEN "11110" => fracSelBits_uid75_block_rsrvd_fix_q <= "11";
            WHEN "11111" => fracSelBits_uid75_block_rsrvd_fix_q <= "11";
            WHEN OTHERS => fracSelBits_uid75_block_rsrvd_fix_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- fracRPostExc_uid77_block_rsrvd_fix(MUX,76)@4
    fracRPostExc_uid77_block_rsrvd_fix_s <= fracSelBits_uid75_block_rsrvd_fix_q;
    fracRPostExc_uid77_block_rsrvd_fix: PROCESS (fracRPostExc_uid77_block_rsrvd_fix_s, cstAllZWF_uid9_block_rsrvd_fix_q, cstNaNWF_uid10_block_rsrvd_fix_q, redist6_q, fracR_uid70_block_rsrvd_fix_q)
    BEGIN
        CASE (fracRPostExc_uid77_block_rsrvd_fix_s) IS
            WHEN "00" => fracRPostExc_uid77_block_rsrvd_fix_q <= cstAllZWF_uid9_block_rsrvd_fix_q;
            WHEN "01" => fracRPostExc_uid77_block_rsrvd_fix_q <= cstNaNWF_uid10_block_rsrvd_fix_q;
            WHEN "10" => fracRPostExc_uid77_block_rsrvd_fix_q <= redist6_q;
            WHEN "11" => fracRPostExc_uid77_block_rsrvd_fix_q <= fracR_uid70_block_rsrvd_fix_q;
            WHEN OTHERS => fracRPostExc_uid77_block_rsrvd_fix_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- r0_uid81_block_rsrvd_fix(BITJOIN,80)@4
    r0_uid81_block_rsrvd_fix_q <= signR_uid80_block_rsrvd_fix_q & expRPostExc_uid78_block_rsrvd_fix_q & fracRPostExc_uid77_block_rsrvd_fix_q;

    -- out_primWireOut(GPOUT,4)@4
    out_primWireOut <= r0_uid81_block_rsrvd_fix_q;

END normal;
