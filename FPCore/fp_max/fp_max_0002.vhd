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

-- VHDL created from fp_max_0002
-- VHDL created on Sat Apr 18 16:06:22 2015


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

entity fp_max_0002 is
    port (
        a : in std_logic_vector(31 downto 0);  -- float32_m23
        b : in std_logic_vector(31 downto 0);  -- float32_m23
        q : out std_logic_vector(31 downto 0);  -- float32_m23
        clk : in std_logic;
        areset : in std_logic
    );
end fp_max_0002;

architecture normal of fp_max_0002 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal cstAllOWE_uid6_fpMaxTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal cstOneWF_uid7_fpMaxTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal expXIsMax_uid12_fpMaxTest_a : STD_LOGIC_VECTOR (7 downto 0);
    signal expXIsMax_uid12_fpMaxTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal expXIsMax_uid12_fpMaxTest_q_i : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid12_fpMaxTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvFracXIsZero_uid17_fpMaxTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal InvFracXIsZero_uid17_fpMaxTest_q_i : STD_LOGIC_VECTOR (0 downto 0);
    signal InvFracXIsZero_uid17_fpMaxTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid29_fpMaxTest_a : STD_LOGIC_VECTOR (7 downto 0);
    signal expXIsMax_uid29_fpMaxTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal expXIsMax_uid29_fpMaxTest_q_i : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid29_fpMaxTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvFracXIsZero_uid34_fpMaxTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal InvFracXIsZero_uid34_fpMaxTest_q_i : STD_LOGIC_VECTOR (0 downto 0);
    signal InvFracXIsZero_uid34_fpMaxTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal efxGTefy_uid55_fpMaxTest_a : STD_LOGIC_VECTOR (33 downto 0);
    signal efxGTefy_uid55_fpMaxTest_b : STD_LOGIC_VECTOR (33 downto 0);
    signal efxGTefy_uid55_fpMaxTest_o : STD_LOGIC_VECTOR (33 downto 0);
    signal efxGTefy_uid55_fpMaxTest_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal efxGTefy_uid55_fpMaxTest_c : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal join_uid68_fpMaxTest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal exc_N_uid18_fpMaxTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal exc_N_uid18_fpMaxTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal exc_N_uid18_fpMaxTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal exc_N_uid35_fpMaxTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal exc_N_uid35_fpMaxTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal exc_N_uid35_fpMaxTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal nanOut_uid40_fpMaxTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal nanOut_uid40_fpMaxTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal nanOut_uid40_fpMaxTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal oneIsNaN_uid41_fpMaxTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal oneIsNaN_uid41_fpMaxTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal oneIsNaN_uid41_fpMaxTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExc_N_uid42_fpMaxTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExc_N_uid42_fpMaxTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal yNotNaN_uid43_fpMaxTest_a : STD_LOGIC_VECTOR (31 downto 0);
    signal yNotNaN_uid43_fpMaxTest_b : STD_LOGIC_VECTOR (31 downto 0);
    signal yNotNaN_uid43_fpMaxTest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal InvExc_N_uid44_fpMaxTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExc_N_uid44_fpMaxTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal xNotNaN_uid45_fpMaxTest_a : STD_LOGIC_VECTOR (31 downto 0);
    signal xNotNaN_uid45_fpMaxTest_b : STD_LOGIC_VECTOR (31 downto 0);
    signal xNotNaN_uid45_fpMaxTest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal oneNaNOutput_uid46_fpMaxTest_a : STD_LOGIC_VECTOR (31 downto 0);
    signal oneNaNOutput_uid46_fpMaxTest_b : STD_LOGIC_VECTOR (31 downto 0);
    signal oneNaNOutput_uid46_fpMaxTest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal InvEfxGTefy_uid56_fpMaxTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal InvEfxGTefy_uid56_fpMaxTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal exp_uid11_fpMaxTest_in : STD_LOGIC_VECTOR (31 downto 0);
    signal exp_uid11_fpMaxTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal frac_uid13_fpMaxTest_in : STD_LOGIC_VECTOR (31 downto 0);
    signal frac_uid13_fpMaxTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal exp_uid28_fpMaxTest_in : STD_LOGIC_VECTOR (31 downto 0);
    signal exp_uid28_fpMaxTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal frac_uid30_fpMaxTest_in : STD_LOGIC_VECTOR (31 downto 0);
    signal frac_uid30_fpMaxTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal fracXIsNotZero_uid14_fpMaxTest_a : STD_LOGIC_VECTOR (25 downto 0);
    signal fracXIsNotZero_uid14_fpMaxTest_b : STD_LOGIC_VECTOR (25 downto 0);
    signal fracXIsNotZero_uid14_fpMaxTest_o : STD_LOGIC_VECTOR (25 downto 0);
    signal fracXIsNotZero_uid14_fpMaxTest_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid14_fpMaxTest_n : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid31_fpMaxTest_a : STD_LOGIC_VECTOR (25 downto 0);
    signal fracXIsNotZero_uid31_fpMaxTest_b : STD_LOGIC_VECTOR (25 downto 0);
    signal fracXIsNotZero_uid31_fpMaxTest_o : STD_LOGIC_VECTOR (25 downto 0);
    signal fracXIsNotZero_uid31_fpMaxTest_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid31_fpMaxTest_n : STD_LOGIC_VECTOR (0 downto 0);
    signal X31_uid53_fpMaxTest_in : STD_LOGIC_VECTOR (31 downto 0);
    signal X31_uid53_fpMaxTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal Y31_uid54_fpMaxTest_in : STD_LOGIC_VECTOR (31 downto 0);
    signal Y31_uid54_fpMaxTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal join_uid65_fpMaxTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal xNegyNegYGTX_uid57_fpMaxTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal xNegyNegYGTX_uid57_fpMaxTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal xNegyNegYGTX_uid57_fpMaxTest_c : STD_LOGIC_VECTOR (0 downto 0);
    signal xNegyNegYGTX_uid57_fpMaxTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracX_uid49_fpMaxTest_q : STD_LOGIC_VECTOR (30 downto 0);
    signal expFracY_uid52_fpMaxTest_q : STD_LOGIC_VECTOR (30 downto 0);
    signal fracXIsZero_uid15_fpMaxTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid15_fpMaxTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid32_fpMaxTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid32_fpMaxTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvX31_uid59_fpMaxTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal InvX31_uid59_fpMaxTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvY31_uid58_fpMaxTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal InvY31_uid58_fpMaxTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal xPosYNeg_uid62_fpMaxTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal xPosYNeg_uid62_fpMaxTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal xPosYNeg_uid62_fpMaxTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal xPosyPosXGtY_uid60_fpMaxTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal xPosyPosXGtY_uid60_fpMaxTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal xPosyPosXGtY_uid60_fpMaxTest_c : STD_LOGIC_VECTOR (0 downto 0);
    signal xPosyPosXGtY_uid60_fpMaxTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal selX_uid63_fpMaxTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal selX_uid63_fpMaxTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal selX_uid63_fpMaxTest_c : STD_LOGIC_VECTOR (0 downto 0);
    signal selX_uid63_fpMaxTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal r_uid64_fpMaxTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal r_uid64_fpMaxTest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal rPostNaN_uid72_fpMaxTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rPostNaN_uid72_fpMaxTest_q : STD_LOGIC_VECTOR (31 downto 0);

begin


    -- xIn(GPIN,3)@0

    -- redist1(DELAY,74)
    redist1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1 )
    PORT MAP ( xin => b, xout => redist1_q, clk => clk, aclr => areset );

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- cstOneWF_uid7_fpMaxTest(CONSTANT,6)
    cstOneWF_uid7_fpMaxTest_q <= "00000000000000000000001";

    -- frac_uid30_fpMaxTest(BITSELECT,29)@0
    frac_uid30_fpMaxTest_in <= b;
    frac_uid30_fpMaxTest_b <= frac_uid30_fpMaxTest_in(22 downto 0);

    -- fracXIsNotZero_uid31_fpMaxTest(COMPARE,30)@0
    fracXIsNotZero_uid31_fpMaxTest_cin <= GND_q;
    fracXIsNotZero_uid31_fpMaxTest_a <= STD_LOGIC_VECTOR("00" & frac_uid30_fpMaxTest_b) & '0';
    fracXIsNotZero_uid31_fpMaxTest_b <= STD_LOGIC_VECTOR("00" & cstOneWF_uid7_fpMaxTest_q) & fracXIsNotZero_uid31_fpMaxTest_cin(0);
    fracXIsNotZero_uid31_fpMaxTest_o <= STD_LOGIC_VECTOR(UNSIGNED(fracXIsNotZero_uid31_fpMaxTest_a) - UNSIGNED(fracXIsNotZero_uid31_fpMaxTest_b));
    fracXIsNotZero_uid31_fpMaxTest_n(0) <= not (fracXIsNotZero_uid31_fpMaxTest_o(25));

    -- fracXIsZero_uid32_fpMaxTest(LOGICAL,31)@0
    fracXIsZero_uid32_fpMaxTest_a <= fracXIsNotZero_uid31_fpMaxTest_n;
    fracXIsZero_uid32_fpMaxTest_q <= not (fracXIsZero_uid32_fpMaxTest_a);

    -- InvFracXIsZero_uid34_fpMaxTest(LOGICAL,33)@0
    InvFracXIsZero_uid34_fpMaxTest_a <= fracXIsZero_uid32_fpMaxTest_q;
    InvFracXIsZero_uid34_fpMaxTest_q_i <= not (InvFracXIsZero_uid34_fpMaxTest_a);
    InvFracXIsZero_uid34_fpMaxTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => InvFracXIsZero_uid34_fpMaxTest_q_i, xout => InvFracXIsZero_uid34_fpMaxTest_q, clk => clk, aclr => areset );

    -- cstAllOWE_uid6_fpMaxTest(CONSTANT,5)
    cstAllOWE_uid6_fpMaxTest_q <= "11111111";

    -- exp_uid28_fpMaxTest(BITSELECT,27)@0
    exp_uid28_fpMaxTest_in <= b;
    exp_uid28_fpMaxTest_b <= exp_uid28_fpMaxTest_in(30 downto 23);

    -- expXIsMax_uid29_fpMaxTest(LOGICAL,28)@0
    expXIsMax_uid29_fpMaxTest_a <= exp_uid28_fpMaxTest_b;
    expXIsMax_uid29_fpMaxTest_b <= cstAllOWE_uid6_fpMaxTest_q;
    expXIsMax_uid29_fpMaxTest_q_i <= "1" WHEN expXIsMax_uid29_fpMaxTest_a = expXIsMax_uid29_fpMaxTest_b ELSE "0";
    expXIsMax_uid29_fpMaxTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => expXIsMax_uid29_fpMaxTest_q_i, xout => expXIsMax_uid29_fpMaxTest_q, clk => clk, aclr => areset );

    -- exc_N_uid35_fpMaxTest(LOGICAL,34)@1
    exc_N_uid35_fpMaxTest_a <= expXIsMax_uid29_fpMaxTest_q;
    exc_N_uid35_fpMaxTest_b <= InvFracXIsZero_uid34_fpMaxTest_q;
    exc_N_uid35_fpMaxTest_q <= exc_N_uid35_fpMaxTest_a and exc_N_uid35_fpMaxTest_b;

    -- InvExc_N_uid42_fpMaxTest(LOGICAL,41)@1
    InvExc_N_uid42_fpMaxTest_a <= exc_N_uid35_fpMaxTest_q;
    InvExc_N_uid42_fpMaxTest_q <= not (InvExc_N_uid42_fpMaxTest_a);

    -- yNotNaN_uid43_fpMaxTest(LOGICAL,42)@1
    yNotNaN_uid43_fpMaxTest_a <= STD_LOGIC_VECTOR((31 downto 1 => InvExc_N_uid42_fpMaxTest_q(0)) & InvExc_N_uid42_fpMaxTest_q);
    yNotNaN_uid43_fpMaxTest_b <= redist1_q;
    yNotNaN_uid43_fpMaxTest_q <= yNotNaN_uid43_fpMaxTest_a and yNotNaN_uid43_fpMaxTest_b;

    -- redist0(DELAY,73)
    redist0 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1 )
    PORT MAP ( xin => a, xout => redist0_q, clk => clk, aclr => areset );

    -- frac_uid13_fpMaxTest(BITSELECT,12)@0
    frac_uid13_fpMaxTest_in <= a;
    frac_uid13_fpMaxTest_b <= frac_uid13_fpMaxTest_in(22 downto 0);

    -- fracXIsNotZero_uid14_fpMaxTest(COMPARE,13)@0
    fracXIsNotZero_uid14_fpMaxTest_cin <= GND_q;
    fracXIsNotZero_uid14_fpMaxTest_a <= STD_LOGIC_VECTOR("00" & frac_uid13_fpMaxTest_b) & '0';
    fracXIsNotZero_uid14_fpMaxTest_b <= STD_LOGIC_VECTOR("00" & cstOneWF_uid7_fpMaxTest_q) & fracXIsNotZero_uid14_fpMaxTest_cin(0);
    fracXIsNotZero_uid14_fpMaxTest_o <= STD_LOGIC_VECTOR(UNSIGNED(fracXIsNotZero_uid14_fpMaxTest_a) - UNSIGNED(fracXIsNotZero_uid14_fpMaxTest_b));
    fracXIsNotZero_uid14_fpMaxTest_n(0) <= not (fracXIsNotZero_uid14_fpMaxTest_o(25));

    -- fracXIsZero_uid15_fpMaxTest(LOGICAL,14)@0
    fracXIsZero_uid15_fpMaxTest_a <= fracXIsNotZero_uid14_fpMaxTest_n;
    fracXIsZero_uid15_fpMaxTest_q <= not (fracXIsZero_uid15_fpMaxTest_a);

    -- InvFracXIsZero_uid17_fpMaxTest(LOGICAL,16)@0
    InvFracXIsZero_uid17_fpMaxTest_a <= fracXIsZero_uid15_fpMaxTest_q;
    InvFracXIsZero_uid17_fpMaxTest_q_i <= not (InvFracXIsZero_uid17_fpMaxTest_a);
    InvFracXIsZero_uid17_fpMaxTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => InvFracXIsZero_uid17_fpMaxTest_q_i, xout => InvFracXIsZero_uid17_fpMaxTest_q, clk => clk, aclr => areset );

    -- exp_uid11_fpMaxTest(BITSELECT,10)@0
    exp_uid11_fpMaxTest_in <= a;
    exp_uid11_fpMaxTest_b <= exp_uid11_fpMaxTest_in(30 downto 23);

    -- expXIsMax_uid12_fpMaxTest(LOGICAL,11)@0
    expXIsMax_uid12_fpMaxTest_a <= exp_uid11_fpMaxTest_b;
    expXIsMax_uid12_fpMaxTest_b <= cstAllOWE_uid6_fpMaxTest_q;
    expXIsMax_uid12_fpMaxTest_q_i <= "1" WHEN expXIsMax_uid12_fpMaxTest_a = expXIsMax_uid12_fpMaxTest_b ELSE "0";
    expXIsMax_uid12_fpMaxTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => expXIsMax_uid12_fpMaxTest_q_i, xout => expXIsMax_uid12_fpMaxTest_q, clk => clk, aclr => areset );

    -- exc_N_uid18_fpMaxTest(LOGICAL,17)@1
    exc_N_uid18_fpMaxTest_a <= expXIsMax_uid12_fpMaxTest_q;
    exc_N_uid18_fpMaxTest_b <= InvFracXIsZero_uid17_fpMaxTest_q;
    exc_N_uid18_fpMaxTest_q <= exc_N_uid18_fpMaxTest_a and exc_N_uid18_fpMaxTest_b;

    -- InvExc_N_uid44_fpMaxTest(LOGICAL,43)@1
    InvExc_N_uid44_fpMaxTest_a <= exc_N_uid18_fpMaxTest_q;
    InvExc_N_uid44_fpMaxTest_q <= not (InvExc_N_uid44_fpMaxTest_a);

    -- xNotNaN_uid45_fpMaxTest(LOGICAL,44)@1
    xNotNaN_uid45_fpMaxTest_a <= STD_LOGIC_VECTOR((31 downto 1 => InvExc_N_uid44_fpMaxTest_q(0)) & InvExc_N_uid44_fpMaxTest_q);
    xNotNaN_uid45_fpMaxTest_b <= redist0_q;
    xNotNaN_uid45_fpMaxTest_q <= xNotNaN_uid45_fpMaxTest_a and xNotNaN_uid45_fpMaxTest_b;

    -- oneNaNOutput_uid46_fpMaxTest(LOGICAL,45)@1
    oneNaNOutput_uid46_fpMaxTest_a <= xNotNaN_uid45_fpMaxTest_q;
    oneNaNOutput_uid46_fpMaxTest_b <= yNotNaN_uid43_fpMaxTest_q;
    oneNaNOutput_uid46_fpMaxTest_q <= oneNaNOutput_uid46_fpMaxTest_a or oneNaNOutput_uid46_fpMaxTest_b;

    -- join_uid68_fpMaxTest(BITJOIN,67)@1
    join_uid68_fpMaxTest_q <= GND_q & cstAllOWE_uid6_fpMaxTest_q & cstOneWF_uid7_fpMaxTest_q;

    -- expFracX_uid49_fpMaxTest(BITJOIN,48)@0
    expFracX_uid49_fpMaxTest_q <= exp_uid11_fpMaxTest_b & frac_uid13_fpMaxTest_b;

    -- expFracY_uid52_fpMaxTest(BITJOIN,51)@0
    expFracY_uid52_fpMaxTest_q <= exp_uid28_fpMaxTest_b & frac_uid30_fpMaxTest_b;

    -- efxGTefy_uid55_fpMaxTest(COMPARE,54)@0
    efxGTefy_uid55_fpMaxTest_cin <= GND_q;
    efxGTefy_uid55_fpMaxTest_a <= STD_LOGIC_VECTOR("00" & expFracY_uid52_fpMaxTest_q) & '0';
    efxGTefy_uid55_fpMaxTest_b <= STD_LOGIC_VECTOR("00" & expFracX_uid49_fpMaxTest_q) & efxGTefy_uid55_fpMaxTest_cin(0);
    efxGTefy_uid55_fpMaxTest: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            efxGTefy_uid55_fpMaxTest_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            efxGTefy_uid55_fpMaxTest_o <= STD_LOGIC_VECTOR(UNSIGNED(efxGTefy_uid55_fpMaxTest_a) - UNSIGNED(efxGTefy_uid55_fpMaxTest_b));
        END IF;
    END PROCESS;
    efxGTefy_uid55_fpMaxTest_c(0) <= efxGTefy_uid55_fpMaxTest_o(33);

    -- InvEfxGTefy_uid56_fpMaxTest(LOGICAL,55)@1
    InvEfxGTefy_uid56_fpMaxTest_a <= efxGTefy_uid55_fpMaxTest_c;
    InvEfxGTefy_uid56_fpMaxTest_q <= not (InvEfxGTefy_uid56_fpMaxTest_a);

    -- Y31_uid54_fpMaxTest(BITSELECT,53)@1
    Y31_uid54_fpMaxTest_in <= STD_LOGIC_VECTOR(redist1_q);
    Y31_uid54_fpMaxTest_b <= Y31_uid54_fpMaxTest_in(31 downto 31);

    -- X31_uid53_fpMaxTest(BITSELECT,52)@1
    X31_uid53_fpMaxTest_in <= STD_LOGIC_VECTOR(redist0_q);
    X31_uid53_fpMaxTest_b <= X31_uid53_fpMaxTest_in(31 downto 31);

    -- xNegyNegYGTX_uid57_fpMaxTest(LOGICAL,56)@1
    xNegyNegYGTX_uid57_fpMaxTest_a <= X31_uid53_fpMaxTest_b;
    xNegyNegYGTX_uid57_fpMaxTest_b <= Y31_uid54_fpMaxTest_b;
    xNegyNegYGTX_uid57_fpMaxTest_c <= InvEfxGTefy_uid56_fpMaxTest_q;
    xNegyNegYGTX_uid57_fpMaxTest_q <= xNegyNegYGTX_uid57_fpMaxTest_a and xNegyNegYGTX_uid57_fpMaxTest_b and xNegyNegYGTX_uid57_fpMaxTest_c;

    -- InvY31_uid58_fpMaxTest(LOGICAL,57)@1
    InvY31_uid58_fpMaxTest_a <= Y31_uid54_fpMaxTest_b;
    InvY31_uid58_fpMaxTest_q <= not (InvY31_uid58_fpMaxTest_a);

    -- InvX31_uid59_fpMaxTest(LOGICAL,58)@1
    InvX31_uid59_fpMaxTest_a <= X31_uid53_fpMaxTest_b;
    InvX31_uid59_fpMaxTest_q <= not (InvX31_uid59_fpMaxTest_a);

    -- xPosyPosXGtY_uid60_fpMaxTest(LOGICAL,59)@1
    xPosyPosXGtY_uid60_fpMaxTest_a <= InvX31_uid59_fpMaxTest_q;
    xPosyPosXGtY_uid60_fpMaxTest_b <= InvY31_uid58_fpMaxTest_q;
    xPosyPosXGtY_uid60_fpMaxTest_c <= efxGTefy_uid55_fpMaxTest_c;
    xPosyPosXGtY_uid60_fpMaxTest_q <= xPosyPosXGtY_uid60_fpMaxTest_a and xPosyPosXGtY_uid60_fpMaxTest_b and xPosyPosXGtY_uid60_fpMaxTest_c;

    -- xPosYNeg_uid62_fpMaxTest(LOGICAL,61)@1
    xPosYNeg_uid62_fpMaxTest_a <= InvX31_uid59_fpMaxTest_q;
    xPosYNeg_uid62_fpMaxTest_b <= Y31_uid54_fpMaxTest_b;
    xPosYNeg_uid62_fpMaxTest_q <= xPosYNeg_uid62_fpMaxTest_a and xPosYNeg_uid62_fpMaxTest_b;

    -- selX_uid63_fpMaxTest(LOGICAL,62)@1
    selX_uid63_fpMaxTest_a <= xPosYNeg_uid62_fpMaxTest_q;
    selX_uid63_fpMaxTest_b <= xPosyPosXGtY_uid60_fpMaxTest_q;
    selX_uid63_fpMaxTest_c <= xNegyNegYGTX_uid57_fpMaxTest_q;
    selX_uid63_fpMaxTest_q <= selX_uid63_fpMaxTest_a or selX_uid63_fpMaxTest_b or selX_uid63_fpMaxTest_c;

    -- r_uid64_fpMaxTest(MUX,63)@1
    r_uid64_fpMaxTest_s <= selX_uid63_fpMaxTest_q;
    r_uid64_fpMaxTest: PROCESS (r_uid64_fpMaxTest_s, redist1_q, redist0_q)
    BEGIN
        CASE (r_uid64_fpMaxTest_s) IS
            WHEN "0" => r_uid64_fpMaxTest_q <= redist1_q;
            WHEN "1" => r_uid64_fpMaxTest_q <= redist0_q;
            WHEN OTHERS => r_uid64_fpMaxTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- oneIsNaN_uid41_fpMaxTest(LOGICAL,40)@1
    oneIsNaN_uid41_fpMaxTest_a <= exc_N_uid18_fpMaxTest_q;
    oneIsNaN_uid41_fpMaxTest_b <= exc_N_uid35_fpMaxTest_q;
    oneIsNaN_uid41_fpMaxTest_q <= oneIsNaN_uid41_fpMaxTest_a xor oneIsNaN_uid41_fpMaxTest_b;

    -- nanOut_uid40_fpMaxTest(LOGICAL,39)@1
    nanOut_uid40_fpMaxTest_a <= exc_N_uid18_fpMaxTest_q;
    nanOut_uid40_fpMaxTest_b <= exc_N_uid35_fpMaxTest_q;
    nanOut_uid40_fpMaxTest_q <= nanOut_uid40_fpMaxTest_a and nanOut_uid40_fpMaxTest_b;

    -- join_uid65_fpMaxTest(BITJOIN,64)@1
    join_uid65_fpMaxTest_q <= oneIsNaN_uid41_fpMaxTest_q & nanOut_uid40_fpMaxTest_q;

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- rPostNaN_uid72_fpMaxTest(MUX,71)@1
    rPostNaN_uid72_fpMaxTest_s <= join_uid65_fpMaxTest_q;
    rPostNaN_uid72_fpMaxTest: PROCESS (rPostNaN_uid72_fpMaxTest_s, r_uid64_fpMaxTest_q, join_uid68_fpMaxTest_q, oneNaNOutput_uid46_fpMaxTest_q)
    BEGIN
        CASE (rPostNaN_uid72_fpMaxTest_s) IS
            WHEN "00" => rPostNaN_uid72_fpMaxTest_q <= r_uid64_fpMaxTest_q;
            WHEN "01" => rPostNaN_uid72_fpMaxTest_q <= join_uid68_fpMaxTest_q;
            WHEN "10" => rPostNaN_uid72_fpMaxTest_q <= oneNaNOutput_uid46_fpMaxTest_q;
            WHEN "11" => rPostNaN_uid72_fpMaxTest_q <= join_uid68_fpMaxTest_q;
            WHEN OTHERS => rPostNaN_uid72_fpMaxTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- xOut(GPOUT,4)@1
    q <= rPostNaN_uid72_fpMaxTest_q;

END normal;
