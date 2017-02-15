----------------------------------------------------------------------------------
-- Company: 
-- Author: 	Mirko Gagliardi
-- 
-- Create Date:    30/06/2015
-- Design Name: 
-- Module Name:    RegWrContr - rtl 
-- Project Name: 	 Streaming Multiprocessor	
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 	 
--
-- Revision: v 2.0
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use ieee.numeric_std.all;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

library work;
use work.fpupack.all;

entity RegWrContr is
	 Generic (
			RegBlock_Addr_Length : natural := REG_BLOCK_ADDR_SP;
			RegBlock_Numb : natural := REG_BLOCK_ROW
		);
	PORT(
		clk	     : in std_logic;
		reset	     : in std_logic;
		en 	     : in std_logic;
		op			  : in std_logic_vector (SEL_NUM-1 DOWNTO 0);
		EnWr		  : in std_logic;
		RegAddrWr	: in std_logic_vector(RegBlock_Addr_Length-1 downto 0);
		WrEnVect	   : in std_logic_vector(RegBlock_Numb-1 downto 0);
		RegAddrWrOut	: out std_logic_vector(RegBlock_Addr_Length-1 downto 0);
		WrEnVectOut 	: out std_logic_vector(RegBlock_Numb-1 downto 0)
	);
end entity;

architecture rtl of RegWrContr is

	COMPONENT VectorShifterReg
		GENERIC (
			N : natural := 4;
			M : natural := 4
		);
		PORT (  
			clk     : in std_logic;
			reset   : in std_logic;
			EnRd    : in std_logic;   
			EnWr    : in std_logic;    
			DataOut : out std_logic_vector(N-1 downto 0);   
			DataIn  : in std_logic_vector (N-1 downto 0);   
			WrAddr  : in std_logic_vector (M-1 downto 0)  
		);
	END COMPONENT;
	
	signal DecOpMux, DecOpIn : std_logic_vector (SEL_NUM-1 downto 0) := (others => '0');
	signal DecOpLat : std_logic_vector (QUEUE_LENGTH-1 downto 0) := (others => '0');
	signal en_wr : std_logic := '0';

begin
	
	RegWrController : VectorShifterReg 
		GENERIC MAP(
			N => RegBlock_Addr_Length, 
			M => QUEUE_LENGTH
		)
		PORT MAP(
			clk => clk,
			reset => reset,
			EnRd => en,
			EnWr => en_wr,
			DataIn => RegAddrWr,
			DataOut => RegAddrWrOut,
			WrAddr => DecOpLat
		);
	
	EnWrController : VectorShifterReg 
		GENERIC MAP(
			N => RegBlock_Numb, 
			M => QUEUE_LENGTH
		)
		PORT MAP(
			clk => clk,
			reset => reset,
			EnRd => en,
			EnWr => en_wr,
			DataIn => WrEnVect,
			DataOut => WrEnVectOut,
			WrAddr => DecOpLat
		);
		
	en_wr <= not EnWr;
	
	RegContrProc : process(op) begin
		case op is
			when LOAD_OP =>
				DecOpLat <= LOAD_OP_LAT;
			
			when ADD_OP =>
				DecOpLat <= ADD_LAT_REG;
				
			when MULT_OP =>
				DecOpLat <= MULT_LAT_REG;
				
			when others =>
				DecOpLat <= (others => '1');
		end case;
	end process;

end rtl;