library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
 
entity mux_3to1 is
   Generic (N : natural:=4);
	Port(
      a, b, c: in std_logic_vector (N-1 downto 0); 
      sel : in std_logic_vector(3 downto 0);
      y : out std_logic_vector (N-1 downto 0)
   );
end entity mux_3to1;
 
architecture behavioral of mux_3to1 is
begin 
   process (a, b, c, sel) is
   begin
		case sel is
				when "0000"  => y <= a;
				when "0001"  => y <= b;
				when "0010"  => y <= c;
				when others => y <= (others => '0');
		end case;
   end process;
end architecture behavioral;