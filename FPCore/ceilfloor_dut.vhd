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

-- VHDL created from ceilfloor_dut
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
entity ceilfloor_dut is
    port (
        ceil_in : in std_logic_vector(31 downto 0);  -- float32_m23
        floor_in : in std_logic_vector(31 downto 0);  -- float32_m23
        ceil_out : out std_logic_vector(31 downto 0);  -- float32_m23
        floor_out : out std_logic_vector(31 downto 0);  -- float32_m23
        clk : in std_logic;
        areset : in std_logic
    );
end ceilfloor_dut;

architecture normal of ceilfloor_dut is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    -- ceilfloor_dut_prim component declaration
    -- inputs
    --  in_1_ceil_in_x <= ceil_in, width=32, real=1
    --  in_2_floor_in_x <= floor_in, width=32, real=1
    -- outputs
    --  out_1_ceil_out_x => prim_out_1_ceil_out_x, width=32, real=1
    --  out_2_floor_out_x => prim_out_2_floor_out_x, width=32, real=1
    component ceilfloor_dut_prim is
        port (
            in_1_ceil_in_x : in std_logic_vector(31 downto 0);
            in_2_floor_in_x : in std_logic_vector(31 downto 0);
            out_1_ceil_out_x : out std_logic_vector(31 downto 0);
            out_2_floor_out_x : out std_logic_vector(31 downto 0);
            clk : in std_logic;
            areset : in std_logic
        );
    end component;


    signal prim_in_1_ceil_in_x : STD_LOGIC_VECTOR (31 downto 0);
    signal prim_in_2_floor_in_x : STD_LOGIC_VECTOR (31 downto 0);
    signal prim_out_1_ceil_out_x : STD_LOGIC_VECTOR (31 downto 0);
    signal prim_out_2_floor_out_x : STD_LOGIC_VECTOR (31 downto 0);

begin


    -- GND(CONSTANT,0)

    -- VCC(CONSTANT,1)

    -- floor_in(GPIN,3)

    -- ceil_in(GPIN,2)

    -- prim(BLACKBOX,6)
    prim_in_1_ceil_in_x <= ceil_in;
    prim_in_2_floor_in_x <= floor_in;
    theprim : ceilfloor_dut_prim
    PORT MAP (
        in_1_ceil_in_x => prim_in_1_ceil_in_x,
        in_2_floor_in_x => prim_in_2_floor_in_x,
        out_1_ceil_out_x => prim_out_1_ceil_out_x,
        out_2_floor_out_x => prim_out_2_floor_out_x,
        clk => clk,
        areset => areset
    );

    -- ceil_out(GPOUT,4)
    ceil_out <= prim_out_1_ceil_out_x;

    -- floor_out(GPOUT,5)
    floor_out <= prim_out_2_floor_out_x;

END normal;
