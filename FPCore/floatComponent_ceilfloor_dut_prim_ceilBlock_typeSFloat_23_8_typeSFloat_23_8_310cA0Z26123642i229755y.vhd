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

-- VHDL created from floatComponent_ceilfloor_dut_prim_ceilBlock_typeSFloat_23_8_typeSFloat_23_8_310cA0Zs0i226123642i229755y
-- VHDL created on Fri Apr 17 16:25:14 2015


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

USE work.ceilfloor_dut_safe_path.all;
entity floatComponent_ceilfloor_dut_prim_ceilBlock_typeSFloat_23_8_typeSFloat_23_8_310cA0Zs0i226123642i229755y is
    port (
        in_0 : in std_logic_vector(31 downto 0);  -- float32_m23
        out_primWireOut : out std_logic_vector(31 downto 0);  -- float32_m23
        clk : in std_logic;
        areset : in std_logic
    );
end floatComponent_ceilfloor_dut_prim_ceilBlock_typeSFloat_23_8_typeSFloat_23_8_310cA0Zs0i226123642i229755y;

architecture normal of floatComponent_ceilfloor_dut_prim_ceilBlock_typeSFloat_23_8_typeSFloat_23_8_310cA0Zs0i226123642i229755y is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal cstAllOWE_uid9_block_rsrvd_fix_q : STD_LOGIC_VECTOR (7 downto 0);
    signal cstOneWF_uid10_block_rsrvd_fix_q : STD_LOGIC_VECTOR (22 downto 0);
    signal cstAllZWE_uid11_block_rsrvd_fix_q : STD_LOGIC_VECTOR (7 downto 0);
    signal fracXIsZero_uid18_block_rsrvd_fix_a : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid18_block_rsrvd_fix_q_i : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid18_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bias_uid26_block_rsrvd_fix_q : STD_LOGIC_VECTOR (7 downto 0);
    signal expLTBias_uid27_block_rsrvd_fix_a : STD_LOGIC_VECTOR (10 downto 0);
    signal expLTBias_uid27_block_rsrvd_fix_b : STD_LOGIC_VECTOR (10 downto 0);
    signal expLTBias_uid27_block_rsrvd_fix_o : STD_LOGIC_VECTOR (10 downto 0);
    signal expLTBias_uid27_block_rsrvd_fix_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal expLTBias_uid27_block_rsrvd_fix_c : STD_LOGIC_VECTOR (0 downto 0);
    signal biasPwF_uid31_block_rsrvd_fix_q : STD_LOGIC_VECTOR (7 downto 0);
    signal resIsInteger_uid32_block_rsrvd_fix_a : STD_LOGIC_VECTOR (10 downto 0);
    signal resIsInteger_uid32_block_rsrvd_fix_b : STD_LOGIC_VECTOR (10 downto 0);
    signal resIsInteger_uid32_block_rsrvd_fix_o : STD_LOGIC_VECTOR (10 downto 0);
    signal resIsInteger_uid32_block_rsrvd_fix_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal resIsInteger_uid32_block_rsrvd_fix_n : STD_LOGIC_VECTOR (0 downto 0);
    signal maskIncrementTable_uid38_block_rsrvd_fix_q : STD_LOGIC_VECTOR (23 downto 0);
    signal zeroWF_uid40_block_rsrvd_fix_q : STD_LOGIC_VECTOR (22 downto 0);
    signal intFracValue_uid41_block_rsrvd_fix_s : STD_LOGIC_VECTOR (0 downto 0);
    signal intFracValue_uid41_block_rsrvd_fix_q : STD_LOGIC_VECTOR (22 downto 0);
    signal flagDiscardedFracBits_uid45_block_rsrvd_fix_a : STD_LOGIC_VECTOR (0 downto 0);
    signal flagDiscardedFracBits_uid45_block_rsrvd_fix_q_i : STD_LOGIC_VECTOR (0 downto 0);
    signal flagDiscardedFracBits_uid45_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracPosAndFracBits_uid51_block_rsrvd_fix_a : STD_LOGIC_VECTOR (22 downto 0);
    signal fracPosAndFracBits_uid51_block_rsrvd_fix_b : STD_LOGIC_VECTOR (22 downto 0);
    signal fracPosAndFracBits_uid51_block_rsrvd_fix_q_i : STD_LOGIC_VECTOR (22 downto 0);
    signal fracPosAndFracBits_uid51_block_rsrvd_fix_q : STD_LOGIC_VECTOR (22 downto 0);
    signal fracNegOrPosWithZeroDisBitsComp_uid59_block_rsrvd_fix_a : STD_LOGIC_VECTOR (22 downto 0);
    signal fracNegOrPosWithZeroDisBitsComp_uid59_block_rsrvd_fix_b : STD_LOGIC_VECTOR (22 downto 0);
    signal fracNegOrPosWithZeroDisBitsComp_uid59_block_rsrvd_fix_q_i : STD_LOGIC_VECTOR (22 downto 0);
    signal fracNegOrPosWithZeroDisBitsComp_uid59_block_rsrvd_fix_q : STD_LOGIC_VECTOR (22 downto 0);
    signal fracAndExpandedFlagResInt_uid60_block_rsrvd_fix_a : STD_LOGIC_VECTOR (22 downto 0);
    signal fracAndExpandedFlagResInt_uid60_block_rsrvd_fix_b : STD_LOGIC_VECTOR (22 downto 0);
    signal fracAndExpandedFlagResInt_uid60_block_rsrvd_fix_q_i : STD_LOGIC_VECTOR (22 downto 0);
    signal fracAndExpandedFlagResInt_uid60_block_rsrvd_fix_q : STD_LOGIC_VECTOR (22 downto 0);
    signal compNegNonZeroDiscBits_uid67_block_rsrvd_fix_a : STD_LOGIC_VECTOR (7 downto 0);
    signal compNegNonZeroDiscBits_uid67_block_rsrvd_fix_b : STD_LOGIC_VECTOR (7 downto 0);
    signal compNegNonZeroDiscBits_uid67_block_rsrvd_fix_q_i : STD_LOGIC_VECTOR (7 downto 0);
    signal compNegNonZeroDiscBits_uid67_block_rsrvd_fix_q : STD_LOGIC_VECTOR (7 downto 0);
    signal compOrInteger_uid73_block_rsrvd_fix_a : STD_LOGIC_VECTOR (0 downto 0);
    signal compOrInteger_uid73_block_rsrvd_fix_b : STD_LOGIC_VECTOR (0 downto 0);
    signal compOrInteger_uid73_block_rsrvd_fix_c : STD_LOGIC_VECTOR (0 downto 0);
    signal compOrInteger_uid73_block_rsrvd_fix_q_i : STD_LOGIC_VECTOR (0 downto 0);
    signal compOrInteger_uid73_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist9_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist10_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist11_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist12_q : STD_LOGIC_VECTOR (7 downto 0);
    signal fracXIsNotZero_uid17_block_rsrvd_fix_a : STD_LOGIC_VECTOR (25 downto 0);
    signal fracXIsNotZero_uid17_block_rsrvd_fix_b : STD_LOGIC_VECTOR (25 downto 0);
    signal fracXIsNotZero_uid17_block_rsrvd_fix_o : STD_LOGIC_VECTOR (25 downto 0);
    signal fracXIsNotZero_uid17_block_rsrvd_fix_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid17_block_rsrvd_fix_n : STD_LOGIC_VECTOR (0 downto 0);
    signal ovfExpFrac_uid46_block_rsrvd_fix_q : STD_LOGIC_VECTOR (31 downto 0);
    signal expXIsZero_uid13_block_rsrvd_fix_a : STD_LOGIC_VECTOR (7 downto 0);
    signal expXIsZero_uid13_block_rsrvd_fix_b : STD_LOGIC_VECTOR (7 downto 0);
    signal expXIsZero_uid13_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid15_block_rsrvd_fix_a : STD_LOGIC_VECTOR (7 downto 0);
    signal expXIsMax_uid15_block_rsrvd_fix_b : STD_LOGIC_VECTOR (7 downto 0);
    signal expXIsMax_uid15_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal exc_I_uid19_block_rsrvd_fix_a : STD_LOGIC_VECTOR (0 downto 0);
    signal exc_I_uid19_block_rsrvd_fix_b : STD_LOGIC_VECTOR (0 downto 0);
    signal exc_I_uid19_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvFracXIsZero_uid20_block_rsrvd_fix_a : STD_LOGIC_VECTOR (0 downto 0);
    signal InvFracXIsZero_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal exc_N_uid21_block_rsrvd_fix_a : STD_LOGIC_VECTOR (0 downto 0);
    signal exc_N_uid21_block_rsrvd_fix_b : STD_LOGIC_VECTOR (0 downto 0);
    signal exc_N_uid21_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal resIsZero_uid28_block_rsrvd_fix_a : STD_LOGIC_VECTOR (0 downto 0);
    signal resIsZero_uid28_block_rsrvd_fix_b : STD_LOGIC_VECTOR (0 downto 0);
    signal resIsZero_uid28_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvSignX_uid29_block_rsrvd_fix_a : STD_LOGIC_VECTOR (0 downto 0);
    signal InvSignX_uid29_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal resIsOne_uid30_block_rsrvd_fix_a : STD_LOGIC_VECTOR (0 downto 0);
    signal resIsOne_uid30_block_rsrvd_fix_b : STD_LOGIC_VECTOR (0 downto 0);
    signal resIsOne_uid30_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expComputingRange_uid33_block_rsrvd_fix_a : STD_LOGIC_VECTOR (0 downto 0);
    signal expComputingRange_uid33_block_rsrvd_fix_b : STD_LOGIC_VECTOR (0 downto 0);
    signal expComputingRange_uid33_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal maskTable_uid36_block_rsrvd_fix_q : STD_LOGIC_VECTOR (22 downto 0);
    signal fracPostMask_uid39_block_rsrvd_fix_a : STD_LOGIC_VECTOR (22 downto 0);
    signal fracPostMask_uid39_block_rsrvd_fix_b : STD_LOGIC_VECTOR (22 downto 0);
    signal fracPostMask_uid39_block_rsrvd_fix_q : STD_LOGIC_VECTOR (22 downto 0);
    signal invertedMaskBits_uid42_block_rsrvd_fix_a : STD_LOGIC_VECTOR (22 downto 0);
    signal invertedMaskBits_uid42_block_rsrvd_fix_q : STD_LOGIC_VECTOR (22 downto 0);
    signal discardedFracBits_uid43_block_rsrvd_fix_a : STD_LOGIC_VECTOR (22 downto 0);
    signal discardedFracBits_uid43_block_rsrvd_fix_b : STD_LOGIC_VECTOR (22 downto 0);
    signal discardedFracBits_uid43_block_rsrvd_fix_q : STD_LOGIC_VECTOR (22 downto 0);
    signal discardedBitsAllZeros_uid44_block_rsrvd_fix_a : STD_LOGIC_VECTOR (22 downto 0);
    signal discardedBitsAllZeros_uid44_block_rsrvd_fix_b : STD_LOGIC_VECTOR (22 downto 0);
    signal discardedBitsAllZeros_uid44_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal ovfExpIntFracValuePostIncMask_uid47_block_rsrvd_fix_a : STD_LOGIC_VECTOR (32 downto 0);
    signal ovfExpIntFracValuePostIncMask_uid47_block_rsrvd_fix_b : STD_LOGIC_VECTOR (32 downto 0);
    signal ovfExpIntFracValuePostIncMask_uid47_block_rsrvd_fix_o : STD_LOGIC_VECTOR (32 downto 0);
    signal ovfExpIntFracValuePostIncMask_uid47_block_rsrvd_fix_q : STD_LOGIC_VECTOR (32 downto 0);
    signal negDiscBitsCompRange_uid50_block_rsrvd_fix_a : STD_LOGIC_VECTOR (0 downto 0);
    signal negDiscBitsCompRange_uid50_block_rsrvd_fix_b : STD_LOGIC_VECTOR (0 downto 0);
    signal negDiscBitsCompRange_uid50_block_rsrvd_fix_c : STD_LOGIC_VECTOR (0 downto 0);
    signal negDiscBitsCompRange_uid50_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvFlagDiscardedFracBits_uid52_block_rsrvd_fix_a : STD_LOGIC_VECTOR (0 downto 0);
    signal InvFlagDiscardedFracBits_uid52_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal posCompRangeNoDiscBIts_uid54_block_rsrvd_fix_a : STD_LOGIC_VECTOR (0 downto 0);
    signal posCompRangeNoDiscBIts_uid54_block_rsrvd_fix_b : STD_LOGIC_VECTOR (0 downto 0);
    signal posCompRangeNoDiscBIts_uid54_block_rsrvd_fix_c : STD_LOGIC_VECTOR (0 downto 0);
    signal posCompRangeNoDiscBIts_uid54_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal negCompRange_uid55_block_rsrvd_fix_a : STD_LOGIC_VECTOR (0 downto 0);
    signal negCompRange_uid55_block_rsrvd_fix_b : STD_LOGIC_VECTOR (0 downto 0);
    signal negCompRange_uid55_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal nCompNegOrPosWithZeroDiscBits_uid56_block_rsrvd_fix_a : STD_LOGIC_VECTOR (0 downto 0);
    signal nCompNegOrPosWithZeroDiscBits_uid56_block_rsrvd_fix_b : STD_LOGIC_VECTOR (0 downto 0);
    signal nCompNegOrPosWithZeroDiscBits_uid56_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvResIsZero_uid57_block_rsrvd_fix_a : STD_LOGIC_VECTOR (0 downto 0);
    signal InvResIsZero_uid57_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal resNotZeroAndComp_uid58_block_rsrvd_fix_a : STD_LOGIC_VECTOR (0 downto 0);
    signal resNotZeroAndComp_uid58_block_rsrvd_fix_b : STD_LOGIC_VECTOR (0 downto 0);
    signal resNotZeroAndComp_uid58_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRNoExc_uid61_block_rsrvd_fix_a : STD_LOGIC_VECTOR (22 downto 0);
    signal fracRNoExc_uid61_block_rsrvd_fix_b : STD_LOGIC_VECTOR (22 downto 0);
    signal fracRNoExc_uid61_block_rsrvd_fix_c : STD_LOGIC_VECTOR (22 downto 0);
    signal fracRNoExc_uid61_block_rsrvd_fix_q : STD_LOGIC_VECTOR (22 downto 0);
    signal NotExcIOrZ_uid62_block_rsrvd_fix_a : STD_LOGIC_VECTOR (0 downto 0);
    signal NotExcIOrZ_uid62_block_rsrvd_fix_b : STD_LOGIC_VECTOR (0 downto 0);
    signal NotExcIOrZ_uid62_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracR_uid63_block_rsrvd_fix_a : STD_LOGIC_VECTOR (22 downto 0);
    signal fracR_uid63_block_rsrvd_fix_b : STD_LOGIC_VECTOR (22 downto 0);
    signal fracR_uid63_block_rsrvd_fix_q : STD_LOGIC_VECTOR (22 downto 0);
    signal expResIsOne_uid68_block_rsrvd_fix_a : STD_LOGIC_VECTOR (7 downto 0);
    signal expResIsOne_uid68_block_rsrvd_fix_b : STD_LOGIC_VECTOR (7 downto 0);
    signal expResIsOne_uid68_block_rsrvd_fix_q : STD_LOGIC_VECTOR (7 downto 0);
    signal negCompRange_uid71_block_rsrvd_fix_a : STD_LOGIC_VECTOR (0 downto 0);
    signal negCompRange_uid71_block_rsrvd_fix_b : STD_LOGIC_VECTOR (0 downto 0);
    signal negCompRange_uid71_block_rsrvd_fix_c : STD_LOGIC_VECTOR (0 downto 0);
    signal negCompRange_uid71_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal CompRangePosNoDisc_uid72_block_rsrvd_fix_a : STD_LOGIC_VECTOR (0 downto 0);
    signal CompRangePosNoDisc_uid72_block_rsrvd_fix_b : STD_LOGIC_VECTOR (0 downto 0);
    signal CompRangePosNoDisc_uid72_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expIntegerOrCompPosDiscBitsZeroOrCompNeg_uid74_block_rsrvd_fix_a : STD_LOGIC_VECTOR (7 downto 0);
    signal expIntegerOrCompPosDiscBitsZeroOrCompNeg_uid74_block_rsrvd_fix_b : STD_LOGIC_VECTOR (7 downto 0);
    signal expIntegerOrCompPosDiscBitsZeroOrCompNeg_uid74_block_rsrvd_fix_q : STD_LOGIC_VECTOR (7 downto 0);
    signal expRNoException_uid75_block_rsrvd_fix_a : STD_LOGIC_VECTOR (7 downto 0);
    signal expRNoException_uid75_block_rsrvd_fix_b : STD_LOGIC_VECTOR (7 downto 0);
    signal expRNoException_uid75_block_rsrvd_fix_c : STD_LOGIC_VECTOR (7 downto 0);
    signal expRNoException_uid75_block_rsrvd_fix_q : STD_LOGIC_VECTOR (7 downto 0);
    signal excXNOrI_uid76_block_rsrvd_fix_a : STD_LOGIC_VECTOR (0 downto 0);
    signal excXNOrI_uid76_block_rsrvd_fix_b : STD_LOGIC_VECTOR (0 downto 0);
    signal excXNOrI_uid76_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expWithNaNInf_uid77_block_rsrvd_fix_a : STD_LOGIC_VECTOR (7 downto 0);
    signal expWithNaNInf_uid77_block_rsrvd_fix_b : STD_LOGIC_VECTOR (7 downto 0);
    signal expWithNaNInf_uid77_block_rsrvd_fix_q : STD_LOGIC_VECTOR (7 downto 0);
    signal rZero_uid78_block_rsrvd_fix_a : STD_LOGIC_VECTOR (0 downto 0);
    signal rZero_uid78_block_rsrvd_fix_b : STD_LOGIC_VECTOR (0 downto 0);
    signal rZero_uid78_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvRZero_uid79_block_rsrvd_fix_a : STD_LOGIC_VECTOR (0 downto 0);
    signal InvRZero_uid79_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expR_uid80_block_rsrvd_fix_a : STD_LOGIC_VECTOR (7 downto 0);
    signal expR_uid80_block_rsrvd_fix_b : STD_LOGIC_VECTOR (7 downto 0);
    signal expR_uid80_block_rsrvd_fix_q : STD_LOGIC_VECTOR (7 downto 0);
    signal expX_uid6_block_rsrvd_fix_in : STD_LOGIC_VECTOR (31 downto 0);
    signal expX_uid6_block_rsrvd_fix_b : STD_LOGIC_VECTOR (7 downto 0);
    signal fracX_uid7_block_rsrvd_fix_in : STD_LOGIC_VECTOR (31 downto 0);
    signal fracX_uid7_block_rsrvd_fix_b : STD_LOGIC_VECTOR (22 downto 0);
    signal signX_uid8_block_rsrvd_fix_in : STD_LOGIC_VECTOR (31 downto 0);
    signal signX_uid8_block_rsrvd_fix_b : STD_LOGIC_VECTOR (0 downto 0);
    signal unbiasedExp_uid34_block_rsrvd_fix_a : STD_LOGIC_VECTOR (8 downto 0);
    signal unbiasedExp_uid34_block_rsrvd_fix_b : STD_LOGIC_VECTOR (8 downto 0);
    signal unbiasedExp_uid34_block_rsrvd_fix_o : STD_LOGIC_VECTOR (8 downto 0);
    signal unbiasedExp_uid34_block_rsrvd_fix_q : STD_LOGIC_VECTOR (8 downto 0);
    signal ceilX_uid81_block_rsrvd_fix_q : STD_LOGIC_VECTOR (31 downto 0);
    signal intFracPosWNonZeroDiscardedBits_uid48_block_rsrvd_fix_in : STD_LOGIC_VECTOR (22 downto 0);
    signal intFracPosWNonZeroDiscardedBits_uid48_block_rsrvd_fix_b : STD_LOGIC_VECTOR (22 downto 0);
    signal expNegNonZeroFrac_uid64_block_rsrvd_fix_in : STD_LOGIC_VECTOR (30 downto 0);
    signal expNegNonZeroFrac_uid64_block_rsrvd_fix_b : STD_LOGIC_VECTOR (7 downto 0);
    signal unbiasedExpLowerBits_uid35_block_rsrvd_fix_in : STD_LOGIC_VECTOR (4 downto 0);
    signal unbiasedExpLowerBits_uid35_block_rsrvd_fix_b : STD_LOGIC_VECTOR (4 downto 0);

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- in_0(GPIN,3)@0

    -- signX_uid8_block_rsrvd_fix(BITSELECT,7)@0
    signX_uid8_block_rsrvd_fix_in <= STD_LOGIC_VECTOR(in_0);
    signX_uid8_block_rsrvd_fix_b <= signX_uid8_block_rsrvd_fix_in(31 downto 31);

    -- redist5(DELAY,87)
    redist5 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => signX_uid8_block_rsrvd_fix_b, xout => redist5_q, clk => clk, aclr => areset );

    -- redist6(DELAY,88)
    redist6 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => redist5_q, xout => redist6_q, clk => clk, aclr => areset );

    -- redist7(DELAY,89)
    redist7 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => redist6_q, xout => redist7_q, clk => clk, aclr => areset );

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- bias_uid26_block_rsrvd_fix(CONSTANT,25)
    bias_uid26_block_rsrvd_fix_q <= "01111111";

    -- expX_uid6_block_rsrvd_fix(BITSELECT,5)@0
    expX_uid6_block_rsrvd_fix_in <= in_0;
    expX_uid6_block_rsrvd_fix_b <= expX_uid6_block_rsrvd_fix_in(30 downto 23);

    -- expLTBias_uid27_block_rsrvd_fix(COMPARE,26)@0
    expLTBias_uid27_block_rsrvd_fix_cin <= GND_q;
    expLTBias_uid27_block_rsrvd_fix_a <= STD_LOGIC_VECTOR("00" & expX_uid6_block_rsrvd_fix_b) & '0';
    expLTBias_uid27_block_rsrvd_fix_b <= STD_LOGIC_VECTOR("00" & bias_uid26_block_rsrvd_fix_q) & expLTBias_uid27_block_rsrvd_fix_cin(0);
    expLTBias_uid27_block_rsrvd_fix: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expLTBias_uid27_block_rsrvd_fix_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expLTBias_uid27_block_rsrvd_fix_o <= STD_LOGIC_VECTOR(UNSIGNED(expLTBias_uid27_block_rsrvd_fix_a) - UNSIGNED(expLTBias_uid27_block_rsrvd_fix_b));
        END IF;
    END PROCESS;
    expLTBias_uid27_block_rsrvd_fix_c(0) <= expLTBias_uid27_block_rsrvd_fix_o(10);

    -- redist4(DELAY,86)
    redist4 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => expLTBias_uid27_block_rsrvd_fix_c, xout => redist4_q, clk => clk, aclr => areset );

    -- resIsZero_uid28_block_rsrvd_fix(LOGICAL,27)@2
    resIsZero_uid28_block_rsrvd_fix_a <= redist6_q;
    resIsZero_uid28_block_rsrvd_fix_b <= redist4_q;
    resIsZero_uid28_block_rsrvd_fix_q <= resIsZero_uid28_block_rsrvd_fix_a and resIsZero_uid28_block_rsrvd_fix_b;

    -- redist3(DELAY,85)
    redist3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => resIsZero_uid28_block_rsrvd_fix_q, xout => redist3_q, clk => clk, aclr => areset );

    -- cstAllZWE_uid11_block_rsrvd_fix(CONSTANT,10)
    cstAllZWE_uid11_block_rsrvd_fix_q <= "00000000";

    -- redist10(DELAY,92)
    redist10 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1 )
    PORT MAP ( xin => expX_uid6_block_rsrvd_fix_b, xout => redist10_q, clk => clk, aclr => areset );

    -- redist11(DELAY,93)
    redist11 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1 )
    PORT MAP ( xin => redist10_q, xout => redist11_q, clk => clk, aclr => areset );

    -- redist12(DELAY,94)
    redist12 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1 )
    PORT MAP ( xin => redist11_q, xout => redist12_q, clk => clk, aclr => areset );

    -- expXIsZero_uid13_block_rsrvd_fix(LOGICAL,12)@3
    expXIsZero_uid13_block_rsrvd_fix_a <= redist12_q;
    expXIsZero_uid13_block_rsrvd_fix_b <= cstAllZWE_uid11_block_rsrvd_fix_q;
    expXIsZero_uid13_block_rsrvd_fix_q <= "1" WHEN expXIsZero_uid13_block_rsrvd_fix_a = expXIsZero_uid13_block_rsrvd_fix_b ELSE "0";

    -- rZero_uid78_block_rsrvd_fix(LOGICAL,77)@3
    rZero_uid78_block_rsrvd_fix_a <= expXIsZero_uid13_block_rsrvd_fix_q;
    rZero_uid78_block_rsrvd_fix_b <= redist3_q;
    rZero_uid78_block_rsrvd_fix_q <= rZero_uid78_block_rsrvd_fix_a or rZero_uid78_block_rsrvd_fix_b;

    -- InvRZero_uid79_block_rsrvd_fix(LOGICAL,78)@3
    InvRZero_uid79_block_rsrvd_fix_a <= rZero_uid78_block_rsrvd_fix_q;
    InvRZero_uid79_block_rsrvd_fix_q <= not (InvRZero_uid79_block_rsrvd_fix_a);

    -- cstOneWF_uid10_block_rsrvd_fix(CONSTANT,9)
    cstOneWF_uid10_block_rsrvd_fix_q <= "00000000000000000000001";

    -- fracX_uid7_block_rsrvd_fix(BITSELECT,6)@0
    fracX_uid7_block_rsrvd_fix_in <= in_0;
    fracX_uid7_block_rsrvd_fix_b <= fracX_uid7_block_rsrvd_fix_in(22 downto 0);

    -- redist8(DELAY,90)
    redist8 : dspba_delay
    GENERIC MAP ( width => 23, depth => 1 )
    PORT MAP ( xin => fracX_uid7_block_rsrvd_fix_b, xout => redist8_q, clk => clk, aclr => areset );

    -- redist9(DELAY,91)
    redist9 : dspba_delay
    GENERIC MAP ( width => 23, depth => 1 )
    PORT MAP ( xin => redist8_q, xout => redist9_q, clk => clk, aclr => areset );

    -- fracXIsNotZero_uid17_block_rsrvd_fix(COMPARE,16)@2
    fracXIsNotZero_uid17_block_rsrvd_fix_cin <= GND_q;
    fracXIsNotZero_uid17_block_rsrvd_fix_a <= STD_LOGIC_VECTOR("00" & redist9_q) & '0';
    fracXIsNotZero_uid17_block_rsrvd_fix_b <= STD_LOGIC_VECTOR("00" & cstOneWF_uid10_block_rsrvd_fix_q) & fracXIsNotZero_uid17_block_rsrvd_fix_cin(0);
    fracXIsNotZero_uid17_block_rsrvd_fix_o <= STD_LOGIC_VECTOR(UNSIGNED(fracXIsNotZero_uid17_block_rsrvd_fix_a) - UNSIGNED(fracXIsNotZero_uid17_block_rsrvd_fix_b));
    fracXIsNotZero_uid17_block_rsrvd_fix_n(0) <= not (fracXIsNotZero_uid17_block_rsrvd_fix_o(25));

    -- fracXIsZero_uid18_block_rsrvd_fix(LOGICAL,17)@2
    fracXIsZero_uid18_block_rsrvd_fix_a <= fracXIsNotZero_uid17_block_rsrvd_fix_n;
    fracXIsZero_uid18_block_rsrvd_fix_q_i <= not (fracXIsZero_uid18_block_rsrvd_fix_a);
    fracXIsZero_uid18_block_rsrvd_fix_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => fracXIsZero_uid18_block_rsrvd_fix_q_i, xout => fracXIsZero_uid18_block_rsrvd_fix_q, clk => clk, aclr => areset );

    -- cstAllOWE_uid9_block_rsrvd_fix(CONSTANT,8)
    cstAllOWE_uid9_block_rsrvd_fix_q <= "11111111";

    -- expXIsMax_uid15_block_rsrvd_fix(LOGICAL,14)@3
    expXIsMax_uid15_block_rsrvd_fix_a <= redist12_q;
    expXIsMax_uid15_block_rsrvd_fix_b <= cstAllOWE_uid9_block_rsrvd_fix_q;
    expXIsMax_uid15_block_rsrvd_fix_q <= "1" WHEN expXIsMax_uid15_block_rsrvd_fix_a = expXIsMax_uid15_block_rsrvd_fix_b ELSE "0";

    -- exc_I_uid19_block_rsrvd_fix(LOGICAL,18)@3
    exc_I_uid19_block_rsrvd_fix_a <= expXIsMax_uid15_block_rsrvd_fix_q;
    exc_I_uid19_block_rsrvd_fix_b <= fracXIsZero_uid18_block_rsrvd_fix_q;
    exc_I_uid19_block_rsrvd_fix_q <= exc_I_uid19_block_rsrvd_fix_a and exc_I_uid19_block_rsrvd_fix_b;

    -- InvFracXIsZero_uid20_block_rsrvd_fix(LOGICAL,19)@3
    InvFracXIsZero_uid20_block_rsrvd_fix_a <= fracXIsZero_uid18_block_rsrvd_fix_q;
    InvFracXIsZero_uid20_block_rsrvd_fix_q <= not (InvFracXIsZero_uid20_block_rsrvd_fix_a);

    -- exc_N_uid21_block_rsrvd_fix(LOGICAL,20)@3
    exc_N_uid21_block_rsrvd_fix_a <= expXIsMax_uid15_block_rsrvd_fix_q;
    exc_N_uid21_block_rsrvd_fix_b <= InvFracXIsZero_uid20_block_rsrvd_fix_q;
    exc_N_uid21_block_rsrvd_fix_q <= exc_N_uid21_block_rsrvd_fix_a and exc_N_uid21_block_rsrvd_fix_b;

    -- excXNOrI_uid76_block_rsrvd_fix(LOGICAL,75)@3
    excXNOrI_uid76_block_rsrvd_fix_a <= exc_N_uid21_block_rsrvd_fix_q;
    excXNOrI_uid76_block_rsrvd_fix_b <= exc_I_uid19_block_rsrvd_fix_q;
    excXNOrI_uid76_block_rsrvd_fix_q <= excXNOrI_uid76_block_rsrvd_fix_a or excXNOrI_uid76_block_rsrvd_fix_b;

    -- biasPwF_uid31_block_rsrvd_fix(CONSTANT,30)
    biasPwF_uid31_block_rsrvd_fix_q <= "10010110";

    -- resIsInteger_uid32_block_rsrvd_fix(COMPARE,31)@1
    resIsInteger_uid32_block_rsrvd_fix_cin <= GND_q;
    resIsInteger_uid32_block_rsrvd_fix_a <= STD_LOGIC_VECTOR("00" & redist10_q) & '0';
    resIsInteger_uid32_block_rsrvd_fix_b <= STD_LOGIC_VECTOR("00" & biasPwF_uid31_block_rsrvd_fix_q) & resIsInteger_uid32_block_rsrvd_fix_cin(0);
    resIsInteger_uid32_block_rsrvd_fix: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            resIsInteger_uid32_block_rsrvd_fix_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            resIsInteger_uid32_block_rsrvd_fix_o <= STD_LOGIC_VECTOR(UNSIGNED(resIsInteger_uid32_block_rsrvd_fix_a) - UNSIGNED(resIsInteger_uid32_block_rsrvd_fix_b));
        END IF;
    END PROCESS;
    resIsInteger_uid32_block_rsrvd_fix_n(0) <= not (resIsInteger_uid32_block_rsrvd_fix_o(10));

    -- zeroWF_uid40_block_rsrvd_fix(CONSTANT,39)
    zeroWF_uid40_block_rsrvd_fix_q <= "00000000000000000000000";

    -- unbiasedExp_uid34_block_rsrvd_fix(SUB,33)@0
    unbiasedExp_uid34_block_rsrvd_fix_a <= STD_LOGIC_VECTOR("0" & expX_uid6_block_rsrvd_fix_b);
    unbiasedExp_uid34_block_rsrvd_fix_b <= STD_LOGIC_VECTOR("0" & bias_uid26_block_rsrvd_fix_q);
    unbiasedExp_uid34_block_rsrvd_fix_o <= STD_LOGIC_VECTOR(UNSIGNED(unbiasedExp_uid34_block_rsrvd_fix_a) - UNSIGNED(unbiasedExp_uid34_block_rsrvd_fix_b));
    unbiasedExp_uid34_block_rsrvd_fix_q <= unbiasedExp_uid34_block_rsrvd_fix_o(8 downto 0);

    -- unbiasedExpLowerBits_uid35_block_rsrvd_fix(BITSELECT,34)@0
    unbiasedExpLowerBits_uid35_block_rsrvd_fix_in <= unbiasedExp_uid34_block_rsrvd_fix_q(4 downto 0);
    unbiasedExpLowerBits_uid35_block_rsrvd_fix_b <= unbiasedExpLowerBits_uid35_block_rsrvd_fix_in(4 downto 0);

    -- redist0(DELAY,82)
    redist0 : dspba_delay
    GENERIC MAP ( width => 5, depth => 1 )
    PORT MAP ( xin => unbiasedExpLowerBits_uid35_block_rsrvd_fix_b, xout => redist0_q, clk => clk, aclr => areset );

    -- maskTable_uid36_block_rsrvd_fix(LOOKUP,35)@1
    maskTable_uid36_block_rsrvd_fix: PROCESS (redist0_q)
    BEGIN
        -- Begin reserved scope level
        CASE (redist0_q) IS
            WHEN "00000" => maskTable_uid36_block_rsrvd_fix_q <= "00000000000000000000000";
            WHEN "00001" => maskTable_uid36_block_rsrvd_fix_q <= "10000000000000000000000";
            WHEN "00010" => maskTable_uid36_block_rsrvd_fix_q <= "11000000000000000000000";
            WHEN "00011" => maskTable_uid36_block_rsrvd_fix_q <= "11100000000000000000000";
            WHEN "00100" => maskTable_uid36_block_rsrvd_fix_q <= "11110000000000000000000";
            WHEN "00101" => maskTable_uid36_block_rsrvd_fix_q <= "11111000000000000000000";
            WHEN "00110" => maskTable_uid36_block_rsrvd_fix_q <= "11111100000000000000000";
            WHEN "00111" => maskTable_uid36_block_rsrvd_fix_q <= "11111110000000000000000";
            WHEN "01000" => maskTable_uid36_block_rsrvd_fix_q <= "11111111000000000000000";
            WHEN "01001" => maskTable_uid36_block_rsrvd_fix_q <= "11111111100000000000000";
            WHEN "01010" => maskTable_uid36_block_rsrvd_fix_q <= "11111111110000000000000";
            WHEN "01011" => maskTable_uid36_block_rsrvd_fix_q <= "11111111111000000000000";
            WHEN "01100" => maskTable_uid36_block_rsrvd_fix_q <= "11111111111100000000000";
            WHEN "01101" => maskTable_uid36_block_rsrvd_fix_q <= "11111111111110000000000";
            WHEN "01110" => maskTable_uid36_block_rsrvd_fix_q <= "11111111111111000000000";
            WHEN "01111" => maskTable_uid36_block_rsrvd_fix_q <= "11111111111111100000000";
            WHEN "10000" => maskTable_uid36_block_rsrvd_fix_q <= "11111111111111110000000";
            WHEN "10001" => maskTable_uid36_block_rsrvd_fix_q <= "11111111111111111000000";
            WHEN "10010" => maskTable_uid36_block_rsrvd_fix_q <= "11111111111111111100000";
            WHEN "10011" => maskTable_uid36_block_rsrvd_fix_q <= "11111111111111111110000";
            WHEN "10100" => maskTable_uid36_block_rsrvd_fix_q <= "11111111111111111111000";
            WHEN "10101" => maskTable_uid36_block_rsrvd_fix_q <= "11111111111111111111100";
            WHEN "10110" => maskTable_uid36_block_rsrvd_fix_q <= "11111111111111111111110";
            WHEN OTHERS => maskTable_uid36_block_rsrvd_fix_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- invertedMaskBits_uid42_block_rsrvd_fix(LOGICAL,41)@1
    invertedMaskBits_uid42_block_rsrvd_fix_a <= maskTable_uid36_block_rsrvd_fix_q;
    invertedMaskBits_uid42_block_rsrvd_fix_q <= not (invertedMaskBits_uid42_block_rsrvd_fix_a);

    -- discardedFracBits_uid43_block_rsrvd_fix(LOGICAL,42)@1
    discardedFracBits_uid43_block_rsrvd_fix_a <= invertedMaskBits_uid42_block_rsrvd_fix_q;
    discardedFracBits_uid43_block_rsrvd_fix_b <= redist8_q;
    discardedFracBits_uid43_block_rsrvd_fix_q <= discardedFracBits_uid43_block_rsrvd_fix_a and discardedFracBits_uid43_block_rsrvd_fix_b;

    -- discardedBitsAllZeros_uid44_block_rsrvd_fix(LOGICAL,43)@1
    discardedBitsAllZeros_uid44_block_rsrvd_fix_a <= discardedFracBits_uid43_block_rsrvd_fix_q;
    discardedBitsAllZeros_uid44_block_rsrvd_fix_b <= zeroWF_uid40_block_rsrvd_fix_q;
    discardedBitsAllZeros_uid44_block_rsrvd_fix_q <= "1" WHEN discardedBitsAllZeros_uid44_block_rsrvd_fix_a = discardedBitsAllZeros_uid44_block_rsrvd_fix_b ELSE "0";

    -- flagDiscardedFracBits_uid45_block_rsrvd_fix(LOGICAL,44)@1
    flagDiscardedFracBits_uid45_block_rsrvd_fix_a <= discardedBitsAllZeros_uid44_block_rsrvd_fix_q;
    flagDiscardedFracBits_uid45_block_rsrvd_fix_q_i <= not (flagDiscardedFracBits_uid45_block_rsrvd_fix_a);
    flagDiscardedFracBits_uid45_block_rsrvd_fix_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => flagDiscardedFracBits_uid45_block_rsrvd_fix_q_i, xout => flagDiscardedFracBits_uid45_block_rsrvd_fix_q, clk => clk, aclr => areset );

    -- InvFlagDiscardedFracBits_uid52_block_rsrvd_fix(LOGICAL,51)@2
    InvFlagDiscardedFracBits_uid52_block_rsrvd_fix_a <= flagDiscardedFracBits_uid45_block_rsrvd_fix_q;
    InvFlagDiscardedFracBits_uid52_block_rsrvd_fix_q <= not (InvFlagDiscardedFracBits_uid52_block_rsrvd_fix_a);

    -- InvSignX_uid29_block_rsrvd_fix(LOGICAL,28)@1
    InvSignX_uid29_block_rsrvd_fix_a <= redist5_q;
    InvSignX_uid29_block_rsrvd_fix_q <= not (InvSignX_uid29_block_rsrvd_fix_a);

    -- redist2(DELAY,84)
    redist2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => InvSignX_uid29_block_rsrvd_fix_q, xout => redist2_q, clk => clk, aclr => areset );

    -- expComputingRange_uid33_block_rsrvd_fix(LOGICAL,32)@2
    expComputingRange_uid33_block_rsrvd_fix_a <= redist4_q;
    expComputingRange_uid33_block_rsrvd_fix_b <= resIsInteger_uid32_block_rsrvd_fix_n;
    expComputingRange_uid33_block_rsrvd_fix_q <= not (expComputingRange_uid33_block_rsrvd_fix_a or expComputingRange_uid33_block_rsrvd_fix_b);

    -- negCompRange_uid71_block_rsrvd_fix(LOGICAL,70)@2
    negCompRange_uid71_block_rsrvd_fix_a <= expComputingRange_uid33_block_rsrvd_fix_q;
    negCompRange_uid71_block_rsrvd_fix_b <= redist2_q;
    negCompRange_uid71_block_rsrvd_fix_c <= InvFlagDiscardedFracBits_uid52_block_rsrvd_fix_q;
    negCompRange_uid71_block_rsrvd_fix_q <= negCompRange_uid71_block_rsrvd_fix_a and negCompRange_uid71_block_rsrvd_fix_b and negCompRange_uid71_block_rsrvd_fix_c;

    -- CompRangePosNoDisc_uid72_block_rsrvd_fix(LOGICAL,71)@2
    CompRangePosNoDisc_uid72_block_rsrvd_fix_a <= expComputingRange_uid33_block_rsrvd_fix_q;
    CompRangePosNoDisc_uid72_block_rsrvd_fix_b <= redist6_q;
    CompRangePosNoDisc_uid72_block_rsrvd_fix_q <= CompRangePosNoDisc_uid72_block_rsrvd_fix_a and CompRangePosNoDisc_uid72_block_rsrvd_fix_b;

    -- compOrInteger_uid73_block_rsrvd_fix(LOGICAL,72)@2
    compOrInteger_uid73_block_rsrvd_fix_a <= CompRangePosNoDisc_uid72_block_rsrvd_fix_q;
    compOrInteger_uid73_block_rsrvd_fix_b <= negCompRange_uid71_block_rsrvd_fix_q;
    compOrInteger_uid73_block_rsrvd_fix_c <= resIsInteger_uid32_block_rsrvd_fix_n;
    compOrInteger_uid73_block_rsrvd_fix_q_i <= compOrInteger_uid73_block_rsrvd_fix_a or compOrInteger_uid73_block_rsrvd_fix_b or compOrInteger_uid73_block_rsrvd_fix_c;
    compOrInteger_uid73_block_rsrvd_fix_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => compOrInteger_uid73_block_rsrvd_fix_q_i, xout => compOrInteger_uid73_block_rsrvd_fix_q, clk => clk, aclr => areset );

    -- expIntegerOrCompPosDiscBitsZeroOrCompNeg_uid74_block_rsrvd_fix(LOGICAL,73)@3
    expIntegerOrCompPosDiscBitsZeroOrCompNeg_uid74_block_rsrvd_fix_a <= redist12_q;
    expIntegerOrCompPosDiscBitsZeroOrCompNeg_uid74_block_rsrvd_fix_b <= STD_LOGIC_VECTOR((7 downto 1 => compOrInteger_uid73_block_rsrvd_fix_q(0)) & compOrInteger_uid73_block_rsrvd_fix_q);
    expIntegerOrCompPosDiscBitsZeroOrCompNeg_uid74_block_rsrvd_fix_q <= expIntegerOrCompPosDiscBitsZeroOrCompNeg_uid74_block_rsrvd_fix_a and expIntegerOrCompPosDiscBitsZeroOrCompNeg_uid74_block_rsrvd_fix_b;

    -- resIsOne_uid30_block_rsrvd_fix(LOGICAL,29)@1
    resIsOne_uid30_block_rsrvd_fix_a <= InvSignX_uid29_block_rsrvd_fix_q;
    resIsOne_uid30_block_rsrvd_fix_b <= expLTBias_uid27_block_rsrvd_fix_c;
    resIsOne_uid30_block_rsrvd_fix_q <= resIsOne_uid30_block_rsrvd_fix_a and resIsOne_uid30_block_rsrvd_fix_b;

    -- redist1(DELAY,83)
    redist1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2 )
    PORT MAP ( xin => resIsOne_uid30_block_rsrvd_fix_q, xout => redist1_q, clk => clk, aclr => areset );

    -- expResIsOne_uid68_block_rsrvd_fix(LOGICAL,67)@3
    expResIsOne_uid68_block_rsrvd_fix_a <= bias_uid26_block_rsrvd_fix_q;
    expResIsOne_uid68_block_rsrvd_fix_b <= STD_LOGIC_VECTOR((7 downto 1 => redist1_q(0)) & redist1_q);
    expResIsOne_uid68_block_rsrvd_fix_q <= expResIsOne_uid68_block_rsrvd_fix_a and expResIsOne_uid68_block_rsrvd_fix_b;

    -- negDiscBitsCompRange_uid50_block_rsrvd_fix(LOGICAL,49)@2
    negDiscBitsCompRange_uid50_block_rsrvd_fix_a <= redist2_q;
    negDiscBitsCompRange_uid50_block_rsrvd_fix_b <= flagDiscardedFracBits_uid45_block_rsrvd_fix_q;
    negDiscBitsCompRange_uid50_block_rsrvd_fix_c <= expComputingRange_uid33_block_rsrvd_fix_q;
    negDiscBitsCompRange_uid50_block_rsrvd_fix_q <= negDiscBitsCompRange_uid50_block_rsrvd_fix_a and negDiscBitsCompRange_uid50_block_rsrvd_fix_b and negDiscBitsCompRange_uid50_block_rsrvd_fix_c;

    -- maskIncrementTable_uid38_block_rsrvd_fix(LOOKUP,37)@1
    maskIncrementTable_uid38_block_rsrvd_fix: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            maskIncrementTable_uid38_block_rsrvd_fix_q <= "100000000000000000000000";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (redist0_q) IS
                WHEN "00000" => maskIncrementTable_uid38_block_rsrvd_fix_q <= "100000000000000000000000";
                WHEN "00001" => maskIncrementTable_uid38_block_rsrvd_fix_q <= "010000000000000000000000";
                WHEN "00010" => maskIncrementTable_uid38_block_rsrvd_fix_q <= "001000000000000000000000";
                WHEN "00011" => maskIncrementTable_uid38_block_rsrvd_fix_q <= "000100000000000000000000";
                WHEN "00100" => maskIncrementTable_uid38_block_rsrvd_fix_q <= "000010000000000000000000";
                WHEN "00101" => maskIncrementTable_uid38_block_rsrvd_fix_q <= "000001000000000000000000";
                WHEN "00110" => maskIncrementTable_uid38_block_rsrvd_fix_q <= "000000100000000000000000";
                WHEN "00111" => maskIncrementTable_uid38_block_rsrvd_fix_q <= "000000010000000000000000";
                WHEN "01000" => maskIncrementTable_uid38_block_rsrvd_fix_q <= "000000001000000000000000";
                WHEN "01001" => maskIncrementTable_uid38_block_rsrvd_fix_q <= "000000000100000000000000";
                WHEN "01010" => maskIncrementTable_uid38_block_rsrvd_fix_q <= "000000000010000000000000";
                WHEN "01011" => maskIncrementTable_uid38_block_rsrvd_fix_q <= "000000000001000000000000";
                WHEN "01100" => maskIncrementTable_uid38_block_rsrvd_fix_q <= "000000000000100000000000";
                WHEN "01101" => maskIncrementTable_uid38_block_rsrvd_fix_q <= "000000000000010000000000";
                WHEN "01110" => maskIncrementTable_uid38_block_rsrvd_fix_q <= "000000000000001000000000";
                WHEN "01111" => maskIncrementTable_uid38_block_rsrvd_fix_q <= "000000000000000100000000";
                WHEN "10000" => maskIncrementTable_uid38_block_rsrvd_fix_q <= "000000000000000010000000";
                WHEN "10001" => maskIncrementTable_uid38_block_rsrvd_fix_q <= "000000000000000001000000";
                WHEN "10010" => maskIncrementTable_uid38_block_rsrvd_fix_q <= "000000000000000000100000";
                WHEN "10011" => maskIncrementTable_uid38_block_rsrvd_fix_q <= "000000000000000000010000";
                WHEN "10100" => maskIncrementTable_uid38_block_rsrvd_fix_q <= "000000000000000000001000";
                WHEN "10101" => maskIncrementTable_uid38_block_rsrvd_fix_q <= "000000000000000000000100";
                WHEN "10110" => maskIncrementTable_uid38_block_rsrvd_fix_q <= "000000000000000000000010";
                WHEN "10111" => maskIncrementTable_uid38_block_rsrvd_fix_q <= "000000000000000000000001";
                WHEN OTHERS => maskIncrementTable_uid38_block_rsrvd_fix_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- fracPostMask_uid39_block_rsrvd_fix(LOGICAL,38)@1
    fracPostMask_uid39_block_rsrvd_fix_a <= redist8_q;
    fracPostMask_uid39_block_rsrvd_fix_b <= maskTable_uid36_block_rsrvd_fix_q;
    fracPostMask_uid39_block_rsrvd_fix_q <= fracPostMask_uid39_block_rsrvd_fix_a and fracPostMask_uid39_block_rsrvd_fix_b;

    -- intFracValue_uid41_block_rsrvd_fix(MUX,40)@1
    intFracValue_uid41_block_rsrvd_fix_s <= resIsOne_uid30_block_rsrvd_fix_q;
    intFracValue_uid41_block_rsrvd_fix: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            intFracValue_uid41_block_rsrvd_fix_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (intFracValue_uid41_block_rsrvd_fix_s) IS
                WHEN "0" => intFracValue_uid41_block_rsrvd_fix_q <= fracPostMask_uid39_block_rsrvd_fix_q;
                WHEN "1" => intFracValue_uid41_block_rsrvd_fix_q <= zeroWF_uid40_block_rsrvd_fix_q;
                WHEN OTHERS => intFracValue_uid41_block_rsrvd_fix_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- ovfExpFrac_uid46_block_rsrvd_fix(BITJOIN,45)@2
    ovfExpFrac_uid46_block_rsrvd_fix_q <= GND_q & redist11_q & intFracValue_uid41_block_rsrvd_fix_q;

    -- ovfExpIntFracValuePostIncMask_uid47_block_rsrvd_fix(ADD,46)@2
    ovfExpIntFracValuePostIncMask_uid47_block_rsrvd_fix_a <= STD_LOGIC_VECTOR("0" & ovfExpFrac_uid46_block_rsrvd_fix_q);
    ovfExpIntFracValuePostIncMask_uid47_block_rsrvd_fix_b <= STD_LOGIC_VECTOR("000000000" & maskIncrementTable_uid38_block_rsrvd_fix_q);
    ovfExpIntFracValuePostIncMask_uid47_block_rsrvd_fix_o <= STD_LOGIC_VECTOR(UNSIGNED(ovfExpIntFracValuePostIncMask_uid47_block_rsrvd_fix_a) + UNSIGNED(ovfExpIntFracValuePostIncMask_uid47_block_rsrvd_fix_b));
    ovfExpIntFracValuePostIncMask_uid47_block_rsrvd_fix_q <= ovfExpIntFracValuePostIncMask_uid47_block_rsrvd_fix_o(32 downto 0);

    -- expNegNonZeroFrac_uid64_block_rsrvd_fix(BITSELECT,63)@2
    expNegNonZeroFrac_uid64_block_rsrvd_fix_in <= ovfExpIntFracValuePostIncMask_uid47_block_rsrvd_fix_q(30 downto 0);
    expNegNonZeroFrac_uid64_block_rsrvd_fix_b <= expNegNonZeroFrac_uid64_block_rsrvd_fix_in(30 downto 23);

    -- compNegNonZeroDiscBits_uid67_block_rsrvd_fix(LOGICAL,66)@2
    compNegNonZeroDiscBits_uid67_block_rsrvd_fix_a <= expNegNonZeroFrac_uid64_block_rsrvd_fix_b;
    compNegNonZeroDiscBits_uid67_block_rsrvd_fix_b <= STD_LOGIC_VECTOR((7 downto 1 => negDiscBitsCompRange_uid50_block_rsrvd_fix_q(0)) & negDiscBitsCompRange_uid50_block_rsrvd_fix_q);
    compNegNonZeroDiscBits_uid67_block_rsrvd_fix_q_i <= compNegNonZeroDiscBits_uid67_block_rsrvd_fix_a and compNegNonZeroDiscBits_uid67_block_rsrvd_fix_b;
    compNegNonZeroDiscBits_uid67_block_rsrvd_fix_delay : dspba_delay
    GENERIC MAP ( width => 8, depth => 1 )
    PORT MAP ( xin => compNegNonZeroDiscBits_uid67_block_rsrvd_fix_q_i, xout => compNegNonZeroDiscBits_uid67_block_rsrvd_fix_q, clk => clk, aclr => areset );

    -- expRNoException_uid75_block_rsrvd_fix(LOGICAL,74)@3
    expRNoException_uid75_block_rsrvd_fix_a <= compNegNonZeroDiscBits_uid67_block_rsrvd_fix_q;
    expRNoException_uid75_block_rsrvd_fix_b <= expResIsOne_uid68_block_rsrvd_fix_q;
    expRNoException_uid75_block_rsrvd_fix_c <= expIntegerOrCompPosDiscBitsZeroOrCompNeg_uid74_block_rsrvd_fix_q;
    expRNoException_uid75_block_rsrvd_fix_q <= expRNoException_uid75_block_rsrvd_fix_a or expRNoException_uid75_block_rsrvd_fix_b or expRNoException_uid75_block_rsrvd_fix_c;

    -- expWithNaNInf_uid77_block_rsrvd_fix(LOGICAL,76)@3
    expWithNaNInf_uid77_block_rsrvd_fix_a <= expRNoException_uid75_block_rsrvd_fix_q;
    expWithNaNInf_uid77_block_rsrvd_fix_b <= STD_LOGIC_VECTOR((7 downto 1 => excXNOrI_uid76_block_rsrvd_fix_q(0)) & excXNOrI_uid76_block_rsrvd_fix_q);
    expWithNaNInf_uid77_block_rsrvd_fix_q <= expWithNaNInf_uid77_block_rsrvd_fix_a or expWithNaNInf_uid77_block_rsrvd_fix_b;

    -- expR_uid80_block_rsrvd_fix(LOGICAL,79)@3
    expR_uid80_block_rsrvd_fix_a <= expWithNaNInf_uid77_block_rsrvd_fix_q;
    expR_uid80_block_rsrvd_fix_b <= STD_LOGIC_VECTOR((7 downto 1 => InvRZero_uid79_block_rsrvd_fix_q(0)) & InvRZero_uid79_block_rsrvd_fix_q);
    expR_uid80_block_rsrvd_fix_q <= expR_uid80_block_rsrvd_fix_a and expR_uid80_block_rsrvd_fix_b;

    -- NotExcIOrZ_uid62_block_rsrvd_fix(LOGICAL,61)@3
    NotExcIOrZ_uid62_block_rsrvd_fix_a <= exc_I_uid19_block_rsrvd_fix_q;
    NotExcIOrZ_uid62_block_rsrvd_fix_b <= expXIsZero_uid13_block_rsrvd_fix_q;
    NotExcIOrZ_uid62_block_rsrvd_fix_q <= not (NotExcIOrZ_uid62_block_rsrvd_fix_a or NotExcIOrZ_uid62_block_rsrvd_fix_b);

    -- fracAndExpandedFlagResInt_uid60_block_rsrvd_fix(LOGICAL,59)@2
    fracAndExpandedFlagResInt_uid60_block_rsrvd_fix_a <= redist9_q;
    fracAndExpandedFlagResInt_uid60_block_rsrvd_fix_b <= STD_LOGIC_VECTOR((22 downto 1 => resIsInteger_uid32_block_rsrvd_fix_n(0)) & resIsInteger_uid32_block_rsrvd_fix_n);
    fracAndExpandedFlagResInt_uid60_block_rsrvd_fix_q_i <= fracAndExpandedFlagResInt_uid60_block_rsrvd_fix_a and fracAndExpandedFlagResInt_uid60_block_rsrvd_fix_b;
    fracAndExpandedFlagResInt_uid60_block_rsrvd_fix_delay : dspba_delay
    GENERIC MAP ( width => 23, depth => 1 )
    PORT MAP ( xin => fracAndExpandedFlagResInt_uid60_block_rsrvd_fix_q_i, xout => fracAndExpandedFlagResInt_uid60_block_rsrvd_fix_q, clk => clk, aclr => areset );

    -- InvResIsZero_uid57_block_rsrvd_fix(LOGICAL,56)@2
    InvResIsZero_uid57_block_rsrvd_fix_a <= resIsZero_uid28_block_rsrvd_fix_q;
    InvResIsZero_uid57_block_rsrvd_fix_q <= not (InvResIsZero_uid57_block_rsrvd_fix_a);

    -- posCompRangeNoDiscBIts_uid54_block_rsrvd_fix(LOGICAL,53)@2
    posCompRangeNoDiscBIts_uid54_block_rsrvd_fix_a <= redist2_q;
    posCompRangeNoDiscBIts_uid54_block_rsrvd_fix_b <= expComputingRange_uid33_block_rsrvd_fix_q;
    posCompRangeNoDiscBIts_uid54_block_rsrvd_fix_c <= InvFlagDiscardedFracBits_uid52_block_rsrvd_fix_q;
    posCompRangeNoDiscBIts_uid54_block_rsrvd_fix_q <= posCompRangeNoDiscBIts_uid54_block_rsrvd_fix_a and posCompRangeNoDiscBIts_uid54_block_rsrvd_fix_b and posCompRangeNoDiscBIts_uid54_block_rsrvd_fix_c;

    -- negCompRange_uid55_block_rsrvd_fix(LOGICAL,54)@2
    negCompRange_uid55_block_rsrvd_fix_a <= redist6_q;
    negCompRange_uid55_block_rsrvd_fix_b <= expComputingRange_uid33_block_rsrvd_fix_q;
    negCompRange_uid55_block_rsrvd_fix_q <= negCompRange_uid55_block_rsrvd_fix_a and negCompRange_uid55_block_rsrvd_fix_b;

    -- nCompNegOrPosWithZeroDiscBits_uid56_block_rsrvd_fix(LOGICAL,55)@2
    nCompNegOrPosWithZeroDiscBits_uid56_block_rsrvd_fix_a <= negCompRange_uid55_block_rsrvd_fix_q;
    nCompNegOrPosWithZeroDiscBits_uid56_block_rsrvd_fix_b <= posCompRangeNoDiscBIts_uid54_block_rsrvd_fix_q;
    nCompNegOrPosWithZeroDiscBits_uid56_block_rsrvd_fix_q <= nCompNegOrPosWithZeroDiscBits_uid56_block_rsrvd_fix_a or nCompNegOrPosWithZeroDiscBits_uid56_block_rsrvd_fix_b;

    -- resNotZeroAndComp_uid58_block_rsrvd_fix(LOGICAL,57)@2
    resNotZeroAndComp_uid58_block_rsrvd_fix_a <= nCompNegOrPosWithZeroDiscBits_uid56_block_rsrvd_fix_q;
    resNotZeroAndComp_uid58_block_rsrvd_fix_b <= InvResIsZero_uid57_block_rsrvd_fix_q;
    resNotZeroAndComp_uid58_block_rsrvd_fix_q <= resNotZeroAndComp_uid58_block_rsrvd_fix_a and resNotZeroAndComp_uid58_block_rsrvd_fix_b;

    -- fracNegOrPosWithZeroDisBitsComp_uid59_block_rsrvd_fix(LOGICAL,58)@2
    fracNegOrPosWithZeroDisBitsComp_uid59_block_rsrvd_fix_a <= intFracValue_uid41_block_rsrvd_fix_q;
    fracNegOrPosWithZeroDisBitsComp_uid59_block_rsrvd_fix_b <= STD_LOGIC_VECTOR((22 downto 1 => resNotZeroAndComp_uid58_block_rsrvd_fix_q(0)) & resNotZeroAndComp_uid58_block_rsrvd_fix_q);
    fracNegOrPosWithZeroDisBitsComp_uid59_block_rsrvd_fix_q_i <= fracNegOrPosWithZeroDisBitsComp_uid59_block_rsrvd_fix_a and fracNegOrPosWithZeroDisBitsComp_uid59_block_rsrvd_fix_b;
    fracNegOrPosWithZeroDisBitsComp_uid59_block_rsrvd_fix_delay : dspba_delay
    GENERIC MAP ( width => 23, depth => 1 )
    PORT MAP ( xin => fracNegOrPosWithZeroDisBitsComp_uid59_block_rsrvd_fix_q_i, xout => fracNegOrPosWithZeroDisBitsComp_uid59_block_rsrvd_fix_q, clk => clk, aclr => areset );

    -- intFracPosWNonZeroDiscardedBits_uid48_block_rsrvd_fix(BITSELECT,47)@2
    intFracPosWNonZeroDiscardedBits_uid48_block_rsrvd_fix_in <= ovfExpIntFracValuePostIncMask_uid47_block_rsrvd_fix_q(22 downto 0);
    intFracPosWNonZeroDiscardedBits_uid48_block_rsrvd_fix_b <= intFracPosWNonZeroDiscardedBits_uid48_block_rsrvd_fix_in(22 downto 0);

    -- fracPosAndFracBits_uid51_block_rsrvd_fix(LOGICAL,50)@2
    fracPosAndFracBits_uid51_block_rsrvd_fix_a <= intFracPosWNonZeroDiscardedBits_uid48_block_rsrvd_fix_b;
    fracPosAndFracBits_uid51_block_rsrvd_fix_b <= STD_LOGIC_VECTOR((22 downto 1 => negDiscBitsCompRange_uid50_block_rsrvd_fix_q(0)) & negDiscBitsCompRange_uid50_block_rsrvd_fix_q);
    fracPosAndFracBits_uid51_block_rsrvd_fix_q_i <= fracPosAndFracBits_uid51_block_rsrvd_fix_a and fracPosAndFracBits_uid51_block_rsrvd_fix_b;
    fracPosAndFracBits_uid51_block_rsrvd_fix_delay : dspba_delay
    GENERIC MAP ( width => 23, depth => 1 )
    PORT MAP ( xin => fracPosAndFracBits_uid51_block_rsrvd_fix_q_i, xout => fracPosAndFracBits_uid51_block_rsrvd_fix_q, clk => clk, aclr => areset );

    -- fracRNoExc_uid61_block_rsrvd_fix(LOGICAL,60)@3
    fracRNoExc_uid61_block_rsrvd_fix_a <= fracPosAndFracBits_uid51_block_rsrvd_fix_q;
    fracRNoExc_uid61_block_rsrvd_fix_b <= fracNegOrPosWithZeroDisBitsComp_uid59_block_rsrvd_fix_q;
    fracRNoExc_uid61_block_rsrvd_fix_c <= fracAndExpandedFlagResInt_uid60_block_rsrvd_fix_q;
    fracRNoExc_uid61_block_rsrvd_fix_q <= fracRNoExc_uid61_block_rsrvd_fix_a or fracRNoExc_uid61_block_rsrvd_fix_b or fracRNoExc_uid61_block_rsrvd_fix_c;

    -- fracR_uid63_block_rsrvd_fix(LOGICAL,62)@3
    fracR_uid63_block_rsrvd_fix_a <= fracRNoExc_uid61_block_rsrvd_fix_q;
    fracR_uid63_block_rsrvd_fix_b <= STD_LOGIC_VECTOR((22 downto 1 => NotExcIOrZ_uid62_block_rsrvd_fix_q(0)) & NotExcIOrZ_uid62_block_rsrvd_fix_q);
    fracR_uid63_block_rsrvd_fix_q <= fracR_uid63_block_rsrvd_fix_a and fracR_uid63_block_rsrvd_fix_b;

    -- ceilX_uid81_block_rsrvd_fix(BITJOIN,80)@3
    ceilX_uid81_block_rsrvd_fix_q <= redist7_q & expR_uid80_block_rsrvd_fix_q & fracR_uid63_block_rsrvd_fix_q;

    -- out_primWireOut(GPOUT,4)@3
    out_primWireOut <= ceilX_uid81_block_rsrvd_fix_q;

END normal;
