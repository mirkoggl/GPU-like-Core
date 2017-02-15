library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
 
entity mux is
   Generic (N : natural:=4);
	port(
      a, b, c, d, e, f, g, h, i, j, k : in std_logic_vector (N-1 downto 0); 
      sel : in std_logic_vector(3 downto 0);
      y : out std_logic_vector (N-1 downto 0)
   );
end entity mux;
 
architecture behavioral of mux is
begin 
   process (a, b, c, d, e, f, g, h, i, j, k, sel) is
   begin
      case sel is
         when "0000"  => y <= a;
         when "0001"  => y <= b;
         when "0010"  => y <= c;
         when "0011"  => y <= d;
         when "0100"  => y <= e;
         when "0101"  => y <= f;
         when "0110"  => y <= g;
			when "0111"  => y <= h;
			when "1000"  => y <= i;
			when "1001"  => y <= j;
			when "1010"  => y <= k;
         when others => y <= (others => '0');
      end case;
   end process;
end architecture behavioral;