library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.fpupack.all;

entity DecoderRegMap is
	Generic (
			Warp_Id_Length : natural := WARP_ID_SP;
			Reg_Addr_Length : natural := REG_ADDR_SP;
			Max_RegBlock_Numb : natural := MAX_REG_BLOCK_PER_WARP
		);
	Port(
		OpIn	: in instruction_word_type;
		NopIn   : in std_logic;
		WrEnRegMap   : out std_logic;
		WarpIdRegMap : out std_logic_vector(Warp_Id_Length-1 downto 0);
		RegIn1RegMap : out std_logic_vector(Reg_Addr_Length-1 downto 0);
		RegIn2RegMap : out std_logic_vector(Reg_Addr_Length-1 downto 0);
		RegInWrRegMap : out std_logic_vector(Reg_Addr_Length-1 downto 0);
		OpRegMap 	 : out std_logic_vector(REG_OP_SP-1 downto 0);
		NumRegMap    : out std_logic_vector(Max_RegBlock_Numb-1 downto 0);
		NopOut	    : out std_logic
	);
end entity;

architecture rtl of DecoderRegMap is
	
	signal op_regmap : std_logic_vector(REG_OP_SP-1 downto 0) := (others => '0');
	signal nop_out_inter : std_logic := '0';
	
begin
	
	OpRegMap <= op_regmap;
	WarpIdRegMap <= OpIn.WarpId;
	RegIn1RegMap <= OpIn.Rs;
	RegIn2RegMap <= OpIn.Rt;
	RegInWrRegMap <= OpIn.Rd;
--	DataIn <= OpIn.DataIn;
	NopOut <= NopIn or nop_out_inter;
	
	Decode : process(OpIn)
		begin	
			case OpIn.Operation is
				when WARP_ALLOC_OP =>
					op_regmap <= REGMAP_ALLCWARP;
					nop_out_inter <= '1';
					WrEnRegMap <= '0';
					NumRegMap <= OpIn.Rs(Max_RegBlock_Numb-1 downto 0);
					
				when WARP_DEALLOC_OP =>
					op_regmap <= REGMAP_DEALLCWARP;
					nop_out_inter <= '1';
					WrEnRegMap <= '0';
					NumRegMap <= (others => '0');
				
				when LOAD_OP =>
					op_regmap <= REGMAP_TRANSLATE;
					nop_out_inter <= '1';
					WrEnRegMap <= '1';
					NumRegMap <= (others => '0');
					
				when STORE_OP =>
					op_regmap <= REGMAP_TRANSLATE;
					nop_out_inter <= '1';
					WrEnRegMap <= '0';
					NumRegMap <= (others => '0');
					
--				when MEM_OP =>
--					op_regmap <= REGMAP_TRANSLATE;
--					nop_out_inter <= '1';
--					WrEnRegMap <= '0';
--					NumRegMap <= (others => '0');
					
				when others =>
					op_regmap <= REGMAP_TRANSLATE;
					nop_out_inter <= '0';
					WrEnRegMap <= '1';
					NumRegMap <= (others => '0');
			end case;
		end process;
end rtl;