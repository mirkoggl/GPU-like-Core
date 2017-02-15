----------------------------------------------------------------------------------
-- Company: 
-- Author: 	Mirko Gagliardi
-- 
-- Create Date:    27/05/2015
-- Design Name: 
-- Module Name:    Dispatcher - rtl 
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
--								The Dispatcher decodes the current operation and controls the FPU cores.
--
----------------------------------------------------------------------------------
library IEEE;
use ieee.numeric_std.all;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

library work;
use work.fpupack.all;

entity Dispatcher is
	PORT(
		reset	     : IN std_logic;
		en 	     : IN std_logic;
		clk	     : IN std_logic;
		NopIn		  : IN std_logic;
		op			  : IN std_logic_vector (SEL_NUM-1 DOWNTO 0);
		MuxOut     : OUT std_logic_vector (SEL_NUM-1 downto 0);
		EnOpOut    : OUT std_logic_vector (OP_NUM-1 DOWNTO 0)
	);
end entity;

architecture rtl of Dispatcher is

	COMPONENT VectorShifter
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
	
	COMPONENT OpDecoder 
		PORT(
			op		  : IN std_logic_vector (SEL_NUM-1 downto 0);
			OpMux : OUT std_logic_vector (SEL_NUM-1 downto 0);
			OpLat   : OUT std_logic_vector (QUEUE_LENGTH-1 downto 0);
			EnOp	  : OUT std_logic_vector (OP_NUM-1 DOWNTO 0)

		);
	END COMPONENT;
	
	signal DecOpMux, DecOpIn : std_logic_vector (SEL_NUM-1 downto 0) := (others => '0');
	signal DecOpLat : std_logic_vector (QUEUE_LENGTH-1 downto 0) := (others => '0');

begin


	MuxController : VectorShifter 
		GENERIC MAP(
			N => SEL_NUM, 
			M => QUEUE_LENGTH
		)
		PORT MAP(
			clk => clk,
			reset => reset,
			EnRd => en,
			EnWr => en,
			DataIn => DecOpMux,
			DataOut => MuxOut,
			WrAddr => DecOpLat
		);
		
	OpDecoder_inst : OpDecoder PORT MAP(
			op => DecOpIn,
			OpMux => DecOpMux,
			OpLat => DecOpLat,
			EnOp => EnOpOut
	);
	
	NopCheckProc : process(clk, reset)
		begin
			if reset = '1' then
					DecOpIn <= NOP;
			elsif rising_edge(clk) then 
				if en = '1' then
					if NopIn = '1' then
						DecOpIn <= NOP;
					else
						DecOpIn <= op;
					end if;	
				end if;
			end if;
	end process;

end rtl;