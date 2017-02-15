----------------------------------------------------------------------------------
-- Company: 
-- Author: 	Mirko Gagliardi
-- 
-- Create Date:    12/05/2015
-- Design Name: 
-- Module Name:    IndexSelector - rtl 
-- Project Name: 	 Streaming Multiprocessor	
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 	 
--
-- Revision: v 1.3
-- Revision 0.01 - File Created
-- Additional Comments: 
--								IndexSelector chooses between two different indexes.
-- 
----------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_arith.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

library work;
use work.fpupack.all;

entity IndexSelector is
	Generic (
			N : integer := IND_SEL_DIM;
			M : integer := OP_QUEUE_IND
		);
	Port(
		 NopVect  : in std_logic_vector(N-1 downto 0);
		 GrantIn  : in ind_sel_in_type;
		 counter  : in integer;
		 NopOut		 : out std_logic;
		 CheckOut : out std_logic_vector(M-1 downto 0)
		);
end entity;

architecture rtl of IndexSelector is
	
	signal temp_out : std_logic_vector(M-1 downto 0) := (others => '0'); 
	signal ones_vector : std_logic_vector(N-1 downto 0) := (others => '1');
	
begin
	
	process (NopVect, GrantIn, counter)
	begin 
		if NopVect = "00" then
			if counter = 0 then
				CheckOut <= GrantIn(0);
			else
				CheckOut <= GrantIn(1);
			end if;
			NopOut <= '0';
		elsif NopVect = "10" then
			CheckOut <= GrantIn(1);
			NopOut <= '0';
		elsif NopVect = "01" then
			CheckOut <= GrantIn(0);
			NopOut <= '0';
		else
			CheckOut <= (others => '0');
			NopOut <= '1';
		end if;
	end process;
end rtl;