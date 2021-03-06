-- megafunction wizard: %ALTFP_ABS%
-- GENERATION: STANDARD
-- VERSION: WM1.0
-- MODULE: ALTFP_ABS 

-- ============================================================
-- File Name: fp_abs.vhd
-- Megafunction Name(s):
-- 			ALTFP_ABS
--
-- Simulation Library Files(s):
-- 			
-- ============================================================
-- ************************************************************
-- THIS IS A WIZARD-GENERATED FILE. DO NOT EDIT THIS FILE!
--
-- 14.1.0 Build 186 12/03/2014 SJ Full Version
-- ************************************************************


--Copyright (C) 1991-2014 Altera Corporation. All rights reserved.
--Your use of Altera Corporation's design tools, logic functions 
--and other software and tools, and its AMPP partner logic 
--functions, and any output files from any of the foregoing 
--(including device programming or simulation files), and any 
--associated documentation or information are expressly subject 
--to the terms and conditions of the Altera Program License 
--Subscription Agreement, the Altera Quartus II License Agreement,
--the Altera MegaCore Function License Agreement, or other 
--applicable license agreement, including, without limitation, 
--that your use is for the sole purpose of programming logic 
--devices manufactured by Altera and sold by Altera or its 
--authorized distributors.  Please refer to the applicable 
--agreement for further details.


--altfp_abs CBX_AUTO_BLACKBOX="ALL" DEVICE_FAMILY="Cyclone V" PIPELINE=0 WIDTH_EXP=8 WIDTH_MAN=23 data result
--VERSION_BEGIN 14.1 cbx_altfp_abs 2014:12:03:18:04:04:SJ cbx_mgl 2014:12:03:18:06:09:SJ  VERSION_END

--synthesis_resources = 
 LIBRARY ieee;
 USE ieee.std_logic_1164.all;

 ENTITY  fp_abs_altfp_abs_fp9 IS 
	 PORT 
	 ( 
		 data	:	IN  STD_LOGIC_VECTOR (31 DOWNTO 0);
		 result	:	OUT  STD_LOGIC_VECTOR (31 DOWNTO 0)
	 ); 
 END fp_abs_altfp_abs_fp9;

 ARCHITECTURE RTL OF fp_abs_altfp_abs_fp9 IS

	 SIGNAL  data_w :	STD_LOGIC_VECTOR (31 DOWNTO 0);
	 SIGNAL  gnd_w :	STD_LOGIC;
 BEGIN

	data_w <= ( gnd_w & data(30 DOWNTO 0));
	gnd_w <= '0';
	result <= data_w;

 END RTL; --fp_abs_altfp_abs_fp9
--VALID FILE


LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY fp_abs IS
	PORT
	(
		data		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		result		: OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
	);
END fp_abs;


ARCHITECTURE RTL OF fp_abs IS

	SIGNAL sub_wire0	: STD_LOGIC_VECTOR (31 DOWNTO 0);



	COMPONENT fp_abs_altfp_abs_fp9
	PORT (
			data	: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
			result	: OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
	);
	END COMPONENT;

BEGIN
	result    <= sub_wire0(31 DOWNTO 0);

	fp_abs_altfp_abs_fp9_component : fp_abs_altfp_abs_fp9
	PORT MAP (
		data => data,
		result => sub_wire0
	);



END RTL;

-- ============================================================
-- CNX file retrieval info
-- ============================================================
-- Retrieval info: LIBRARY: altera_mf altera_mf.altera_mf_components.all
-- Retrieval info: PRIVATE: INTENDED_DEVICE_FAMILY STRING "Cyclone V"
-- Retrieval info: CONSTANT: INTENDED_DEVICE_FAMILY STRING "UNUSED"
-- Retrieval info: CONSTANT: LPM_HINT STRING "UNUSED"
-- Retrieval info: CONSTANT: LPM_TYPE STRING "altfp_abs"
-- Retrieval info: CONSTANT: PIPELINE NUMERIC "0"
-- Retrieval info: CONSTANT: WIDTH_EXP NUMERIC "8"
-- Retrieval info: CONSTANT: WIDTH_MAN NUMERIC "23"
-- Retrieval info: USED_PORT: data 0 0 32 0 INPUT NODEFVAL "data[31..0]"
-- Retrieval info: CONNECT: @data 0 0 32 0 data 0 0 32 0
-- Retrieval info: USED_PORT: result 0 0 32 0 OUTPUT NODEFVAL "result[31..0]"
-- Retrieval info: CONNECT: result 0 0 32 0 @result 0 0 32 0
-- Retrieval info: GEN_FILE: TYPE_NORMAL fp_abs.vhd TRUE FALSE
-- Retrieval info: GEN_FILE: TYPE_NORMAL fp_abs.qip TRUE FALSE
-- Retrieval info: GEN_FILE: TYPE_NORMAL fp_abs.bsf TRUE TRUE
-- Retrieval info: GEN_FILE: TYPE_NORMAL fp_abs_inst.vhd TRUE TRUE
-- Retrieval info: GEN_FILE: TYPE_NORMAL fp_abs.inc TRUE TRUE
-- Retrieval info: GEN_FILE: TYPE_NORMAL fp_abs.cmp TRUE TRUE
