-- safe_path for fp_min_dut given rtl dir is ./rtl (quartus)
LIBRARY ieee;
USE ieee.std_logic_1164.all;

PACKAGE fp_min_dut_safe_path is
	FUNCTION safe_path( path: string ) RETURN string;
END fp_min_dut_safe_path;

PACKAGE body fp_min_dut_safe_path IS
	FUNCTION safe_path( path: string )
		RETURN string IS
	BEGIN
		return string'("./rtl/") & path;
	END FUNCTION safe_path;
END fp_min_dut_safe_path;
