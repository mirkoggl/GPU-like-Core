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

-- VHDL created from floatComponent_fract_dut_prim_fracBlock_typeSFloat_23_8_typeSFloat_23_8_310cu4udA0Zs0i226123642i229755y
-- VHDL created on Mon Apr 20 12:20:24 2015


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

USE work.fract_dut_safe_path.all;
entity floatComponent_fract_dut_prim_fracBlock_typeSFloat_23_8_typeSFloat_23_8_310cu4udA0Zs0i226123642i229755y is
    port (
        in_0 : in std_logic_vector(31 downto 0);  -- float32_m23
        out_primWireOut : out std_logic_vector(31 downto 0);  -- float32_m23
        clk : in std_logic;
        areset : in std_logic
    );
end floatComponent_fract_dut_prim_fracBlock_typeSFloat_23_8_typeSFloat_23_8_310cu4udA0Zs0i226123642i229755y;

architecture normal of floatComponent_fract_dut_prim_fracBlock_typeSFloat_23_8_typeSFloat_23_8_310cu4udA0Zs0i226123642i229755y is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal cstAllOWE_uid9_block_rsrvd_fix_q : STD_LOGIC_VECTOR (7 downto 0);
    signal cstOneWF_uid10_block_rsrvd_fix_q : STD_LOGIC_VECTOR (22 downto 0);
    signal cstAllZWE_uid11_block_rsrvd_fix_q : STD_LOGIC_VECTOR (7 downto 0);
    signal expXIsZero_uid13_block_rsrvd_fix_a : STD_LOGIC_VECTOR (7 downto 0);
    signal expXIsZero_uid13_block_rsrvd_fix_b : STD_LOGIC_VECTOR (7 downto 0);
    signal expXIsZero_uid13_block_rsrvd_fix_q_i : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsZero_uid13_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid15_block_rsrvd_fix_a : STD_LOGIC_VECTOR (7 downto 0);
    signal expXIsMax_uid15_block_rsrvd_fix_b : STD_LOGIC_VECTOR (7 downto 0);
    signal expXIsMax_uid15_block_rsrvd_fix_q_i : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid15_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal exc_I_uid19_block_rsrvd_fix_a : STD_LOGIC_VECTOR (0 downto 0);
    signal exc_I_uid19_block_rsrvd_fix_b : STD_LOGIC_VECTOR (0 downto 0);
    signal exc_I_uid19_block_rsrvd_fix_q_i : STD_LOGIC_VECTOR (0 downto 0);
    signal exc_I_uid19_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal exc_N_uid21_block_rsrvd_fix_a : STD_LOGIC_VECTOR (0 downto 0);
    signal exc_N_uid21_block_rsrvd_fix_b : STD_LOGIC_VECTOR (0 downto 0);
    signal exc_N_uid21_block_rsrvd_fix_q_i : STD_LOGIC_VECTOR (0 downto 0);
    signal exc_N_uid21_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal cstBias_uid26_block_rsrvd_fix_q : STD_LOGIC_VECTOR (7 downto 0);
    signal cstBiasPwF_uid27_block_rsrvd_fix_q : STD_LOGIC_VECTOR (7 downto 0);
    signal cstBiasM1_uid28_block_rsrvd_fix_q : STD_LOGIC_VECTOR (7 downto 0);
    signal cstWF_uid29_block_rsrvd_fix_q : STD_LOGIC_VECTOR (4 downto 0);
    signal resIsZero_uid30_block_rsrvd_fix_a : STD_LOGIC_VECTOR (10 downto 0);
    signal resIsZero_uid30_block_rsrvd_fix_b : STD_LOGIC_VECTOR (10 downto 0);
    signal resIsZero_uid30_block_rsrvd_fix_o : STD_LOGIC_VECTOR (10 downto 0);
    signal resIsZero_uid30_block_rsrvd_fix_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal resIsZero_uid30_block_rsrvd_fix_n : STD_LOGIC_VECTOR (0 downto 0);
    signal resIsX_uid31_block_rsrvd_fix_a : STD_LOGIC_VECTOR (10 downto 0);
    signal resIsX_uid31_block_rsrvd_fix_b : STD_LOGIC_VECTOR (10 downto 0);
    signal resIsX_uid31_block_rsrvd_fix_o : STD_LOGIC_VECTOR (10 downto 0);
    signal resIsX_uid31_block_rsrvd_fix_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal resIsX_uid31_block_rsrvd_fix_n : STD_LOGIC_VECTOR (0 downto 0);
    signal shiftValue_uid33_block_rsrvd_fix_a : STD_LOGIC_VECTOR (8 downto 0);
    signal shiftValue_uid33_block_rsrvd_fix_b : STD_LOGIC_VECTOR (8 downto 0);
    signal shiftValue_uid33_block_rsrvd_fix_o : STD_LOGIC_VECTOR (8 downto 0);
    signal shiftValue_uid33_block_rsrvd_fix_q : STD_LOGIC_VECTOR (8 downto 0);
    signal negAndNotNaN_uid44_block_rsrvd_fix_a : STD_LOGIC_VECTOR (0 downto 0);
    signal negAndNotNaN_uid44_block_rsrvd_fix_b : STD_LOGIC_VECTOR (0 downto 0);
    signal negAndNotNaN_uid44_block_rsrvd_fix_q_i : STD_LOGIC_VECTOR (0 downto 0);
    signal negAndNotNaN_uid44_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRZero_uid55_block_rsrvd_fix_a : STD_LOGIC_VECTOR (0 downto 0);
    signal excRZero_uid55_block_rsrvd_fix_b : STD_LOGIC_VECTOR (0 downto 0);
    signal excRZero_uid55_block_rsrvd_fix_c : STD_LOGIC_VECTOR (0 downto 0);
    signal excRZero_uid55_block_rsrvd_fix_d : STD_LOGIC_VECTOR (0 downto 0);
    signal excRZero_uid55_block_rsrvd_fix_q_i : STD_LOGIC_VECTOR (0 downto 0);
    signal excRZero_uid55_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal zeroFracRPostExc_uid59_block_rsrvd_fix_q : STD_LOGIC_VECTOR (22 downto 0);
    signal zs_uid68_zeroCount_uid36_block_rsrvd_fix_q : STD_LOGIC_VECTOR (15 downto 0);
    signal mO_uid71_zeroCount_uid36_block_rsrvd_fix_q : STD_LOGIC_VECTOR (8 downto 0);
    signal zs_uid82_zeroCount_uid36_block_rsrvd_fix_q : STD_LOGIC_VECTOR (3 downto 0);
    signal vCount_uid84_zeroCount_uid36_block_rsrvd_fix_a : STD_LOGIC_VECTOR (3 downto 0);
    signal vCount_uid84_zeroCount_uid36_block_rsrvd_fix_b : STD_LOGIC_VECTOR (3 downto 0);
    signal vCount_uid84_zeroCount_uid36_block_rsrvd_fix_q_i : STD_LOGIC_VECTOR (0 downto 0);
    signal vCount_uid84_zeroCount_uid36_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal zs_uid88_zeroCount_uid36_block_rsrvd_fix_q : STD_LOGIC_VECTOR (1 downto 0);
    signal wOutCst_uid100_alignedXFxP_uid34_block_rsrvd_fix_q : STD_LOGIC_VECTOR (4 downto 0);
    signal shiftedOut_uid101_alignedXFxP_uid34_block_rsrvd_fix_a : STD_LOGIC_VECTOR (11 downto 0);
    signal shiftedOut_uid101_alignedXFxP_uid34_block_rsrvd_fix_b : STD_LOGIC_VECTOR (11 downto 0);
    signal shiftedOut_uid101_alignedXFxP_uid34_block_rsrvd_fix_o : STD_LOGIC_VECTOR (11 downto 0);
    signal shiftedOut_uid101_alignedXFxP_uid34_block_rsrvd_fix_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal shiftedOut_uid101_alignedXFxP_uid34_block_rsrvd_fix_n : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage0Idx3_uid108_alignedXFxP_uid34_block_rsrvd_fix_q : STD_LOGIC_VECTOR (23 downto 0);
    signal leftShiftStage1Idx3Pad6_uid117_alignedXFxP_uid34_block_rsrvd_fix_q : STD_LOGIC_VECTOR (5 downto 0);
    signal leftShiftStage2_uid126_alignedXFxP_uid34_block_rsrvd_fix_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid126_alignedXFxP_uid34_block_rsrvd_fix_q : STD_LOGIC_VECTOR (23 downto 0);
    signal fracXIsNotZero_uid17_block_rsrvd_fix_p1_of_2_a : STD_LOGIC_VECTOR (22 downto 0);
    signal fracXIsNotZero_uid17_block_rsrvd_fix_p1_of_2_b : STD_LOGIC_VECTOR (22 downto 0);
    signal fracXIsNotZero_uid17_block_rsrvd_fix_p1_of_2_o : STD_LOGIC_VECTOR (22 downto 0);
    signal fracXIsNotZero_uid17_block_rsrvd_fix_p1_of_2_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid17_block_rsrvd_fix_p1_of_2_c : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid17_block_rsrvd_fix_p2_of_2_a : STD_LOGIC_VECTOR (4 downto 0);
    signal fracXIsNotZero_uid17_block_rsrvd_fix_p2_of_2_b : STD_LOGIC_VECTOR (4 downto 0);
    signal fracXIsNotZero_uid17_block_rsrvd_fix_p2_of_2_o : STD_LOGIC_VECTOR (4 downto 0);
    signal fracXIsNotZero_uid17_block_rsrvd_fix_p2_of_2_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid17_block_rsrvd_fix_p2_of_2_c : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist1_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist2_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist3_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist4_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist5_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist6_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist8_q : STD_LOGIC_VECTOR (6 downto 0);
    signal redist9_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist11_q : STD_LOGIC_VECTOR (21 downto 0);
    signal redist12_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist13_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist14_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist16_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist17_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist18_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist19_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist20_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist21_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist22_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist24_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist13_inputreg_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist13_outputreg_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist23_outputreg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist23_replace_mem_reset0 : std_logic;
    signal redist23_replace_mem_ia : STD_LOGIC_VECTOR (31 downto 0);
    signal redist23_replace_mem_aa : STD_LOGIC_VECTOR (1 downto 0);
    signal redist23_replace_mem_ab : STD_LOGIC_VECTOR (1 downto 0);
    signal redist23_replace_mem_iq : STD_LOGIC_VECTOR (31 downto 0);
    signal redist23_replace_mem_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist23_replace_rdcnt_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist23_replace_rdcnt_i : UNSIGNED (1 downto 0);
    signal redist23_replace_rdcnt_eq : std_logic;
    signal redist23_replace_rdreg_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist23_mem_top_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist23_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist23_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute preserve : boolean;
    attribute preserve of redist23_sticky_ena_q : signal is true;
    signal finalFrac_uid40_block_rsrvd_fix_q : STD_LOGIC_VECTOR (22 downto 0);
    signal concExc_uid56_block_rsrvd_fix_q : STD_LOGIC_VECTOR (2 downto 0);
    signal fracXIsNotZero_uid17_block_rsrvd_fix_BitExpansion_for_b_q : STD_LOGIC_VECTOR (23 downto 0);
    signal InvExc_N_uid22_block_rsrvd_fix_a : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExc_N_uid22_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExc_I_uid23_block_rsrvd_fix_a : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExc_I_uid23_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsZero_uid24_block_rsrvd_fix_a : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsZero_uid24_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal exc_R_uid25_block_rsrvd_fix_a : STD_LOGIC_VECTOR (0 downto 0);
    signal exc_R_uid25_block_rsrvd_fix_b : STD_LOGIC_VECTOR (0 downto 0);
    signal exc_R_uid25_block_rsrvd_fix_c : STD_LOGIC_VECTOR (0 downto 0);
    signal exc_R_uid25_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracIsZero_uid37_block_rsrvd_fix_a : STD_LOGIC_VECTOR (4 downto 0);
    signal fracIsZero_uid37_block_rsrvd_fix_b : STD_LOGIC_VECTOR (4 downto 0);
    signal fracIsZero_uid37_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal finalExpExt_uid41_block_rsrvd_fix_a : STD_LOGIC_VECTOR (8 downto 0);
    signal finalExpExt_uid41_block_rsrvd_fix_b : STD_LOGIC_VECTOR (8 downto 0);
    signal finalExpExt_uid41_block_rsrvd_fix_o : STD_LOGIC_VECTOR (8 downto 0);
    signal finalExpExt_uid41_block_rsrvd_fix_q : STD_LOGIC_VECTOR (8 downto 0);
    signal InvResIsX_uid51_block_rsrvd_fix_a : STD_LOGIC_VECTOR (0 downto 0);
    signal InvResIsX_uid51_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvResIsZero_uid52_block_rsrvd_fix_a : STD_LOGIC_VECTOR (0 downto 0);
    signal InvResIsZero_uid52_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal xRegAndFracZero_uid53_block_rsrvd_fix_a : STD_LOGIC_VECTOR (0 downto 0);
    signal xRegAndFracZero_uid53_block_rsrvd_fix_b : STD_LOGIC_VECTOR (0 downto 0);
    signal xRegAndFracZero_uid53_block_rsrvd_fix_c : STD_LOGIC_VECTOR (0 downto 0);
    signal xRegAndFracZero_uid53_block_rsrvd_fix_d : STD_LOGIC_VECTOR (0 downto 0);
    signal xRegAndFracZero_uid53_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal xRegAndInt_uid54_block_rsrvd_fix_a : STD_LOGIC_VECTOR (0 downto 0);
    signal xRegAndInt_uid54_block_rsrvd_fix_b : STD_LOGIC_VECTOR (0 downto 0);
    signal xRegAndInt_uid54_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excREnc_uid57_block_rsrvd_fix_q : STD_LOGIC_VECTOR (1 downto 0);
    signal vCount_uid78_zeroCount_uid36_block_rsrvd_fix_a : STD_LOGIC_VECTOR (7 downto 0);
    signal vCount_uid78_zeroCount_uid36_block_rsrvd_fix_b : STD_LOGIC_VECTOR (7 downto 0);
    signal vCount_uid78_zeroCount_uid36_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid81_zeroCount_uid36_block_rsrvd_fix_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid81_zeroCount_uid36_block_rsrvd_fix_q : STD_LOGIC_VECTOR (7 downto 0);
    signal vStagei_uid87_zeroCount_uid36_block_rsrvd_fix_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid87_zeroCount_uid36_block_rsrvd_fix_q : STD_LOGIC_VECTOR (3 downto 0);
    signal r_uid128_alignedXFxP_uid34_block_rsrvd_fix_s : STD_LOGIC_VECTOR (0 downto 0);
    signal r_uid128_alignedXFxP_uid34_block_rsrvd_fix_q : STD_LOGIC_VECTOR (23 downto 0);
    signal fracXIsNotZero_uid17_block_rsrvd_fix_cout_n_a : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid17_block_rsrvd_fix_cout_n_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist23_replace_rdmux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal redist23_replace_rdmux_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist23_cmp_a : STD_LOGIC_VECTOR (2 downto 0);
    signal redist23_cmp_b : STD_LOGIC_VECTOR (2 downto 0);
    signal redist23_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist23_notEnable_a : STD_LOGIC_VECTOR (0 downto 0);
    signal redist23_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist23_nor_a : STD_LOGIC_VECTOR (0 downto 0);
    signal redist23_nor_b : STD_LOGIC_VECTOR (0 downto 0);
    signal redist23_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist23_enaAnd_a : STD_LOGIC_VECTOR (0 downto 0);
    signal redist23_enaAnd_b : STD_LOGIC_VECTOR (0 downto 0);
    signal redist23_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expX_uid6_block_rsrvd_fix_in : STD_LOGIC_VECTOR (31 downto 0);
    signal expX_uid6_block_rsrvd_fix_b : STD_LOGIC_VECTOR (7 downto 0);
    signal leftShiftStageSel4Dto3_uid109_alignedXFxP_uid34_block_rsrvd_fix_in : STD_LOGIC_VECTOR (4 downto 0);
    signal leftShiftStageSel4Dto3_uid109_alignedXFxP_uid34_block_rsrvd_fix_b : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStageSel2Dto1_uid120_alignedXFxP_uid34_block_rsrvd_fix_in : STD_LOGIC_VECTOR (2 downto 0);
    signal leftShiftStageSel2Dto1_uid120_alignedXFxP_uid34_block_rsrvd_fix_b : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStageSel0Dto0_uid125_alignedXFxP_uid34_block_rsrvd_fix_in : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStageSel0Dto0_uid125_alignedXFxP_uid34_block_rsrvd_fix_b : STD_LOGIC_VECTOR (0 downto 0);
    signal finalValFP_uid45_block_rsrvd_fix_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage0Idx2_uid136_alignedFracFinal_uid38_block_rsrvd_fix_q : STD_LOGIC_VECTOR (22 downto 0);
    signal leftShiftStageSel4Dto3_uid138_alignedFracFinal_uid38_block_rsrvd_fix_in : STD_LOGIC_VECTOR (4 downto 0);
    signal leftShiftStageSel4Dto3_uid138_alignedFracFinal_uid38_block_rsrvd_fix_b : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStageSel2Dto1_uid149_alignedFracFinal_uid38_block_rsrvd_fix_in : STD_LOGIC_VECTOR (2 downto 0);
    signal leftShiftStageSel2Dto1_uid149_alignedFracFinal_uid38_block_rsrvd_fix_b : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStageSel0Dto0_uid154_alignedFracFinal_uid38_block_rsrvd_fix_in : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStageSel0Dto0_uid154_alignedFracFinal_uid38_block_rsrvd_fix_b : STD_LOGIC_VECTOR (0 downto 0);
    signal rVStage_uid69_zeroCount_uid36_block_rsrvd_fix_in : STD_LOGIC_VECTOR (22 downto 0);
    signal rVStage_uid69_zeroCount_uid36_block_rsrvd_fix_b : STD_LOGIC_VECTOR (15 downto 0);
    signal vStage_uid72_zeroCount_uid36_block_rsrvd_fix_in : STD_LOGIC_VECTOR (6 downto 0);
    signal vStage_uid72_zeroCount_uid36_block_rsrvd_fix_b : STD_LOGIC_VECTOR (6 downto 0);
    signal muxFPPreExc_uid47_block_rsrvd_fix_s : STD_LOGIC_VECTOR (0 downto 0);
    signal muxFPPreExc_uid47_block_rsrvd_fix_q : STD_LOGIC_VECTOR (31 downto 0);
    signal fracX_uid7_block_rsrvd_fix_in : STD_LOGIC_VECTOR (31 downto 0);
    signal fracX_uid7_block_rsrvd_fix_b : STD_LOGIC_VECTOR (22 downto 0);
    signal X14dto0_uid132_alignedFracFinal_uid38_block_rsrvd_fix_in : STD_LOGIC_VECTOR (14 downto 0);
    signal X14dto0_uid132_alignedFracFinal_uid38_block_rsrvd_fix_b : STD_LOGIC_VECTOR (14 downto 0);
    signal signX_uid8_block_rsrvd_fix_in : STD_LOGIC_VECTOR (31 downto 0);
    signal signX_uid8_block_rsrvd_fix_b : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid17_block_rsrvd_fix_BitSelect_for_b_in : STD_LOGIC_VECTOR (23 downto 0);
    signal fracXIsNotZero_uid17_block_rsrvd_fix_BitSelect_for_b_b : STD_LOGIC_VECTOR (20 downto 0);
    signal fracXIsNotZero_uid17_block_rsrvd_fix_BitSelect_for_b_c : STD_LOGIC_VECTOR (2 downto 0);
    signal finalExp_uid42_block_rsrvd_fix_in : STD_LOGIC_VECTOR (7 downto 0);
    signal finalExp_uid42_block_rsrvd_fix_b : STD_LOGIC_VECTOR (7 downto 0);
    signal rVStage_uid83_zeroCount_uid36_block_rsrvd_fix_in : STD_LOGIC_VECTOR (7 downto 0);
    signal rVStage_uid83_zeroCount_uid36_block_rsrvd_fix_b : STD_LOGIC_VECTOR (3 downto 0);
    signal vStage_uid85_zeroCount_uid36_block_rsrvd_fix_in : STD_LOGIC_VECTOR (3 downto 0);
    signal vStage_uid85_zeroCount_uid36_block_rsrvd_fix_b : STD_LOGIC_VECTOR (3 downto 0);
    signal rVStage_uid89_zeroCount_uid36_block_rsrvd_fix_in : STD_LOGIC_VECTOR (3 downto 0);
    signal rVStage_uid89_zeroCount_uid36_block_rsrvd_fix_b : STD_LOGIC_VECTOR (1 downto 0);
    signal vStage_uid91_zeroCount_uid36_block_rsrvd_fix_in : STD_LOGIC_VECTOR (1 downto 0);
    signal vStage_uid91_zeroCount_uid36_block_rsrvd_fix_b : STD_LOGIC_VECTOR (1 downto 0);
    signal fracXPosFxP_uid35_block_rsrvd_fix_in : STD_LOGIC_VECTOR (22 downto 0);
    signal fracXPosFxP_uid35_block_rsrvd_fix_b : STD_LOGIC_VECTOR (22 downto 0);
    signal fracXIsZero_uid18_block_rsrvd_fix_a : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid18_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vCount_uid70_zeroCount_uid36_block_rsrvd_fix_a : STD_LOGIC_VECTOR (15 downto 0);
    signal vCount_uid70_zeroCount_uid36_block_rsrvd_fix_b : STD_LOGIC_VECTOR (15 downto 0);
    signal vCount_uid70_zeroCount_uid36_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal cStage_uid73_zeroCount_uid36_block_rsrvd_fix_q : STD_LOGIC_VECTOR (15 downto 0);
    signal muxFPPreExcSign_uid48_block_rsrvd_fix_in : STD_LOGIC_VECTOR (31 downto 0);
    signal muxFPPreExcSign_uid48_block_rsrvd_fix_b : STD_LOGIC_VECTOR (0 downto 0);
    signal muxFPPreExcExp_uid49_block_rsrvd_fix_in : STD_LOGIC_VECTOR (30 downto 0);
    signal muxFPPreExcExp_uid49_block_rsrvd_fix_b : STD_LOGIC_VECTOR (7 downto 0);
    signal muxFPPreExcFrac_uid50_block_rsrvd_fix_in : STD_LOGIC_VECTOR (22 downto 0);
    signal muxFPPreExcFrac_uid50_block_rsrvd_fix_b : STD_LOGIC_VECTOR (22 downto 0);
    signal oFracX_uid32_uid32_block_rsrvd_fix_q : STD_LOGIC_VECTOR (23 downto 0);
    signal fracXIsNotZero_uid17_block_rsrvd_fix_BitExpansion_for_a_q : STD_LOGIC_VECTOR (23 downto 0);
    signal leftShiftStage0Idx1_uid133_alignedFracFinal_uid38_block_rsrvd_fix_q : STD_LOGIC_VECTOR (22 downto 0);
    signal vCount_uid90_zeroCount_uid36_block_rsrvd_fix_a : STD_LOGIC_VECTOR (1 downto 0);
    signal vCount_uid90_zeroCount_uid36_block_rsrvd_fix_b : STD_LOGIC_VECTOR (1 downto 0);
    signal vCount_uid90_zeroCount_uid36_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid93_zeroCount_uid36_block_rsrvd_fix_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid93_zeroCount_uid36_block_rsrvd_fix_q : STD_LOGIC_VECTOR (1 downto 0);
    signal InvFracXIsZero_uid20_block_rsrvd_fix_a : STD_LOGIC_VECTOR (0 downto 0);
    signal InvFracXIsZero_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid75_zeroCount_uid36_block_rsrvd_fix_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid75_zeroCount_uid36_block_rsrvd_fix_q : STD_LOGIC_VECTOR (15 downto 0);
    signal expRPostExc_uid65_block_rsrvd_fix_s : STD_LOGIC_VECTOR (1 downto 0);
    signal expRPostExc_uid65_block_rsrvd_fix_q : STD_LOGIC_VECTOR (7 downto 0);
    signal fracRPostExc_uid61_block_rsrvd_fix_s : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRPostExc_uid61_block_rsrvd_fix_q : STD_LOGIC_VECTOR (22 downto 0);
    signal X15dto0_uid103_alignedXFxP_uid34_block_rsrvd_fix_in : STD_LOGIC_VECTOR (15 downto 0);
    signal X15dto0_uid103_alignedXFxP_uid34_block_rsrvd_fix_b : STD_LOGIC_VECTOR (15 downto 0);
    signal X7dto0_uid106_alignedXFxP_uid34_block_rsrvd_fix_in : STD_LOGIC_VECTOR (7 downto 0);
    signal X7dto0_uid106_alignedXFxP_uid34_block_rsrvd_fix_b : STD_LOGIC_VECTOR (7 downto 0);
    signal fracXIsNotZero_uid17_block_rsrvd_fix_BitSelect_for_a_in : STD_LOGIC_VECTOR (23 downto 0);
    signal fracXIsNotZero_uid17_block_rsrvd_fix_BitSelect_for_a_b : STD_LOGIC_VECTOR (20 downto 0);
    signal fracXIsNotZero_uid17_block_rsrvd_fix_BitSelect_for_a_c : STD_LOGIC_VECTOR (2 downto 0);
    signal leftShiftStage0_uid139_alignedFracFinal_uid38_block_rsrvd_fix_s : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage0_uid139_alignedFracFinal_uid38_block_rsrvd_fix_q : STD_LOGIC_VECTOR (22 downto 0);
    signal rVStage_uid95_zeroCount_uid36_block_rsrvd_fix_in : STD_LOGIC_VECTOR (1 downto 0);
    signal rVStage_uid95_zeroCount_uid36_block_rsrvd_fix_b : STD_LOGIC_VECTOR (0 downto 0);
    signal rVStage_uid77_zeroCount_uid36_block_rsrvd_fix_in : STD_LOGIC_VECTOR (15 downto 0);
    signal rVStage_uid77_zeroCount_uid36_block_rsrvd_fix_b : STD_LOGIC_VECTOR (7 downto 0);
    signal vStage_uid79_zeroCount_uid36_block_rsrvd_fix_in : STD_LOGIC_VECTOR (7 downto 0);
    signal vStage_uid79_zeroCount_uid36_block_rsrvd_fix_b : STD_LOGIC_VECTOR (7 downto 0);
    signal RFrac_uid66_block_rsrvd_fix_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage0Idx1_uid104_alignedXFxP_uid34_block_rsrvd_fix_q : STD_LOGIC_VECTOR (23 downto 0);
    signal leftShiftStage0Idx2_uid107_alignedXFxP_uid34_block_rsrvd_fix_q : STD_LOGIC_VECTOR (23 downto 0);
    signal LeftShiftStage020dto0_uid141_alignedFracFinal_uid38_block_rsrvd_fix_in : STD_LOGIC_VECTOR (20 downto 0);
    signal LeftShiftStage020dto0_uid141_alignedFracFinal_uid38_block_rsrvd_fix_b : STD_LOGIC_VECTOR (20 downto 0);
    signal LeftShiftStage018dto0_uid144_alignedFracFinal_uid38_block_rsrvd_fix_in : STD_LOGIC_VECTOR (18 downto 0);
    signal LeftShiftStage018dto0_uid144_alignedFracFinal_uid38_block_rsrvd_fix_b : STD_LOGIC_VECTOR (18 downto 0);
    signal LeftShiftStage016dto0_uid147_alignedFracFinal_uid38_block_rsrvd_fix_in : STD_LOGIC_VECTOR (16 downto 0);
    signal LeftShiftStage016dto0_uid147_alignedFracFinal_uid38_block_rsrvd_fix_b : STD_LOGIC_VECTOR (16 downto 0);
    signal vCount_uid96_zeroCount_uid36_block_rsrvd_fix_a : STD_LOGIC_VECTOR (0 downto 0);
    signal vCount_uid96_zeroCount_uid36_block_rsrvd_fix_b : STD_LOGIC_VECTOR (0 downto 0);
    signal vCount_uid96_zeroCount_uid36_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage0_uid110_alignedXFxP_uid34_block_rsrvd_fix_s : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage0_uid110_alignedXFxP_uid34_block_rsrvd_fix_q : STD_LOGIC_VECTOR (23 downto 0);
    signal leftShiftStage1Idx1_uid142_alignedFracFinal_uid38_block_rsrvd_fix_q : STD_LOGIC_VECTOR (22 downto 0);
    signal leftShiftStage1Idx2_uid145_alignedFracFinal_uid38_block_rsrvd_fix_q : STD_LOGIC_VECTOR (22 downto 0);
    signal leftShiftStage1Idx3_uid148_alignedFracFinal_uid38_block_rsrvd_fix_q : STD_LOGIC_VECTOR (22 downto 0);
    signal r_uid97_zeroCount_uid36_block_rsrvd_fix_q : STD_LOGIC_VECTOR (4 downto 0);
    signal LeftShiftStage021dto0_uid112_alignedXFxP_uid34_block_rsrvd_fix_in : STD_LOGIC_VECTOR (21 downto 0);
    signal LeftShiftStage021dto0_uid112_alignedXFxP_uid34_block_rsrvd_fix_b : STD_LOGIC_VECTOR (21 downto 0);
    signal LeftShiftStage019dto0_uid115_alignedXFxP_uid34_block_rsrvd_fix_in : STD_LOGIC_VECTOR (19 downto 0);
    signal LeftShiftStage019dto0_uid115_alignedXFxP_uid34_block_rsrvd_fix_b : STD_LOGIC_VECTOR (19 downto 0);
    signal LeftShiftStage017dto0_uid118_alignedXFxP_uid34_block_rsrvd_fix_in : STD_LOGIC_VECTOR (17 downto 0);
    signal LeftShiftStage017dto0_uid118_alignedXFxP_uid34_block_rsrvd_fix_b : STD_LOGIC_VECTOR (17 downto 0);
    signal leftShiftStage1_uid150_alignedFracFinal_uid38_block_rsrvd_fix_s : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage1_uid150_alignedFracFinal_uid38_block_rsrvd_fix_q : STD_LOGIC_VECTOR (22 downto 0);
    signal leftShiftStage1Idx1_uid113_alignedXFxP_uid34_block_rsrvd_fix_q : STD_LOGIC_VECTOR (23 downto 0);
    signal leftShiftStage1Idx2_uid116_alignedXFxP_uid34_block_rsrvd_fix_q : STD_LOGIC_VECTOR (23 downto 0);
    signal leftShiftStage1Idx3_uid119_alignedXFxP_uid34_block_rsrvd_fix_q : STD_LOGIC_VECTOR (23 downto 0);
    signal LeftShiftStage121dto0_uid152_alignedFracFinal_uid38_block_rsrvd_fix_in : STD_LOGIC_VECTOR (21 downto 0);
    signal LeftShiftStage121dto0_uid152_alignedFracFinal_uid38_block_rsrvd_fix_b : STD_LOGIC_VECTOR (21 downto 0);
    signal leftShiftStage1_uid121_alignedXFxP_uid34_block_rsrvd_fix_s : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage1_uid121_alignedXFxP_uid34_block_rsrvd_fix_q : STD_LOGIC_VECTOR (23 downto 0);
    signal leftShiftStage2Idx1_uid153_alignedFracFinal_uid38_block_rsrvd_fix_q : STD_LOGIC_VECTOR (22 downto 0);
    signal LeftShiftStage122dto0_uid123_alignedXFxP_uid34_block_rsrvd_fix_in : STD_LOGIC_VECTOR (22 downto 0);
    signal LeftShiftStage122dto0_uid123_alignedXFxP_uid34_block_rsrvd_fix_b : STD_LOGIC_VECTOR (22 downto 0);
    signal leftShiftStage2_uid155_alignedFracFinal_uid38_block_rsrvd_fix_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid155_alignedFracFinal_uid38_block_rsrvd_fix_q : STD_LOGIC_VECTOR (22 downto 0);
    signal leftShiftStage2Idx1_uid124_alignedXFxP_uid34_block_rsrvd_fix_q : STD_LOGIC_VECTOR (23 downto 0);
    signal alignedFracFinalU_uid39_block_rsrvd_fix_in : STD_LOGIC_VECTOR (21 downto 0);
    signal alignedFracFinalU_uid39_block_rsrvd_fix_b : STD_LOGIC_VECTOR (21 downto 0);

begin


    -- redist23_notEnable(LOGICAL,202)
    redist23_notEnable_a <= VCC_q;
    redist23_notEnable_q <= not (redist23_notEnable_a);

    -- redist23_nor(LOGICAL,203)
    redist23_nor_a <= redist23_notEnable_q;
    redist23_nor_b <= redist23_sticky_ena_q;
    redist23_nor_q <= not (redist23_nor_a or redist23_nor_b);

    -- redist23_mem_top(CONSTANT,199)
    redist23_mem_top_q <= "010";

    -- redist23_cmp(LOGICAL,200)
    redist23_cmp_a <= redist23_mem_top_q;
    redist23_cmp_b <= STD_LOGIC_VECTOR("0" & redist23_replace_rdmux_q);
    redist23_cmp_q <= "1" WHEN redist23_cmp_a = redist23_cmp_b ELSE "0";

    -- redist23_cmpReg(REG,201)
    redist23_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist23_cmpReg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist23_cmpReg_q <= STD_LOGIC_VECTOR(redist23_cmp_q);
        END IF;
    END PROCESS;

    -- redist23_sticky_ena(REG,204)
    redist23_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist23_sticky_ena_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist23_nor_q = "1") THEN
                redist23_sticky_ena_q <= STD_LOGIC_VECTOR(redist23_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist23_enaAnd(LOGICAL,205)
    redist23_enaAnd_a <= redist23_sticky_ena_q;
    redist23_enaAnd_b <= VCC_q;
    redist23_enaAnd_q <= redist23_enaAnd_a and redist23_enaAnd_b;

    -- redist23_replace_rdcnt(COUNTER,195)
    -- every=1, low=0, high=2, step=1, init=1
    redist23_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist23_replace_rdcnt_i <= TO_UNSIGNED(1, 2);
            redist23_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist23_replace_rdcnt_i = TO_UNSIGNED(1, 2)) THEN
                redist23_replace_rdcnt_eq <= '1';
            ELSE
                redist23_replace_rdcnt_eq <= '0';
            END IF;
            IF (redist23_replace_rdcnt_eq = '1') THEN
                redist23_replace_rdcnt_i <= redist23_replace_rdcnt_i - 2;
            ELSE
                redist23_replace_rdcnt_i <= redist23_replace_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist23_replace_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist23_replace_rdcnt_i, 2)));

    -- redist23_replace_rdmux(MUX,197)
    redist23_replace_rdmux_s <= VCC_q;
    redist23_replace_rdmux: PROCESS (redist23_replace_rdmux_s, redist23_replace_rdreg_q, redist23_replace_rdcnt_q)
    BEGIN
        CASE (redist23_replace_rdmux_s) IS
            WHEN "0" => redist23_replace_rdmux_q <= redist23_replace_rdreg_q;
            WHEN "1" => redist23_replace_rdmux_q <= redist23_replace_rdcnt_q;
            WHEN OTHERS => redist23_replace_rdmux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- in_0(GPIN,3)@0

    -- redist22(DELAY,188)
    redist22 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1 )
    PORT MAP ( xin => in_0, xout => redist22_q, clk => clk, aclr => areset );

    -- redist23_replace_rdreg(REG,196)
    redist23_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist23_replace_rdreg_q <= "00";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist23_replace_rdreg_q <= STD_LOGIC_VECTOR(redist23_replace_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist23_replace_mem(DUALMEM,194)
    redist23_replace_mem_ia <= STD_LOGIC_VECTOR(redist22_q);
    redist23_replace_mem_aa <= redist23_replace_rdreg_q;
    redist23_replace_mem_ab <= redist23_replace_rdmux_q;
    redist23_replace_mem_reset0 <= areset;
    redist23_replace_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 32,
        widthad_a => 2,
        numwords_a => 3,
        width_b => 32,
        widthad_b => 2,
        numwords_b => 3,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => "UNUSED",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken1 => redist23_enaAnd_q(0),
        clocken0 => '1',
        clock0 => clk,
        aclr1 => redist23_replace_mem_reset0,
        clock1 => clk,
        address_a => redist23_replace_mem_aa,
        data_a => redist23_replace_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist23_replace_mem_ab,
        q_b => redist23_replace_mem_iq
    );
    redist23_replace_mem_q <= redist23_replace_mem_iq(31 downto 0);

    -- redist23_outputreg(DELAY,193)
    redist23_outputreg : dspba_delay
    GENERIC MAP ( width => 32, depth => 1 )
    PORT MAP ( xin => redist23_replace_mem_q, xout => redist23_outputreg_q, clk => clk, aclr => areset );

    -- redist24(DELAY,190)
    redist24 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1 )
    PORT MAP ( xin => redist23_outputreg_q, xout => redist24_q, clk => clk, aclr => areset );

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- cstOneWF_uid10_block_rsrvd_fix(CONSTANT,9)
    cstOneWF_uid10_block_rsrvd_fix_q <= "00000000000000000000001";

    -- fracXIsNotZero_uid17_block_rsrvd_fix_BitExpansion_for_b(BITJOIN,158)@1
    fracXIsNotZero_uid17_block_rsrvd_fix_BitExpansion_for_b_q <= GND_q & cstOneWF_uid10_block_rsrvd_fix_q;

    -- fracXIsNotZero_uid17_block_rsrvd_fix_BitSelect_for_b(BITSELECT,161)@1
    fracXIsNotZero_uid17_block_rsrvd_fix_BitSelect_for_b_in <= fracXIsNotZero_uid17_block_rsrvd_fix_BitExpansion_for_b_q;
    fracXIsNotZero_uid17_block_rsrvd_fix_BitSelect_for_b_b <= fracXIsNotZero_uid17_block_rsrvd_fix_BitSelect_for_b_in(20 downto 0);
    fracXIsNotZero_uid17_block_rsrvd_fix_BitSelect_for_b_c <= fracXIsNotZero_uid17_block_rsrvd_fix_BitSelect_for_b_in(23 downto 21);

    -- fracX_uid7_block_rsrvd_fix(BITSELECT,6)@1
    fracX_uid7_block_rsrvd_fix_in <= redist22_q;
    fracX_uid7_block_rsrvd_fix_b <= fracX_uid7_block_rsrvd_fix_in(22 downto 0);

    -- fracXIsNotZero_uid17_block_rsrvd_fix_BitExpansion_for_a(BITJOIN,156)@1
    fracXIsNotZero_uid17_block_rsrvd_fix_BitExpansion_for_a_q <= GND_q & fracX_uid7_block_rsrvd_fix_b;

    -- fracXIsNotZero_uid17_block_rsrvd_fix_BitSelect_for_a(BITSELECT,160)@1
    fracXIsNotZero_uid17_block_rsrvd_fix_BitSelect_for_a_in <= fracXIsNotZero_uid17_block_rsrvd_fix_BitExpansion_for_a_q;
    fracXIsNotZero_uid17_block_rsrvd_fix_BitSelect_for_a_b <= fracXIsNotZero_uid17_block_rsrvd_fix_BitSelect_for_a_in(20 downto 0);
    fracXIsNotZero_uid17_block_rsrvd_fix_BitSelect_for_a_c <= fracXIsNotZero_uid17_block_rsrvd_fix_BitSelect_for_a_in(23 downto 21);

    -- fracXIsNotZero_uid17_block_rsrvd_fix_p1_of_2(SUB,162)@1
    fracXIsNotZero_uid17_block_rsrvd_fix_p1_of_2_cin <= GND_q;
    fracXIsNotZero_uid17_block_rsrvd_fix_p1_of_2_a <= STD_LOGIC_VECTOR("0" & fracXIsNotZero_uid17_block_rsrvd_fix_BitSelect_for_a_b) & '0';
    fracXIsNotZero_uid17_block_rsrvd_fix_p1_of_2_b <= STD_LOGIC_VECTOR("0" & fracXIsNotZero_uid17_block_rsrvd_fix_BitSelect_for_b_b) & fracXIsNotZero_uid17_block_rsrvd_fix_p1_of_2_cin(0);
    fracXIsNotZero_uid17_block_rsrvd_fix_p1_of_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            fracXIsNotZero_uid17_block_rsrvd_fix_p1_of_2_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            fracXIsNotZero_uid17_block_rsrvd_fix_p1_of_2_o <= STD_LOGIC_VECTOR(UNSIGNED(fracXIsNotZero_uid17_block_rsrvd_fix_p1_of_2_a) - UNSIGNED(fracXIsNotZero_uid17_block_rsrvd_fix_p1_of_2_b));
        END IF;
    END PROCESS;
    fracXIsNotZero_uid17_block_rsrvd_fix_p1_of_2_c(0) <= fracXIsNotZero_uid17_block_rsrvd_fix_p1_of_2_o(22);

    -- redist0(DELAY,166)
    redist0 : dspba_delay
    GENERIC MAP ( width => 3, depth => 1 )
    PORT MAP ( xin => fracXIsNotZero_uid17_block_rsrvd_fix_BitSelect_for_b_c, xout => redist0_q, clk => clk, aclr => areset );

    -- redist1(DELAY,167)
    redist1 : dspba_delay
    GENERIC MAP ( width => 3, depth => 1 )
    PORT MAP ( xin => fracXIsNotZero_uid17_block_rsrvd_fix_BitSelect_for_a_c, xout => redist1_q, clk => clk, aclr => areset );

    -- fracXIsNotZero_uid17_block_rsrvd_fix_p2_of_2(SUB,163)@2
    fracXIsNotZero_uid17_block_rsrvd_fix_p2_of_2_cin <= fracXIsNotZero_uid17_block_rsrvd_fix_p1_of_2_c;
    fracXIsNotZero_uid17_block_rsrvd_fix_p2_of_2_a <= STD_LOGIC_VECTOR("0" & redist1_q) & '0';
    fracXIsNotZero_uid17_block_rsrvd_fix_p2_of_2_b <= STD_LOGIC_VECTOR("0" & redist0_q) & fracXIsNotZero_uid17_block_rsrvd_fix_p2_of_2_cin(0);
    fracXIsNotZero_uid17_block_rsrvd_fix_p2_of_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            fracXIsNotZero_uid17_block_rsrvd_fix_p2_of_2_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            fracXIsNotZero_uid17_block_rsrvd_fix_p2_of_2_o <= STD_LOGIC_VECTOR(UNSIGNED(fracXIsNotZero_uid17_block_rsrvd_fix_p2_of_2_a) - UNSIGNED(fracXIsNotZero_uid17_block_rsrvd_fix_p2_of_2_b));
        END IF;
    END PROCESS;
    fracXIsNotZero_uid17_block_rsrvd_fix_p2_of_2_c(0) <= fracXIsNotZero_uid17_block_rsrvd_fix_p2_of_2_o(4);

    -- fracXIsNotZero_uid17_block_rsrvd_fix_cout_n(LOGICAL,165)@3
    fracXIsNotZero_uid17_block_rsrvd_fix_cout_n_a <= fracXIsNotZero_uid17_block_rsrvd_fix_p2_of_2_c;
    fracXIsNotZero_uid17_block_rsrvd_fix_cout_n_q <= not (fracXIsNotZero_uid17_block_rsrvd_fix_cout_n_a);

    -- fracXIsZero_uid18_block_rsrvd_fix(LOGICAL,17)@3
    fracXIsZero_uid18_block_rsrvd_fix_a <= fracXIsNotZero_uid17_block_rsrvd_fix_cout_n_q;
    fracXIsZero_uid18_block_rsrvd_fix_q <= not (fracXIsZero_uid18_block_rsrvd_fix_a);

    -- InvFracXIsZero_uid20_block_rsrvd_fix(LOGICAL,19)@3
    InvFracXIsZero_uid20_block_rsrvd_fix_a <= fracXIsZero_uid18_block_rsrvd_fix_q;
    InvFracXIsZero_uid20_block_rsrvd_fix_q <= not (InvFracXIsZero_uid20_block_rsrvd_fix_a);

    -- cstAllOWE_uid9_block_rsrvd_fix(CONSTANT,8)
    cstAllOWE_uid9_block_rsrvd_fix_q <= "11111111";

    -- expX_uid6_block_rsrvd_fix(BITSELECT,5)@0
    expX_uid6_block_rsrvd_fix_in <= in_0;
    expX_uid6_block_rsrvd_fix_b <= expX_uid6_block_rsrvd_fix_in(30 downto 23);

    -- expXIsMax_uid15_block_rsrvd_fix(LOGICAL,14)@0
    expXIsMax_uid15_block_rsrvd_fix_a <= expX_uid6_block_rsrvd_fix_b;
    expXIsMax_uid15_block_rsrvd_fix_b <= cstAllOWE_uid9_block_rsrvd_fix_q;
    expXIsMax_uid15_block_rsrvd_fix_q_i <= "1" WHEN expXIsMax_uid15_block_rsrvd_fix_a = expXIsMax_uid15_block_rsrvd_fix_b ELSE "0";
    expXIsMax_uid15_block_rsrvd_fix_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => expXIsMax_uid15_block_rsrvd_fix_q_i, xout => expXIsMax_uid15_block_rsrvd_fix_q, clk => clk, aclr => areset );

    -- redist20(DELAY,186)
    redist20 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2 )
    PORT MAP ( xin => expXIsMax_uid15_block_rsrvd_fix_q, xout => redist20_q, clk => clk, aclr => areset );

    -- exc_N_uid21_block_rsrvd_fix(LOGICAL,20)@3
    exc_N_uid21_block_rsrvd_fix_a <= redist20_q;
    exc_N_uid21_block_rsrvd_fix_b <= InvFracXIsZero_uid20_block_rsrvd_fix_q;
    exc_N_uid21_block_rsrvd_fix_q_i <= exc_N_uid21_block_rsrvd_fix_a and exc_N_uid21_block_rsrvd_fix_b;
    exc_N_uid21_block_rsrvd_fix_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => exc_N_uid21_block_rsrvd_fix_q_i, xout => exc_N_uid21_block_rsrvd_fix_q, clk => clk, aclr => areset );

    -- redist17(DELAY,183)
    redist17 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2 )
    PORT MAP ( xin => exc_N_uid21_block_rsrvd_fix_q, xout => redist17_q, clk => clk, aclr => areset );

    -- InvExc_N_uid22_block_rsrvd_fix(LOGICAL,21)@6
    InvExc_N_uid22_block_rsrvd_fix_a <= redist17_q;
    InvExc_N_uid22_block_rsrvd_fix_q <= not (InvExc_N_uid22_block_rsrvd_fix_a);

    -- signX_uid8_block_rsrvd_fix(BITSELECT,7)@6
    signX_uid8_block_rsrvd_fix_in <= STD_LOGIC_VECTOR(redist23_outputreg_q);
    signX_uid8_block_rsrvd_fix_b <= signX_uid8_block_rsrvd_fix_in(31 downto 31);

    -- negAndNotNaN_uid44_block_rsrvd_fix(LOGICAL,43)@6
    negAndNotNaN_uid44_block_rsrvd_fix_a <= signX_uid8_block_rsrvd_fix_b;
    negAndNotNaN_uid44_block_rsrvd_fix_b <= InvExc_N_uid22_block_rsrvd_fix_q;
    negAndNotNaN_uid44_block_rsrvd_fix_q_i <= negAndNotNaN_uid44_block_rsrvd_fix_a and negAndNotNaN_uid44_block_rsrvd_fix_b;
    negAndNotNaN_uid44_block_rsrvd_fix_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => negAndNotNaN_uid44_block_rsrvd_fix_q_i, xout => negAndNotNaN_uid44_block_rsrvd_fix_q, clk => clk, aclr => areset );

    -- zs_uid68_zeroCount_uid36_block_rsrvd_fix(CONSTANT,67)
    zs_uid68_zeroCount_uid36_block_rsrvd_fix_q <= "0000000000000000";

    -- leftShiftStage0Idx3_uid108_alignedXFxP_uid34_block_rsrvd_fix(CONSTANT,107)
    leftShiftStage0Idx3_uid108_alignedXFxP_uid34_block_rsrvd_fix_q <= "000000000000000000000000";

    -- LeftShiftStage122dto0_uid123_alignedXFxP_uid34_block_rsrvd_fix(BITSELECT,122)@1
    LeftShiftStage122dto0_uid123_alignedXFxP_uid34_block_rsrvd_fix_in <= leftShiftStage1_uid121_alignedXFxP_uid34_block_rsrvd_fix_q(22 downto 0);
    LeftShiftStage122dto0_uid123_alignedXFxP_uid34_block_rsrvd_fix_b <= LeftShiftStage122dto0_uid123_alignedXFxP_uid34_block_rsrvd_fix_in(22 downto 0);

    -- leftShiftStage2Idx1_uid124_alignedXFxP_uid34_block_rsrvd_fix(BITJOIN,123)@1
    leftShiftStage2Idx1_uid124_alignedXFxP_uid34_block_rsrvd_fix_q <= LeftShiftStage122dto0_uid123_alignedXFxP_uid34_block_rsrvd_fix_b & GND_q;

    -- LeftShiftStage017dto0_uid118_alignedXFxP_uid34_block_rsrvd_fix(BITSELECT,117)@1
    LeftShiftStage017dto0_uid118_alignedXFxP_uid34_block_rsrvd_fix_in <= leftShiftStage0_uid110_alignedXFxP_uid34_block_rsrvd_fix_q(17 downto 0);
    LeftShiftStage017dto0_uid118_alignedXFxP_uid34_block_rsrvd_fix_b <= LeftShiftStage017dto0_uid118_alignedXFxP_uid34_block_rsrvd_fix_in(17 downto 0);

    -- leftShiftStage1Idx3Pad6_uid117_alignedXFxP_uid34_block_rsrvd_fix(CONSTANT,116)
    leftShiftStage1Idx3Pad6_uid117_alignedXFxP_uid34_block_rsrvd_fix_q <= "000000";

    -- leftShiftStage1Idx3_uid119_alignedXFxP_uid34_block_rsrvd_fix(BITJOIN,118)@1
    leftShiftStage1Idx3_uid119_alignedXFxP_uid34_block_rsrvd_fix_q <= LeftShiftStage017dto0_uid118_alignedXFxP_uid34_block_rsrvd_fix_b & leftShiftStage1Idx3Pad6_uid117_alignedXFxP_uid34_block_rsrvd_fix_q;

    -- LeftShiftStage019dto0_uid115_alignedXFxP_uid34_block_rsrvd_fix(BITSELECT,114)@1
    LeftShiftStage019dto0_uid115_alignedXFxP_uid34_block_rsrvd_fix_in <= leftShiftStage0_uid110_alignedXFxP_uid34_block_rsrvd_fix_q(19 downto 0);
    LeftShiftStage019dto0_uid115_alignedXFxP_uid34_block_rsrvd_fix_b <= LeftShiftStage019dto0_uid115_alignedXFxP_uid34_block_rsrvd_fix_in(19 downto 0);

    -- zs_uid82_zeroCount_uid36_block_rsrvd_fix(CONSTANT,81)
    zs_uid82_zeroCount_uid36_block_rsrvd_fix_q <= "0000";

    -- leftShiftStage1Idx2_uid116_alignedXFxP_uid34_block_rsrvd_fix(BITJOIN,115)@1
    leftShiftStage1Idx2_uid116_alignedXFxP_uid34_block_rsrvd_fix_q <= LeftShiftStage019dto0_uid115_alignedXFxP_uid34_block_rsrvd_fix_b & zs_uid82_zeroCount_uid36_block_rsrvd_fix_q;

    -- LeftShiftStage021dto0_uid112_alignedXFxP_uid34_block_rsrvd_fix(BITSELECT,111)@1
    LeftShiftStage021dto0_uid112_alignedXFxP_uid34_block_rsrvd_fix_in <= leftShiftStage0_uid110_alignedXFxP_uid34_block_rsrvd_fix_q(21 downto 0);
    LeftShiftStage021dto0_uid112_alignedXFxP_uid34_block_rsrvd_fix_b <= LeftShiftStage021dto0_uid112_alignedXFxP_uid34_block_rsrvd_fix_in(21 downto 0);

    -- zs_uid88_zeroCount_uid36_block_rsrvd_fix(CONSTANT,87)
    zs_uid88_zeroCount_uid36_block_rsrvd_fix_q <= "00";

    -- leftShiftStage1Idx1_uid113_alignedXFxP_uid34_block_rsrvd_fix(BITJOIN,112)@1
    leftShiftStage1Idx1_uid113_alignedXFxP_uid34_block_rsrvd_fix_q <= LeftShiftStage021dto0_uid112_alignedXFxP_uid34_block_rsrvd_fix_b & zs_uid88_zeroCount_uid36_block_rsrvd_fix_q;

    -- X7dto0_uid106_alignedXFxP_uid34_block_rsrvd_fix(BITSELECT,105)@1
    X7dto0_uid106_alignedXFxP_uid34_block_rsrvd_fix_in <= oFracX_uid32_uid32_block_rsrvd_fix_q(7 downto 0);
    X7dto0_uid106_alignedXFxP_uid34_block_rsrvd_fix_b <= X7dto0_uid106_alignedXFxP_uid34_block_rsrvd_fix_in(7 downto 0);

    -- leftShiftStage0Idx2_uid107_alignedXFxP_uid34_block_rsrvd_fix(BITJOIN,106)@1
    leftShiftStage0Idx2_uid107_alignedXFxP_uid34_block_rsrvd_fix_q <= X7dto0_uid106_alignedXFxP_uid34_block_rsrvd_fix_b & zs_uid68_zeroCount_uid36_block_rsrvd_fix_q;

    -- X15dto0_uid103_alignedXFxP_uid34_block_rsrvd_fix(BITSELECT,102)@1
    X15dto0_uid103_alignedXFxP_uid34_block_rsrvd_fix_in <= oFracX_uid32_uid32_block_rsrvd_fix_q(15 downto 0);
    X15dto0_uid103_alignedXFxP_uid34_block_rsrvd_fix_b <= X15dto0_uid103_alignedXFxP_uid34_block_rsrvd_fix_in(15 downto 0);

    -- cstAllZWE_uid11_block_rsrvd_fix(CONSTANT,10)
    cstAllZWE_uid11_block_rsrvd_fix_q <= "00000000";

    -- leftShiftStage0Idx1_uid104_alignedXFxP_uid34_block_rsrvd_fix(BITJOIN,103)@1
    leftShiftStage0Idx1_uid104_alignedXFxP_uid34_block_rsrvd_fix_q <= X15dto0_uid103_alignedXFxP_uid34_block_rsrvd_fix_b & cstAllZWE_uid11_block_rsrvd_fix_q;

    -- oFracX_uid32_uid32_block_rsrvd_fix(BITJOIN,31)@1
    oFracX_uid32_uid32_block_rsrvd_fix_q <= VCC_q & fracX_uid7_block_rsrvd_fix_b;

    -- cstBias_uid26_block_rsrvd_fix(CONSTANT,25)
    cstBias_uid26_block_rsrvd_fix_q <= "01111111";

    -- shiftValue_uid33_block_rsrvd_fix(SUB,32)@0
    shiftValue_uid33_block_rsrvd_fix_a <= STD_LOGIC_VECTOR("0" & expX_uid6_block_rsrvd_fix_b);
    shiftValue_uid33_block_rsrvd_fix_b <= STD_LOGIC_VECTOR("0" & cstBias_uid26_block_rsrvd_fix_q);
    shiftValue_uid33_block_rsrvd_fix: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            shiftValue_uid33_block_rsrvd_fix_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            shiftValue_uid33_block_rsrvd_fix_o <= STD_LOGIC_VECTOR(UNSIGNED(shiftValue_uid33_block_rsrvd_fix_a) - UNSIGNED(shiftValue_uid33_block_rsrvd_fix_b));
        END IF;
    END PROCESS;
    shiftValue_uid33_block_rsrvd_fix_q <= shiftValue_uid33_block_rsrvd_fix_o(8 downto 0);

    -- leftShiftStageSel4Dto3_uid109_alignedXFxP_uid34_block_rsrvd_fix(BITSELECT,108)@1
    leftShiftStageSel4Dto3_uid109_alignedXFxP_uid34_block_rsrvd_fix_in <= shiftValue_uid33_block_rsrvd_fix_q(4 downto 0);
    leftShiftStageSel4Dto3_uid109_alignedXFxP_uid34_block_rsrvd_fix_b <= leftShiftStageSel4Dto3_uid109_alignedXFxP_uid34_block_rsrvd_fix_in(4 downto 3);

    -- leftShiftStage0_uid110_alignedXFxP_uid34_block_rsrvd_fix(MUX,109)@1
    leftShiftStage0_uid110_alignedXFxP_uid34_block_rsrvd_fix_s <= leftShiftStageSel4Dto3_uid109_alignedXFxP_uid34_block_rsrvd_fix_b;
    leftShiftStage0_uid110_alignedXFxP_uid34_block_rsrvd_fix: PROCESS (leftShiftStage0_uid110_alignedXFxP_uid34_block_rsrvd_fix_s, oFracX_uid32_uid32_block_rsrvd_fix_q, leftShiftStage0Idx1_uid104_alignedXFxP_uid34_block_rsrvd_fix_q, leftShiftStage0Idx2_uid107_alignedXFxP_uid34_block_rsrvd_fix_q, leftShiftStage0Idx3_uid108_alignedXFxP_uid34_block_rsrvd_fix_q)
    BEGIN
        CASE (leftShiftStage0_uid110_alignedXFxP_uid34_block_rsrvd_fix_s) IS
            WHEN "00" => leftShiftStage0_uid110_alignedXFxP_uid34_block_rsrvd_fix_q <= oFracX_uid32_uid32_block_rsrvd_fix_q;
            WHEN "01" => leftShiftStage0_uid110_alignedXFxP_uid34_block_rsrvd_fix_q <= leftShiftStage0Idx1_uid104_alignedXFxP_uid34_block_rsrvd_fix_q;
            WHEN "10" => leftShiftStage0_uid110_alignedXFxP_uid34_block_rsrvd_fix_q <= leftShiftStage0Idx2_uid107_alignedXFxP_uid34_block_rsrvd_fix_q;
            WHEN "11" => leftShiftStage0_uid110_alignedXFxP_uid34_block_rsrvd_fix_q <= leftShiftStage0Idx3_uid108_alignedXFxP_uid34_block_rsrvd_fix_q;
            WHEN OTHERS => leftShiftStage0_uid110_alignedXFxP_uid34_block_rsrvd_fix_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- leftShiftStageSel2Dto1_uid120_alignedXFxP_uid34_block_rsrvd_fix(BITSELECT,119)@1
    leftShiftStageSel2Dto1_uid120_alignedXFxP_uid34_block_rsrvd_fix_in <= shiftValue_uid33_block_rsrvd_fix_q(2 downto 0);
    leftShiftStageSel2Dto1_uid120_alignedXFxP_uid34_block_rsrvd_fix_b <= leftShiftStageSel2Dto1_uid120_alignedXFxP_uid34_block_rsrvd_fix_in(2 downto 1);

    -- leftShiftStage1_uid121_alignedXFxP_uid34_block_rsrvd_fix(MUX,120)@1
    leftShiftStage1_uid121_alignedXFxP_uid34_block_rsrvd_fix_s <= leftShiftStageSel2Dto1_uid120_alignedXFxP_uid34_block_rsrvd_fix_b;
    leftShiftStage1_uid121_alignedXFxP_uid34_block_rsrvd_fix: PROCESS (leftShiftStage1_uid121_alignedXFxP_uid34_block_rsrvd_fix_s, leftShiftStage0_uid110_alignedXFxP_uid34_block_rsrvd_fix_q, leftShiftStage1Idx1_uid113_alignedXFxP_uid34_block_rsrvd_fix_q, leftShiftStage1Idx2_uid116_alignedXFxP_uid34_block_rsrvd_fix_q, leftShiftStage1Idx3_uid119_alignedXFxP_uid34_block_rsrvd_fix_q)
    BEGIN
        CASE (leftShiftStage1_uid121_alignedXFxP_uid34_block_rsrvd_fix_s) IS
            WHEN "00" => leftShiftStage1_uid121_alignedXFxP_uid34_block_rsrvd_fix_q <= leftShiftStage0_uid110_alignedXFxP_uid34_block_rsrvd_fix_q;
            WHEN "01" => leftShiftStage1_uid121_alignedXFxP_uid34_block_rsrvd_fix_q <= leftShiftStage1Idx1_uid113_alignedXFxP_uid34_block_rsrvd_fix_q;
            WHEN "10" => leftShiftStage1_uid121_alignedXFxP_uid34_block_rsrvd_fix_q <= leftShiftStage1Idx2_uid116_alignedXFxP_uid34_block_rsrvd_fix_q;
            WHEN "11" => leftShiftStage1_uid121_alignedXFxP_uid34_block_rsrvd_fix_q <= leftShiftStage1Idx3_uid119_alignedXFxP_uid34_block_rsrvd_fix_q;
            WHEN OTHERS => leftShiftStage1_uid121_alignedXFxP_uid34_block_rsrvd_fix_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- leftShiftStageSel0Dto0_uid125_alignedXFxP_uid34_block_rsrvd_fix(BITSELECT,124)@1
    leftShiftStageSel0Dto0_uid125_alignedXFxP_uid34_block_rsrvd_fix_in <= shiftValue_uid33_block_rsrvd_fix_q(0 downto 0);
    leftShiftStageSel0Dto0_uid125_alignedXFxP_uid34_block_rsrvd_fix_b <= leftShiftStageSel0Dto0_uid125_alignedXFxP_uid34_block_rsrvd_fix_in(0 downto 0);

    -- leftShiftStage2_uid126_alignedXFxP_uid34_block_rsrvd_fix(MUX,125)@1
    leftShiftStage2_uid126_alignedXFxP_uid34_block_rsrvd_fix_s <= leftShiftStageSel0Dto0_uid125_alignedXFxP_uid34_block_rsrvd_fix_b;
    leftShiftStage2_uid126_alignedXFxP_uid34_block_rsrvd_fix: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            leftShiftStage2_uid126_alignedXFxP_uid34_block_rsrvd_fix_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (leftShiftStage2_uid126_alignedXFxP_uid34_block_rsrvd_fix_s) IS
                WHEN "0" => leftShiftStage2_uid126_alignedXFxP_uid34_block_rsrvd_fix_q <= leftShiftStage1_uid121_alignedXFxP_uid34_block_rsrvd_fix_q;
                WHEN "1" => leftShiftStage2_uid126_alignedXFxP_uid34_block_rsrvd_fix_q <= leftShiftStage2Idx1_uid124_alignedXFxP_uid34_block_rsrvd_fix_q;
                WHEN OTHERS => leftShiftStage2_uid126_alignedXFxP_uid34_block_rsrvd_fix_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- wOutCst_uid100_alignedXFxP_uid34_block_rsrvd_fix(CONSTANT,99)
    wOutCst_uid100_alignedXFxP_uid34_block_rsrvd_fix_q <= "11000";

    -- shiftedOut_uid101_alignedXFxP_uid34_block_rsrvd_fix(COMPARE,100)@1
    shiftedOut_uid101_alignedXFxP_uid34_block_rsrvd_fix_cin <= GND_q;
    shiftedOut_uid101_alignedXFxP_uid34_block_rsrvd_fix_a <= STD_LOGIC_VECTOR("00" & shiftValue_uid33_block_rsrvd_fix_q) & '0';
    shiftedOut_uid101_alignedXFxP_uid34_block_rsrvd_fix_b <= STD_LOGIC_VECTOR("000000" & wOutCst_uid100_alignedXFxP_uid34_block_rsrvd_fix_q) & shiftedOut_uid101_alignedXFxP_uid34_block_rsrvd_fix_cin(0);
    shiftedOut_uid101_alignedXFxP_uid34_block_rsrvd_fix: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            shiftedOut_uid101_alignedXFxP_uid34_block_rsrvd_fix_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            shiftedOut_uid101_alignedXFxP_uid34_block_rsrvd_fix_o <= STD_LOGIC_VECTOR(UNSIGNED(shiftedOut_uid101_alignedXFxP_uid34_block_rsrvd_fix_a) - UNSIGNED(shiftedOut_uid101_alignedXFxP_uid34_block_rsrvd_fix_b));
        END IF;
    END PROCESS;
    shiftedOut_uid101_alignedXFxP_uid34_block_rsrvd_fix_n(0) <= not (shiftedOut_uid101_alignedXFxP_uid34_block_rsrvd_fix_o(11));

    -- r_uid128_alignedXFxP_uid34_block_rsrvd_fix(MUX,127)@2
    r_uid128_alignedXFxP_uid34_block_rsrvd_fix_s <= shiftedOut_uid101_alignedXFxP_uid34_block_rsrvd_fix_n;
    r_uid128_alignedXFxP_uid34_block_rsrvd_fix: PROCESS (r_uid128_alignedXFxP_uid34_block_rsrvd_fix_s, leftShiftStage2_uid126_alignedXFxP_uid34_block_rsrvd_fix_q, leftShiftStage0Idx3_uid108_alignedXFxP_uid34_block_rsrvd_fix_q)
    BEGIN
        CASE (r_uid128_alignedXFxP_uid34_block_rsrvd_fix_s) IS
            WHEN "0" => r_uid128_alignedXFxP_uid34_block_rsrvd_fix_q <= leftShiftStage2_uid126_alignedXFxP_uid34_block_rsrvd_fix_q;
            WHEN "1" => r_uid128_alignedXFxP_uid34_block_rsrvd_fix_q <= leftShiftStage0Idx3_uid108_alignedXFxP_uid34_block_rsrvd_fix_q;
            WHEN OTHERS => r_uid128_alignedXFxP_uid34_block_rsrvd_fix_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- fracXPosFxP_uid35_block_rsrvd_fix(BITSELECT,34)@2
    fracXPosFxP_uid35_block_rsrvd_fix_in <= r_uid128_alignedXFxP_uid34_block_rsrvd_fix_q(22 downto 0);
    fracXPosFxP_uid35_block_rsrvd_fix_b <= fracXPosFxP_uid35_block_rsrvd_fix_in(22 downto 0);

    -- redist12(DELAY,178)
    redist12 : dspba_delay
    GENERIC MAP ( width => 23, depth => 1 )
    PORT MAP ( xin => fracXPosFxP_uid35_block_rsrvd_fix_b, xout => redist12_q, clk => clk, aclr => areset );

    -- rVStage_uid69_zeroCount_uid36_block_rsrvd_fix(BITSELECT,68)@3
    rVStage_uid69_zeroCount_uid36_block_rsrvd_fix_in <= redist12_q;
    rVStage_uid69_zeroCount_uid36_block_rsrvd_fix_b <= rVStage_uid69_zeroCount_uid36_block_rsrvd_fix_in(22 downto 7);

    -- vCount_uid70_zeroCount_uid36_block_rsrvd_fix(LOGICAL,69)@3
    vCount_uid70_zeroCount_uid36_block_rsrvd_fix_a <= rVStage_uid69_zeroCount_uid36_block_rsrvd_fix_b;
    vCount_uid70_zeroCount_uid36_block_rsrvd_fix_b <= zs_uid68_zeroCount_uid36_block_rsrvd_fix_q;
    vCount_uid70_zeroCount_uid36_block_rsrvd_fix_q <= "1" WHEN vCount_uid70_zeroCount_uid36_block_rsrvd_fix_a = vCount_uid70_zeroCount_uid36_block_rsrvd_fix_b ELSE "0";

    -- redist9(DELAY,175)
    redist9 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2 )
    PORT MAP ( xin => vCount_uid70_zeroCount_uid36_block_rsrvd_fix_q, xout => redist9_q, clk => clk, aclr => areset );

    -- vStage_uid72_zeroCount_uid36_block_rsrvd_fix(BITSELECT,71)@3
    vStage_uid72_zeroCount_uid36_block_rsrvd_fix_in <= redist12_q(6 downto 0);
    vStage_uid72_zeroCount_uid36_block_rsrvd_fix_b <= vStage_uid72_zeroCount_uid36_block_rsrvd_fix_in(6 downto 0);

    -- mO_uid71_zeroCount_uid36_block_rsrvd_fix(CONSTANT,70)
    mO_uid71_zeroCount_uid36_block_rsrvd_fix_q <= "111111111";

    -- cStage_uid73_zeroCount_uid36_block_rsrvd_fix(BITJOIN,72)@3
    cStage_uid73_zeroCount_uid36_block_rsrvd_fix_q <= vStage_uid72_zeroCount_uid36_block_rsrvd_fix_b & mO_uid71_zeroCount_uid36_block_rsrvd_fix_q;

    -- vStagei_uid75_zeroCount_uid36_block_rsrvd_fix(MUX,74)@3
    vStagei_uid75_zeroCount_uid36_block_rsrvd_fix_s <= vCount_uid70_zeroCount_uid36_block_rsrvd_fix_q;
    vStagei_uid75_zeroCount_uid36_block_rsrvd_fix: PROCESS (vStagei_uid75_zeroCount_uid36_block_rsrvd_fix_s, rVStage_uid69_zeroCount_uid36_block_rsrvd_fix_b, cStage_uid73_zeroCount_uid36_block_rsrvd_fix_q)
    BEGIN
        CASE (vStagei_uid75_zeroCount_uid36_block_rsrvd_fix_s) IS
            WHEN "0" => vStagei_uid75_zeroCount_uid36_block_rsrvd_fix_q <= rVStage_uid69_zeroCount_uid36_block_rsrvd_fix_b;
            WHEN "1" => vStagei_uid75_zeroCount_uid36_block_rsrvd_fix_q <= cStage_uid73_zeroCount_uid36_block_rsrvd_fix_q;
            WHEN OTHERS => vStagei_uid75_zeroCount_uid36_block_rsrvd_fix_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid77_zeroCount_uid36_block_rsrvd_fix(BITSELECT,76)@3
    rVStage_uid77_zeroCount_uid36_block_rsrvd_fix_in <= vStagei_uid75_zeroCount_uid36_block_rsrvd_fix_q;
    rVStage_uid77_zeroCount_uid36_block_rsrvd_fix_b <= rVStage_uid77_zeroCount_uid36_block_rsrvd_fix_in(15 downto 8);

    -- redist7(DELAY,173)
    redist7 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1 )
    PORT MAP ( xin => rVStage_uid77_zeroCount_uid36_block_rsrvd_fix_b, xout => redist7_q, clk => clk, aclr => areset );

    -- vCount_uid78_zeroCount_uid36_block_rsrvd_fix(LOGICAL,77)@4
    vCount_uid78_zeroCount_uid36_block_rsrvd_fix_a <= redist7_q;
    vCount_uid78_zeroCount_uid36_block_rsrvd_fix_b <= cstAllZWE_uid11_block_rsrvd_fix_q;
    vCount_uid78_zeroCount_uid36_block_rsrvd_fix_q <= "1" WHEN vCount_uid78_zeroCount_uid36_block_rsrvd_fix_a = vCount_uid78_zeroCount_uid36_block_rsrvd_fix_b ELSE "0";

    -- redist6(DELAY,172)
    redist6 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => vCount_uid78_zeroCount_uid36_block_rsrvd_fix_q, xout => redist6_q, clk => clk, aclr => areset );

    -- vStage_uid79_zeroCount_uid36_block_rsrvd_fix(BITSELECT,78)@3
    vStage_uid79_zeroCount_uid36_block_rsrvd_fix_in <= vStagei_uid75_zeroCount_uid36_block_rsrvd_fix_q(7 downto 0);
    vStage_uid79_zeroCount_uid36_block_rsrvd_fix_b <= vStage_uid79_zeroCount_uid36_block_rsrvd_fix_in(7 downto 0);

    -- redist5(DELAY,171)
    redist5 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1 )
    PORT MAP ( xin => vStage_uid79_zeroCount_uid36_block_rsrvd_fix_b, xout => redist5_q, clk => clk, aclr => areset );

    -- vStagei_uid81_zeroCount_uid36_block_rsrvd_fix(MUX,80)@4
    vStagei_uid81_zeroCount_uid36_block_rsrvd_fix_s <= vCount_uid78_zeroCount_uid36_block_rsrvd_fix_q;
    vStagei_uid81_zeroCount_uid36_block_rsrvd_fix: PROCESS (vStagei_uid81_zeroCount_uid36_block_rsrvd_fix_s, redist7_q, redist5_q)
    BEGIN
        CASE (vStagei_uid81_zeroCount_uid36_block_rsrvd_fix_s) IS
            WHEN "0" => vStagei_uid81_zeroCount_uid36_block_rsrvd_fix_q <= redist7_q;
            WHEN "1" => vStagei_uid81_zeroCount_uid36_block_rsrvd_fix_q <= redist5_q;
            WHEN OTHERS => vStagei_uid81_zeroCount_uid36_block_rsrvd_fix_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid83_zeroCount_uid36_block_rsrvd_fix(BITSELECT,82)@4
    rVStage_uid83_zeroCount_uid36_block_rsrvd_fix_in <= vStagei_uid81_zeroCount_uid36_block_rsrvd_fix_q;
    rVStage_uid83_zeroCount_uid36_block_rsrvd_fix_b <= rVStage_uid83_zeroCount_uid36_block_rsrvd_fix_in(7 downto 4);

    -- vCount_uid84_zeroCount_uid36_block_rsrvd_fix(LOGICAL,83)@4
    vCount_uid84_zeroCount_uid36_block_rsrvd_fix_a <= rVStage_uid83_zeroCount_uid36_block_rsrvd_fix_b;
    vCount_uid84_zeroCount_uid36_block_rsrvd_fix_b <= zs_uid82_zeroCount_uid36_block_rsrvd_fix_q;
    vCount_uid84_zeroCount_uid36_block_rsrvd_fix_q_i <= "1" WHEN vCount_uid84_zeroCount_uid36_block_rsrvd_fix_a = vCount_uid84_zeroCount_uid36_block_rsrvd_fix_b ELSE "0";
    vCount_uid84_zeroCount_uid36_block_rsrvd_fix_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => vCount_uid84_zeroCount_uid36_block_rsrvd_fix_q_i, xout => vCount_uid84_zeroCount_uid36_block_rsrvd_fix_q, clk => clk, aclr => areset );

    -- vStage_uid85_zeroCount_uid36_block_rsrvd_fix(BITSELECT,84)@4
    vStage_uid85_zeroCount_uid36_block_rsrvd_fix_in <= vStagei_uid81_zeroCount_uid36_block_rsrvd_fix_q(3 downto 0);
    vStage_uid85_zeroCount_uid36_block_rsrvd_fix_b <= vStage_uid85_zeroCount_uid36_block_rsrvd_fix_in(3 downto 0);

    -- redist3(DELAY,169)
    redist3 : dspba_delay
    GENERIC MAP ( width => 4, depth => 1 )
    PORT MAP ( xin => vStage_uid85_zeroCount_uid36_block_rsrvd_fix_b, xout => redist3_q, clk => clk, aclr => areset );

    -- redist4(DELAY,170)
    redist4 : dspba_delay
    GENERIC MAP ( width => 4, depth => 1 )
    PORT MAP ( xin => rVStage_uid83_zeroCount_uid36_block_rsrvd_fix_b, xout => redist4_q, clk => clk, aclr => areset );

    -- vStagei_uid87_zeroCount_uid36_block_rsrvd_fix(MUX,86)@5
    vStagei_uid87_zeroCount_uid36_block_rsrvd_fix_s <= vCount_uid84_zeroCount_uid36_block_rsrvd_fix_q;
    vStagei_uid87_zeroCount_uid36_block_rsrvd_fix: PROCESS (vStagei_uid87_zeroCount_uid36_block_rsrvd_fix_s, redist4_q, redist3_q)
    BEGIN
        CASE (vStagei_uid87_zeroCount_uid36_block_rsrvd_fix_s) IS
            WHEN "0" => vStagei_uid87_zeroCount_uid36_block_rsrvd_fix_q <= redist4_q;
            WHEN "1" => vStagei_uid87_zeroCount_uid36_block_rsrvd_fix_q <= redist3_q;
            WHEN OTHERS => vStagei_uid87_zeroCount_uid36_block_rsrvd_fix_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid89_zeroCount_uid36_block_rsrvd_fix(BITSELECT,88)@5
    rVStage_uid89_zeroCount_uid36_block_rsrvd_fix_in <= vStagei_uid87_zeroCount_uid36_block_rsrvd_fix_q;
    rVStage_uid89_zeroCount_uid36_block_rsrvd_fix_b <= rVStage_uid89_zeroCount_uid36_block_rsrvd_fix_in(3 downto 2);

    -- vCount_uid90_zeroCount_uid36_block_rsrvd_fix(LOGICAL,89)@5
    vCount_uid90_zeroCount_uid36_block_rsrvd_fix_a <= rVStage_uid89_zeroCount_uid36_block_rsrvd_fix_b;
    vCount_uid90_zeroCount_uid36_block_rsrvd_fix_b <= zs_uid88_zeroCount_uid36_block_rsrvd_fix_q;
    vCount_uid90_zeroCount_uid36_block_rsrvd_fix_q <= "1" WHEN vCount_uid90_zeroCount_uid36_block_rsrvd_fix_a = vCount_uid90_zeroCount_uid36_block_rsrvd_fix_b ELSE "0";

    -- vStage_uid91_zeroCount_uid36_block_rsrvd_fix(BITSELECT,90)@5
    vStage_uid91_zeroCount_uid36_block_rsrvd_fix_in <= vStagei_uid87_zeroCount_uid36_block_rsrvd_fix_q(1 downto 0);
    vStage_uid91_zeroCount_uid36_block_rsrvd_fix_b <= vStage_uid91_zeroCount_uid36_block_rsrvd_fix_in(1 downto 0);

    -- vStagei_uid93_zeroCount_uid36_block_rsrvd_fix(MUX,92)@5
    vStagei_uid93_zeroCount_uid36_block_rsrvd_fix_s <= vCount_uid90_zeroCount_uid36_block_rsrvd_fix_q;
    vStagei_uid93_zeroCount_uid36_block_rsrvd_fix: PROCESS (vStagei_uid93_zeroCount_uid36_block_rsrvd_fix_s, rVStage_uid89_zeroCount_uid36_block_rsrvd_fix_b, vStage_uid91_zeroCount_uid36_block_rsrvd_fix_b)
    BEGIN
        CASE (vStagei_uid93_zeroCount_uid36_block_rsrvd_fix_s) IS
            WHEN "0" => vStagei_uid93_zeroCount_uid36_block_rsrvd_fix_q <= rVStage_uid89_zeroCount_uid36_block_rsrvd_fix_b;
            WHEN "1" => vStagei_uid93_zeroCount_uid36_block_rsrvd_fix_q <= vStage_uid91_zeroCount_uid36_block_rsrvd_fix_b;
            WHEN OTHERS => vStagei_uid93_zeroCount_uid36_block_rsrvd_fix_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid95_zeroCount_uid36_block_rsrvd_fix(BITSELECT,94)@5
    rVStage_uid95_zeroCount_uid36_block_rsrvd_fix_in <= vStagei_uid93_zeroCount_uid36_block_rsrvd_fix_q;
    rVStage_uid95_zeroCount_uid36_block_rsrvd_fix_b <= rVStage_uid95_zeroCount_uid36_block_rsrvd_fix_in(1 downto 1);

    -- vCount_uid96_zeroCount_uid36_block_rsrvd_fix(LOGICAL,95)@5
    vCount_uid96_zeroCount_uid36_block_rsrvd_fix_a <= rVStage_uid95_zeroCount_uid36_block_rsrvd_fix_b;
    vCount_uid96_zeroCount_uid36_block_rsrvd_fix_b <= GND_q;
    vCount_uid96_zeroCount_uid36_block_rsrvd_fix_q <= "1" WHEN vCount_uid96_zeroCount_uid36_block_rsrvd_fix_a = vCount_uid96_zeroCount_uid36_block_rsrvd_fix_b ELSE "0";

    -- r_uid97_zeroCount_uid36_block_rsrvd_fix(BITJOIN,96)@5
    r_uid97_zeroCount_uid36_block_rsrvd_fix_q <= redist9_q & redist6_q & vCount_uid84_zeroCount_uid36_block_rsrvd_fix_q & vCount_uid90_zeroCount_uid36_block_rsrvd_fix_q & vCount_uid96_zeroCount_uid36_block_rsrvd_fix_q;

    -- redist2(DELAY,168)
    redist2 : dspba_delay
    GENERIC MAP ( width => 5, depth => 1 )
    PORT MAP ( xin => r_uid97_zeroCount_uid36_block_rsrvd_fix_q, xout => redist2_q, clk => clk, aclr => areset );

    -- cstBiasM1_uid28_block_rsrvd_fix(CONSTANT,27)
    cstBiasM1_uid28_block_rsrvd_fix_q <= "01111110";

    -- finalExpExt_uid41_block_rsrvd_fix(SUB,40)@6
    finalExpExt_uid41_block_rsrvd_fix_a <= STD_LOGIC_VECTOR("0" & cstBiasM1_uid28_block_rsrvd_fix_q);
    finalExpExt_uid41_block_rsrvd_fix_b <= STD_LOGIC_VECTOR("0000" & redist2_q);
    finalExpExt_uid41_block_rsrvd_fix_o <= STD_LOGIC_VECTOR(UNSIGNED(finalExpExt_uid41_block_rsrvd_fix_a) - UNSIGNED(finalExpExt_uid41_block_rsrvd_fix_b));
    finalExpExt_uid41_block_rsrvd_fix_q <= finalExpExt_uid41_block_rsrvd_fix_o(8 downto 0);

    -- finalExp_uid42_block_rsrvd_fix(BITSELECT,41)@6
    finalExp_uid42_block_rsrvd_fix_in <= finalExpExt_uid41_block_rsrvd_fix_q(7 downto 0);
    finalExp_uid42_block_rsrvd_fix_b <= finalExp_uid42_block_rsrvd_fix_in(7 downto 0);

    -- redist10(DELAY,176)
    redist10 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1 )
    PORT MAP ( xin => finalExp_uid42_block_rsrvd_fix_b, xout => redist10_q, clk => clk, aclr => areset );

    -- LeftShiftStage121dto0_uid152_alignedFracFinal_uid38_block_rsrvd_fix(BITSELECT,151)@6
    LeftShiftStage121dto0_uid152_alignedFracFinal_uid38_block_rsrvd_fix_in <= leftShiftStage1_uid150_alignedFracFinal_uid38_block_rsrvd_fix_q(21 downto 0);
    LeftShiftStage121dto0_uid152_alignedFracFinal_uid38_block_rsrvd_fix_b <= LeftShiftStage121dto0_uid152_alignedFracFinal_uid38_block_rsrvd_fix_in(21 downto 0);

    -- leftShiftStage2Idx1_uid153_alignedFracFinal_uid38_block_rsrvd_fix(BITJOIN,152)@6
    leftShiftStage2Idx1_uid153_alignedFracFinal_uid38_block_rsrvd_fix_q <= LeftShiftStage121dto0_uid152_alignedFracFinal_uid38_block_rsrvd_fix_b & GND_q;

    -- LeftShiftStage016dto0_uid147_alignedFracFinal_uid38_block_rsrvd_fix(BITSELECT,146)@6
    LeftShiftStage016dto0_uid147_alignedFracFinal_uid38_block_rsrvd_fix_in <= leftShiftStage0_uid139_alignedFracFinal_uid38_block_rsrvd_fix_q(16 downto 0);
    LeftShiftStage016dto0_uid147_alignedFracFinal_uid38_block_rsrvd_fix_b <= LeftShiftStage016dto0_uid147_alignedFracFinal_uid38_block_rsrvd_fix_in(16 downto 0);

    -- leftShiftStage1Idx3_uid148_alignedFracFinal_uid38_block_rsrvd_fix(BITJOIN,147)@6
    leftShiftStage1Idx3_uid148_alignedFracFinal_uid38_block_rsrvd_fix_q <= LeftShiftStage016dto0_uid147_alignedFracFinal_uid38_block_rsrvd_fix_b & leftShiftStage1Idx3Pad6_uid117_alignedXFxP_uid34_block_rsrvd_fix_q;

    -- LeftShiftStage018dto0_uid144_alignedFracFinal_uid38_block_rsrvd_fix(BITSELECT,143)@6
    LeftShiftStage018dto0_uid144_alignedFracFinal_uid38_block_rsrvd_fix_in <= leftShiftStage0_uid139_alignedFracFinal_uid38_block_rsrvd_fix_q(18 downto 0);
    LeftShiftStage018dto0_uid144_alignedFracFinal_uid38_block_rsrvd_fix_b <= LeftShiftStage018dto0_uid144_alignedFracFinal_uid38_block_rsrvd_fix_in(18 downto 0);

    -- leftShiftStage1Idx2_uid145_alignedFracFinal_uid38_block_rsrvd_fix(BITJOIN,144)@6
    leftShiftStage1Idx2_uid145_alignedFracFinal_uid38_block_rsrvd_fix_q <= LeftShiftStage018dto0_uid144_alignedFracFinal_uid38_block_rsrvd_fix_b & zs_uid82_zeroCount_uid36_block_rsrvd_fix_q;

    -- LeftShiftStage020dto0_uid141_alignedFracFinal_uid38_block_rsrvd_fix(BITSELECT,140)@6
    LeftShiftStage020dto0_uid141_alignedFracFinal_uid38_block_rsrvd_fix_in <= leftShiftStage0_uid139_alignedFracFinal_uid38_block_rsrvd_fix_q(20 downto 0);
    LeftShiftStage020dto0_uid141_alignedFracFinal_uid38_block_rsrvd_fix_b <= LeftShiftStage020dto0_uid141_alignedFracFinal_uid38_block_rsrvd_fix_in(20 downto 0);

    -- leftShiftStage1Idx1_uid142_alignedFracFinal_uid38_block_rsrvd_fix(BITJOIN,141)@6
    leftShiftStage1Idx1_uid142_alignedFracFinal_uid38_block_rsrvd_fix_q <= LeftShiftStage020dto0_uid141_alignedFracFinal_uid38_block_rsrvd_fix_b & zs_uid88_zeroCount_uid36_block_rsrvd_fix_q;

    -- zeroFracRPostExc_uid59_block_rsrvd_fix(CONSTANT,58)
    zeroFracRPostExc_uid59_block_rsrvd_fix_q <= "00000000000000000000000";

    -- redist8(DELAY,174)
    redist8 : dspba_delay
    GENERIC MAP ( width => 7, depth => 3 )
    PORT MAP ( xin => vStage_uid72_zeroCount_uid36_block_rsrvd_fix_b, xout => redist8_q, clk => clk, aclr => areset );

    -- leftShiftStage0Idx2_uid136_alignedFracFinal_uid38_block_rsrvd_fix(BITJOIN,135)@6
    leftShiftStage0Idx2_uid136_alignedFracFinal_uid38_block_rsrvd_fix_q <= redist8_q & zs_uid68_zeroCount_uid36_block_rsrvd_fix_q;

    -- X14dto0_uid132_alignedFracFinal_uid38_block_rsrvd_fix(BITSELECT,131)@6
    X14dto0_uid132_alignedFracFinal_uid38_block_rsrvd_fix_in <= redist13_outputreg_q(14 downto 0);
    X14dto0_uid132_alignedFracFinal_uid38_block_rsrvd_fix_b <= X14dto0_uid132_alignedFracFinal_uid38_block_rsrvd_fix_in(14 downto 0);

    -- leftShiftStage0Idx1_uid133_alignedFracFinal_uid38_block_rsrvd_fix(BITJOIN,132)@6
    leftShiftStage0Idx1_uid133_alignedFracFinal_uid38_block_rsrvd_fix_q <= X14dto0_uid132_alignedFracFinal_uid38_block_rsrvd_fix_b & cstAllZWE_uid11_block_rsrvd_fix_q;

    -- redist13_inputreg(DELAY,191)
    redist13_inputreg : dspba_delay
    GENERIC MAP ( width => 23, depth => 1 )
    PORT MAP ( xin => redist12_q, xout => redist13_inputreg_q, clk => clk, aclr => areset );

    -- redist13(DELAY,179)
    redist13 : dspba_delay
    GENERIC MAP ( width => 23, depth => 1 )
    PORT MAP ( xin => redist13_inputreg_q, xout => redist13_q, clk => clk, aclr => areset );

    -- redist13_outputreg(DELAY,192)
    redist13_outputreg : dspba_delay
    GENERIC MAP ( width => 23, depth => 1 )
    PORT MAP ( xin => redist13_q, xout => redist13_outputreg_q, clk => clk, aclr => areset );

    -- leftShiftStageSel4Dto3_uid138_alignedFracFinal_uid38_block_rsrvd_fix(BITSELECT,137)@6
    leftShiftStageSel4Dto3_uid138_alignedFracFinal_uid38_block_rsrvd_fix_in <= redist2_q;
    leftShiftStageSel4Dto3_uid138_alignedFracFinal_uid38_block_rsrvd_fix_b <= leftShiftStageSel4Dto3_uid138_alignedFracFinal_uid38_block_rsrvd_fix_in(4 downto 3);

    -- leftShiftStage0_uid139_alignedFracFinal_uid38_block_rsrvd_fix(MUX,138)@6
    leftShiftStage0_uid139_alignedFracFinal_uid38_block_rsrvd_fix_s <= leftShiftStageSel4Dto3_uid138_alignedFracFinal_uid38_block_rsrvd_fix_b;
    leftShiftStage0_uid139_alignedFracFinal_uid38_block_rsrvd_fix: PROCESS (leftShiftStage0_uid139_alignedFracFinal_uid38_block_rsrvd_fix_s, redist13_outputreg_q, leftShiftStage0Idx1_uid133_alignedFracFinal_uid38_block_rsrvd_fix_q, leftShiftStage0Idx2_uid136_alignedFracFinal_uid38_block_rsrvd_fix_q, zeroFracRPostExc_uid59_block_rsrvd_fix_q)
    BEGIN
        CASE (leftShiftStage0_uid139_alignedFracFinal_uid38_block_rsrvd_fix_s) IS
            WHEN "00" => leftShiftStage0_uid139_alignedFracFinal_uid38_block_rsrvd_fix_q <= redist13_outputreg_q;
            WHEN "01" => leftShiftStage0_uid139_alignedFracFinal_uid38_block_rsrvd_fix_q <= leftShiftStage0Idx1_uid133_alignedFracFinal_uid38_block_rsrvd_fix_q;
            WHEN "10" => leftShiftStage0_uid139_alignedFracFinal_uid38_block_rsrvd_fix_q <= leftShiftStage0Idx2_uid136_alignedFracFinal_uid38_block_rsrvd_fix_q;
            WHEN "11" => leftShiftStage0_uid139_alignedFracFinal_uid38_block_rsrvd_fix_q <= zeroFracRPostExc_uid59_block_rsrvd_fix_q;
            WHEN OTHERS => leftShiftStage0_uid139_alignedFracFinal_uid38_block_rsrvd_fix_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- leftShiftStageSel2Dto1_uid149_alignedFracFinal_uid38_block_rsrvd_fix(BITSELECT,148)@6
    leftShiftStageSel2Dto1_uid149_alignedFracFinal_uid38_block_rsrvd_fix_in <= redist2_q(2 downto 0);
    leftShiftStageSel2Dto1_uid149_alignedFracFinal_uid38_block_rsrvd_fix_b <= leftShiftStageSel2Dto1_uid149_alignedFracFinal_uid38_block_rsrvd_fix_in(2 downto 1);

    -- leftShiftStage1_uid150_alignedFracFinal_uid38_block_rsrvd_fix(MUX,149)@6
    leftShiftStage1_uid150_alignedFracFinal_uid38_block_rsrvd_fix_s <= leftShiftStageSel2Dto1_uid149_alignedFracFinal_uid38_block_rsrvd_fix_b;
    leftShiftStage1_uid150_alignedFracFinal_uid38_block_rsrvd_fix: PROCESS (leftShiftStage1_uid150_alignedFracFinal_uid38_block_rsrvd_fix_s, leftShiftStage0_uid139_alignedFracFinal_uid38_block_rsrvd_fix_q, leftShiftStage1Idx1_uid142_alignedFracFinal_uid38_block_rsrvd_fix_q, leftShiftStage1Idx2_uid145_alignedFracFinal_uid38_block_rsrvd_fix_q, leftShiftStage1Idx3_uid148_alignedFracFinal_uid38_block_rsrvd_fix_q)
    BEGIN
        CASE (leftShiftStage1_uid150_alignedFracFinal_uid38_block_rsrvd_fix_s) IS
            WHEN "00" => leftShiftStage1_uid150_alignedFracFinal_uid38_block_rsrvd_fix_q <= leftShiftStage0_uid139_alignedFracFinal_uid38_block_rsrvd_fix_q;
            WHEN "01" => leftShiftStage1_uid150_alignedFracFinal_uid38_block_rsrvd_fix_q <= leftShiftStage1Idx1_uid142_alignedFracFinal_uid38_block_rsrvd_fix_q;
            WHEN "10" => leftShiftStage1_uid150_alignedFracFinal_uid38_block_rsrvd_fix_q <= leftShiftStage1Idx2_uid145_alignedFracFinal_uid38_block_rsrvd_fix_q;
            WHEN "11" => leftShiftStage1_uid150_alignedFracFinal_uid38_block_rsrvd_fix_q <= leftShiftStage1Idx3_uid148_alignedFracFinal_uid38_block_rsrvd_fix_q;
            WHEN OTHERS => leftShiftStage1_uid150_alignedFracFinal_uid38_block_rsrvd_fix_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- leftShiftStageSel0Dto0_uid154_alignedFracFinal_uid38_block_rsrvd_fix(BITSELECT,153)@6
    leftShiftStageSel0Dto0_uid154_alignedFracFinal_uid38_block_rsrvd_fix_in <= redist2_q(0 downto 0);
    leftShiftStageSel0Dto0_uid154_alignedFracFinal_uid38_block_rsrvd_fix_b <= leftShiftStageSel0Dto0_uid154_alignedFracFinal_uid38_block_rsrvd_fix_in(0 downto 0);

    -- leftShiftStage2_uid155_alignedFracFinal_uid38_block_rsrvd_fix(MUX,154)@6
    leftShiftStage2_uid155_alignedFracFinal_uid38_block_rsrvd_fix_s <= leftShiftStageSel0Dto0_uid154_alignedFracFinal_uid38_block_rsrvd_fix_b;
    leftShiftStage2_uid155_alignedFracFinal_uid38_block_rsrvd_fix: PROCESS (leftShiftStage2_uid155_alignedFracFinal_uid38_block_rsrvd_fix_s, leftShiftStage1_uid150_alignedFracFinal_uid38_block_rsrvd_fix_q, leftShiftStage2Idx1_uid153_alignedFracFinal_uid38_block_rsrvd_fix_q)
    BEGIN
        CASE (leftShiftStage2_uid155_alignedFracFinal_uid38_block_rsrvd_fix_s) IS
            WHEN "0" => leftShiftStage2_uid155_alignedFracFinal_uid38_block_rsrvd_fix_q <= leftShiftStage1_uid150_alignedFracFinal_uid38_block_rsrvd_fix_q;
            WHEN "1" => leftShiftStage2_uid155_alignedFracFinal_uid38_block_rsrvd_fix_q <= leftShiftStage2Idx1_uid153_alignedFracFinal_uid38_block_rsrvd_fix_q;
            WHEN OTHERS => leftShiftStage2_uid155_alignedFracFinal_uid38_block_rsrvd_fix_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- alignedFracFinalU_uid39_block_rsrvd_fix(BITSELECT,38)@6
    alignedFracFinalU_uid39_block_rsrvd_fix_in <= leftShiftStage2_uid155_alignedFracFinal_uid38_block_rsrvd_fix_q(21 downto 0);
    alignedFracFinalU_uid39_block_rsrvd_fix_b <= alignedFracFinalU_uid39_block_rsrvd_fix_in(21 downto 0);

    -- redist11(DELAY,177)
    redist11 : dspba_delay
    GENERIC MAP ( width => 22, depth => 1 )
    PORT MAP ( xin => alignedFracFinalU_uid39_block_rsrvd_fix_b, xout => redist11_q, clk => clk, aclr => areset );

    -- finalFrac_uid40_block_rsrvd_fix(BITJOIN,39)@7
    finalFrac_uid40_block_rsrvd_fix_q <= redist11_q & GND_q;

    -- finalValFP_uid45_block_rsrvd_fix(BITJOIN,44)@7
    finalValFP_uid45_block_rsrvd_fix_q <= negAndNotNaN_uid44_block_rsrvd_fix_q & redist10_q & finalFrac_uid40_block_rsrvd_fix_q;

    -- resIsX_uid31_block_rsrvd_fix(COMPARE,30)@0
    resIsX_uid31_block_rsrvd_fix_cin <= GND_q;
    resIsX_uid31_block_rsrvd_fix_a <= STD_LOGIC_VECTOR("00" & cstBiasM1_uid28_block_rsrvd_fix_q) & '0';
    resIsX_uid31_block_rsrvd_fix_b <= STD_LOGIC_VECTOR("00" & expX_uid6_block_rsrvd_fix_b) & resIsX_uid31_block_rsrvd_fix_cin(0);
    resIsX_uid31_block_rsrvd_fix: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            resIsX_uid31_block_rsrvd_fix_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            resIsX_uid31_block_rsrvd_fix_o <= STD_LOGIC_VECTOR(UNSIGNED(resIsX_uid31_block_rsrvd_fix_a) - UNSIGNED(resIsX_uid31_block_rsrvd_fix_b));
        END IF;
    END PROCESS;
    resIsX_uid31_block_rsrvd_fix_n(0) <= not (resIsX_uid31_block_rsrvd_fix_o(10));

    -- redist14(DELAY,180)
    redist14 : dspba_delay
    GENERIC MAP ( width => 1, depth => 5 )
    PORT MAP ( xin => resIsX_uid31_block_rsrvd_fix_n, xout => redist14_q, clk => clk, aclr => areset );

    -- redist15(DELAY,181)
    redist15 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => redist14_q, xout => redist15_q, clk => clk, aclr => areset );

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- muxFPPreExc_uid47_block_rsrvd_fix(MUX,46)@7
    muxFPPreExc_uid47_block_rsrvd_fix_s <= redist15_q;
    muxFPPreExc_uid47_block_rsrvd_fix: PROCESS (muxFPPreExc_uid47_block_rsrvd_fix_s, finalValFP_uid45_block_rsrvd_fix_q, redist24_q)
    BEGIN
        CASE (muxFPPreExc_uid47_block_rsrvd_fix_s) IS
            WHEN "0" => muxFPPreExc_uid47_block_rsrvd_fix_q <= finalValFP_uid45_block_rsrvd_fix_q;
            WHEN "1" => muxFPPreExc_uid47_block_rsrvd_fix_q <= redist24_q;
            WHEN OTHERS => muxFPPreExc_uid47_block_rsrvd_fix_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- muxFPPreExcSign_uid48_block_rsrvd_fix(BITSELECT,47)@7
    muxFPPreExcSign_uid48_block_rsrvd_fix_in <= STD_LOGIC_VECTOR(muxFPPreExc_uid47_block_rsrvd_fix_q);
    muxFPPreExcSign_uid48_block_rsrvd_fix_b <= muxFPPreExcSign_uid48_block_rsrvd_fix_in(31 downto 31);

    -- muxFPPreExcExp_uid49_block_rsrvd_fix(BITSELECT,48)@7
    muxFPPreExcExp_uid49_block_rsrvd_fix_in <= muxFPPreExc_uid47_block_rsrvd_fix_q(30 downto 0);
    muxFPPreExcExp_uid49_block_rsrvd_fix_b <= muxFPPreExcExp_uid49_block_rsrvd_fix_in(30 downto 23);

    -- redist18(DELAY,184)
    redist18 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => redist17_q, xout => redist18_q, clk => clk, aclr => areset );

    -- cstWF_uid29_block_rsrvd_fix(CONSTANT,28)
    cstWF_uid29_block_rsrvd_fix_q <= "10111";

    -- fracIsZero_uid37_block_rsrvd_fix(LOGICAL,36)@6
    fracIsZero_uid37_block_rsrvd_fix_a <= redist2_q;
    fracIsZero_uid37_block_rsrvd_fix_b <= cstWF_uid29_block_rsrvd_fix_q;
    fracIsZero_uid37_block_rsrvd_fix_q <= "1" WHEN fracIsZero_uid37_block_rsrvd_fix_a = fracIsZero_uid37_block_rsrvd_fix_b ELSE "0";

    -- InvResIsX_uid51_block_rsrvd_fix(LOGICAL,50)@6
    InvResIsX_uid51_block_rsrvd_fix_a <= redist14_q;
    InvResIsX_uid51_block_rsrvd_fix_q <= not (InvResIsX_uid51_block_rsrvd_fix_a);

    -- cstBiasPwF_uid27_block_rsrvd_fix(CONSTANT,26)
    cstBiasPwF_uid27_block_rsrvd_fix_q <= "10010110";

    -- resIsZero_uid30_block_rsrvd_fix(COMPARE,29)@0
    resIsZero_uid30_block_rsrvd_fix_cin <= GND_q;
    resIsZero_uid30_block_rsrvd_fix_a <= STD_LOGIC_VECTOR("00" & expX_uid6_block_rsrvd_fix_b) & '0';
    resIsZero_uid30_block_rsrvd_fix_b <= STD_LOGIC_VECTOR("00" & cstBiasPwF_uid27_block_rsrvd_fix_q) & resIsZero_uid30_block_rsrvd_fix_cin(0);
    resIsZero_uid30_block_rsrvd_fix: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            resIsZero_uid30_block_rsrvd_fix_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            resIsZero_uid30_block_rsrvd_fix_o <= STD_LOGIC_VECTOR(UNSIGNED(resIsZero_uid30_block_rsrvd_fix_a) - UNSIGNED(resIsZero_uid30_block_rsrvd_fix_b));
        END IF;
    END PROCESS;
    resIsZero_uid30_block_rsrvd_fix_n(0) <= not (resIsZero_uid30_block_rsrvd_fix_o(10));

    -- redist16(DELAY,182)
    redist16 : dspba_delay
    GENERIC MAP ( width => 1, depth => 5 )
    PORT MAP ( xin => resIsZero_uid30_block_rsrvd_fix_n, xout => redist16_q, clk => clk, aclr => areset );

    -- InvResIsZero_uid52_block_rsrvd_fix(LOGICAL,51)@6
    InvResIsZero_uid52_block_rsrvd_fix_a <= redist16_q;
    InvResIsZero_uid52_block_rsrvd_fix_q <= not (InvResIsZero_uid52_block_rsrvd_fix_a);

    -- InvExc_I_uid23_block_rsrvd_fix(LOGICAL,22)@6
    InvExc_I_uid23_block_rsrvd_fix_a <= redist19_q;
    InvExc_I_uid23_block_rsrvd_fix_q <= not (InvExc_I_uid23_block_rsrvd_fix_a);

    -- InvExpXIsZero_uid24_block_rsrvd_fix(LOGICAL,23)@6
    InvExpXIsZero_uid24_block_rsrvd_fix_a <= redist21_q;
    InvExpXIsZero_uid24_block_rsrvd_fix_q <= not (InvExpXIsZero_uid24_block_rsrvd_fix_a);

    -- exc_R_uid25_block_rsrvd_fix(LOGICAL,24)@6
    exc_R_uid25_block_rsrvd_fix_a <= InvExpXIsZero_uid24_block_rsrvd_fix_q;
    exc_R_uid25_block_rsrvd_fix_b <= InvExc_I_uid23_block_rsrvd_fix_q;
    exc_R_uid25_block_rsrvd_fix_c <= InvExc_N_uid22_block_rsrvd_fix_q;
    exc_R_uid25_block_rsrvd_fix_q <= exc_R_uid25_block_rsrvd_fix_a and exc_R_uid25_block_rsrvd_fix_b and exc_R_uid25_block_rsrvd_fix_c;

    -- xRegAndFracZero_uid53_block_rsrvd_fix(LOGICAL,52)@6
    xRegAndFracZero_uid53_block_rsrvd_fix_a <= exc_R_uid25_block_rsrvd_fix_q;
    xRegAndFracZero_uid53_block_rsrvd_fix_b <= InvResIsZero_uid52_block_rsrvd_fix_q;
    xRegAndFracZero_uid53_block_rsrvd_fix_c <= InvResIsX_uid51_block_rsrvd_fix_q;
    xRegAndFracZero_uid53_block_rsrvd_fix_d <= fracIsZero_uid37_block_rsrvd_fix_q;
    xRegAndFracZero_uid53_block_rsrvd_fix_q <= xRegAndFracZero_uid53_block_rsrvd_fix_a and xRegAndFracZero_uid53_block_rsrvd_fix_b and xRegAndFracZero_uid53_block_rsrvd_fix_c and xRegAndFracZero_uid53_block_rsrvd_fix_d;

    -- xRegAndInt_uid54_block_rsrvd_fix(LOGICAL,53)@6
    xRegAndInt_uid54_block_rsrvd_fix_a <= exc_R_uid25_block_rsrvd_fix_q;
    xRegAndInt_uid54_block_rsrvd_fix_b <= redist16_q;
    xRegAndInt_uid54_block_rsrvd_fix_q <= xRegAndInt_uid54_block_rsrvd_fix_a and xRegAndInt_uid54_block_rsrvd_fix_b;

    -- exc_I_uid19_block_rsrvd_fix(LOGICAL,18)@3
    exc_I_uid19_block_rsrvd_fix_a <= redist20_q;
    exc_I_uid19_block_rsrvd_fix_b <= fracXIsZero_uid18_block_rsrvd_fix_q;
    exc_I_uid19_block_rsrvd_fix_q_i <= exc_I_uid19_block_rsrvd_fix_a and exc_I_uid19_block_rsrvd_fix_b;
    exc_I_uid19_block_rsrvd_fix_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => exc_I_uid19_block_rsrvd_fix_q_i, xout => exc_I_uid19_block_rsrvd_fix_q, clk => clk, aclr => areset );

    -- redist19(DELAY,185)
    redist19 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2 )
    PORT MAP ( xin => exc_I_uid19_block_rsrvd_fix_q, xout => redist19_q, clk => clk, aclr => areset );

    -- expXIsZero_uid13_block_rsrvd_fix(LOGICAL,12)@0
    expXIsZero_uid13_block_rsrvd_fix_a <= expX_uid6_block_rsrvd_fix_b;
    expXIsZero_uid13_block_rsrvd_fix_b <= cstAllZWE_uid11_block_rsrvd_fix_q;
    expXIsZero_uid13_block_rsrvd_fix_q_i <= "1" WHEN expXIsZero_uid13_block_rsrvd_fix_a = expXIsZero_uid13_block_rsrvd_fix_b ELSE "0";
    expXIsZero_uid13_block_rsrvd_fix_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => expXIsZero_uid13_block_rsrvd_fix_q_i, xout => expXIsZero_uid13_block_rsrvd_fix_q, clk => clk, aclr => areset );

    -- redist21(DELAY,187)
    redist21 : dspba_delay
    GENERIC MAP ( width => 1, depth => 5 )
    PORT MAP ( xin => expXIsZero_uid13_block_rsrvd_fix_q, xout => redist21_q, clk => clk, aclr => areset );

    -- excRZero_uid55_block_rsrvd_fix(LOGICAL,54)@6
    excRZero_uid55_block_rsrvd_fix_a <= redist21_q;
    excRZero_uid55_block_rsrvd_fix_b <= redist19_q;
    excRZero_uid55_block_rsrvd_fix_c <= xRegAndInt_uid54_block_rsrvd_fix_q;
    excRZero_uid55_block_rsrvd_fix_d <= xRegAndFracZero_uid53_block_rsrvd_fix_q;
    excRZero_uid55_block_rsrvd_fix_q_i <= excRZero_uid55_block_rsrvd_fix_a or excRZero_uid55_block_rsrvd_fix_b or excRZero_uid55_block_rsrvd_fix_c or excRZero_uid55_block_rsrvd_fix_d;
    excRZero_uid55_block_rsrvd_fix_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => excRZero_uid55_block_rsrvd_fix_q_i, xout => excRZero_uid55_block_rsrvd_fix_q, clk => clk, aclr => areset );

    -- concExc_uid56_block_rsrvd_fix(BITJOIN,55)@7
    concExc_uid56_block_rsrvd_fix_q <= redist18_q & GND_q & excRZero_uid55_block_rsrvd_fix_q;

    -- excREnc_uid57_block_rsrvd_fix(LOOKUP,56)@7
    excREnc_uid57_block_rsrvd_fix: PROCESS (concExc_uid56_block_rsrvd_fix_q)
    BEGIN
        -- Begin reserved scope level
        CASE (concExc_uid56_block_rsrvd_fix_q) IS
            WHEN "000" => excREnc_uid57_block_rsrvd_fix_q <= "01";
            WHEN "001" => excREnc_uid57_block_rsrvd_fix_q <= "00";
            WHEN "010" => excREnc_uid57_block_rsrvd_fix_q <= "10";
            WHEN "011" => excREnc_uid57_block_rsrvd_fix_q <= "00";
            WHEN "100" => excREnc_uid57_block_rsrvd_fix_q <= "11";
            WHEN "101" => excREnc_uid57_block_rsrvd_fix_q <= "00";
            WHEN "110" => excREnc_uid57_block_rsrvd_fix_q <= "00";
            WHEN "111" => excREnc_uid57_block_rsrvd_fix_q <= "00";
            WHEN OTHERS => excREnc_uid57_block_rsrvd_fix_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- expRPostExc_uid65_block_rsrvd_fix(MUX,64)@7
    expRPostExc_uid65_block_rsrvd_fix_s <= excREnc_uid57_block_rsrvd_fix_q;
    expRPostExc_uid65_block_rsrvd_fix: PROCESS (expRPostExc_uid65_block_rsrvd_fix_s, cstAllZWE_uid11_block_rsrvd_fix_q, muxFPPreExcExp_uid49_block_rsrvd_fix_b, cstAllOWE_uid9_block_rsrvd_fix_q)
    BEGIN
        CASE (expRPostExc_uid65_block_rsrvd_fix_s) IS
            WHEN "00" => expRPostExc_uid65_block_rsrvd_fix_q <= cstAllZWE_uid11_block_rsrvd_fix_q;
            WHEN "01" => expRPostExc_uid65_block_rsrvd_fix_q <= muxFPPreExcExp_uid49_block_rsrvd_fix_b;
            WHEN "10" => expRPostExc_uid65_block_rsrvd_fix_q <= cstAllOWE_uid9_block_rsrvd_fix_q;
            WHEN "11" => expRPostExc_uid65_block_rsrvd_fix_q <= cstAllOWE_uid9_block_rsrvd_fix_q;
            WHEN OTHERS => expRPostExc_uid65_block_rsrvd_fix_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- muxFPPreExcFrac_uid50_block_rsrvd_fix(BITSELECT,49)@7
    muxFPPreExcFrac_uid50_block_rsrvd_fix_in <= muxFPPreExc_uid47_block_rsrvd_fix_q(22 downto 0);
    muxFPPreExcFrac_uid50_block_rsrvd_fix_b <= muxFPPreExcFrac_uid50_block_rsrvd_fix_in(22 downto 0);

    -- fracRPostExc_uid61_block_rsrvd_fix(MUX,60)@7
    fracRPostExc_uid61_block_rsrvd_fix_s <= excREnc_uid57_block_rsrvd_fix_q;
    fracRPostExc_uid61_block_rsrvd_fix: PROCESS (fracRPostExc_uid61_block_rsrvd_fix_s, zeroFracRPostExc_uid59_block_rsrvd_fix_q, muxFPPreExcFrac_uid50_block_rsrvd_fix_b, cstOneWF_uid10_block_rsrvd_fix_q)
    BEGIN
        CASE (fracRPostExc_uid61_block_rsrvd_fix_s) IS
            WHEN "00" => fracRPostExc_uid61_block_rsrvd_fix_q <= zeroFracRPostExc_uid59_block_rsrvd_fix_q;
            WHEN "01" => fracRPostExc_uid61_block_rsrvd_fix_q <= muxFPPreExcFrac_uid50_block_rsrvd_fix_b;
            WHEN "10" => fracRPostExc_uid61_block_rsrvd_fix_q <= zeroFracRPostExc_uid59_block_rsrvd_fix_q;
            WHEN "11" => fracRPostExc_uid61_block_rsrvd_fix_q <= cstOneWF_uid10_block_rsrvd_fix_q;
            WHEN OTHERS => fracRPostExc_uid61_block_rsrvd_fix_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- RFrac_uid66_block_rsrvd_fix(BITJOIN,65)@7
    RFrac_uid66_block_rsrvd_fix_q <= muxFPPreExcSign_uid48_block_rsrvd_fix_b & expRPostExc_uid65_block_rsrvd_fix_q & fracRPostExc_uid61_block_rsrvd_fix_q;

    -- out_primWireOut(GPOUT,4)@7
    out_primWireOut <= RFrac_uid66_block_rsrvd_fix_q;

END normal;
