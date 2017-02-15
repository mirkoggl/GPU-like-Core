library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
 
entity mux_2to1 is
   Generic (N : natural:=4);
	Port(
      a, b: in std_logic_vector (N-1 downto 0); 
      sel : in std_logic;
      y : out std_logic_vector (N-1 downto 0)
   );
end entity mux_2to1;
 
architecture behavioral of mux_2to1 is
begin 
   process (a, b, sel) is
   begin
      case sel is
         when '0'  => y <= a;
         when '1'  => y <= b;
         when others => y <= (others => '0');
      end case;
   end process;
end architecture behavioral;