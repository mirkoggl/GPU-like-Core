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

-- VHDL created from fp_max_dut_prim
-- VHDL created on Mon Apr 20 13:02:54 2015


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

USE work.fp_max_dut_safe_path.all;
entity fp_max_dut_prim is
    port (
        in_1_data_x : in std_logic_vector(31 downto 0);  -- float32_m23
        in_2_data1_x : in std_logic_vector(31 downto 0);  -- float32_m23
        out_1_dout_x : out std_logic_vector(31 downto 0);  -- float32_m23
        clk : in std_logic;
        areset : in std_logic
    );
end fp_max_dut_prim;

architecture normal of fp_max_dut_prim is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    -- floatComponent_fp_max_dut_prim_maxBlock_typeSFloat_23_8_typeSFloat_23_8_typeSFloA0Z4ge26154ge2a150m4e5u component declaration
    -- inputs
    --  in_0 <= in_1_data_x, width=32, real=1
    --  in_1 <= in_2_data1_x, width=32, real=1
    -- outputs
    --  out_primWireOut => MinMax_out_primWireOut, width=32, real=1
    component floatComponent_fp_max_dut_prim_maxBlock_typeSFloat_23_8_typeSFloat_23_8_typeSFloA0Z4ge26154ge2a150m4e5u is
        port (
            in_0 : in std_logic_vector(31 downto 0);
            in_1 : in std_logic_vector(31 downto 0);
            out_primWireOut : out std_logic_vector(31 downto 0);
            clk : in std_logic;
            areset : in std_logic
        );
    end component;


    signal MinMax_in_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal MinMax_in_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal MinMax_out_primWireOut : STD_LOGIC_VECTOR (31 downto 0);

begin


    -- GND(CONSTANT,0)

    -- VCC(CONSTANT,1)

    -- in_2_data1_x(GPIN,4)@0

    -- in_1_data_x(GPIN,3)@0

    -- MinMax(BLACKBOX,2)@0
    MinMax_in_0 <= in_1_data_x;
    MinMax_in_1 <= in_2_data1_x;
    theMinMax : floatComponent_fp_max_dut_prim_maxBlock_typeSFloat_23_8_typeSFloat_23_8_typeSFloA0Z4ge26154ge2a150m4e5u
    PORT MAP (
        in_0 => MinMax_in_0,
        in_1 => MinMax_in_1,
        out_primWireOut => MinMax_out_primWireOut,
        clk => clk,
        areset => areset
    );

    -- out_1_dout_x(GPOUT,5)@1
    out_1_dout_x <= MinMax_out_primWireOut;

END normal;
