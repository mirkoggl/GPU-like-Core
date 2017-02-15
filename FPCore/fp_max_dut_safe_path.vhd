-- safe_path for fp_max_dut given rtl dir is ./rtl (quartus)
LIBRARY ieee;
USE ieee.std_logic_1164.all;

PACKAGE fp_max_dut_safe_path is
	FUNCTION safe_path( path: string ) RETURN string;
END fp_max_dut_safe_path;

PACKAGE body fp_max_dut_safe_path IS
	FUNCTION safe_path( path: string )
		RETURN string IS
	BEGIN
		return string'("./rtl/") & path;
	END FUNCTION safe_path;
END fp_max_dut_safe_path;
