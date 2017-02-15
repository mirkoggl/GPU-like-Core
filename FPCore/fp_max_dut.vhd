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

-- VHDL created from fp_max_dut
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
entity fp_max_dut is
    port (
        max_in1 : in std_logic_vector(31 downto 0);  -- float32_m23
        max_in2 : in std_logic_vector(31 downto 0);  -- float32_m23
        max_out : out std_logic_vector(31 downto 0);  -- float32_m23
        clk : in std_logic;
        areset : in std_logic
    );
end fp_max_dut;

architecture normal of fp_max_dut is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    -- fp_max_dut_prim component declaration
    -- inputs
    --  in_1_data_x <= max_in1, width=32, real=1
    --  in_2_data1_x <= max_in2, width=32, real=1
    -- outputs
    --  out_1_dout_x => prim_out_1_dout_x, width=32, real=1
    component fp_max_dut_prim is
        port (
            in_1_data_x : in std_logic_vector(31 downto 0);
            in_2_data1_x : in std_logic_vector(31 downto 0);
            out_1_dout_x : out std_logic_vector(31 downto 0);
            clk : in std_logic;
            areset : in std_logic
        );
    end component;


    signal prim_in_1_data_x : STD_LOGIC_VECTOR (31 downto 0);
    signal prim_in_2_data1_x : STD_LOGIC_VECTOR (31 downto 0);
    signal prim_out_1_dout_x : STD_LOGIC_VECTOR (31 downto 0);

begin


    -- GND(CONSTANT,0)

    -- VCC(CONSTANT,1)

    -- max_in2(GPIN,3)

    -- max_in1(GPIN,2)

    -- prim(BLACKBOX,5)
    prim_in_1_data_x <= max_in1;
    prim_in_2_data1_x <= max_in2;
    theprim : fp_max_dut_prim
    PORT MAP (
        in_1_data_x => prim_in_1_data_x,
        in_2_data1_x => prim_in_2_data1_x,
        out_1_dout_x => prim_out_1_dout_x,
        clk => clk,
        areset => areset
    );

    -- max_out(GPOUT,4)
    max_out <= prim_out_1_dout_x;

END normal;
