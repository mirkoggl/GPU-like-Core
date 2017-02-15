----------------------------------------------------------------------------------
-- Company: 
-- Author: 	Mirko Gagliardi
-- 
-- Create Date:    29/04/2015
-- Design Name: 
-- Module Name:    UpdateVect - rtl 
-- Project Name: 	 Streaming Multiprocessor	
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 	 
--
-- Revision: v 1.1
-- Revision 0.01 - File Created
-- Additional Comments: 
--								UpdateVect gets in input the two collision vectors and the last scheduled operation
--								and it updates the vectors. 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

library work;
use work.fpupack.all;

entity UpdateVect is
	Port(
			clk   : in std_logic;
			reset : in std_logic;
			en    : in std_logic;
			MuxCollVector_in : in std_logic_vector (MAX_LATENCY-1 downto 0);
			AdderCollVect_in : in  std_logic_vector (MULT_LAT_S downto 0);
			LastOp : in std_logic_vector(SEL_NUM-1 downto 0);
			MuxCollVector_out : out std_logic_vector (MAX_LATENCY-1 downto 0);
			AdderCollVect_out : out  std_logic_vector (MULT_LAT_S downto 0)
		);	
end entity;

architecture rtl of UpdateVect is
		
begin
			
	VectorUpdate : process(clk, reset)
		begin
			if reset = '1' then
					MuxCollVector_out <= (others => '0');
					AdderCollVect_out <= (others => '0');
			elsif rising_edge(clk) then 
				if en = '1' then
					if LastOp = NOP then
							MuxCollVector_out <= '0' & MuxCollVector_in(MAX_LATENCY-1 downto 1);
							AdderCollVect_out <= '0' & AdderCollVect_in(MULT_LAT_S downto 1);
						else
							MuxCollVector_out <= ('0' & MuxCollVector_in(MAX_LATENCY-1 downto 1)) or CollVectRom(conv_integer(LastOp));
							-- Controllo su ADD e FMA
							if LastOp = FMA_OP then
								AdderCollVect_out <= '1' & AdderCollVect_in(MULT_LAT_S downto 1);		
							else 
								AdderCollVect_out <= '0' & AdderCollVect_in(MULT_LAT_S downto 1);
							end if;
					end if;
				end if;	
			end if;
	end process;

end rtl;