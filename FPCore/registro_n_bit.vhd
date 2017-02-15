----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:32:53 12/09/2012 
-- Design Name: 
-- Module Name:    registro_n_bit - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity registro_n_bit is
	 Generic (N : natural:=4);
    Port ( value_in : in  STD_LOGIC_VECTOR (N-1 downto 0);
           clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           en : in  STD_LOGIC;
           value_out : out  STD_LOGIC_VECTOR (N-1 downto 0));
end registro_n_bit;

architecture Behavioral of registro_n_bit is

begin

process(value_in,reset,en,clk)
	begin
		if(reset='1') then
			value_out<=(others=>'0');
		elsif(rising_edge(clk) and en='1') then
				value_out<=value_in;
		end if;
end process;

end Behavioral;

