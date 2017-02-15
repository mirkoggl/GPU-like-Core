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

-- VHDL created from floatComponent_fp_min_dut_prim_minBlock_typeSFloat_23_8_typeSFloat_23_8_typeSFloA0Z4ge26154ge2a150m4e5u
-- VHDL created on Mon Apr 20 13:10:41 2015


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

USE work.fp_min_dut_safe_path.all;
entity floatComponent_fp_min_dut_prim_minBlock_typeSFloat_23_8_typeSFloat_23_8_typeSFloA0Z4ge26154ge2a150m4e5u is
    port (
        in_0 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_1 : in std_logic_vector(31 downto 0);  -- float32_m23
        out_primWireOut : out std_logic_vector(31 downto 0);  -- float32_m23
        clk : in std_logic;
        areset : in std_logic
    );
end floatComponent_fp_min_dut_prim_minBlock_typeSFloat_23_8_typeSFloat_23_8_typeSFloA0Z4ge26154ge2a150m4e5u;

architecture normal of floatComponent_fp_min_dut_prim_minBlock_typeSFloat_23_8_typeSFloat_23_8_typeSFloA0Z4ge26154ge2a150m4e5u is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal cstAllOWE_uid7_block_rsrvd_fix_q : STD_LOGIC_VECTOR (7 downto 0);
    signal cstOneWF_uid8_block_rsrvd_fix_q : STD_LOGIC_VECTOR (22 downto 0);
    signal exc_N_uid19_block_rsrvd_fix_a : STD_LOGIC_VECTOR (0 downto 0);
    signal exc_N_uid19_block_rsrvd_fix_b : STD_LOGIC_VECTOR (0 downto 0);
    signal exc_N_uid19_block_rsrvd_fix_q_i : STD_LOGIC_VECTOR (0 downto 0);
    signal exc_N_uid19_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal exc_N_uid36_block_rsrvd_fix_a : STD_LOGIC_VECTOR (0 downto 0);
    signal exc_N_uid36_block_rsrvd_fix_b : STD_LOGIC_VECTOR (0 downto 0);
    signal exc_N_uid36_block_rsrvd_fix_q_i : STD_LOGIC_VECTOR (0 downto 0);
    signal exc_N_uid36_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal efxGTefy_uid56_block_rsrvd_fix_a : STD_LOGIC_VECTOR (33 downto 0);
    signal efxGTefy_uid56_block_rsrvd_fix_b : STD_LOGIC_VECTOR (33 downto 0);
    signal efxGTefy_uid56_block_rsrvd_fix_o : STD_LOGIC_VECTOR (33 downto 0);
    signal efxGTefy_uid56_block_rsrvd_fix_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal efxGTefy_uid56_block_rsrvd_fix_c : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal join_uid69_block_rsrvd_fix_q : STD_LOGIC_VECTOR (31 downto 0);
    signal nanOut_uid41_block_rsrvd_fix_a : STD_LOGIC_VECTOR (0 downto 0);
    signal nanOut_uid41_block_rsrvd_fix_b : STD_LOGIC_VECTOR (0 downto 0);
    signal nanOut_uid41_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal oneIsNaN_uid42_block_rsrvd_fix_a : STD_LOGIC_VECTOR (0 downto 0);
    signal oneIsNaN_uid42_block_rsrvd_fix_b : STD_LOGIC_VECTOR (0 downto 0);
    signal oneIsNaN_uid42_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExc_N_uid43_block_rsrvd_fix_a : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExc_N_uid43_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal yNotNaN_uid44_block_rsrvd_fix_a : STD_LOGIC_VECTOR (31 downto 0);
    signal yNotNaN_uid44_block_rsrvd_fix_b : STD_LOGIC_VECTOR (31 downto 0);
    signal yNotNaN_uid44_block_rsrvd_fix_q : STD_LOGIC_VECTOR (31 downto 0);
    signal InvExc_N_uid45_block_rsrvd_fix_a : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExc_N_uid45_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal xNotNaN_uid46_block_rsrvd_fix_a : STD_LOGIC_VECTOR (31 downto 0);
    signal xNotNaN_uid46_block_rsrvd_fix_b : STD_LOGIC_VECTOR (31 downto 0);
    signal xNotNaN_uid46_block_rsrvd_fix_q : STD_LOGIC_VECTOR (31 downto 0);
    signal oneNaNOutput_uid47_block_rsrvd_fix_a : STD_LOGIC_VECTOR (31 downto 0);
    signal oneNaNOutput_uid47_block_rsrvd_fix_b : STD_LOGIC_VECTOR (31 downto 0);
    signal oneNaNOutput_uid47_block_rsrvd_fix_q : STD_LOGIC_VECTOR (31 downto 0);
    signal InvEfxGTefy_uid57_block_rsrvd_fix_a : STD_LOGIC_VECTOR (0 downto 0);
    signal InvEfxGTefy_uid57_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal exp_uid12_block_rsrvd_fix_in : STD_LOGIC_VECTOR (31 downto 0);
    signal exp_uid12_block_rsrvd_fix_b : STD_LOGIC_VECTOR (7 downto 0);
    signal frac_uid14_block_rsrvd_fix_in : STD_LOGIC_VECTOR (31 downto 0);
    signal frac_uid14_block_rsrvd_fix_b : STD_LOGIC_VECTOR (22 downto 0);
    signal exp_uid29_block_rsrvd_fix_in : STD_LOGIC_VECTOR (31 downto 0);
    signal exp_uid29_block_rsrvd_fix_b : STD_LOGIC_VECTOR (7 downto 0);
    signal frac_uid31_block_rsrvd_fix_in : STD_LOGIC_VECTOR (31 downto 0);
    signal frac_uid31_block_rsrvd_fix_b : STD_LOGIC_VECTOR (22 downto 0);
    signal expXIsMax_uid13_block_rsrvd_fix_a : STD_LOGIC_VECTOR (7 downto 0);
    signal expXIsMax_uid13_block_rsrvd_fix_b : STD_LOGIC_VECTOR (7 downto 0);
    signal expXIsMax_uid13_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid30_block_rsrvd_fix_a : STD_LOGIC_VECTOR (7 downto 0);
    signal expXIsMax_uid30_block_rsrvd_fix_b : STD_LOGIC_VECTOR (7 downto 0);
    signal expXIsMax_uid30_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid15_block_rsrvd_fix_a : STD_LOGIC_VECTOR (25 downto 0);
    signal fracXIsNotZero_uid15_block_rsrvd_fix_b : STD_LOGIC_VECTOR (25 downto 0);
    signal fracXIsNotZero_uid15_block_rsrvd_fix_o : STD_LOGIC_VECTOR (25 downto 0);
    signal fracXIsNotZero_uid15_block_rsrvd_fix_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid15_block_rsrvd_fix_n : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid32_block_rsrvd_fix_a : STD_LOGIC_VECTOR (25 downto 0);
    signal fracXIsNotZero_uid32_block_rsrvd_fix_b : STD_LOGIC_VECTOR (25 downto 0);
    signal fracXIsNotZero_uid32_block_rsrvd_fix_o : STD_LOGIC_VECTOR (25 downto 0);
    signal fracXIsNotZero_uid32_block_rsrvd_fix_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid32_block_rsrvd_fix_n : STD_LOGIC_VECTOR (0 downto 0);
    signal Y31_uid55_block_rsrvd_fix_in : STD_LOGIC_VECTOR (31 downto 0);
    signal Y31_uid55_block_rsrvd_fix_b : STD_LOGIC_VECTOR (0 downto 0);
    signal X31_uid54_block_rsrvd_fix_in : STD_LOGIC_VECTOR (31 downto 0);
    signal X31_uid54_block_rsrvd_fix_b : STD_LOGIC_VECTOR (0 downto 0);
    signal join_uid66_block_rsrvd_fix_q : STD_LOGIC_VECTOR (1 downto 0);
    signal xNegyNegYGTX_uid58_block_rsrvd_fix_a : STD_LOGIC_VECTOR (0 downto 0);
    signal xNegyNegYGTX_uid58_block_rsrvd_fix_b : STD_LOGIC_VECTOR (0 downto 0);
    signal xNegyNegYGTX_uid58_block_rsrvd_fix_c : STD_LOGIC_VECTOR (0 downto 0);
    signal xNegyNegYGTX_uid58_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracX_uid50_block_rsrvd_fix_q : STD_LOGIC_VECTOR (30 downto 0);
    signal expFracY_uid53_block_rsrvd_fix_q : STD_LOGIC_VECTOR (30 downto 0);
    signal fracXIsZero_uid16_block_rsrvd_fix_a : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid16_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid33_block_rsrvd_fix_a : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid33_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvY31_uid59_block_rsrvd_fix_a : STD_LOGIC_VECTOR (0 downto 0);
    signal InvY31_uid59_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvX31_uid60_block_rsrvd_fix_a : STD_LOGIC_VECTOR (0 downto 0);
    signal InvX31_uid60_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvFracXIsZero_uid18_block_rsrvd_fix_a : STD_LOGIC_VECTOR (0 downto 0);
    signal InvFracXIsZero_uid18_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvFracXIsZero_uid35_block_rsrvd_fix_a : STD_LOGIC_VECTOR (0 downto 0);
    signal InvFracXIsZero_uid35_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal xPosyPosXGtY_uid61_block_rsrvd_fix_a : STD_LOGIC_VECTOR (0 downto 0);
    signal xPosyPosXGtY_uid61_block_rsrvd_fix_b : STD_LOGIC_VECTOR (0 downto 0);
    signal xPosyPosXGtY_uid61_block_rsrvd_fix_c : STD_LOGIC_VECTOR (0 downto 0);
    signal xPosyPosXGtY_uid61_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal xPosYNeg_uid63_block_rsrvd_fix_a : STD_LOGIC_VECTOR (0 downto 0);
    signal xPosYNeg_uid63_block_rsrvd_fix_b : STD_LOGIC_VECTOR (0 downto 0);
    signal xPosYNeg_uid63_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal selX_uid64_block_rsrvd_fix_a : STD_LOGIC_VECTOR (0 downto 0);
    signal selX_uid64_block_rsrvd_fix_b : STD_LOGIC_VECTOR (0 downto 0);
    signal selX_uid64_block_rsrvd_fix_c : STD_LOGIC_VECTOR (0 downto 0);
    signal selX_uid64_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal r_uid65_block_rsrvd_fix_s : STD_LOGIC_VECTOR (0 downto 0);
    signal r_uid65_block_rsrvd_fix_q : STD_LOGIC_VECTOR (31 downto 0);
    signal rPostNaN_uid73_block_rsrvd_fix_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rPostNaN_uid73_block_rsrvd_fix_q : STD_LOGIC_VECTOR (31 downto 0);

begin


    -- in_1(GPIN,4)@0

    -- redist0(DELAY,74)
    redist0 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1 )
    PORT MAP ( xin => in_1, xout => redist0_q, clk => clk, aclr => areset );

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- cstOneWF_uid8_block_rsrvd_fix(CONSTANT,7)
    cstOneWF_uid8_block_rsrvd_fix_q <= "00000000000000000000001";

    -- frac_uid31_block_rsrvd_fix(BITSELECT,30)@0
    frac_uid31_block_rsrvd_fix_in <= in_1;
    frac_uid31_block_rsrvd_fix_b <= frac_uid31_block_rsrvd_fix_in(22 downto 0);

    -- fracXIsNotZero_uid32_block_rsrvd_fix(COMPARE,31)@0
    fracXIsNotZero_uid32_block_rsrvd_fix_cin <= GND_q;
    fracXIsNotZero_uid32_block_rsrvd_fix_a <= STD_LOGIC_VECTOR("00" & frac_uid31_block_rsrvd_fix_b) & '0';
    fracXIsNotZero_uid32_block_rsrvd_fix_b <= STD_LOGIC_VECTOR("00" & cstOneWF_uid8_block_rsrvd_fix_q) & fracXIsNotZero_uid32_block_rsrvd_fix_cin(0);
    fracXIsNotZero_uid32_block_rsrvd_fix_o <= STD_LOGIC_VECTOR(UNSIGNED(fracXIsNotZero_uid32_block_rsrvd_fix_a) - UNSIGNED(fracXIsNotZero_uid32_block_rsrvd_fix_b));
    fracXIsNotZero_uid32_block_rsrvd_fix_n(0) <= not (fracXIsNotZero_uid32_block_rsrvd_fix_o(25));

    -- fracXIsZero_uid33_block_rsrvd_fix(LOGICAL,32)@0
    fracXIsZero_uid33_block_rsrvd_fix_a <= fracXIsNotZero_uid32_block_rsrvd_fix_n;
    fracXIsZero_uid33_block_rsrvd_fix_q <= not (fracXIsZero_uid33_block_rsrvd_fix_a);

    -- InvFracXIsZero_uid35_block_rsrvd_fix(LOGICAL,34)@0
    InvFracXIsZero_uid35_block_rsrvd_fix_a <= fracXIsZero_uid33_block_rsrvd_fix_q;
    InvFracXIsZero_uid35_block_rsrvd_fix_q <= not (InvFracXIsZero_uid35_block_rsrvd_fix_a);

    -- cstAllOWE_uid7_block_rsrvd_fix(CONSTANT,6)
    cstAllOWE_uid7_block_rsrvd_fix_q <= "11111111";

    -- exp_uid29_block_rsrvd_fix(BITSELECT,28)@0
    exp_uid29_block_rsrvd_fix_in <= in_1;
    exp_uid29_block_rsrvd_fix_b <= exp_uid29_block_rsrvd_fix_in(30 downto 23);

    -- expXIsMax_uid30_block_rsrvd_fix(LOGICAL,29)@0
    expXIsMax_uid30_block_rsrvd_fix_a <= exp_uid29_block_rsrvd_fix_b;
    expXIsMax_uid30_block_rsrvd_fix_b <= cstAllOWE_uid7_block_rsrvd_fix_q;
    expXIsMax_uid30_block_rsrvd_fix_q <= "1" WHEN expXIsMax_uid30_block_rsrvd_fix_a = expXIsMax_uid30_block_rsrvd_fix_b ELSE "0";

    -- exc_N_uid36_block_rsrvd_fix(LOGICAL,35)@0
    exc_N_uid36_block_rsrvd_fix_a <= expXIsMax_uid30_block_rsrvd_fix_q;
    exc_N_uid36_block_rsrvd_fix_b <= InvFracXIsZero_uid35_block_rsrvd_fix_q;
    exc_N_uid36_block_rsrvd_fix_q_i <= exc_N_uid36_block_rsrvd_fix_a and exc_N_uid36_block_rsrvd_fix_b;
    exc_N_uid36_block_rsrvd_fix_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => exc_N_uid36_block_rsrvd_fix_q_i, xout => exc_N_uid36_block_rsrvd_fix_q, clk => clk, aclr => areset );

    -- InvExc_N_uid43_block_rsrvd_fix(LOGICAL,42)@1
    InvExc_N_uid43_block_rsrvd_fix_a <= exc_N_uid36_block_rsrvd_fix_q;
    InvExc_N_uid43_block_rsrvd_fix_q <= not (InvExc_N_uid43_block_rsrvd_fix_a);

    -- yNotNaN_uid44_block_rsrvd_fix(LOGICAL,43)@1
    yNotNaN_uid44_block_rsrvd_fix_a <= STD_LOGIC_VECTOR((31 downto 1 => InvExc_N_uid43_block_rsrvd_fix_q(0)) & InvExc_N_uid43_block_rsrvd_fix_q);
    yNotNaN_uid44_block_rsrvd_fix_b <= redist0_q;
    yNotNaN_uid44_block_rsrvd_fix_q <= yNotNaN_uid44_block_rsrvd_fix_a and yNotNaN_uid44_block_rsrvd_fix_b;

    -- in_0(GPIN,3)@0

    -- redist1(DELAY,75)
    redist1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1 )
    PORT MAP ( xin => in_0, xout => redist1_q, clk => clk, aclr => areset );

    -- frac_uid14_block_rsrvd_fix(BITSELECT,13)@0
    frac_uid14_block_rsrvd_fix_in <= in_0;
    frac_uid14_block_rsrvd_fix_b <= frac_uid14_block_rsrvd_fix_in(22 downto 0);

    -- fracXIsNotZero_uid15_block_rsrvd_fix(COMPARE,14)@0
    fracXIsNotZero_uid15_block_rsrvd_fix_cin <= GND_q;
    fracXIsNotZero_uid15_block_rsrvd_fix_a <= STD_LOGIC_VECTOR("00" & frac_uid14_block_rsrvd_fix_b) & '0';
    fracXIsNotZero_uid15_block_rsrvd_fix_b <= STD_LOGIC_VECTOR("00" & cstOneWF_uid8_block_rsrvd_fix_q) & fracXIsNotZero_uid15_block_rsrvd_fix_cin(0);
    fracXIsNotZero_uid15_block_rsrvd_fix_o <= STD_LOGIC_VECTOR(UNSIGNED(fracXIsNotZero_uid15_block_rsrvd_fix_a) - UNSIGNED(fracXIsNotZero_uid15_block_rsrvd_fix_b));
    fracXIsNotZero_uid15_block_rsrvd_fix_n(0) <= not (fracXIsNotZero_uid15_block_rsrvd_fix_o(25));

    -- fracXIsZero_uid16_block_rsrvd_fix(LOGICAL,15)@0
    fracXIsZero_uid16_block_rsrvd_fix_a <= fracXIsNotZero_uid15_block_rsrvd_fix_n;
    fracXIsZero_uid16_block_rsrvd_fix_q <= not (fracXIsZero_uid16_block_rsrvd_fix_a);

    -- InvFracXIsZero_uid18_block_rsrvd_fix(LOGICAL,17)@0
    InvFracXIsZero_uid18_block_rsrvd_fix_a <= fracXIsZero_uid16_block_rsrvd_fix_q;
    InvFracXIsZero_uid18_block_rsrvd_fix_q <= not (InvFracXIsZero_uid18_block_rsrvd_fix_a);

    -- exp_uid12_block_rsrvd_fix(BITSELECT,11)@0
    exp_uid12_block_rsrvd_fix_in <= in_0;
    exp_uid12_block_rsrvd_fix_b <= exp_uid12_block_rsrvd_fix_in(30 downto 23);

    -- expXIsMax_uid13_block_rsrvd_fix(LOGICAL,12)@0
    expXIsMax_uid13_block_rsrvd_fix_a <= exp_uid12_block_rsrvd_fix_b;
    expXIsMax_uid13_block_rsrvd_fix_b <= cstAllOWE_uid7_block_rsrvd_fix_q;
    expXIsMax_uid13_block_rsrvd_fix_q <= "1" WHEN expXIsMax_uid13_block_rsrvd_fix_a = expXIsMax_uid13_block_rsrvd_fix_b ELSE "0";

    -- exc_N_uid19_block_rsrvd_fix(LOGICAL,18)@0
    exc_N_uid19_block_rsrvd_fix_a <= expXIsMax_uid13_block_rsrvd_fix_q;
    exc_N_uid19_block_rsrvd_fix_b <= InvFracXIsZero_uid18_block_rsrvd_fix_q;
    exc_N_uid19_block_rsrvd_fix_q_i <= exc_N_uid19_block_rsrvd_fix_a and exc_N_uid19_block_rsrvd_fix_b;
    exc_N_uid19_block_rsrvd_fix_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => exc_N_uid19_block_rsrvd_fix_q_i, xout => exc_N_uid19_block_rsrvd_fix_q, clk => clk, aclr => areset );

    -- InvExc_N_uid45_block_rsrvd_fix(LOGICAL,44)@1
    InvExc_N_uid45_block_rsrvd_fix_a <= exc_N_uid19_block_rsrvd_fix_q;
    InvExc_N_uid45_block_rsrvd_fix_q <= not (InvExc_N_uid45_block_rsrvd_fix_a);

    -- xNotNaN_uid46_block_rsrvd_fix(LOGICAL,45)@1
    xNotNaN_uid46_block_rsrvd_fix_a <= STD_LOGIC_VECTOR((31 downto 1 => InvExc_N_uid45_block_rsrvd_fix_q(0)) & InvExc_N_uid45_block_rsrvd_fix_q);
    xNotNaN_uid46_block_rsrvd_fix_b <= redist1_q;
    xNotNaN_uid46_block_rsrvd_fix_q <= xNotNaN_uid46_block_rsrvd_fix_a and xNotNaN_uid46_block_rsrvd_fix_b;

    -- oneNaNOutput_uid47_block_rsrvd_fix(LOGICAL,46)@1
    oneNaNOutput_uid47_block_rsrvd_fix_a <= xNotNaN_uid46_block_rsrvd_fix_q;
    oneNaNOutput_uid47_block_rsrvd_fix_b <= yNotNaN_uid44_block_rsrvd_fix_q;
    oneNaNOutput_uid47_block_rsrvd_fix_q <= oneNaNOutput_uid47_block_rsrvd_fix_a or oneNaNOutput_uid47_block_rsrvd_fix_b;

    -- join_uid69_block_rsrvd_fix(BITJOIN,68)@1
    join_uid69_block_rsrvd_fix_q <= GND_q & cstAllOWE_uid7_block_rsrvd_fix_q & cstOneWF_uid8_block_rsrvd_fix_q;

    -- expFracX_uid50_block_rsrvd_fix(BITJOIN,49)@0
    expFracX_uid50_block_rsrvd_fix_q <= exp_uid12_block_rsrvd_fix_b & frac_uid14_block_rsrvd_fix_b;

    -- expFracY_uid53_block_rsrvd_fix(BITJOIN,52)@0
    expFracY_uid53_block_rsrvd_fix_q <= exp_uid29_block_rsrvd_fix_b & frac_uid31_block_rsrvd_fix_b;

    -- efxGTefy_uid56_block_rsrvd_fix(COMPARE,55)@0
    efxGTefy_uid56_block_rsrvd_fix_cin <= GND_q;
    efxGTefy_uid56_block_rsrvd_fix_a <= STD_LOGIC_VECTOR("00" & expFracY_uid53_block_rsrvd_fix_q) & '0';
    efxGTefy_uid56_block_rsrvd_fix_b <= STD_LOGIC_VECTOR("00" & expFracX_uid50_block_rsrvd_fix_q) & efxGTefy_uid56_block_rsrvd_fix_cin(0);
    efxGTefy_uid56_block_rsrvd_fix: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            efxGTefy_uid56_block_rsrvd_fix_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            efxGTefy_uid56_block_rsrvd_fix_o <= STD_LOGIC_VECTOR(UNSIGNED(efxGTefy_uid56_block_rsrvd_fix_a) - UNSIGNED(efxGTefy_uid56_block_rsrvd_fix_b));
        END IF;
    END PROCESS;
    efxGTefy_uid56_block_rsrvd_fix_c(0) <= efxGTefy_uid56_block_rsrvd_fix_o(33);

    -- InvEfxGTefy_uid57_block_rsrvd_fix(LOGICAL,56)@1
    InvEfxGTefy_uid57_block_rsrvd_fix_a <= efxGTefy_uid56_block_rsrvd_fix_c;
    InvEfxGTefy_uid57_block_rsrvd_fix_q <= not (InvEfxGTefy_uid57_block_rsrvd_fix_a);

    -- Y31_uid55_block_rsrvd_fix(BITSELECT,54)@1
    Y31_uid55_block_rsrvd_fix_in <= STD_LOGIC_VECTOR(redist0_q);
    Y31_uid55_block_rsrvd_fix_b <= Y31_uid55_block_rsrvd_fix_in(31 downto 31);

    -- X31_uid54_block_rsrvd_fix(BITSELECT,53)@1
    X31_uid54_block_rsrvd_fix_in <= STD_LOGIC_VECTOR(redist1_q);
    X31_uid54_block_rsrvd_fix_b <= X31_uid54_block_rsrvd_fix_in(31 downto 31);

    -- xNegyNegYGTX_uid58_block_rsrvd_fix(LOGICAL,57)@1
    xNegyNegYGTX_uid58_block_rsrvd_fix_a <= X31_uid54_block_rsrvd_fix_b;
    xNegyNegYGTX_uid58_block_rsrvd_fix_b <= Y31_uid55_block_rsrvd_fix_b;
    xNegyNegYGTX_uid58_block_rsrvd_fix_c <= InvEfxGTefy_uid57_block_rsrvd_fix_q;
    xNegyNegYGTX_uid58_block_rsrvd_fix_q <= xNegyNegYGTX_uid58_block_rsrvd_fix_a and xNegyNegYGTX_uid58_block_rsrvd_fix_b and xNegyNegYGTX_uid58_block_rsrvd_fix_c;

    -- InvY31_uid59_block_rsrvd_fix(LOGICAL,58)@1
    InvY31_uid59_block_rsrvd_fix_a <= Y31_uid55_block_rsrvd_fix_b;
    InvY31_uid59_block_rsrvd_fix_q <= not (InvY31_uid59_block_rsrvd_fix_a);

    -- InvX31_uid60_block_rsrvd_fix(LOGICAL,59)@1
    InvX31_uid60_block_rsrvd_fix_a <= X31_uid54_block_rsrvd_fix_b;
    InvX31_uid60_block_rsrvd_fix_q <= not (InvX31_uid60_block_rsrvd_fix_a);

    -- xPosyPosXGtY_uid61_block_rsrvd_fix(LOGICAL,60)@1
    xPosyPosXGtY_uid61_block_rsrvd_fix_a <= InvX31_uid60_block_rsrvd_fix_q;
    xPosyPosXGtY_uid61_block_rsrvd_fix_b <= InvY31_uid59_block_rsrvd_fix_q;
    xPosyPosXGtY_uid61_block_rsrvd_fix_c <= efxGTefy_uid56_block_rsrvd_fix_c;
    xPosyPosXGtY_uid61_block_rsrvd_fix_q <= xPosyPosXGtY_uid61_block_rsrvd_fix_a and xPosyPosXGtY_uid61_block_rsrvd_fix_b and xPosyPosXGtY_uid61_block_rsrvd_fix_c;

    -- xPosYNeg_uid63_block_rsrvd_fix(LOGICAL,62)@1
    xPosYNeg_uid63_block_rsrvd_fix_a <= InvX31_uid60_block_rsrvd_fix_q;
    xPosYNeg_uid63_block_rsrvd_fix_b <= Y31_uid55_block_rsrvd_fix_b;
    xPosYNeg_uid63_block_rsrvd_fix_q <= xPosYNeg_uid63_block_rsrvd_fix_a and xPosYNeg_uid63_block_rsrvd_fix_b;

    -- selX_uid64_block_rsrvd_fix(LOGICAL,63)@1
    selX_uid64_block_rsrvd_fix_a <= xPosYNeg_uid63_block_rsrvd_fix_q;
    selX_uid64_block_rsrvd_fix_b <= xPosyPosXGtY_uid61_block_rsrvd_fix_q;
    selX_uid64_block_rsrvd_fix_c <= xNegyNegYGTX_uid58_block_rsrvd_fix_q;
    selX_uid64_block_rsrvd_fix_q <= selX_uid64_block_rsrvd_fix_a or selX_uid64_block_rsrvd_fix_b or selX_uid64_block_rsrvd_fix_c;

    -- r_uid65_block_rsrvd_fix(MUX,64)@1
    r_uid65_block_rsrvd_fix_s <= selX_uid64_block_rsrvd_fix_q;
    r_uid65_block_rsrvd_fix: PROCESS (r_uid65_block_rsrvd_fix_s, redist1_q, redist0_q)
    BEGIN
        CASE (r_uid65_block_rsrvd_fix_s) IS
            WHEN "0" => r_uid65_block_rsrvd_fix_q <= redist1_q;
            WHEN "1" => r_uid65_block_rsrvd_fix_q <= redist0_q;
            WHEN OTHERS => r_uid65_block_rsrvd_fix_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- oneIsNaN_uid42_block_rsrvd_fix(LOGICAL,41)@1
    oneIsNaN_uid42_block_rsrvd_fix_a <= exc_N_uid19_block_rsrvd_fix_q;
    oneIsNaN_uid42_block_rsrvd_fix_b <= exc_N_uid36_block_rsrvd_fix_q;
    oneIsNaN_uid42_block_rsrvd_fix_q <= oneIsNaN_uid42_block_rsrvd_fix_a xor oneIsNaN_uid42_block_rsrvd_fix_b;

    -- nanOut_uid41_block_rsrvd_fix(LOGICAL,40)@1
    nanOut_uid41_block_rsrvd_fix_a <= exc_N_uid19_block_rsrvd_fix_q;
    nanOut_uid41_block_rsrvd_fix_b <= exc_N_uid36_block_rsrvd_fix_q;
    nanOut_uid41_block_rsrvd_fix_q <= nanOut_uid41_block_rsrvd_fix_a and nanOut_uid41_block_rsrvd_fix_b;

    -- join_uid66_block_rsrvd_fix(BITJOIN,65)@1
    join_uid66_block_rsrvd_fix_q <= oneIsNaN_uid42_block_rsrvd_fix_q & nanOut_uid41_block_rsrvd_fix_q;

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- rPostNaN_uid73_block_rsrvd_fix(MUX,72)@1
    rPostNaN_uid73_block_rsrvd_fix_s <= join_uid66_block_rsrvd_fix_q;
    rPostNaN_uid73_block_rsrvd_fix: PROCESS (rPostNaN_uid73_block_rsrvd_fix_s, r_uid65_block_rsrvd_fix_q, join_uid69_block_rsrvd_fix_q, oneNaNOutput_uid47_block_rsrvd_fix_q)
    BEGIN
        CASE (rPostNaN_uid73_block_rsrvd_fix_s) IS
            WHEN "00" => rPostNaN_uid73_block_rsrvd_fix_q <= r_uid65_block_rsrvd_fix_q;
            WHEN "01" => rPostNaN_uid73_block_rsrvd_fix_q <= join_uid69_block_rsrvd_fix_q;
            WHEN "10" => rPostNaN_uid73_block_rsrvd_fix_q <= oneNaNOutput_uid47_block_rsrvd_fix_q;
            WHEN "11" => rPostNaN_uid73_block_rsrvd_fix_q <= join_uid69_block_rsrvd_fix_q;
            WHEN OTHERS => rPostNaN_uid73_block_rsrvd_fix_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_primWireOut(GPOUT,5)@1
    out_primWireOut <= rPostNaN_uid73_block_rsrvd_fix_q;

END normal;
