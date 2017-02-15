----------------------------------------------------------------------------------
-- Company: 
-- Author: 	Mirko Gagliardi
-- 
-- Create Date:    26/06/2015
-- Design Name: 
-- Module Name:    FPCore - rtl 
-- Project Name: 	 Streaming Multiprocessor	
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 	 
--
-- Revision: v 1.6
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

library work;
use work.fpupack.all;

entity FPCore is
	PORT(
		clk              : IN  std_logic;
		reset            : IN  std_logic;
		en               : IN  std_logic;
		DataInA          : IN  std_logic_vector(FP_WIDTH - 1 DOWNTO 0);
		DataInB          : IN  std_logic_vector(FP_WIDTH - 1 DOWNTO 0);
		DataInC          : IN  std_logic_vector(FP_WIDTH - 1 DOWNTO 0);
		EnOp             : IN  std_logic_vector(OP_NUM - 1 DOWNTO 0);
		SelMuxIn         : IN  std_logic_vector(SEL_NUM - 1 DOWNTO 0);
		nan              : OUT std_logic;
		overflow         : OUT std_logic;
		division_by_zero : OUT std_logic;
		underflow        : OUT std_logic;
		zero             : OUT std_logic;
		DataOut          : OUT std_logic_vector(FP_WIDTH - 1 DOWNTO 0)
	);
end entity;

architecture rtl of FPCore is
	COMPONENT registro_n_bit
		Generic(N : natural := 4);
		Port(value_in  : in  STD_LOGIC_VECTOR(N - 1 downto 0);
			 clk       : in  STD_LOGIC;
			 reset     : in  STD_LOGIC;
			 en        : in  STD_LOGIC;
			 value_out : out STD_LOGIC_VECTOR(N - 1 downto 0));
	END COMPONENT;

	COMPONENT FifoShifter is
		Generic(
			VECTOR_WIDTH : natural := 32;
			FIFO_DEPTH   : natural := 10
		);
		Port(
			clock         : in  std_logic;
			reset         : in  std_logic;
			en            : in  std_logic;
			input_vector  : in  std_logic_vector(VECTOR_WIDTH - 1 downto 0);
			output_vector : out std_logic_vector(VECTOR_WIDTH - 1 downto 0)
		);
	END COMPONENT;

	COMPONENT mux
		Generic(N : natural := 4);
		port(
			a, b, c, d, e, f, g, h, i, j, k : in  std_logic_vector(N - 1 downto 0);
			sel                             : in  std_logic_vector(3 downto 0);
			y                               : out std_logic_vector(N - 1 downto 0)
		);
	END COMPONENT;

	COMPONENT mux_2to1
		Generic(N : natural := 4);
		port(
			a, b : in  std_logic_vector(N - 1 downto 0);
			sel  : in  std_logic;
			y    : out std_logic_vector(N - 1 downto 0)
		);
	END COMPONENT;

	COMPONENT mux_3to1
		Generic(N : natural := 4);
		Port(
			a, b, c : in  std_logic_vector(N - 1 downto 0);
			sel     : in  std_logic_vector(3 downto 0);
			y       : out std_logic_vector(N - 1 downto 0)
		);
	END COMPONENT;

	COMPONENT fp_add
		PORT(
			aclr      : IN  STD_LOGIC;
			clk_en    : IN  STD_LOGIC;
			clock     : IN  STD_LOGIC;
			dataa     : IN  STD_LOGIC_VECTOR(FP_WIDTH - 1 DOWNTO 0);
			datab     : IN  STD_LOGIC_VECTOR(FP_WIDTH - 1 DOWNTO 0);
			nan       : OUT STD_LOGIC;
			overflow  : OUT STD_LOGIC;
			result    : OUT STD_LOGIC_VECTOR(FP_WIDTH - 1 DOWNTO 0);
			underflow : OUT STD_LOGIC;
			zero      : OUT STD_LOGIC
		);
	END COMPONENT;

	COMPONENT fp_mult
		PORT(
			aclr      : IN  STD_LOGIC;
			clk_en    : IN  STD_LOGIC;
			clock     : IN  STD_LOGIC;
			dataa     : IN  STD_LOGIC_VECTOR(FP_WIDTH - 1 DOWNTO 0);
			datab     : IN  STD_LOGIC_VECTOR(FP_WIDTH - 1 DOWNTO 0);
			nan       : OUT STD_LOGIC;
			overflow  : OUT STD_LOGIC;
			result    : OUT STD_LOGIC_VECTOR(FP_WIDTH - 1 DOWNTO 0);
			underflow : OUT STD_LOGIC;
			zero      : OUT STD_LOGIC
		);
	END COMPONENT;

	COMPONENT fp_div
		PORT(
			aclr             : IN  STD_LOGIC;
			clk_en           : IN  STD_LOGIC;
			clock            : IN  STD_LOGIC;
			dataa            : IN  STD_LOGIC_VECTOR(FP_WIDTH - 1 DOWNTO 0);
			datab            : IN  STD_LOGIC_VECTOR(FP_WIDTH - 1 DOWNTO 0);
			division_by_zero : OUT STD_LOGIC;
			nan              : OUT STD_LOGIC;
			overflow         : OUT STD_LOGIC;
			result           : OUT STD_LOGIC_VECTOR(FP_WIDTH - 1 DOWNTO 0);
			underflow        : OUT STD_LOGIC;
			zero             : OUT STD_LOGIC
		);
	END COMPONENT;

	COMPONENT fp_abs
		PORT(
			data   : IN  STD_LOGIC_VECTOR(FP_WIDTH - 1 DOWNTO 0);
			result : OUT STD_LOGIC_VECTOR(FP_WIDTH - 1 DOWNTO 0)
		);
	END COMPONENT;

	COMPONENT fp_neg
		PORT(
			a      : in  std_logic_vector(FP_WIDTH - 1 DOWNTO 0);
			result : out std_logic_vector(FP_WIDTH - 1 DOWNTO 0)
		);
	END COMPONENT;

	COMPONENT ceilfloor_dut
		port(
			ceil_in   : in  std_logic_vector(FP_WIDTH - 1 downto 0);
			floor_in  : in  std_logic_vector(FP_WIDTH - 1 downto 0);
			ceil_out  : out std_logic_vector(FP_WIDTH - 1 downto 0);
			floor_out : out std_logic_vector(FP_WIDTH - 1 downto 0);
			clk       : in  std_logic;
			areset    : in  std_logic
		);
	END COMPONENT;

	COMPONENT fp_max_dut
		PORT(
			max_in1 : in  std_logic_vector(FP_WIDTH - 1 downto 0);
			max_in2 : in  std_logic_vector(FP_WIDTH - 1 downto 0);
			max_out : out std_logic_vector(FP_WIDTH - 1 downto 0);
			clk     : in  std_logic;
			areset  : in  std_logic
		);
	END COMPONENT;

	COMPONENT fp_min_dut
		PORT(
			min_in1 : in  std_logic_vector(FP_WIDTH - 1 downto 0);
			min_in2 : in  std_logic_vector(FP_WIDTH - 1 downto 0);
			min_out : out std_logic_vector(FP_WIDTH - 1 downto 0);
			clk     : in  std_logic;
			areset  : in  std_logic
		);
	END COMPONENT;

	COMPONENT rint_dut
		PORT(
			rint_in  : in  std_logic_vector(FP_WIDTH - 1 downto 0);
			rint_out : out std_logic_vector(FP_WIDTH - 1 downto 0);
			clk      : in  std_logic;
			areset   : in  std_logic
		);
	END COMPONENT;

	COMPONENT fract_dut
		PORT(
			frac_in   : in  std_logic_vector(FP_WIDTH - 1 downto 0);
			frac_obut : out std_logic_vector(FP_WIDTH - 1 downto 0);
			clk       : in  std_logic;
			areset    : in  std_logic
		);
	END COMPONENT;

	signal en_addsub, en_add, en_sub, en_mult, en_div, en_abs, en_neg, en_max, en_min, en_ceil, en_floor, en_rint, en_frac               : std_logic                               := '0';
	signal add_in1, add_in2, mult_in1, mult_in2, abs_in, neg_in, max_in1, max_in2, min_in1, min_in2, ceil_in, floor_in, rint_in, frac_in : std_logic_vector(FP_WIDTH - 1 downto 0) := (others => '0');

	signal div_in1, div_in2                                                                                                 : std_logic_vector(FP_WIDTH - 1 downto 0) := "00111111100000000000000000000000";
	signal add_out, mult_out, div_out, mux_out, abs_out, neg_out, max_out, min_out, ceil_out, floor_out, rint_out, frac_out : std_logic_vector(FP_WIDTH - 1 downto 0) := (others => '0');
	signal add_mux_in1, add_mux_in2, addsub_mux_in, DataInB_neg                                                             : std_logic_vector(FP_WIDTH - 1 downto 0) := (others => '0');

	signal en_fma, en_fma_delay                                            : std_logic_vector(0 downto 0)           := (others => '0');
	signal add_signal_out, mult_signal_out, div_signal_out, res_signal_out : std_logic_vector(4 downto 0)           := (others => '0');
	signal sel_mux                                                         : std_logic_vector(SEL_NUM - 1 downto 0) := (others => '0');

	signal DataInC_delayed : std_logic_vector(FP_WIDTH - 1 downto 0) := (others => '0');

begin
	sel_mux   <= SelMuxIn;
	en_add    <= EnOp(0);
	en_sub    <= EnOp(1);
	en_mult   <= EnOp(2);
	en_fma(0) <= EnOp(3);
	en_div    <= EnOp(4);
	en_abs    <= EnOp(5);
	en_neg    <= EnOp(6);
	en_max    <= EnOp(7);
	en_min    <= EnOp(8);
	en_ceil   <= EnOp(9);
	en_floor  <= EnOp(10);
	en_rint   <= EnOp(11);
	en_frac   <= EnOp(12);

	-----------------------------------------------------------------------
	-- ADDER
	-----------------------------------------------------------------------	
	DataInB_neg <= (not DataInB(FP_WIDTH - 1)) & DataInB(FP_WIDTH - 2 downto 0);
	en_addsub   <= en_add or en_sub or en_fma_delay(0);

	DataInC_delay : FifoShifter
		GENERIC MAP(
			VECTOR_WIDTH => FP_WIDTH,
			FIFO_DEPTH   => conv_integer(MULT_LAT)
		)
		PORT MAP(
			clock         => clk,
			reset         => reset,
			en            => en,
			input_vector  => DataInC,
			output_vector => DataInC_delayed
		);

	fma_en_delay : FifoShifter
		GENERIC MAP(
			VECTOR_WIDTH => 1,
			FIFO_DEPTH   => conv_integer(MULT_LAT)
		)
		PORT MAP(
			clock         => clk,
			reset         => reset,
			en            => en,
			input_vector  => en_fma,
			output_vector => en_fma_delay
		);

	mux_2to1_addsub : mux_2to1
		GENERIC MAP(FP_WIDTH)
		PORT MAP(DataInB, DataInB_neg, en_sub, addsub_mux_in);

	mux_2to1_add_in1 : mux_2to1
		GENERIC MAP(FP_WIDTH)
		PORT MAP(DataInA, mult_out, en_fma_delay(0), add_mux_in1);
	mux_2to1_add_in2 : mux_2to1
		GENERIC MAP(FP_WIDTH)
		PORT MAP(addsub_mux_in, DataInC_delayed, en_fma_delay(0), add_mux_in2);

	add_in1_reg : registro_n_bit
		GENERIC MAP(FP_WIDTH)
		PORT MAP(add_mux_in1, clk, reset, en_addsub, add_in1);
	add_in2_reg : registro_n_bit
		GENERIC MAP(FP_WIDTH)
		PORT MAP(add_mux_in2, clk, reset, en_addsub, add_in2);

	fp_addsub_inst : fp_add PORT MAP(
			aclr      => reset,
			clk_en    => en,
			clock     => clk,
			dataa     => add_in1,
			datab     => add_in2,
			nan       => add_signal_out(0),
			overflow  => add_signal_out(1),
			result    => add_out,
			underflow => add_signal_out(2),
			zero      => add_signal_out(3)
		);

	-----------------------------------------------------------------------
	-- MULT
	-----------------------------------------------------------------------
	mult_in1_reg : registro_n_bit
		GENERIC MAP(FP_WIDTH)
		PORT MAP(DataInA, clk, reset, en_mult, mult_in1);
	mult_in2_reg : registro_n_bit
		GENERIC MAP(FP_WIDTH)
		PORT MAP(DataInB, clk, reset, en_mult, mult_in2);

	fp_mult_inst : fp_mult PORT MAP(
			aclr      => reset,
			clk_en    => en,
			clock     => clk,
			dataa     => mult_in1,
			datab     => mult_in2,
			nan       => mult_signal_out(0),
			overflow  => mult_signal_out(1),
			result    => mult_out,
			underflow => mult_signal_out(2),
			zero      => mult_signal_out(3)
		);

	-----------------------------------------------------------------------
	-- DIV
	-----------------------------------------------------------------------

	gen_div : if DIV_GEN = 1 generate
		div_in1_reg : registro_n_bit
			GENERIC MAP(FP_WIDTH)
			PORT MAP(DataInA, clk, reset, en_div, div_in1);
		div_in2_reg : registro_n_bit
			GENERIC MAP(FP_WIDTH)
			PORT MAP(DataInB, clk, reset, en_div, div_in2);

		fp_div_inst : fp_div PORT MAP(
				aclr             => reset,
				clk_en           => en,
				clock            => clk,
				dataa            => div_in1,
				datab            => div_in2,
				division_by_zero => div_signal_out(4),
				nan              => div_signal_out(0),
				overflow         => div_signal_out(1),
				result           => div_out,
				underflow        => div_signal_out(2),
				zero             => div_signal_out(3)
			);

	end generate;

	-----------------------------------------------------------------------
	-- ABS
	-----------------------------------------------------------------------	

	gen_abs : if ABS_GEN = 1 generate
		abs_in_reg : registro_n_bit
			GENERIC MAP(FP_WIDTH)
			PORT MAP(DataInA, clk, reset, en_abs, abs_in);

		fp_abs_inst : fp_abs PORT MAP(
				data   => abs_in,
				result => abs_out
			);

	end generate;

	-----------------------------------------------------------------------
	-- NEG
	-----------------------------------------------------------------------	

	gen_neg : if NEG_GEN = 1 generate
		neg_in_reg : registro_n_bit
			GENERIC MAP(FP_WIDTH)
			PORT MAP(DataInA, clk, reset, en_neg, neg_in);

		fp_neg_inst : fp_neg PORT MAP(
				a      => neg_in,
				result => neg_out
			);

	end generate;

	-----------------------------------------------------------------------
	-- CEIL and FLOOR
	-----------------------------------------------------------------------	

	gen_ceilfloor : if CEILFLOOR_GEN = 1 generate
		ceil_in_reg : registro_n_bit
			GENERIC MAP(FP_WIDTH)
			PORT MAP(DataInA, clk, reset, en_ceil, ceil_in);
		floor_in_reg : registro_n_bit
			GENERIC MAP(FP_WIDTH)
			PORT MAP(DataInA, clk, reset, en_floor, floor_in);

		fp_ceilfloor_inst : ceilfloor_dut PORT MAP(
				ceil_in   => ceil_in,
				floor_in  => floor_in,
				ceil_out  => ceil_out,
				floor_out => floor_out,
				clk       => clk,
				areset    => reset
			);

	end generate;

	-----------------------------------------------------------------------
	-- MAX and MIN
	-----------------------------------------------------------------------	

	gen_max : if MAX_GEN = 1 generate
		max_in1_reg : registro_n_bit
			GENERIC MAP(FP_WIDTH)
			PORT MAP(DataInA, clk, reset, en_max, max_in1);
		max_in2_reg : registro_n_bit
			GENERIC MAP(FP_WIDTH)
			PORT MAP(DataInB, clk, reset, en_max, max_in2);

		fp_max_inst : fp_max_dut PORT MAP(
				clk     => clk,
				areset  => reset,
				max_in1 => max_in1,
				max_in2 => max_in2,
				max_out => max_out
			);

	end generate;

	gen_min : if MIN_GEN = 1 generate
		min_in1_reg : registro_n_bit
			GENERIC MAP(FP_WIDTH)
			PORT MAP(DataInA, clk, reset, en_min, min_in1);
		min_in2_reg : registro_n_bit
			GENERIC MAP(FP_WIDTH)
			PORT MAP(DataInB, clk, reset, en_min, min_in2);

		fp_min_inst : fp_min_dut PORT MAP(
				clk     => clk,
				areset  => reset,
				min_in1 => min_in1,
				min_in2 => min_in2,
				min_out => min_out
			);

	end generate;

	-----------------------------------------------------------------------
	-- RINT and FRAC
	-----------------------------------------------------------------------	

	gen_rint : if RINT_GEN = 1 generate
		rint_in_reg : registro_n_bit
			GENERIC MAP(FP_WIDTH)
			PORT MAP(DataInA, clk, reset, en_rint, rint_in);

		fp_rint_inst : rint_dut PORT MAP(
				clk      => clk,
				areset   => reset,
				rint_in  => rint_in,
				rint_out => rint_out
			);

	end generate;

	gen_frac : if FRAC_GEN = 1 generate
		frac_in_reg : registro_n_bit
			GENERIC MAP(FP_WIDTH)
			PORT MAP(DataInA, clk, reset, en_frac, frac_in);

		fp_fract_inst : fract_dut PORT MAP(
				clk       => clk,
				areset    => reset,
				frac_in   => frac_in,
				frac_obut => frac_out
			);

	end generate;

	-----------------------------------------------------------------------
	-- MUX Results
	-----------------------------------------------------------------------	 
	mux_result : process(sel_mux, clk)
	begin
		if rising_edge(clk) then
			if sel_mux = ADD_OP then
				DataOut <= add_out;
			elsif sel_mux = SUB_OP then
				DataOut <= add_out;
			elsif sel_mux = MULT_OP then
				DataOut <= mult_out;
			elsif sel_mux = DIV_OP then
				DataOut <= div_out;
			elsif sel_mux = FMA_OP then
				DataOut <= add_out;
			elsif sel_mux = ABS_OP then
				DataOut <= abs_out;
			elsif sel_mux = NEG_OP then
				DataOut <= neg_out;
			elsif sel_mux = CEIL_OP then
				DataOut <= ceil_out;
			elsif sel_mux = FLOOR_OP then
				DataOut <= floor_out;
			elsif sel_mux = MAX_OP then
				DataOut <= max_out;
			elsif sel_mux = MIN_OP then
				DataOut <= min_out;
			elsif sel_mux = RINT_OP then
				DataOut <= rint_out;
			elsif sel_mux = FRAC_OP then
				DataOut <= frac_out;
			else
				DataOut <= (others => '0');
			end if;
		end if;
	end process;

	-- Exceptions Multiplexer
	mux_out_except : process(sel_mux, clk)
	begin
		if rising_edge(clk) then
			if sel_mux = ADD_OP or sel_mux = SUB_OP or sel_mux = FMA_OP then
				nan              <= add_signal_out(0);
				overflow         <= add_signal_out(1);
				underflow        <= add_signal_out(2);
				zero             <= add_signal_out(3);
				division_by_zero <= add_signal_out(4);
			elsif sel_mux = MULT_OP then
				nan              <= mult_signal_out(0);
				overflow         <= mult_signal_out(1);
				underflow        <= mult_signal_out(2);
				zero             <= mult_signal_out(3);
				division_by_zero <= mult_signal_out(4);
			elsif sel_mux = DIV_OP then
				nan              <= div_signal_out(0);
				overflow         <= div_signal_out(1);
				underflow        <= div_signal_out(2);
				zero             <= div_signal_out(3);
				division_by_zero <= div_signal_out(4);
			else
				nan              <= '0';
				overflow         <= '0';
				underflow        <= '0';
				zero             <= '0';
				division_by_zero <= '0';
			end if;
		end if;
	end process;

end rtl;
