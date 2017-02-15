library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.fpupack.all;

entity fp_neg is
	port(
		a	    : in std_logic_vector (FP_WIDTH-1 DOWNTO 0);
		result : out std_logic_vector (FP_WIDTH-1 DOWNTO 0)
	);
end entity;

architecture rtl of fp_neg is

	signal temp : std_logic_vector (FP_WIDTH-1 DOWNTO 0) := (others=>'0');

begin

	temp(FP_WIDTH-1) <= not a(FP_WIDTH-1);
	temp(FP_WIDTH-2 downto 0) <=  a(FP_WIDTH-2 downto 0);
	
	result <= temp;

end rtl;
