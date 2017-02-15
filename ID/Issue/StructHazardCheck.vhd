----------------------------------------------------------------------------------
-- Company: 
-- Author: 	Mirko Gagliardi
-- 
-- Create Date:    29/04/2015
-- Design Name: 
-- Module Name:    StructHazardCheck - rtl 
-- Project Name: 	 Streaming Multiprocessor	
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 	 
--
-- Revision: v 1.0
-- Revision 0.01 - File Created
-- Additional Comments: 
--								The Structural Hazard Check component checks if the operation in input generates a structural hazard if executed. 
--								The FPU cores are build by all fully pipelined operators, so there are no collision between different operations 
--								and there are no collisions between same operations scheduled in succession. Structural hazards may occur only on 
--								the output of each FPU cores when more operations wants simultaneously propagate their results at the WB stage.
--
--								MuxCollVector vector tracks when WB is busy. AdderCollVect tracks when floating-point adder is busy, FMA uses
--								adder after multiplier, so we need to track when adder is busy.
--
--								This component just checks the two vector, it does not update them. This is done by UpdateVect in Issue. 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

library work;
use work.fpupack.all;

entity StructHazardCheck is
	Port(
		clk 	: in std_logic;
		reset : in std_logic;
		en    : in std_logic;
		NoGrant : in std_logic;
		op	   : in std_logic_vector (SEL_NUM-1 DOWNTO 0);
		Ind   : in std_logic_vector(OP_QUEUE_IND-1 downto 0);
		MuxCollVector : in std_logic_vector (MAX_LATENCY-1 downto 0);
		AdderCollVect : in std_logic_vector (MULT_LAT_S downto 0);
		IndOut : out std_logic_vector(OP_QUEUE_IND-1 downto 0);
		GrantedOut : out std_logic
	);
end entity;

architecture rtl of StructHazardCheck is
	
	signal grant, no_grant_reg : std_logic := '0';

begin

   GrantedOut <= (not grant) or no_grant_reg;
	IndOut <= Ind;	
		
	CollisionVector : process(clk, reset)
		begin
			if reset = '1' then
					grant <= '0';
			elsif rising_edge(clk) then 
				if en = '1' then
					no_grant_reg <= NoGrant;
					if op /= NOP then
						if (('0' & MuxCollVector(MAX_LATENCY-1 downto 1)) or CollVectRom(conv_integer(op))) = ('0' & MuxCollVector(MAX_LATENCY-1 downto 1)) then 
							grant <= '0';
						-- Controllo su ADD e FMA
						elsif op = ADD_OP then 
							if AdderCollVect(0) = '1'  then 
								grant <= '0';
							else
								grant <= '1';
							end if;				
						else
							grant <= '1';
						end if;
					else 
						grant <= '0';
					end if;	
				else 
					grant <= '0';
				end if;
			end if;
	end process;

end rtl;