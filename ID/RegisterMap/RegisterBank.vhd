----------------------------------------------------------------------------------
-- Company: 
-- Author: 	Mirko Gagliardi
-- 
-- Create Date:    22/04/2015
-- Design Name: 
-- Module Name:    RegisterBank - rtl 
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
--
----------------------------------------------------------------------------------
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.numeric_std.all;

entity RegisterBank is
    generic(
        N:      natural := 32;  -- word width in bits
        M:      natural := 4    --  Address bits, number of words = 2**M 
    );
    port ( 
        clk		  : in   std_logic;
		  reset	  : in   std_logic;
        DataIn   : in   std_logic_vector (N-1 downto 0);
        RdAddrA  : in   std_logic_vector (M-1 downto 0);
        RdAddrB  : in   std_logic_vector (M-1 downto 0);
        WrAddr   : in   std_logic_vector (M-1 downto 0);
        ReadEnA  : in   std_logic;
        ReadEnB  : in   std_logic;
        WriteEn  : in   std_logic;
        DataOutA : out  std_logic_vector (N-1 downto 0);
        DataOutB : out  std_logic_vector (N-1 downto 0)
    ); 
end entity;

architecture behave of RegisterBank is

    type regfile_array is array (natural range 0 to 2**M-1) of std_logic_vector (N-1 downto 0);
    signal regfile: regfile_array := (others => (others => '0'));

begin
	
   ReadReg: process(clk) begin
        if rising_edge(clk) then
            if ReadEnA = '1' then
                DataOutA <= regfile(to_integer(unsigned(RdAddrA)));
            else
                DataOutA <= (others => '0');
            end if;
            if ReadEnB = '1' then
                DataOutB <= regfile(to_integer(unsigned(RdAddrB)));
            else
                DataOutB <= (others => '0');
            end if;
        end if;
    end process;
	 
	 
	 WriteReg: process(clk, reset) begin
		  if reset = '1' then
				regfile <= (others => (others => '0'));
        elsif rising_edge(clk) then
            if WriteEn = '1' then
                regfile(to_integer(unsigned(WrAddr))) <= DataIn;
            end if;
        end if;
    end process;

end architecture;