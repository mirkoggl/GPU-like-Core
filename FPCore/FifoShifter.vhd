----------------------------------------------------------------------------------
-- Company: 
-- Author: 	Mirko Gagliardi
-- 
-- Create Date:    23/04/2015
-- Design Name: 
-- Module Name:    FifoShifter - rtl 
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

entity FifoShifter is
    Generic (
        VECTOR_WIDTH: natural := 32;
        FIFO_DEPTH: natural := 10
    );
    Port (
        clock : in std_logic;
        reset : in std_logic;
		  en	  : in std_logic;
        input_vector  : in std_logic_vector(VECTOR_WIDTH-1 downto 0);
        output_vector : out std_logic_vector(VECTOR_WIDTH-1 downto 0)
    );
end;

architecture rtl of FifoShifter is
	 type fifo_memory_type is array (0 to FIFO_DEPTH-1) of std_logic_vector(VECTOR_WIDTH-1 downto 0);
    signal fifo_memory: fifo_memory_type := (others => (others => '0'));
begin
    process (clock, reset) begin
        if reset = '1' then
            fifo_memory <= (others => (others => '0'));
        elsif rising_edge(clock) and en = '1' then
            fifo_memory <= input_vector & fifo_memory(0 to FIFO_DEPTH-2);
        end if;
    end process;

    output_vector <= fifo_memory(FIFO_DEPTH-1);
end;