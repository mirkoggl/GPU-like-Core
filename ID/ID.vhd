----------------------------------------------------------------------------------
-- Company: 
-- Author: 	Mirko Gagliardi
-- 
-- Create Date:    21/06/2015
-- Design Name: 
-- Module Name:    ID - rtl 
-- Project Name: 	 Streaming Multiprocessor	
-- Target Devices: 
-- Tool versions: 
-- Description: 	 
-- Dependencies: 	 
--
-- Revision: v 1.0
-- Revision 0.01 - File Created
-- Additional Comments:  
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

library work;
use work.fpupack.all;
use work.logpack.all;

entity ID is
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
			EnQueue   : in std_logic;
			OpQueueIn : in instruction_word_queue_type;
			MuxOut  	 : out std_logic_vector (SEL_NUM-1 downto 0);
		   EnOpOut 	 : out std_logic_vector (OP_NUM-1 DOWNTO 0);
			DataOutA  : out data_out_col_array_type;
         DataOutB  : out data_out_col_array_type;
			NotFound  : out std_logic
		);
end entity;

architecture rtl of ID is
  -----------------------------------------------------------------------
  -- ID Functions
  -----------------------------------------------------------------------	

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

  -----------------------------------------------------------------------
  -- ID Component
  -----------------------------------------------------------------------	
	COMPONENT RegisterMap
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
	END COMPONENT;
	
	COMPONENT RegisterBank
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
	END COMPONENT;
	
	COMPONENT Dispatcher 
	 Port(
	     reset	 : in std_logic;
		  en 	    : in std_logic;
		  clk	    : in std_logic;
		  NopIn	 : in std_logic;
		  op		 : in std_logic_vector (SEL_NUM-1 DOWNTO 0);
		  MuxOut  : out std_logic_vector (SEL_NUM-1 downto 0);
		  EnOpOut : out std_logic_vector (OP_NUM-1 DOWNTO 0)
		);
	END COMPONENT;
	
	COMPONENT Issue
	Port(
			clk   : in std_logic;
			reset : in std_logic;
			enable: in std_logic;
			EnQueue  : in std_logic;
 			OpIn  : in instruction_word_queue_type;
			Nop   : out std_logic;
			OpOut : out instruction_word_type
		);
	END COMPONENT;
	
	COMPONENT DecoderRegMap 
		Generic (
			Warp_Id_Length : natural := WARP_ID_SP;
			Reg_Addr_Length : natural := REG_ADDR_SP;
			Max_RegBlock_Numb : natural := MAX_REG_BLOCK_PER_WARP
		  );
		Port(
			OpIn	: in instruction_word_type;
			Nop   : in std_logic;
			WrEnRegMap   : out std_logic;
			WarpIdRegMap : out std_logic_vector(Warp_Id_Length-1 downto 0);
			RegIn1RegMap : out std_logic_vector(Reg_Addr_Length-1 downto 0);
			RegIn2RegMap : out std_logic_vector(Reg_Addr_Length-1 downto 0);
			OpRegMap 	 : out std_logic_vector(REG_OP_SP-1 downto 0);
			NumRegMap    : out std_logic_vector(Max_RegBlock_Numb-1 downto 0); 
			DataIn       : out data_out_col_array_type;
			NopOut	    : out std_logic
		);
	END COMPONENT;

  -----------------------------------------------------------------------
  -- ID Signals
  -----------------------------------------------------------------------	
	
	-- Issue signals
	signal op_out, op_out_stage12 : instruction_word_type := ISTR_WORD_INIT;
	signal no_op, no_op_stage12 : std_logic := '0';
	
	-- DecoderRegMap signals
	signal wr_en_reg_map, nop_out_dec : std_logic := '0';
	signal warpid_reg_map : std_logic_vector(Warp_Id_Length-1 downto 0) := (others => '0');
	signal reg1_reg_map, reg2_reg_map : std_logic_vector(Reg_Addr_Length-1 downto 0) := (others => '0');
	signal op_reg_map : std_logic_vector(REG_OP_SP-1 downto 0) := (others => '0');
	signal num_reg_map : std_logic_vector(Max_RegBlock_Numb-1 downto 0) := (others => '0');
	
	-- Dispatcher signals
	signal mux_out, mux_out_stage23 : std_logic_vector (SEL_NUM-1 downto 0) := (others => '0');
	signal en_op_out, en_op_out_stage23 : std_logic_vector (OP_NUM-1 DOWNTO 0) := (others => '0');
	
	-- Register Map and Register Blocks signals	
	signal data_in, data_in_reg, data_in_stage23 : data_out_col_array_type := (others => (others => '0'));
	signal data_out_a, data_out_b: data_out_matrix_type := (others => (others => (others => '0')));
	signal reg_addr1, reg_addr2, reg_addr1_stage23, reg_addr2_stage23 : std_logic_vector(RegBlock_Addr_Length-1 downto 0) := (others => '0');
	signal block_addr1, block_addr2, block_addr1_stage23, block_addr2_stage23, block_addr1_stage3out, block_addr2_stage3out : std_logic_vector(Block_Addr_Length-1 downto 0) := (others => '0');
	signal wr_en, wr_en_stage23 : std_logic_vector(RegBlock_Row_Numb-1 downto 0) := (others => '0');
	signal rd_en_a, rd_en_b : std_logic := '1';
	signal not_found_stage23, not_found : std_logic := '0';
	
begin

  -----------------------------------------------------------------------
  -- Stage 1 - Issue
  -----------------------------------------------------------------------
	Issue_inst : Issue
		Port Map(
			clk => clk,
			reset => reset,
			enable => en,
			EnQueue => EnQueue,
			OpIn => OpQueueIn,
			Nop => no_op,
			OpOut => op_out
		);	
	
	RegStage12 : process(clk, reset) begin
		if reset = '1' then
			no_op_stage12 <= '0';
			op_out_stage12 <= ISTR_WORD_INIT;
			
		elsif rising_edge(clk) then
			no_op_stage12 <= no_op;
			op_out_stage12 <= op_out;
		end if;
	end process;
	
  -----------------------------------------------------------------------
  -- Stage 2 - Decode and Register Map
  -----------------------------------------------------------------------
  
	DecoderRegMap_inst : DecoderRegMap
		Generic Map(
			Warp_Id_Length => Warp_Id_Length,
			Reg_Addr_Length => Reg_Addr_Length,
			Max_RegBlock_Numb => Max_RegBlock_Numb
			)
		Port Map(
			OpIn => op_out_stage12,
			Nop => no_op_stage12,
			WrEnRegMap => wr_en_reg_map,
			WarpIdRegMap => warpid_reg_map,
			RegIn1RegMap => reg1_reg_map,
			RegIn2RegMap => reg2_reg_map,
			OpRegMap => op_reg_map,
			NumRegMap => num_reg_map, 
			DataIn => data_in,
			NopOut => nop_out_dec
		);
  
	Dispatcher_Inst : Dispatcher
		Port Map(
			clk => clk,
			reset => reset,
			en => en,
			NopIn => nop_out_dec,
			op => op_out_stage12.Operation,
			MuxOut => mux_out,
			EnOpOut => en_op_out
		);
	
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
			WrEn => wr_en_reg_map,
			WarpId => warpid_reg_map,
			RegIn1 => reg1_reg_map,
			RegIn2 => reg2_reg_map,
			OpIn => op_reg_map,
			NumReg => num_reg_map,
			BlockAddr1 => block_addr1,
			BlockAddr2 => block_addr2,
			RegAddr1	=> reg_addr1,
			RegAddr2 => reg_addr2,
			WrEnVect => wr_en,
			NotFound => not_found
		);
   
  RegStage23 : process(clk, reset) begin
		if reset = '1' then
			block_addr1_stage23 <= (others => '0');
			block_addr2_stage23 <= (others => '0');
			reg_addr1_stage23 <= (others => '0');
			reg_addr2_stage23 <= (others => '0');
			wr_en_stage23 <= (others => '0');
			not_found_stage23 <= '0';
			mux_out_stage23 <= (others => '0');
			en_op_out_stage23 <= (others => '0');
			data_in_stage23 <= (others => (others => '0'));
			
		elsif rising_edge(clk) then
			block_addr1_stage23 <= block_addr1;
			block_addr2_stage23 <= block_addr2;
			reg_addr1_stage23 <= reg_addr1;
			reg_addr2_stage23 <= reg_addr2;
			wr_en_stage23 <= wr_en;
			not_found_stage23 <= not_found;
			mux_out_stage23 <= mux_out;
			en_op_out_stage23 <= en_op_out;
			data_in_reg <= data_in;
			data_in_stage23 <= data_in_reg;
		end if;
  end process;
  
  -----------------------------------------------------------------------
  -- Stage 3 - Register Blocks
  -----------------------------------------------------------------------  
  
  	RegBlock_Col_Gen: for j in 0 to RegBlock_Col_Numb-1 generate
		RegBlock_Row_Gen: for i in 0 to RegBlock_Row_Numb-1 generate
			RegBlockX : RegisterBank
				Generic Map(RegisterLength, f_log2(RegisterBlockDepth))
				Port Map(
					clk => clk, 
					reset => reset, 
					DataIn => data_in_stage23(j), 
					RdAddrA => reg_addr1_stage23, 
					RdAddrB => reg_addr2_stage23, 
					WrAddr => reg_addr1_stage23, 
					ReadEnA => rd_en_a, 
					ReadEnB => rd_en_b, 
					WriteEn => wr_en_stage23(i), 
					DataOutA => data_out_a(j)(i), 
					DataOutB => data_out_b(j)(i)
				);
		end generate RegBlock_Row_Gen;
	end generate RegBlock_Col_Gen;
	
	DataOutA <= row_output_map(data_out_a, RegBlock_Col_Numb, conv_integer(block_addr1_stage3out));
	DataOutB <= row_output_map(data_out_b, RegBlock_Col_Numb, conv_integer(block_addr2_stage3out));
	NotFound <= not_found_stage23;
	MuxOut <= mux_out_stage23;
	EnOpOut <= en_op_out_stage23;
	
	RegStage3Out : process(clk, reset) begin
		if reset = '1' then
			block_addr1_stage3out <= (others => '0');
			block_addr2_stage3out <= (others => '0');
			
		elsif rising_edge(clk) then
			block_addr1_stage3out <= block_addr1_stage23;
			block_addr2_stage3out <= block_addr2_stage23;
		end if;
  end process;

end rtl;