-- safe_path for ceilfloor_dut given rtl dir is ./rtl (quartus)
LIBRARY ieee;
USE ieee.std_logic_1164.all;

PACKAGE ceilfloor_dut_safe_path is
	FUNCTION safe_path( path: string ) RETURN string;
END ceilfloor_dut_safe_path;

PACKAGE body ceilfloor_dut_safe_path IS
	FUNCTION safe_path( path: string )
		RETURN string IS
	BEGIN
		return string'("./rtl/") & path;
	END FUNCTION safe_path;
END ceilfloor_dut_safe_path;
