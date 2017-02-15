----------------------------------------------------------------------------------
-- Company: 
-- Author: 	Mirko Gagliardi
-- 
-- Create Date:    26/06/2015
-- Design Name: 
-- Module Name:    LoadStoreUnit - rtl 
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

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;

library work;
use work.fpupack.all;
use work.logpack.all;

entity LoadStoreUnit is
	Generic (
		ADDR_WIDTH : natural := 8
	);
	Port (
		clk  : in std_logic;
		InstrIn	: in instruction_word_type;
		DataRegIn : in data_out_col_array_type;
		wren : out std_logic;
		wben : out std_logic;
		raddr	: out natural range 0 to 2**ADDR_WIDTH-1;
		waddr	: out natural range 0 to 2**ADDR_WIDTH-1;
		DataSM : out data_out_col_array_type
	);
end entity;

architecture rtl of LoadStoreUnit is

begin

	
	Decode : process(clk) begin	
		if rising_edge(clk) then	
			case InstrIn.Operation is
			
				when LOAD_OP =>
					wren <= '0';
					wben <= '1';
					raddr <= conv_integer(InstrIn.MemAddr);
					DataSM <= (others => (others => '0'));
					
				when STORE_OP =>
					wren <= '1';
					wben <= '1';
					waddr <= conv_integer(InstrIn.MemAddr);
					DataSM <= DataRegIn;
					
				when others =>
					wren <= '0';
					wben <= '0';
					raddr <= 0;
					waddr <= 0;
					DataSM <= (others => (others => '0'));
					
			end case;
		end if;
	end process;

end rtl;
