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

-- VHDL created from fp_min
-- VHDL created on Fri Apr 17 15:57:06 2015


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

entity fp_min is
    port (
        a : in std_logic_vector(31 downto 0);  -- float32_m23
        b : in std_logic_vector(31 downto 0);  -- float32_m23
        q : out std_logic_vector(31 downto 0);  -- float32_m23
        clk : in std_logic;
        areset : in std_logic
    );
end fp_min;

architecture normal of fp_min is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal cstAllOWE_uid6_fpMinTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal cstOneWF_uid7_fpMinTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal expXIsMax_uid12_fpMinTest_a : STD_LOGIC_VECTOR (7 downto 0);
    signal expXIsMax_uid12_fpMinTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal expXIsMax_uid12_fpMinTest_q_i : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid12_fpMinTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvFracXIsZero_uid17_fpMinTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal InvFracXIsZero_uid17_fpMinTest_q_i : STD_LOGIC_VECTOR (0 downto 0);
    signal InvFracXIsZero_uid17_fpMinTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid29_fpMinTest_a : STD_LOGIC_VECTOR (7 downto 0);
    signal expXIsMax_uid29_fpMinTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal expXIsMax_uid29_fpMinTest_q_i : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid29_fpMinTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvFracXIsZero_uid34_fpMinTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal InvFracXIsZero_uid34_fpMinTest_q_i : STD_LOGIC_VECTOR (0 downto 0);
    signal InvFracXIsZero_uid34_fpMinTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal efxGTefy_uid55_fpMinTest_a : STD_LOGIC_VECTOR (33 downto 0);
    signal efxGTefy_uid55_fpMinTest_b : STD_LOGIC_VECTOR (33 downto 0);
    signal efxGTefy_uid55_fpMinTest_o : STD_LOGIC_VECTOR (33 downto 0);
    signal efxGTefy_uid55_fpMinTest_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal efxGTefy_uid55_fpMinTest_c : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal join_uid68_fpMinTest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal exc_N_uid18_fpMinTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal exc_N_uid18_fpMinTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal exc_N_uid18_fpMinTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal exc_N_uid35_fpMinTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal exc_N_uid35_fpMinTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal exc_N_uid35_fpMinTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal nanOut_uid40_fpMinTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal nanOut_uid40_fpMinTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal nanOut_uid40_fpMinTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal oneIsNaN_uid41_fpMinTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal oneIsNaN_uid41_fpMinTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal oneIsNaN_uid41_fpMinTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExc_N_uid42_fpMinTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExc_N_uid42_fpMinTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal yNotNaN_uid43_fpMinTest_a : STD_LOGIC_VECTOR (31 downto 0);
    signal yNotNaN_uid43_fpMinTest_b : STD_LOGIC_VECTOR (31 downto 0);
    signal yNotNaN_uid43_fpMinTest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal InvExc_N_uid44_fpMinTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExc_N_uid44_fpMinTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal xNotNaN_uid45_fpMinTest_a : STD_LOGIC_VECTOR (31 downto 0);
    signal xNotNaN_uid45_fpMinTest_b : STD_LOGIC_VECTOR (31 downto 0);
    signal xNotNaN_uid45_fpMinTest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal oneNaNOutput_uid46_fpMinTest_a : STD_LOGIC_VECTOR (31 downto 0);
    signal oneNaNOutput_uid46_fpMinTest_b : STD_LOGIC_VECTOR (31 downto 0);
    signal oneNaNOutput_uid46_fpMinTest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal InvEfxGTefy_uid56_fpMinTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal InvEfxGTefy_uid56_fpMinTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal exp_uid11_fpMinTest_in : STD_LOGIC_VECTOR (31 downto 0);
    signal exp_uid11_fpMinTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal frac_uid13_fpMinTest_in : STD_LOGIC_VECTOR (31 downto 0);
    signal frac_uid13_fpMinTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal exp_uid28_fpMinTest_in : STD_LOGIC_VECTOR (31 downto 0);
    signal exp_uid28_fpMinTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal frac_uid30_fpMinTest_in : STD_LOGIC_VECTOR (31 downto 0);
    signal frac_uid30_fpMinTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal fracXIsNotZero_uid14_fpMinTest_a : STD_LOGIC_VECTOR (25 downto 0);
    signal fracXIsNotZero_uid14_fpMinTest_b : STD_LOGIC_VECTOR (25 downto 0);
    signal fracXIsNotZero_uid14_fpMinTest_o : STD_LOGIC_VECTOR (25 downto 0);
    signal fracXIsNotZero_uid14_fpMinTest_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid14_fpMinTest_n : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid31_fpMinTest_a : STD_LOGIC_VECTOR (25 downto 0);
    signal fracXIsNotZero_uid31_fpMinTest_b : STD_LOGIC_VECTOR (25 downto 0);
    signal fracXIsNotZero_uid31_fpMinTest_o : STD_LOGIC_VECTOR (25 downto 0);
    signal fracXIsNotZero_uid31_fpMinTest_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid31_fpMinTest_n : STD_LOGIC_VECTOR (0 downto 0);
    signal X31_uid53_fpMinTest_in : STD_LOGIC_VECTOR (31 downto 0);
    signal X31_uid53_fpMinTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal Y31_uid54_fpMinTest_in : STD_LOGIC_VECTOR (31 downto 0);
    signal Y31_uid54_fpMinTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal join_uid65_fpMinTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal xNegyNegYGTX_uid57_fpMinTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal xNegyNegYGTX_uid57_fpMinTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal xNegyNegYGTX_uid57_fpMinTest_c : STD_LOGIC_VECTOR (0 downto 0);
    signal xNegyNegYGTX_uid57_fpMinTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracX_uid49_fpMinTest_q : STD_LOGIC_VECTOR (30 downto 0);
    signal expFracY_uid52_fpMinTest_q : STD_LOGIC_VECTOR (30 downto 0);
    signal fracXIsZero_uid15_fpMinTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid15_fpMinTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid32_fpMinTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid32_fpMinTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvX31_uid59_fpMinTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal InvX31_uid59_fpMinTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvY31_uid58_fpMinTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal InvY31_uid58_fpMinTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal xPosYNeg_uid62_fpMinTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal xPosYNeg_uid62_fpMinTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal xPosYNeg_uid62_fpMinTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal xPosyPosXGtY_uid60_fpMinTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal xPosyPosXGtY_uid60_fpMinTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal xPosyPosXGtY_uid60_fpMinTest_c : STD_LOGIC_VECTOR (0 downto 0);
    signal xPosyPosXGtY_uid60_fpMinTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal selX_uid63_fpMinTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal selX_uid63_fpMinTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal selX_uid63_fpMinTest_c : STD_LOGIC_VECTOR (0 downto 0);
    signal selX_uid63_fpMinTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal r_uid64_fpMinTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal r_uid64_fpMinTest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal rPostNaN_uid72_fpMinTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rPostNaN_uid72_fpMinTest_q : STD_LOGIC_VECTOR (31 downto 0);

begin


    -- xIn(GPIN,3)@0

    -- redist1(DELAY,74)
    redist1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1 )
    PORT MAP ( xin => b, xout => redist1_q, clk => clk, aclr => areset );

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- cstOneWF_uid7_fpMinTest(CONSTANT,6)
    cstOneWF_uid7_fpMinTest_q <= "00000000000000000000001";

    -- frac_uid30_fpMinTest(BITSELECT,29)@0
    frac_uid30_fpMinTest_in <= b;
    frac_uid30_fpMinTest_b <= frac_uid30_fpMinTest_in(22 downto 0);

    -- fracXIsNotZero_uid31_fpMinTest(COMPARE,30)@0
    fracXIsNotZero_uid31_fpMinTest_cin <= GND_q;
    fracXIsNotZero_uid31_fpMinTest_a <= STD_LOGIC_VECTOR("00" & frac_uid30_fpMinTest_b) & '0';
    fracXIsNotZero_uid31_fpMinTest_b <= STD_LOGIC_VECTOR("00" & cstOneWF_uid7_fpMinTest_q) & fracXIsNotZero_uid31_fpMinTest_cin(0);
    fracXIsNotZero_uid31_fpMinTest_o <= STD_LOGIC_VECTOR(UNSIGNED(fracXIsNotZero_uid31_fpMinTest_a) - UNSIGNED(fracXIsNotZero_uid31_fpMinTest_b));
    fracXIsNotZero_uid31_fpMinTest_n(0) <= not (fracXIsNotZero_uid31_fpMinTest_o(25));

    -- fracXIsZero_uid32_fpMinTest(LOGICAL,31)@0
    fracXIsZero_uid32_fpMinTest_a <= fracXIsNotZero_uid31_fpMinTest_n;
    fracXIsZero_uid32_fpMinTest_q <= not (fracXIsZero_uid32_fpMinTest_a);

    -- InvFracXIsZero_uid34_fpMinTest(LOGICAL,33)@0
    InvFracXIsZero_uid34_fpMinTest_a <= fracXIsZero_uid32_fpMinTest_q;
    InvFracXIsZero_uid34_fpMinTest_q_i <= not (InvFracXIsZero_uid34_fpMinTest_a);
    InvFracXIsZero_uid34_fpMinTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => InvFracXIsZero_uid34_fpMinTest_q_i, xout => InvFracXIsZero_uid34_fpMinTest_q, clk => clk, aclr => areset );

    -- cstAllOWE_uid6_fpMinTest(CONSTANT,5)
    cstAllOWE_uid6_fpMinTest_q <= "11111111";

    -- exp_uid28_fpMinTest(BITSELECT,27)@0
    exp_uid28_fpMinTest_in <= b;
    exp_uid28_fpMinTest_b <= exp_uid28_fpMinTest_in(30 downto 23);

    -- expXIsMax_uid29_fpMinTest(LOGICAL,28)@0
    expXIsMax_uid29_fpMinTest_a <= exp_uid28_fpMinTest_b;
    expXIsMax_uid29_fpMinTest_b <= cstAllOWE_uid6_fpMinTest_q;
    expXIsMax_uid29_fpMinTest_q_i <= "1" WHEN expXIsMax_uid29_fpMinTest_a = expXIsMax_uid29_fpMinTest_b ELSE "0";
    expXIsMax_uid29_fpMinTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => expXIsMax_uid29_fpMinTest_q_i, xout => expXIsMax_uid29_fpMinTest_q, clk => clk, aclr => areset );

    -- exc_N_uid35_fpMinTest(LOGICAL,34)@1
    exc_N_uid35_fpMinTest_a <= expXIsMax_uid29_fpMinTest_q;
    exc_N_uid35_fpMinTest_b <= InvFracXIsZero_uid34_fpMinTest_q;
    exc_N_uid35_fpMinTest_q <= exc_N_uid35_fpMinTest_a and exc_N_uid35_fpMinTest_b;

    -- InvExc_N_uid42_fpMinTest(LOGICAL,41)@1
    InvExc_N_uid42_fpMinTest_a <= exc_N_uid35_fpMinTest_q;
    InvExc_N_uid42_fpMinTest_q <= not (InvExc_N_uid42_fpMinTest_a);

    -- yNotNaN_uid43_fpMinTest(LOGICAL,42)@1
    yNotNaN_uid43_fpMinTest_a <= STD_LOGIC_VECTOR((31 downto 1 => InvExc_N_uid42_fpMinTest_q(0)) & InvExc_N_uid42_fpMinTest_q);
    yNotNaN_uid43_fpMinTest_b <= redist1_q;
    yNotNaN_uid43_fpMinTest_q <= yNotNaN_uid43_fpMinTest_a and yNotNaN_uid43_fpMinTest_b;

    -- redist0(DELAY,73)
    redist0 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1 )
    PORT MAP ( xin => a, xout => redist0_q, clk => clk, aclr => areset );

    -- frac_uid13_fpMinTest(BITSELECT,12)@0
    frac_uid13_fpMinTest_in <= a;
    frac_uid13_fpMinTest_b <= frac_uid13_fpMinTest_in(22 downto 0);

    -- fracXIsNotZero_uid14_fpMinTest(COMPARE,13)@0
    fracXIsNotZero_uid14_fpMinTest_cin <= GND_q;
    fracXIsNotZero_uid14_fpMinTest_a <= STD_LOGIC_VECTOR("00" & frac_uid13_fpMinTest_b) & '0';
    fracXIsNotZero_uid14_fpMinTest_b <= STD_LOGIC_VECTOR("00" & cstOneWF_uid7_fpMinTest_q) & fracXIsNotZero_uid14_fpMinTest_cin(0);
    fracXIsNotZero_uid14_fpMinTest_o <= STD_LOGIC_VECTOR(UNSIGNED(fracXIsNotZero_uid14_fpMinTest_a) - UNSIGNED(fracXIsNotZero_uid14_fpMinTest_b));
    fracXIsNotZero_uid14_fpMinTest_n(0) <= not (fracXIsNotZero_uid14_fpMinTest_o(25));

    -- fracXIsZero_uid15_fpMinTest(LOGICAL,14)@0
    fracXIsZero_uid15_fpMinTest_a <= fracXIsNotZero_uid14_fpMinTest_n;
    fracXIsZero_uid15_fpMinTest_q <= not (fracXIsZero_uid15_fpMinTest_a);

    -- InvFracXIsZero_uid17_fpMinTest(LOGICAL,16)@0
    InvFracXIsZero_uid17_fpMinTest_a <= fracXIsZero_uid15_fpMinTest_q;
    InvFracXIsZero_uid17_fpMinTest_q_i <= not (InvFracXIsZero_uid17_fpMinTest_a);
    InvFracXIsZero_uid17_fpMinTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => InvFracXIsZero_uid17_fpMinTest_q_i, xout => InvFracXIsZero_uid17_fpMinTest_q, clk => clk, aclr => areset );

    -- exp_uid11_fpMinTest(BITSELECT,10)@0
    exp_uid11_fpMinTest_in <= a;
    exp_uid11_fpMinTest_b <= exp_uid11_fpMinTest_in(30 downto 23);

    -- expXIsMax_uid12_fpMinTest(LOGICAL,11)@0
    expXIsMax_uid12_fpMinTest_a <= exp_uid11_fpMinTest_b;
    expXIsMax_uid12_fpMinTest_b <= cstAllOWE_uid6_fpMinTest_q;
    expXIsMax_uid12_fpMinTest_q_i <= "1" WHEN expXIsMax_uid12_fpMinTest_a = expXIsMax_uid12_fpMinTest_b ELSE "0";
    expXIsMax_uid12_fpMinTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => expXIsMax_uid12_fpMinTest_q_i, xout => expXIsMax_uid12_fpMinTest_q, clk => clk, aclr => areset );

    -- exc_N_uid18_fpMinTest(LOGICAL,17)@1
    exc_N_uid18_fpMinTest_a <= expXIsMax_uid12_fpMinTest_q;
    exc_N_uid18_fpMinTest_b <= InvFracXIsZero_uid17_fpMinTest_q;
    exc_N_uid18_fpMinTest_q <= exc_N_uid18_fpMinTest_a and exc_N_uid18_fpMinTest_b;

    -- InvExc_N_uid44_fpMinTest(LOGICAL,43)@1
    InvExc_N_uid44_fpMinTest_a <= exc_N_uid18_fpMinTest_q;
    InvExc_N_uid44_fpMinTest_q <= not (InvExc_N_uid44_fpMinTest_a);

    -- xNotNaN_uid45_fpMinTest(LOGICAL,44)@1
    xNotNaN_uid45_fpMinTest_a <= STD_LOGIC_VECTOR((31 downto 1 => InvExc_N_uid44_fpMinTest_q(0)) & InvExc_N_uid44_fpMinTest_q);
    xNotNaN_uid45_fpMinTest_b <= redist0_q;
    xNotNaN_uid45_fpMinTest_q <= xNotNaN_uid45_fpMinTest_a and xNotNaN_uid45_fpMinTest_b;

    -- oneNaNOutput_uid46_fpMinTest(LOGICAL,45)@1
    oneNaNOutput_uid46_fpMinTest_a <= xNotNaN_uid45_fpMinTest_q;
    oneNaNOutput_uid46_fpMinTest_b <= yNotNaN_uid43_fpMinTest_q;
    oneNaNOutput_uid46_fpMinTest_q <= oneNaNOutput_uid46_fpMinTest_a or oneNaNOutput_uid46_fpMinTest_b;

    -- join_uid68_fpMinTest(BITJOIN,67)@1
    join_uid68_fpMinTest_q <= GND_q & cstAllOWE_uid6_fpMinTest_q & cstOneWF_uid7_fpMinTest_q;

    -- expFracX_uid49_fpMinTest(BITJOIN,48)@0
    expFracX_uid49_fpMinTest_q <= exp_uid11_fpMinTest_b & frac_uid13_fpMinTest_b;

    -- expFracY_uid52_fpMinTest(BITJOIN,51)@0
    expFracY_uid52_fpMinTest_q <= exp_uid28_fpMinTest_b & frac_uid30_fpMinTest_b;

    -- efxGTefy_uid55_fpMinTest(COMPARE,54)@0
    efxGTefy_uid55_fpMinTest_cin <= GND_q;
    efxGTefy_uid55_fpMinTest_a <= STD_LOGIC_VECTOR("00" & expFracY_uid52_fpMinTest_q) & '0';
    efxGTefy_uid55_fpMinTest_b <= STD_LOGIC_VECTOR("00" & expFracX_uid49_fpMinTest_q) & efxGTefy_uid55_fpMinTest_cin(0);
    efxGTefy_uid55_fpMinTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            efxGTefy_uid55_fpMinTest_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            efxGTefy_uid55_fpMinTest_o <= STD_LOGIC_VECTOR(UNSIGNED(efxGTefy_uid55_fpMinTest_a) - UNSIGNED(efxGTefy_uid55_fpMinTest_b));
        END IF;
    END PROCESS;
    efxGTefy_uid55_fpMinTest_c(0) <= efxGTefy_uid55_fpMinTest_o(33);

    -- InvEfxGTefy_uid56_fpMinTest(LOGICAL,55)@1
    InvEfxGTefy_uid56_fpMinTest_a <= efxGTefy_uid55_fpMinTest_c;
    InvEfxGTefy_uid56_fpMinTest_q <= not (InvEfxGTefy_uid56_fpMinTest_a);

    -- Y31_uid54_fpMinTest(BITSELECT,53)@1
    Y31_uid54_fpMinTest_in <= STD_LOGIC_VECTOR(redist1_q);
    Y31_uid54_fpMinTest_b <= Y31_uid54_fpMinTest_in(31 downto 31);

    -- X31_uid53_fpMinTest(BITSELECT,52)@1
    X31_uid53_fpMinTest_in <= STD_LOGIC_VECTOR(redist0_q);
    X31_uid53_fpMinTest_b <= X31_uid53_fpMinTest_in(31 downto 31);

    -- xNegyNegYGTX_uid57_fpMinTest(LOGICAL,56)@1
    xNegyNegYGTX_uid57_fpMinTest_a <= X31_uid53_fpMinTest_b;
    xNegyNegYGTX_uid57_fpMinTest_b <= Y31_uid54_fpMinTest_b;
    xNegyNegYGTX_uid57_fpMinTest_c <= InvEfxGTefy_uid56_fpMinTest_q;
    xNegyNegYGTX_uid57_fpMinTest_q <= xNegyNegYGTX_uid57_fpMinTest_a and xNegyNegYGTX_uid57_fpMinTest_b and xNegyNegYGTX_uid57_fpMinTest_c;

    -- InvY31_uid58_fpMinTest(LOGICAL,57)@1
    InvY31_uid58_fpMinTest_a <= Y31_uid54_fpMinTest_b;
    InvY31_uid58_fpMinTest_q <= not (InvY31_uid58_fpMinTest_a);

    -- InvX31_uid59_fpMinTest(LOGICAL,58)@1
    InvX31_uid59_fpMinTest_a <= X31_uid53_fpMinTest_b;
    InvX31_uid59_fpMinTest_q <= not (InvX31_uid59_fpMinTest_a);

    -- xPosyPosXGtY_uid60_fpMinTest(LOGICAL,59)@1
    xPosyPosXGtY_uid60_fpMinTest_a <= InvX31_uid59_fpMinTest_q;
    xPosyPosXGtY_uid60_fpMinTest_b <= InvY31_uid58_fpMinTest_q;
    xPosyPosXGtY_uid60_fpMinTest_c <= efxGTefy_uid55_fpMinTest_c;
    xPosyPosXGtY_uid60_fpMinTest_q <= xPosyPosXGtY_uid60_fpMinTest_a and xPosyPosXGtY_uid60_fpMinTest_b and xPosyPosXGtY_uid60_fpMinTest_c;

    -- xPosYNeg_uid62_fpMinTest(LOGICAL,61)@1
    xPosYNeg_uid62_fpMinTest_a <= InvX31_uid59_fpMinTest_q;
    xPosYNeg_uid62_fpMinTest_b <= Y31_uid54_fpMinTest_b;
    xPosYNeg_uid62_fpMinTest_q <= xPosYNeg_uid62_fpMinTest_a and xPosYNeg_uid62_fpMinTest_b;

    -- selX_uid63_fpMinTest(LOGICAL,62)@1
    selX_uid63_fpMinTest_a <= xPosYNeg_uid62_fpMinTest_q;
    selX_uid63_fpMinTest_b <= xPosyPosXGtY_uid60_fpMinTest_q;
    selX_uid63_fpMinTest_c <= xNegyNegYGTX_uid57_fpMinTest_q;
    selX_uid63_fpMinTest_q <= selX_uid63_fpMinTest_a or selX_uid63_fpMinTest_b or selX_uid63_fpMinTest_c;

    -- r_uid64_fpMinTest(MUX,63)@1
    r_uid64_fpMinTest_s <= selX_uid63_fpMinTest_q;
    r_uid64_fpMinTest: PROCESS (r_uid64_fpMinTest_s, redist0_q, redist1_q)
    BEGIN
        CASE (r_uid64_fpMinTest_s) IS
            WHEN "0" => r_uid64_fpMinTest_q <= redist0_q;
            WHEN "1" => r_uid64_fpMinTest_q <= redist1_q;
            WHEN OTHERS => r_uid64_fpMinTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- oneIsNaN_uid41_fpMinTest(LOGICAL,40)@1
    oneIsNaN_uid41_fpMinTest_a <= exc_N_uid18_fpMinTest_q;
    oneIsNaN_uid41_fpMinTest_b <= exc_N_uid35_fpMinTest_q;
    oneIsNaN_uid41_fpMinTest_q <= oneIsNaN_uid41_fpMinTest_a xor oneIsNaN_uid41_fpMinTest_b;

    -- nanOut_uid40_fpMinTest(LOGICAL,39)@1
    nanOut_uid40_fpMinTest_a <= exc_N_uid18_fpMinTest_q;
    nanOut_uid40_fpMinTest_b <= exc_N_uid35_fpMinTest_q;
    nanOut_uid40_fpMinTest_q <= nanOut_uid40_fpMinTest_a and nanOut_uid40_fpMinTest_b;

    -- join_uid65_fpMinTest(BITJOIN,64)@1
    join_uid65_fpMinTest_q <= oneIsNaN_uid41_fpMinTest_q & nanOut_uid40_fpMinTest_q;

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- rPostNaN_uid72_fpMinTest(MUX,71)@1
    rPostNaN_uid72_fpMinTest_s <= join_uid65_fpMinTest_q;
    rPostNaN_uid72_fpMinTest: PROCESS (rPostNaN_uid72_fpMinTest_s, r_uid64_fpMinTest_q, join_uid68_fpMinTest_q, oneNaNOutput_uid46_fpMinTest_q)
    BEGIN
        CASE (rPostNaN_uid72_fpMinTest_s) IS
            WHEN "00" => rPostNaN_uid72_fpMinTest_q <= r_uid64_fpMinTest_q;
            WHEN "01" => rPostNaN_uid72_fpMinTest_q <= join_uid68_fpMinTest_q;
            WHEN "10" => rPostNaN_uid72_fpMinTest_q <= oneNaNOutput_uid46_fpMinTest_q;
            WHEN "11" => rPostNaN_uid72_fpMinTest_q <= join_uid68_fpMinTest_q;
            WHEN OTHERS => rPostNaN_uid72_fpMinTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- xOut(GPOUT,4)@1
    q <= rPostNaN_uid72_fpMinTest_q;

END normal;
