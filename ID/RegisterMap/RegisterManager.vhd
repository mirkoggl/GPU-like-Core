----------------------------------------------------------------------------------
-- Company: 
-- Author: 	Mirko Gagliardi
-- 
-- Create Date:    10/06/2015
-- Design Name: 
-- Module Name:    RegisterManager - rtl 
-- Project Name: 	 Streaming Multiprocessor	
-- Target Devices: 
-- Tool versions: 
-- Description: 	 Prova di integrazione del RegisterMap. I Register Block sono
--						 stati realizzati in VHDL, non potendo usare i blocchi di memoria
--						 delle FPGA, perchè i blocchi di memoria delle FPGA non
--						 supportano 2 letture ed 1 scrittura contemporaneamente
--						 (sia per Altera che per Xilinx). 
--
--						 Questo non sarà implementato come componente nel SM, ma è il 
--						 secondo stadio della ID.
--
-- Dependencies: 	 
--
-- Revision: v 1.2
-- Revision 0.01 - File Created
-- Additional Comments:  Diviso correttamente in stage separati da registri.
--								 Prova multithreading.
--								
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

library work;
use work.fpupack.all;
use work.logpack.all;

entity RegisterManager is
	 Generic (
			RegisterLength : natural := REG_BLOCK_WIDTH;
			RegisterBlockDepth : natural := REG_BLOCK_DEPTH;	
			Warp_Id_Length : natural := WARP_ID_SP;
			Reg_Addr_Length : natural := REG_ADDR_SP;
			Max_RegBlock_Numb : natural := MAX_REG_BLOCK_PER_WARP;
			Block_Addr_Length : natural := ROW_ADDR_SP;
			RegBlock_Addr_Length : natural := REG_BLOCK_ADDR_SP;
			RegBlock_Row_Numb : natural := REG_BLOCK_ROW;
			RegBlock_Col_Numb : natural := REG_BLOCK_COL
		);
	 Port(
			clk    : in std_logic;
			reset  : in std_logic;
			en     : in std_logic;
			WrEn   : in std_logic;
			WarpId : in std_logic_vector(Warp_Id_Length-1 downto 0);
			DataIn : in data_out_col_array_type;
			RegIn1 : in std_logic_vector(Reg_Addr_Length-1 downto 0);
			RegIn2 : in std_logic_vector(Reg_Addr_Length-1 downto 0);
			OpIn   : in std_logic_vector(REG_OP_SP-1 downto 0);
			NumReg : in std_logic_vector(Max_RegBlock_Numb-1 downto 0);
			DataOutA : out data_out_col_array_type;
         DataOutB : out data_out_col_array_type;
			NotFound : out std_logic
		);
end entity;

architecture rtl of RegisterManager is

	-- This function maps a Register Block column output to the effective output.
	function row_output_map (
		 matrix : data_out_matrix_type;
		 col_size : integer;
		 row_index : integer
		) return data_out_col_array_type is

		 variable result : data_out_col_array_type;
		 
	  begin
		 
		 for i in 0 to col_size-1 loop		
				result(i) := matrix(i)(row_index);
		 end loop;	 			 
		return result;
	end function;

	component RegisterMap
	 Generic (
			Warp_Id_Length : natural := WARP_ID_SP;
			Reg_Addr_Length : natural := REG_ADDR_SP;
			Max_RegBlock_Numb : natural := MAX_REG_BLOCK_PER_WARP;
			Block_Addr_Length : natural := ROW_ADDR_SP;
			RegBlock_Addr_Length : natural := REG_BLOCK_ADDR_SP;
			RegBlock_Numb : natural := REG_BLOCK_ROW
		);
	 Port(
			clk    : in std_logic;
			reset  : in std_logic;
			en     : in std_logic;
			WrEn   : in std_logic;
			WarpId : in std_logic_vector(Warp_Id_Length-1 downto 0);
			RegIn1 : in std_logic_vector(Reg_Addr_Length-1 downto 0);
			RegIn2 : in std_logic_vector(Reg_Addr_Length-1 downto 0);
			OpIn   : in std_logic_vector(REG_OP_SP-1 downto 0);
			NumReg : in std_logic_vector(Max_RegBlock_Numb-1 downto 0);
			BlockAddr1 : out std_logic_vector(Block_Addr_Length-1 downto 0);
			BlockAddr2 : out std_logic_vector(Block_Addr_Length-1 downto 0);
			RegAddr1	: out std_logic_vector(RegBlock_Addr_Length-1 downto 0);
			RegAddr2	: out std_logic_vector(RegBlock_Addr_Length-1 downto 0);
			WrEnVect	: out std_logic_vector(RegBlock_Numb-1 downto 0);
			NotFound : out std_logic
		);
	end component;
	
	component RegisterBank
    Generic(
        N:      natural := 32;  -- word width in bits
        M:      natural := 4    -- address bits, number of words = 2**M 
	 );
    Port ( 
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
	end component;
		
	signal data_out_a, data_out_b: data_out_matrix_type := (others => (others => (others => '0')));
	signal reg_addr1, reg_addr2, reg_addr1_reg, reg_addr2_reg : std_logic_vector(RegBlock_Addr_Length-1 downto 0) := (others => '0');
	signal block_addr1, block_addr2, block_addr1_stage01, block_addr2_stage01, block_addr1_stage12, block_addr2_stage12 : std_logic_vector(Block_Addr_Length-1 downto 0) := (others => '0');
	signal wr_en, wr_en_reg : std_logic_vector(RegBlock_Row_Numb-1 downto 0) := (others => '0');
	signal DataIn_stage01, DataIn_stage0 : data_out_col_array_type;
	signal rd_en_a, rd_en_b : std_logic := '1';
	signal wr_en_in_reg, not_found_stage01, not_found_stage12, not_found : std_logic := '0';
	
begin
	
	
	DataOutA <= row_output_map(data_out_a, RegBlock_Col_Numb, conv_integer(block_addr1_stage12));
	DataOutB <= row_output_map(data_out_b, RegBlock_Col_Numb, conv_integer(block_addr2_stage12));
	NotFound <= not_found_stage12;

	RegBlock_Col_Gen: for j in 0 to RegBlock_Col_Numb-1 generate
		RegBlock_Row_Gen: for i in 0 to RegBlock_Row_Numb-1 generate
			RegBlockX : RegisterBank
				Generic Map(RegisterLength, f_log2(RegisterBlockDepth))
				Port Map(
					clk => clk, 
					reset => reset, 
					DataIn => DataIn_stage01(j), 
					RdAddrA => reg_addr1_reg, 
					RdAddrB => reg_addr2_reg, 
					WrAddr => reg_addr1_reg, 
					ReadEnA => rd_en_a, 
					ReadEnB => rd_en_b, 
					WriteEn => wr_en_reg(i), 
					DataOutA => data_out_a(j)(i), 
					DataOutB => data_out_b(j)(i)
				);
		end generate RegBlock_Row_Gen;
	end generate RegBlock_Col_Gen;
	
	RegMap_Inst : RegisterMap
		Generic Map(
			Warp_Id_Length => Warp_Id_Length,
			Reg_Addr_Length => Reg_Addr_Length,
			Max_RegBlock_Numb => Max_RegBlock_Numb,
			Block_Addr_Length => Block_Addr_Length,
			RegBlock_Addr_Length => RegBlock_Addr_Length,
			RegBlock_Numb => RegBlock_Row_Numb
	   )		
		Port Map(
			clk => clk, 
			reset => reset,
			en => en,
			WrEn => WrEn,
			WarpId => WarpId,
			RegIn1 => RegIn1,
			RegIn2 => RegIn2,
			OpIn => OpIn,
			NumReg => NumReg,
			BlockAddr1 => block_addr1,
			BlockAddr2 => block_addr2,
			RegAddr1	=> reg_addr1,
			RegAddr2 => reg_addr2,
			WrEnVect => wr_en,
			NotFound => not_found
		);
   
  RegProc : process(clk) begin
		if rising_edge(clk) then
			DataIn_stage0 <= DataIn;
			DataIn_stage01 <= DataIn_stage0;
			block_addr1_stage01 <= block_addr1;
			block_addr2_stage01 <= block_addr2;
			block_addr1_stage12 <= block_addr1_stage01;
			block_addr2_stage12 <= block_addr2_stage01;
			reg_addr1_reg <= reg_addr1;
			reg_addr2_reg <= reg_addr2;
			wr_en_reg <= wr_en;
			not_found_stage01 <= not_found;
			not_found_stage12 <= not_found_stage01;
		end if;
  end process;

end rtl;