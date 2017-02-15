----------------------------------------------------------------------------------
-- Company: 
-- Author: 	Mirko Gagliardi
-- 
-- Create Date:    27/02/2016
-- Design Name: 
-- Module Name:    InstructionFetch - rtl 
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
use ieee.unsigned.all;

library work;
use work.fpupack.all;
use work.logpack.all;

entity InstructionFetch is
	Port(
		clk	   	 : in std_logic;
		reset	   	 : in std_logic;
		en				 : in std_logic;
		
		WarpMaskIn   : in std_logic_vector(WARP_NUMB-1 downto 0);
		
		L2UpdateAddr : in std_logic_vector(ICACHE_ADDR_WIDTH-1 downto 0);
		L2Data		 : in std_logic_vector(ICACHE_TAG_DATA_WIDTH-1 downto 0);
		L2We			 : in std_logic_vector(ICACHE_WAY-1 downto 0);
		
 		WarpMaskOut  : out std_logic_vector(WARP_NUMB-1 downto 0);
		OpQueue  	 : out instruction_word_queue_type
	);

end entity;

architecture rtl of InstructionFetch is

	COMPONENT simple_dual_port_ram_single_clock is
		Generic (
			DATA_WIDTH : natural := 8;
			ADDR_WIDTH : natural := 6
		);
		Port(
			clk		: in std_logic;
			raddr	: in natural range 0 to 2**ADDR_WIDTH - 1;
			waddr	: in natural range 0 to 2**ADDR_WIDTH - 1;
			data	: in std_logic_vector((DATA_WIDTH-1) downto 0);
			we		: in std_logic := '1';
			q		: out std_logic_vector((DATA_WIDTH -1) downto 0)
		);

	END COMPONENT;
	
	type pc_t is array (WARP_NUMB-1 downto 0) of std_logic_vector(PC_LENGTH-1 downto 0);
	type icache_data_read_t is array (ICACHE_WAY-1 downto 0) of std_logic_vector(ICACHE_TAG_DATA_WIDTH-1 downto 0);
	 
	signal program_counter : pc_t := (others => (others => '0')); 
	signal pc_fetch : std_logic_vector(PC_LENGTH-1 downto 0) := (others => '0');
	signal data_read : icache_data_read_t := (others => (others => '0')); 
	signal warp_sel, null_vect  : std_logic_vector(WARP_NUMB-1 downto 0) := (others => '0');
	signal warp_rr_id : std_logic_vector(f_log2(WARP_NUMB)-1 downto 0) := (others => '0');
	signal warp_counter : std_logic_vector(f_log2(WARP_NUMB)-1 downto 0) := (others => '0');

begin
		
	warp_sel <= (WarpMaskIn and ((not(WarpMaskIn ror warp_counter))+'1')) rol warp_counter;
	
	process (warp_sel)begin 
		case warp_sel is
			when "1---" =>
				warp_rr_id <="11";
			when "01--" =>
				warp_rr_id <="10";
			when "001-" =>
				warp_rr_id <="01";	
			when "0001-" =>
				warp_rr_id <="00";
			when others =>
				warp_rr_id <="00";
		end case;
	end process;
		
	pc_fetch <= program_counter(warp_rr_id);
	
	ICacheTag_Gen : for i in ICACHE_WAY-1 downto 0 generate 
		ICacheTag_X : simple_dual_port_ram_single_clock 
			GENERIC MAP (
				DATA_WIDTH => ICACHE_TAG_DATA_WIDTH,
				ADDR_WIDTH => ICACHE_ADDR_WIDTH
			)
			PORT MAP(
			clk	=> clk,
			raddr	=> pc_fetch,
			waddr	=> L2UpdateAddr,
			data	=> L2Data,
			we		=> L2We(i),
			q		=> data_read(i)
		);
		
	process(clk, reset) begin
		if reset = '1' then
			warp_counter <= '0';
			program_counter <= (others => '0');
		elsif rising_edge(clk) then
			if en = '1' and warp_sel != null_vect then
				warp_counter <= warp_counter + '1';
				program_counter(warp_rr_id) <= program_counter(warp_rr_id) + '100';
			end if;
		end if;
	end process;


end rtl;
