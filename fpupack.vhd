library IEEE;
use ieee.numeric_std.all;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

library work;
use work.logpack.all;
use work.userpack.all;

package fpupack is

  -----------------------------------------------------------------------
  -- IEEE-754 Constants
  -----------------------------------------------------------------------	

	 -- Data width of floating-point number. Deafult: 32
	 constant FP_WIDTH : integer := 32;
	
	 -- Data width of fraction. Deafult: 23
	 constant FRAC_WIDTH : integer := 23;
	
	 -- Data width of exponent. Deafult: 8
	 constant EXP_WIDTH : integer := 8;

	 --Zero vector
	 constant ZERO_VECTOR: std_logic_vector(30 downto 0) := "0000000000000000000000000000000";
	
	 -- Infinty FP format
	 constant INF  : std_logic_vector(30 downto 0) := "1111111100000000000000000000000";
	
	 -- QNaN (Quit Not a Number) FP format (without sign bit)
    constant QNAN : std_logic_vector(30 downto 0) := "1111111110000000000000000000000";
    
    -- SNaN (Signaling Not a Number) FP format (without sign bit)
    constant SNAN : std_logic_vector(30 downto 0) := "1111111100000000000000000000001";
	 	 
  -----------------------------------------------------------------------
  -- FPCore Types and Constants
  -----------------------------------------------------------------------		 
	 -- Core Number
	 constant CORE_NUMB : natural := FPU_CORE_NUMB;
	 
	 -- Max number of warps in a SM
	 constant MAX_NUM_WARP : natural := MAX_NUM_WARP_ALLW;
		 	
	 -- Larghezza dell'input di selezione del Mux del FPCore 
	 constant SEL_NUM : natural := 5;
	 
	 -- Spazio d'indirizzamento del VectorShifter, la larghezza dell'array (2^QUEUE_LENGTH) deve essere > della massima latenza possibile 
	 constant QUEUE_LENGTH : natural := 5;
	 
	 -- Massima latenza possibile, spesso dovuta al FMA + 2 (1 per il WB, 1 perchè i dati vengono passati al FPCore un colpo di clock dopo)
	 constant MAX_LATENCY : natural := 21;
	 
	 -- Numero di operazioni suportate dai FPCore
	 constant OP_NUM : natural := 19;
	 
	 constant WB_DELAY : natural := 6;
	 	 
	 function CreateVec(x : integer; n : integer)         
			return std_logic_vector;
	 
	 type CollVectRomType is array (0 to OP_NUM-1) of std_logic_vector(MAX_LATENCY-1 downto 0);
	 type OpType is (ADD_FP, SUB_FP, MULT_FP, DIV_FP, FMA_FP, ABS_FP, NEG_FP, MAX_FP, MIN_FP, CEIL_FP, FLOOR_FP, RINT_FP, FRAC_FP, NOP_FP);
	 type OpVectType is array (0 to OP_NUM+2) of OpType;
	 
	 
	 constant CollVectRom : CollVectRomType;
	 	 
	 -- Operation FPCore Mux
	 constant ADD_OP   : std_logic_vector (SEL_NUM-1 downto 0) := "00000";
	 constant SUB_OP   : std_logic_vector (SEL_NUM-1 downto 0) := "00001";
	 constant MULT_OP  : std_logic_vector (SEL_NUM-1 downto 0) := "00010";
	 constant DIV_OP   : std_logic_vector (SEL_NUM-1 downto 0) := "00011";
	 constant FMA_OP   : std_logic_vector (SEL_NUM-1 downto 0) := "00100";
	 constant ABS_OP   : std_logic_vector (SEL_NUM-1 downto 0) := "00101";
	 constant NEG_OP   : std_logic_vector (SEL_NUM-1 downto 0) := "00110";
	 constant MAX_OP   : std_logic_vector (SEL_NUM-1 downto 0) := "00111";
	 constant MIN_OP   : std_logic_vector (SEL_NUM-1 downto 0) := "01000";
	 constant CEIL_OP  : std_logic_vector (SEL_NUM-1 downto 0) := "01001";
	 constant FLOOR_OP : std_logic_vector (SEL_NUM-1 downto 0) := "01010";
	 constant RINT_OP  : std_logic_vector (SEL_NUM-1 downto 0) := "01011";
	 constant FRAC_OP  : std_logic_vector (SEL_NUM-1 downto 0) := "01100";
	 constant NOP		 : std_logic_vector (SEL_NUM-1 downto 0) := "11111";
	 
	 -- Operation latency
	 constant ADD_LAT_S : integer := 12;
	 constant SUB_LAT_S : integer := 12;
	 constant MULT_LAT_S : integer := 6;
	 constant DIV_LAT_S : integer := 14;
	 constant FMA_LAT_S : integer := 19;
	 constant ABS_LAT_S : integer := 1;
	 constant NEG_LAT_S : integer := 1;
	 constant MAX_LAT_S : integer := 1;
	 constant MIN_LAT_S : integer := 1;
	 constant CEIL_LAT_S : integer := 4;
	 constant FLOOR_LAT_S : integer := 4;
	 constant RINT_LAT_S : integer := 4;
	 constant FRAC_LAT_S : integer := 7;
	 
	 -- Operation latency, bisogna sottrarle 1 in quanto il VectorShifter aggiorna il valore al colpo di clock successivo
	 constant ADD_LAT   : std_logic_vector (QUEUE_LENGTH-1 downto 0) := conv_std_logic_vector(ADD_LAT_S, QUEUE_LENGTH);	-- 12
	 constant SUB_LAT   : std_logic_vector (QUEUE_LENGTH-1 downto 0) := conv_std_logic_vector(SUB_LAT_S, QUEUE_LENGTH);	-- 12
	 constant MULT_LAT  : std_logic_vector (QUEUE_LENGTH-1 downto 0) := conv_std_logic_vector(MULT_LAT_S, QUEUE_LENGTH);	-- 6
	 constant DIV_LAT   : std_logic_vector (QUEUE_LENGTH-1 downto 0) := conv_std_logic_vector(DIV_LAT_S, QUEUE_LENGTH);	-- 14
	 constant FMA_LAT   : std_logic_vector (QUEUE_LENGTH-1 downto 0) := conv_std_logic_vector(FMA_LAT_S, QUEUE_LENGTH);	-- 19
	 constant ABS_LAT   : std_logic_vector (QUEUE_LENGTH-1 downto 0) := conv_std_logic_vector(ABS_LAT_S, QUEUE_LENGTH); 	-- 1
	 constant NEG_LAT   : std_logic_vector (QUEUE_LENGTH-1 downto 0) := conv_std_logic_vector(NEG_LAT_S, QUEUE_LENGTH); 	-- 1
	 constant MAX_LAT   : std_logic_vector (QUEUE_LENGTH-1 downto 0) := conv_std_logic_vector(MAX_LAT_S, QUEUE_LENGTH);	-- 2
	 constant MIN_LAT   : std_logic_vector (QUEUE_LENGTH-1 downto 0) := conv_std_logic_vector(MIN_LAT_S, QUEUE_LENGTH);	-- 2
	 constant CEIL_LAT  : std_logic_vector (QUEUE_LENGTH-1 downto 0) := conv_std_logic_vector(CEIL_LAT_S, QUEUE_LENGTH);	-- 4
	 constant FLOOR_LAT : std_logic_vector (QUEUE_LENGTH-1 downto 0) := conv_std_logic_vector(FLOOR_LAT_S, QUEUE_LENGTH);	-- 4
	 constant RINT_LAT  : std_logic_vector (QUEUE_LENGTH-1 downto 0) := conv_std_logic_vector(RINT_LAT_S, QUEUE_LENGTH);	-- 5
	 constant FRAC_LAT  : std_logic_vector (QUEUE_LENGTH-1 downto 0) := conv_std_logic_vector(FRAC_LAT_S, QUEUE_LENGTH);	-- 8
	 
	 constant ADD_LAT_REG   : std_logic_vector (QUEUE_LENGTH-1 downto 0) := conv_std_logic_vector(ADD_LAT_S + WB_DELAY, QUEUE_LENGTH);	-- 12
	 constant MULT_LAT_REG  : std_logic_vector (QUEUE_LENGTH-1 downto 0) := conv_std_logic_vector(MULT_LAT_S + WB_DELAY, QUEUE_LENGTH);	-- 6
	
	-- Operator generate
	 constant ADDSUB_GEN : natural := ADDSUB_OP_GEN;
	 constant MULT_GEN : natural := MULT_OP_GEN;
	 constant DIV_GEN : natural := DIV_OP_GEN;
	 constant ABS_GEN : natural := ABS_OP_GEN;
	 constant NEG_GEN : natural := NEG_OP_GEN;
	 constant MAX_GEN : natural := MAX_OP_GEN;
	 constant MIN_GEN : natural := MIN_OP_GEN;
	 constant CEILFLOOR_GEN : natural := CEILFLOOR_OP_GEN;
	 constant RINT_GEN : natural := RINT_OP_GEN;
	 constant FRAC_GEN : natural := FRAC_OP_GEN;	 
	 
  -----------------------------------------------------------------------
  -- Issue Types and Constants
  -----------------------------------------------------------------------	
	
	 -- Number of parallel instruction words 
    constant OP_QUEUE_IND : natural := f_log2(WARP_NUMB);
	 
	 -- Dimensione dei blocchi OpCheck (2^OP_CHECK_DIM)
	 constant OP_CHECK_DIM : natural := 2;
	 
	 -- Dimensione dei blocchi IndexSelector 
	 constant IND_SEL_DIM : natural := 2;
	 
	  -- Numero di blocchi IndexSelector 
	 constant IND_SEL_BLOCK_NUM : natural := (2**OP_QUEUE_IND) - 1;
	 
	 -- Numero di OpCheck da istanziare, ogni OpCheck controlla 4 segnali, quindi servono 2^OP_QUEUE_IND/4 Opcheck
	 constant NUM_OP_CHECK : integer := 2**OP_QUEUE_IND / 2**OP_CHECK_DIM;
  
    -- Tipo a rappresentare la coda di operazioni
    type queue_type is array (0 to 2**OP_QUEUE_IND-1) of std_logic_vector(SEL_NUM-1 downto 0);
	 
	 -- Ingresso del IndexSelector, array di IND_SEL_DIM interi su OP_QUEUE_IND bit 
	 type ind_sel_in_type is array (0 to IND_SEL_DIM-1) of std_logic_vector(OP_QUEUE_IND-1 downto 0);
	 	
	 -- Array di interi utilizzati per collegare tra di loro gli IndexSelector
	 type integer_array_counter is array (0 to OP_QUEUE_IND-1) of integer;-- range 0 to IND_SEL_DIM;
	 type integer_array_indsel is array (0 to IND_SEL_BLOCK_NUM-1) of integer;-- range 0 to IND_SEL_DIM;
	
	 -- Array di interi codificati su OP_QUEUE_IND bit, analogo a ind_sel_in_type, usato per collegare gli input al primo livello di IndexSelector
	 type op_queue_in_type is array (0 to 2**OP_QUEUE_IND-1) of std_logic_vector(OP_QUEUE_IND-1 downto 0);
	 
	 -- Array di ind_sel_in_type, usato per collegare gli IndexSelector tra di loro
	 type ind_sel_in_type_array is array (0 to IND_SEL_BLOCK_NUM-1) of ind_sel_in_type;
	 
	 -- Array per collegare gli IndexSelector intermedi tra di loro
	 type ind_sel_out_type is array (0 to IND_SEL_BLOCK_NUM-1) of std_logic_vector(OP_QUEUE_IND-1 downto 0);
	 
  -----------------------------------------------------------------------
  -- Register Map
  -----------------------------------------------------------------------	
  
	 -- Width of every Register (32 bit) 
	 constant REG_BLOCK_WIDTH : natural := REGISTER_WIDTH;
	 
	 -- Number of registers in a Register Block, every block has REG_BLOCK_DEPTH registers of REG_BLOCK_WIDTH bits.
	 constant REG_BLOCK_DEPTH : natural := REG_BLOCK_SIZE;
	 
	 -- Number of Register Block = REG_BLOCK_ROW x REG_BLOCK_COL, at least one block per Warp
	 constant REG_BLOCK_ROW : natural := REG_BLOCK_NUMB;
	 constant REG_BLOCK_COL : natural := CORE_NUMB;
	 constant TOT_REG_BLOCK_ROW : natural := REG_BLOCK_ROW * REG_BLOCK_DEPTH;
	 
	 -- Max number of Register Block per Warp
	 constant MAX_REG_BLOCK_PER_WARP : natural := MAX_REG_BLOCK_TOEACH_WARP;
	 
	 -- Min number of Register Block per Warp
	 constant MIN_REG_BLOCK_PER_WARP : natural := MIN_REG_BLOCK_TOEACH_WARP;
	 
	 -- Register Block address length	 
	 constant REG_BLOCK_ADDR_SP : natural := f_log2(REG_BLOCK_DEPTH);
	 
	 -- Register address length 
	 constant REG_ADDR_SP : natural := f_log2(MAX_REG_BLOCK_PER_WARP * REG_BLOCK_DEPTH);
	 
	 -- Block Register address length
	 constant ROW_ADDR_SP : natural := f_log2(REG_BLOCK_ROW);
	 
	 -- Warp address length
	 constant WARP_ID_SP : natural := f_log2(MAX_NUM_WARP);
	 
	 -- Register Map istruction length 
	 constant REG_OP_SP : natural := 2;
	 
	 type data_out_row_array_type is array (0 to REG_BLOCK_ROW-1) of std_logic_vector (REG_BLOCK_WIDTH-1 downto 0);
	 type data_out_col_array_type is array (0 to REG_BLOCK_COL-1) of std_logic_vector (REG_BLOCK_WIDTH-1 downto 0);	 
	 type data_out_matrix_type is array (0 to REG_BLOCK_COL-1) of data_out_row_array_type; 
	 type data_out_fpu_array_type is array (0 to Core_Numb-1) of std_logic_vector (FP_WIDTH-1 downto 0);	

	 -- Register Map Operation
	 constant REGMAP_TRANSLATE : std_logic_vector(REG_OP_SP-1 downto 0) := "10";
	 constant REGMAP_DEALLCWARP : std_logic_vector(REG_OP_SP-1 downto 0) := "01";
	 constant REGMAP_ALLCWARP : std_logic_vector(REG_OP_SP-1 downto 0) := "00";
	 
	 -- Register Operation
	 constant WARP_ALLOC_OP : std_logic_vector (SEL_NUM-1 downto 0) := "01101";
	 constant WARP_DEALLOC_OP : std_logic_vector (SEL_NUM-1 downto 0) := "01110";
	 constant MOVE_OP : std_logic_vector (SEL_NUM-1 downto 0) := "01111";
	 constant LOAD_OP : std_logic_vector (SEL_NUM-1 downto 0) := "10000";
	 constant STORE_OP : std_logic_vector (SEL_NUM-1 downto 0) := "10001";
	 constant MEM_OP : std_logic_vector (SEL_NUM-1 downto 0) := "10010";
	 
	 -- Register Operation Latency
	 constant WARP_ALLOC_OP_LAT_S : integer := 1;
	 constant WARP_DEALLOC_OP_LAT_S : integer := 1;
	 constant MOVE_OP_LAT_S : integer := 1;
	 constant LOAD_OP_LAT_S : integer := 4;
	 constant STORE_OP_LAT_S : integer := 1;
	 constant MEM_OP_LAT_S : integer := 1;
	 
	 constant WARP_ALLOC_OP_LAT   : std_logic_vector (QUEUE_LENGTH-1 downto 0) := conv_std_logic_vector(WARP_ALLOC_OP_LAT_S, QUEUE_LENGTH);	
	 constant WARP_DEALLOC_OP_LAT   : std_logic_vector (QUEUE_LENGTH-1 downto 0) := conv_std_logic_vector(WARP_DEALLOC_OP_LAT_S, QUEUE_LENGTH);	
	 constant MOVE_OP_LAT   : std_logic_vector (QUEUE_LENGTH-1 downto 0) := conv_std_logic_vector(MOVE_OP_LAT_S, QUEUE_LENGTH);	
	 constant LOAD_OP_LAT   : std_logic_vector (QUEUE_LENGTH-1 downto 0) := conv_std_logic_vector(LOAD_OP_LAT_S, QUEUE_LENGTH);	
	 constant STORE_OP_LAT   : std_logic_vector (QUEUE_LENGTH-1 downto 0) := conv_std_logic_vector(STORE_OP_LAT_S, QUEUE_LENGTH);	
	 constant MEM_OP_LAT   : std_logic_vector (QUEUE_LENGTH-1 downto 0) := conv_std_logic_vector(MEM_OP_LAT_S, QUEUE_LENGTH);		 
										
  -----------------------------------------------------------------------
  -- MEM - Shared Memory
  -----------------------------------------------------------------------
  
  constant SHARED_MEM_ADDR_WIDTH : natural := SHARED_MEM_ADDR_LENGTH;
  
  
  -----------------------------------------------------------------------
  -- IF - Instruction Fetch
  -----------------------------------------------------------------------	
  constant MEMORY_ADDR   : natural := 32:
  constant MEMORY_OFFSET : natural := 4; 
  
  constant PC_LENGTH 		  		: natural := 32;
  constant ICACHE_WAY			   : natural := 512;
  constant ICACHE_ADDR_WIDTH 		: natural := 64;

  constant ICACHE_TAG_DATA_WIDTH  : natural := MEMORY_ADDR - ICACHE_ADDR_WIDTH - MEMORY_OFFSET;
  constant ICACHE_DATA_DATA_WIDTH : natural := 512;

  -----------------------------------------------------------------------
  -- Istruction Word
  -----------------------------------------------------------------------	
  
  -- Istruction Word
  type instruction_word_type is record
		WarpID : std_logic_vector(WARP_ID_SP-1 downto 0);
		Operation  : std_logic_vector(SEL_NUM-1 downto 0);
		Rs  : std_logic_vector(REG_ADDR_SP-1 downto 0);
		Rt  : std_logic_vector(REG_ADDR_SP-1 downto 0);
		Rd  : std_logic_vector(REG_ADDR_SP-1 downto 0);
		MemAddr : std_logic_vector(SHARED_MEM_ADDR_WIDTH-1 downto 0);
	end record; 
	
  -- Istruction Word Queue_type
  type instruction_word_queue_type is array (0 to 2**OP_QUEUE_IND-1) of instruction_word_type;
  
  constant ISTR_WORD_INIT : instruction_word_type := (
										WarpID => (others =>'0'),
                              Operation => (others=>'0'),
                              Rs => (others=>'0'),
										Rt => (others=>'0'),
										Rd => (others=>'0'),
										MemAddr => (others=>'0')
										);
						

end fpupack;

package body fpupack is
	
	-- Funzione che crea un vettore con un solo bit alto in posizione x
	function CreateVec(x : integer; n : integer)                -- total and fractional bit width of result
			return std_logic_vector is
			variable result   : std_logic_vector(n-1 downto 0) := (others => '0');
		 begin
			result(x) := '1';
			return result;
	end function CreateVec;
	
	constant CollVectRom : CollVectRomType := (
		CreateVec(ADD_LAT_S+1, MAX_LATENCY),   -- ADD
		CreateVec(SUB_LAT_S+1, MAX_LATENCY),   -- SUB
		CreateVec(MULT_LAT_S+1, MAX_LATENCY),   -- MULT
		CreateVec(DIV_LAT_S+1, MAX_LATENCY),   -- DIV
		CreateVec(FMA_LAT_S+1, MAX_LATENCY),   -- FMA
		CreateVec(ABS_LAT_S+1, MAX_LATENCY),   -- ABS
		CreateVec(NEG_LAT_S+1, MAX_LATENCY),   -- NEG
		CreateVec(MAX_LAT_S+1, MAX_LATENCY),   -- MAX
		CreateVec(MIN_LAT_S+1, MAX_LATENCY),   -- MIN
		CreateVec(CEIL_LAT_S+1, MAX_LATENCY),   -- CEIL
		CreateVec(FLOOR_LAT_S+1, MAX_LATENCY),   -- FLOOR
		CreateVec(RINT_LAT_S+1, MAX_LATENCY),   -- RINT
		CreateVec(FRAC_LAT_S+1, MAX_LATENCY),    -- FRAC
		CreateVec(WARP_ALLOC_OP_LAT_S+1, MAX_LATENCY),
		CreateVec(WARP_DEALLOC_OP_LAT_S+1, MAX_LATENCY),
		CreateVec(MOVE_OP_LAT_S+1, MAX_LATENCY),
		CreateVec(LOAD_OP_LAT_S+1, MAX_LATENCY),
		CreateVec(STORE_OP_LAT_S+1, MAX_LATENCY),
		CreateVec(MEM_OP_LAT_S+1, MAX_LATENCY)
	 );
	 
-- Collision Vector DeMux ROM
--	 constant CollVectRom : CollVectRomType := (
--		"000000010000000000000",   -- ADD
--		"000000010000000000000",   -- SUB
--		"000000000000010000000",   -- MULT
--		"000001000000000000000",   -- DIV
--		"100000000000000000000",   -- FMA
--		"000000000000000000100",   -- ABS
--		"000000000000000000100",   -- NEG
--		"000000000000000000100",   -- MAX
--		"000000000000000000100",   -- MIN
--		"000000000000000100000",   -- CEIL
--		"000000000000000100000",   -- FLOOR
--		"000000000000000100000",   -- RINT
--		"000000000000100000000"    -- FRAC
--	 );

end fpupack;