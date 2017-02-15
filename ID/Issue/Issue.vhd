----------------------------------------------------------------------------------
-- Company: 
-- Author: 	Mirko Gagliardi
-- 
-- Create Date:    28/07/2015
-- Design Name: 
-- Module Name:    Issue - rtl 
-- Project Name: 	 Streaming Multiprocessor	
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 	 
--
-- Revision: v 2.5
-- Revision 0.01 - File Created
-- Additional Comments: 
--								The Issue receives in input a set of instruction word and each of these 
--								is a possible schedulable instruction from a different kernel or warp queue. The Issue checks if there are 
--								possible structural hazard among one of these instruction and those already in the datapath. If more
--								instruction can be scheduled, the Issue chose one of them and propagates it on next stage.
--								The number of instruction in input is customizable from the users.
--								The Issue choice one instruction in a fairly way using a Round-Robin algorithm.		
--
--								When EnQueue is high the component stores input instructions in its queue called op_queue. Issue tracks executed 
--								instruction in a vector called index_mask. When it has all bit high Nop passes.
--
--								Each instruction in op_queue are check by a StructHazardCheck in parallel. StructHazardCheck checks structural
--								hazard between its input and instructions already scheduled. Two vectors, called MuxCollVector and AdderCollVect,
--								track instructions already in the datapath, they are collision vectors. If two or more instructions are eligible, 
--								the Index Selector choices one of them	in a fairly way and using an Round-Robin algorithm. The last Index Selector 
--								output drives the OpOut and an instruction word is chosen. At last, UpdateVect receives the scheduled operation and
--								updates MuxCollVector and AdderCollVect. If all instructions in op_queue are been already executed, NopOut output port 
--								is high and UpdateVect	receives NOP as input and does not update MuxCollVector and AdderCollVect.
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

library work;
use work.fpupack.all;

entity Issue is
	Port(
			clk    : in std_logic;
			reset  : in std_logic;
			enable : in std_logic;
			EnQueue : in std_logic;
 			OpIn   : in instruction_word_queue_type;
			NopOut : out std_logic;
			OpOut  : out instruction_word_type
		);	
end entity;

architecture rtl of Issue is	
  -----------------------------------------------------------------------
  -- Issue Functions
  -----------------------------------------------------------------------	
	
	-- This function maps the IndexSelector of the first level with StructHazardCheck, and the others 
	-- among them
	function grant_assign (
		 GrantIn : op_queue_in_type;
		 grant_in_inter : ind_sel_out_type;
		 size_count : integer;
		 size_indarray : integer
		) return ind_sel_in_type_array is

		 variable index : integer;
		 variable IndSelArray : ind_sel_in_type_array;
		 
	  begin
		 
		 for i in size_count-1 downto 0 loop		
				IndSelArray(size_indarray - i-1)(0) := GrantIn(2*(size_count-1 - i)+1);
				IndSelArray(size_indarray - i-1)(1) := GrantIn(2*(size_count-1 - i));	
		 end loop;	 
		 
		 for i in size_indarray/2 downto 1 loop
				IndSelArray(size_indarray - size_count - i)(0) := grant_in_inter(size_indarray - 2*i + 1);
				IndSelArray(size_indarray - size_count - i)(1) := grant_in_inter(size_indarray - 2*i);
		end loop;
			 
		return IndSelArray;
	end function;
	
	-- This function connects the right counter with the right IndexSelector level
	function int_assign (
		 CounterArray : integer_array_counter;
		 size_count : integer;
		 size_indsel : integer
		) return integer_array_indsel is

		 variable index : integer;
		 variable IndSelArray : integer_array_indsel;
		 
	  begin
		 
		 for j in 0 to size_count-1 loop
			 for i in 0 to 2**j-1 loop
				IndSelArray(i + 2**j-1) := CounterArray(j);
			 end loop;	 
		 end loop;
		 return IndSelArray;
	end function;
	
  -----------------------------------------------------------------------
  -- Issue Components
  -----------------------------------------------------------------------		
	COMPONENT IndexSelector 
		Generic (
				N : integer := IND_SEL_DIM;
				M : integer := OP_QUEUE_IND
		);
		Port(
			 NopVect  : in std_logic_vector(N-1 downto 0);
			 GrantIn  : in ind_sel_in_type;
			 counter  : in integer;
			 NopOut		 : out std_logic;
			 CheckOut : out std_logic_vector(M-1 downto 0)
		);
	END COMPONENT;
	
	COMPONENT counter
		Generic(
			N : natural := 4;
			M : natural := 2
		);
		Port(
			clk	  : in std_logic;
			reset	  : in std_logic;
			enable  : in std_logic;
			count_mod   : out integer
		);
	END COMPONENT;
	
	COMPONENT StructHazardCheck
		Port(
			clk 	: in std_logic;
			reset : in std_logic;
			en    : in std_logic;
			NoGrant   : in std_logic;
			op	   : in std_logic_vector (SEL_NUM-1 DOWNTO 0);
			Ind   : in std_logic_vector(OP_QUEUE_IND-1 downto 0);
			MuxCollVector : in std_logic_vector (MAX_LATENCY-1 downto 0);
			AdderCollVect : in std_logic_vector (MULT_LAT_S downto 0);
			IndOut : out std_logic_vector(OP_QUEUE_IND-1 downto 0);
			GrantedOut : out std_logic
		);
	END COMPONENT;
	
	COMPONENT UpdateVect
		Port(
				clk   : in std_logic;
				reset : in std_logic;
				en    : in std_logic;
				MuxCollVector_in : in std_logic_vector (MAX_LATENCY-1 downto 0);
				AdderCollVect_in : in  std_logic_vector (MULT_LAT_S downto 0);
				LastOp : in std_logic_vector(SEL_NUM-1 downto 0);
				MuxCollVector_out : out std_logic_vector (MAX_LATENCY-1 downto 0);
				AdderCollVect_out : out  std_logic_vector (MULT_LAT_S downto 0)
			);	
	END COMPONENT;

  -----------------------------------------------------------------------
  -- Issue Signals
  -----------------------------------------------------------------------		
	signal op_queue : instruction_word_queue_type := (others => ISTR_WORD_INIT);
	signal check_out : std_logic_vector (OP_QUEUE_IND-1 downto 0) := (others => '0');
	signal MuxCollVector_new, MuxCollVector_old : std_logic_vector (MAX_LATENCY-1 downto 0) := (others => '0');
	signal AdderCollVect_new, AdderCollVect_old : std_logic_vector (MULT_LAT_S downto 0) := (others => '0');
	signal LastOp : std_logic_vector(SEL_NUM-1 downto 0) := (others => '0');
	
	signal NopVect : std_logic_vector (NUM_OP_CHECK-1 downto 0) := (others => '0');
	
	signal nop_in_vect : std_logic_vector(2*IND_SEL_BLOCK_NUM-1 downto 0) := (others => '0');
	signal counter_array : integer_array_counter := (others => 0);
	signal index_counter : integer_array_indsel := (others => 0);
	signal indsel_out_temp : ind_sel_out_type := (others => (others => '0'));
	signal nop_out_vect : std_logic_vector(IND_SEL_BLOCK_NUM-1 downto 0) := (others => '0');
	signal grant_in : ind_sel_in_type_array := (others => (others => (others => '0')));
	
	signal ind_in : op_queue_in_type := (others => (others => '0'));
	signal reg_out : std_logic_vector(OP_QUEUE_IND-1 downto 0) := (others => '0');
	signal nop_reg, index_mask : std_logic_vector(2**OP_QUEUE_IND-1 downto 0) := (others => '0');
	
	signal ones_vector : std_logic_vector(2**OP_QUEUE_IND-1 downto 0) := (others => '1');

begin
		
	process(clk, reset)	
	begin
		if reset = '1' then
			op_queue <= (others => ISTR_WORD_INIT);
			index_mask <= (others => '0');
		elsif rising_edge(clk) then
			if EnQueue = '1' then 
				op_queue <= OpIn;
				index_mask <= (others => '0');
			end if;
			OpOut <= op_queue(conv_integer(check_out));
			index_mask(conv_integer(check_out)) <= '1';
		end if;
	end process;
	
	MuxCollVector_new <= MuxCollVector_old;
	AdderCollVect_new <= AdderCollVect_old;
	LastOp <= NOP when nop_out_vect(0) = '1' --index_mask = ones_vector
				 else op_queue(conv_integer(check_out)).Operation;
	NopOut <= nop_out_vect(0);

	index_counter <= int_assign(counter_array, OP_QUEUE_IND, IND_SEL_BLOCK_NUM);
	nop_in_vect(2*IND_SEL_BLOCK_NUM-1 downto IND_SEL_BLOCK_NUM-1) <= nop_reg;
	nop_in_vect(IND_SEL_BLOCK_NUM-2 downto 0) <= nop_out_vect(IND_SEL_BLOCK_NUM-1 downto 1);
	
	grant_in <= grant_assign(ind_in, indsel_out_temp, 2**OP_QUEUE_IND / 2, IND_SEL_BLOCK_NUM);
	check_out <= indsel_out_temp(0);
	
	Counter_Gen: for i in OP_QUEUE_IND-1 downto 0 generate
      CounterX : counter 		
			GENERIC MAP(
				N => 2**(OP_QUEUE_IND-1 - i),
				M => IND_SEL_DIM
			)
			PORT MAP(
				clk => clk,
				reset => reset,
				enable => enable,
				count_mod => counter_array(i)
			);
   end generate Counter_Gen;

	IndexSelector_Gen: for i in IND_SEL_BLOCK_NUM-1 downto 0 generate
      IndSelX : IndexSelector PORT MAP(
			NopVect => nop_in_vect(2*i+1 downto 2*i),
			counter => index_counter(i),
			GrantIn => grant_in(i),
			NopOut => nop_out_vect(i),
			CheckOut => indsel_out_temp(i)
		);
   end generate IndexSelector_Gen;	
			
	StructHazardGen: for i in 2**OP_QUEUE_IND-1 downto 0 generate
	   StructHazardCheckX : StructHazardCheck PORT MAP(
				clk => clk, 
				reset => reset, 
				en => enable,
				NoGrant => index_mask(i),
				Ind =>  conv_std_logic_vector(i, OP_QUEUE_IND),
				MuxCollVector => MuxCollVector_new,
				AdderCollVect => AdderCollVect_new,
				op => op_queue(i).Operation, 
				IndOut => ind_in(i),
				GrantedOut => nop_reg(i)
			);
	end generate StructHazardGen;
	
	UpdateVect_inst : UpdateVect PORT MAP(
				clk => clk,
				reset => reset,
				en => enable,
				MuxCollVector_in => MuxCollVector_new,
				AdderCollVect_in => AdderCollVect_new,
				LastOp => LastOp,
				MuxCollVector_out => MuxCollVector_old,
				AdderCollVect_out=> AdderCollVect_old
		);

end rtl;