-- Quartus II VHDL Template
-- Binary Counter

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter is
	Generic(
		N : natural := 4;
		M : natural := 2
	);
	Port(
		clk	  : in std_logic;
		reset	  : in std_logic;
		enable  : in std_logic;
		count_mod   : out integer
	);
end entity;

architecture rtl of counter is
begin

	process (clk, reset)
		variable  cnt_pulse : integer;-- range 0 to N := 0;
		variable  count	: integer;-- range 0 to M := 0;
	begin
		if reset = '1' then
				cnt_pulse := 0;
				count := 0;
		elsif (rising_edge(clk)) then
			if enable = '1' then
				if cnt_pulse = N-1 then
					count := (count + 1) mod M;
				end if;
					
				cnt_pulse := (cnt_pulse + 1) mod N;

			end if;
		end if;
		count_mod <= count;
	end process;
end rtl;