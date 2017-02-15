library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;

library work;
use work.fpupack.all;
use work.logpack.all;
 
ENTITY tbc IS
END tbc;
 
ARCHITECTURE behavior OF tbc IS 

type floating_point_special_t is (normal, zero_pos, zero_neg, inf_pos, inf_neg, nan, out_of_range);

  -----------------------------------------------------------------------
  -- Functions
  -----------------------------------------------------------------------

  -- Function to limit an integer bit width to a value for which functions can use VHDL's integer type for calculations
  function width_limit(w : integer) return integer is
    constant MAX_WIDTH : integer := 30;  -- maximum width: allows 2**width to be stored in an integer variable
  begin
    if w < MAX_WIDTH then
      return w;
    else
      return MAX_WIDTH;
    end if;
  end function width_limit;

  -- Function to convert a real number to a std_logic_vector floating point representation
  function real_to_flt(x : real;                       -- real number to convert
                       s : floating_point_special_t;   -- indicates special values to convert (overrides x)
                       w, fw : integer)                -- total and fractional bit width of result
    return std_logic_vector is
    constant EW       : integer := w - fw;
    constant FW_LIM   : integer := width_limit(fw);    -- limited internal value of fractional bit width
    constant E_BIAS   : integer := 2 ** (EW - 1) - 1;
    constant MANT_MAX : real    := 2.0 - 1.0 / real(2 ** (FW_LIM - 1));
    variable result   : std_logic_vector(w-1 downto 0) := (others => '0');
    variable sign     : std_logic := '0';
    variable exp      : integer   := 0;
    variable mant     : real;
    variable mant_int : integer;
  begin

    -- Handle special cases
    case s is
      when zero_pos =>  -- plus zero
        result(w-1) := '0';                          -- sign bit clear
        result(w-2 downto 0) := (others => '0');     -- exponent and mantissa clear

      when zero_neg =>  -- minus zero
        result(w-1) := '1';                          -- sign bit set
        result(w-2 downto 0) := (others => '0');     -- exponent and mantissa clear

      when inf_pos =>   -- plus infinity
        result(w-1) := '0';                          -- sign bit clear
        result(w-2 downto fw-1) := (others => '1');  -- exponent
        result(fw-2 downto 0)   := (others => '0');  -- mantissa

      when inf_neg =>   -- minus infinity
        result(w-1) := '1';                          -- sign bit set
        result(w-2 downto fw-1) := (others => '1');  -- exponent
        result(fw-2 downto 0)   := (others => '0');  -- mantissa

      when nan =>       -- Not a Number
        result(w-1) := '0';                          -- sign bit
        result(w-2 downto fw-1) := (others => '1');  -- exponent
        result(fw-2)            := '1';              -- MSB of mantissa set
        result(fw-3 downto 0)   := (others => '0');  -- rest of mantissa clear

      -- NOTE: out_of_range might be possible under some circumstances, but it can be represented
      when normal | out_of_range =>
        -- Handle normal numbers

        -- Zero must be requested using s = zero_pos or s = zero_neg, not s = normal and x = 0.0
        assert x /= 0.0
          report "ERROR: real_to_flt: zero must be requested using s = zero_pos or s = zero_neg, not s = normal and x = 0.0"
          severity failure;

        -- Get sign bit
        if x < 0.0 then
          sign := '1';
          mant := -x;
        else
          sign := '0';
          mant := x;
        end if;

        -- Normalize input to calculate exponent
        while mant < 1.0 loop
          exp  := exp - 1;
          mant := mant * 2.0;
        end loop;
        while mant > MANT_MAX loop
          exp  := exp + 1;
          mant := mant / 2.0;
        end loop;

        -- Remove hidden bit and convert to std_logic_vector
        -- To avoid VHDL's integer type overflowing, use at most 30 bits of the mantissa
        mant := mant - 1.0;
        mant_int := integer(mant * real(2 ** (FW_LIM - 1)));  -- implicit round-to-nearest
        result(fw - 2 downto fw - FW_LIM) := std_logic_vector(to_unsigned(mant_int, FW_LIM - 1));

        -- Add exponent bias and convert to std_logic_vector
        exp := exp + E_BIAS;
        result(w - 2 downto fw - 1) := std_logic_vector(to_unsigned(exp, EW));

        -- Add sign bit
        result(w - 1) := sign;

    end case;

    return result;
  end function real_to_flt;

  -- Function to identify special numbers in a std_logic_vector floating point representation
  function flt_to_special(f : std_logic_vector;  -- floating point number to convert
                          w, fw : integer)       -- total and fractional bit width of result
    return floating_point_special_t is
    constant EW     : integer := w - fw;
    constant ZEROS  : std_logic_vector(w-1 downto 0)    := (others => '0');
    constant ONES   : std_logic_vector(w-1 downto 0)    := (others => '1');
    variable f_int  : std_logic_vector(f'high downto 0) := f;  -- fixed width version of f
    variable f_sign : std_logic                         := f_int(w-1);              -- sign bit of f
    variable f_exp  : std_logic_vector(EW-1 downto 0)   := f_int(w-2 downto fw-1);  -- exponent of f
    variable f_mant : std_logic_vector(fw-2 downto 0)   := f_int(fw-2 downto 0);    -- mantissa of f
    variable result : floating_point_special_t;
    constant E_BIAS   : integer := 2 ** (EW - 1) - 1;
  begin

    -- Check bit widths match
    assert f'high = w - 1
      report "ERROR: flt_to_special: input std_logic_vector f must have bit width = input integer w"
      severity failure;

    -- Check for special cases
    if f_exp = ZEROS(w-2 downto fw-1) then
      -- +/- zero (treat denormalized numbers as zero)
      if f_sign = '0' then
        result := zero_pos;
      else
        result := zero_neg;
      end if;

    elsif f_exp = ONES(w-2 downto fw-1) then
      if f_mant = ZEROS(fw-2 downto 0) then
        -- +/- infinity
        if f_sign = '0' then
          result := inf_pos;
        else
          result := inf_neg;
        end if;

      else
        -- NaN (not a number)
        result := nan;
      end if;
    elsif to_integer(unsigned(f_exp)) - E_BIAS > 1022 then
      -- If the exponent is too large then we end up with a number that VHDL can't represent in a REAL.
      -- This gives fatal runtime errors.  Note that 1022 is used instead of 1023 (the actual max) because
      -- that allows us to ignore the value of the mantissa

      result := out_of_range;
    elsif to_integer(unsigned(f_exp)) - E_BIAS < -1021 then
      result := out_of_range;

    else
      -- not a special case
      result := normal;
    end if;

    return result;
  end function flt_to_special;

  -- Function to convert a std_logic_vector floating point representation into a real number
  function flt_to_real(f : std_logic_vector;  -- floating point number to convert
                       w, fw : integer)       -- total and fractional bit width of result
    return real is
    constant EW     : integer := w - fw;
    constant FW_LIM : integer := width_limit(fw);    -- limited internal value of fractional bit width
    constant E_BIAS : integer := 2 ** (EW - 1) - 1;
    constant ZEROS  : std_logic_vector(w-1 downto 0)    := (others => '0');
    variable f_int  : std_logic_vector(f'high downto 0) := f;  -- fixed width version of f
    variable f_sign : std_logic                         := f_int(w-1);              -- sign bit of f
    variable f_exp  : std_logic_vector(EW-1 downto 0)   := f_int(w-2 downto fw-1);  -- exponent of f
    variable f_mant : std_logic_vector(fw-2 downto 0)   := f_int(fw-2 downto 0);    -- mantissa of f
    variable exp    : integer;
    variable result : real;
  begin

    -- Check bit widths match
    assert f'high = w - 1
      report "ERROR: flt_to_real: input std_logic_vector f must have bit width = input integer w"
      severity failure;

    -- Check for special cases: return zero if any are found
    if flt_to_special(f, w, fw) /= normal then
      result := 0.0;
    else

      -- Convert mantissa to real
      -- To avoid VHDL's integer type overflowing, consider at most 30 bits of the mantissa
      result := real(to_integer(unsigned(f_mant(fw - 2 downto fw - FW_LIM)))) / real(2 ** (FW_LIM - 1)) + 1.0;

      -- Apply exponent
      exp := to_integer(unsigned(f_exp)) - E_BIAS;
      if exp > 0 then
        result := result * (2.0 ** real(exp));
      elsif exp < 0 then
        result := result / (2.0 ** real(-exp));
      end if;

      -- Apply sign bit
      if f_sign = '1' then
        result := -result;
      end if;

    end if;

    return result;
  end function flt_to_real;
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT SM is
			Generic (
				RegisterLength : natural := REG_BLOCK_WIDTH;
				RegisterBlockDepth : natural := REG_BLOCK_DEPTH;	
				Warp_Id_Length : natural := WARP_ID_SP;
				Reg_Addr_Length : natural := REG_ADDR_SP;
				Max_RegBlock_Numb : natural := MAX_REG_BLOCK_PER_WARP;
				Block_Addr_Length : natural := ROW_ADDR_SP;
				RegBlock_Addr_Length : natural := REG_BLOCK_ADDR_SP;
				RegBlock_Row_Numb : natural := REG_BLOCK_ROW;
				Core_Numb : natural := CORE_NUMB;
				Shared_Mem_Addr_Width : natural := SHARED_MEM_ADDR_WIDTH
			);
			 Port(
				clk    : in std_logic;
				reset  : in std_logic;
				en     : in std_logic;
				EnQueue   : in std_logic;
				OpQueueIn : in instruction_word_queue_type;
				WrShMem	 : in std_logic;
				DataIn 	 : in data_out_col_array_type;
				ShMemAddr : in std_logic_vector (SHARED_MEM_ADDR_WIDTH-1 downto 0);
				nan		 : out std_logic;
				overflow	 : out std_logic;
				dbzero	 : out std_logic;
				underflow : out std_logic;
				zero		 : out std_logic;
				DataOut	 : out data_out_col_array_type
			);
    END COMPONENT;
    

   --Inputs
   signal clk, en, EnQueue, WrShMem : std_logic := '0';
	signal DataIn : data_out_col_array_type := (others => (others => '0'));
	signal ShMemAddr : std_logic_vector (SHARED_MEM_ADDR_WIDTH-1 downto 0) := (others => '0');
   signal OpQueueIn : instruction_word_queue_type := (others => ISTR_WORD_INIT);
   signal reset : std_logic := '1';

 	--Outputs
   signal nan_out, overflow_out, dbzero, underflow_out, zero_out  : std_logic := '0';
   signal DataOut : data_out_col_array_type;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
	
	alias op1 : instruction_word_type is OpQueueIn (0);
	alias op2 : instruction_word_type is OpQueueIn (1);
--	alias op3 : instruction_word_type is OpQueueIn (2);
--	alias op4 : instruction_word_type is OpQueueIn (3);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: SM PORT MAP (
          clk => clk,
          en => en,
			 reset => reset,
          EnQueue => EnQueue,
          OpQueueIn => OpQueueIn,
			 WrShMem => WrShMem,
			 DataIn => DataIn,
			 ShMemAddr => ShMemAddr,
          nan => nan_out,
          overflow => overflow_out,
          dbzero => dbzero,
          underflow => underflow_out,
			 zero => zero_out,
			 DataOut => DataOut
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		en <= '1';
		reset <= '0';
		EnQueue <= '0';
		
		WrShMem <= '1';
		DataIn(0) <= real_to_flt(1.11, normal, 32, 24);
		DataIn(1) <= real_to_flt(2.22, normal, 32, 24);
		ShMemAddr <= "0000000";
		
		wait for clk_period;		
		DataIn(0) <= real_to_flt(3.33, normal, 32, 24);
		DataIn(1) <= real_to_flt(4.44, normal, 32, 24);
		ShMemAddr <= "0000001";
		
		
		wait for clk_period;	
		DataIn(0) <= real_to_flt(5.55, normal, 32, 24);
		DataIn(1) <= real_to_flt(6.66, normal, 32, 24);
		ShMemAddr <= "0000010";

		wait for clk_period;		
		DataIn(0) <= real_to_flt(7.77, normal, 32, 24);
		DataIn(1) <= real_to_flt(8.88, normal, 32, 24);
		ShMemAddr <= "0000011";
		
		wait for clk_period;	
		DataIn(0) <= real_to_flt(9.99, normal, 32, 24);
		DataIn(1) <= real_to_flt(10.10, normal, 32, 24);
		ShMemAddr <= "0000100";

		wait for clk_period;		
		DataIn(0) <= real_to_flt(11.11, normal, 32, 24);
		DataIn(1) <= real_to_flt(12.12, normal, 32, 24);
		ShMemAddr <= "0000101";
		
		wait for clk_period;	
		DataIn(0) <= real_to_flt(13.13, normal, 32, 24);
		DataIn(1) <= real_to_flt(14.14, normal, 32, 24);
		ShMemAddr <= "0000110";
		
		wait for clk_period;
		DataIn(0) <= real_to_flt(15.15, normal, 32, 24);
		DataIn(1) <= real_to_flt(16.16, normal, 32, 24);
		ShMemAddr <= "0000111";
		
		wait for clk_period;
		WrShMem <= '0';
		DataIn(0) <= real_to_flt(0.13, zero_pos, 32, 24);
		DataIn(1) <= real_to_flt(0.14, zero_pos, 32, 24);
		
		wait for 10*clk_period;
		EnQueue <= '1';
		op1.WarpID <= "000001";
		op1.Operation <= WARP_ALLOC_OP;
		op1.Rs <= "0001";
		
		op2.WarpID <= "000010";
		op2.Operation <= WARP_ALLOC_OP;
		op2.Rs <= "0010";
		
		wait for clk_period;
		EnQueue <= '0';
		
		wait for 10*clk_period;
		EnQueue <= '1';
		op1.Operation <= LOAD_OP;
		op1.MemAddr <= "0000000";
		op1.Rd <= "0000";
		
		op2.Operation <= LOAD_OP;
		op2.MemAddr <= "0000001";
		op2.Rd <= "0001";
		
		wait for clk_period;
		EnQueue <= '0';
		
		wait for clk_period;
		EnQueue <= '1';
		op1.Operation <= LOAD_OP;
		op1.MemAddr <= "0000010";
		op1.Rd <= "0010";
		
		op2.Operation <= LOAD_OP;
		op2.MemAddr <= "0000011";
		op2.Rd <= "0011";
		
		wait for clk_period;
		EnQueue <= '0';
		
		wait for clk_period;
		EnQueue <= '1';
		op1.Operation <= LOAD_OP;
		op1.MemAddr <= "0000100";
		op1.Rd <= "0001";
		
		op2.Operation <= LOAD_OP;
		op2.MemAddr <= "0000101";
		op2.Rd <= "0000";
		
		wait for clk_period;
		EnQueue <= '0';
		
		wait for clk_period;
		EnQueue <= '1';
		op1.Operation <= LOAD_OP;
		op1.MemAddr <= "0000110";
		op1.Rd <= "0011";
		
		op2.Operation <= LOAD_OP;
		op2.MemAddr <= "0000111";
		op2.Rd <= "0010";
		
		wait for clk_period;
		EnQueue <= '0';
		op1.MemAddr <= "0000000";
		op2.MemAddr <= "0000000";
		
		wait for 10*clk_period;
		EnQueue <= '1';
		op1.Operation <= ADD_OP;
		op1.Rs <= "0000";
		op1.Rt <= "0010";
		op1.Rd <= "0100";
		
		op2.Operation <= ADD_OP;
		op2.Rs <= "0001";
		op2.Rt <= "0011";
		op2.Rd <= "0100";
		
		wait for clk_period;
		EnQueue <= '0';
		
		wait for clk_period;
		EnQueue <= '1';
		op1.Operation <= ADD_OP;
		op1.Rs <= "0001";
		op1.Rt <= "0011";
		op1.Rd <= "0101";
		
		op2.Operation <= ADD_OP;
		op2.Rs <= "0000";
		op2.Rt <= "0010";
		op2.Rd <= "0101";
		
		wait for clk_period;
		EnQueue <= '0';
		
		wait for 10*clk_period;
		EnQueue <= '1';
		op1.Operation <= MULT_OP;
		op1.Rs <= "0000";
		op1.Rt <= "0001";
		op1.Rd <= "0110";
		
		op2.Operation <= MULT_OP;
		op2.Rs <= "0000";
		op2.Rt <= "0001";
		op2.Rd <= "0110";
		
		wait for clk_period;
		EnQueue <= '0';
		
		wait for clk_period;
		EnQueue <= '1';
		op1.Operation <= MULT_OP;
		op1.Rs <= "0010";
		op1.Rt <= "0011";
		op1.Rd <= "0111";
		
		op2.Operation <= MULT_OP;
		op2.Rs <= "0010";
		op2.Rt <= "0011";
		op2.Rd <= "0111";
		
		wait for clk_period;
		EnQueue <= '0';
		
--		wait for 100 ns;	
--		op1.WarpID <= "000001";
--		op1.Operation <= STORE_OP;
--		op1.Rs <= "00001";
--		op1.Rt <= "00011";
--		op1.Rd <= "10001";
--		op1.DataIn(0) <= x"11";
--		op1.DataIn(1) <= x"12";
--		
--		op2.WarpID <= "000010";
--		op2.Operation <= STORE_OP;
--		op2.Rs <= "00011";
--		op2.Rt <= "00111";
--		op2.Rd <= "10101";
--		op2.DataIn(0) <= x"13";
--		op2.DataIn(1) <= x"14";
--		
--		op3.WarpID <= "000011";
--		op3.Operation <= STORE_OP;
--		op3.Rs <= "01101";
--		op3.Rt <= "01111";
--		op3.Rd <= "10111";
--		op3.DataIn(0) <= x"15";
--		op3.DataIn(1) <= x"16";
--		
--		op4.WarpID <= "000100";
--		op4.Operation <= STORE_OP;
--		op4.Rs <= "11001";
--		op4.Rt <= "00111";
--		op4.Rd <= "11111";
--		op4.DataIn(0) <= x"23";
--		op4.DataIn(1) <= x"24";

      -- insert stimulus here 

      wait;
   end process;

END;

