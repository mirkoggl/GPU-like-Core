library IEEE;

use ieee.numeric_std.all;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

package userpack is

  -----------------------------------------------------------------------
  -- FPCore Types and Constants
  -----------------------------------------------------------------------	
  
	  -- Core Number
	  constant FPU_CORE_NUMB : natural := 2;
		 
	  -- Max number of warps allowed in a SM
	  constant MAX_NUM_WARP_ALLW : natural := 64;
	  
     -- Operators supported in each FPU Core. If the value is '1' the relative operator will be in each FPU Core
	  constant ADDSUB_OP_GEN : natural := 1;
	  constant MULT_OP_GEN : natural := 1;
	  constant DIV_OP_GEN : natural := 0;
	  constant ABS_OP_GEN : natural := 0;
	  constant NEG_OP_GEN : natural := 0;
	  constant MAX_OP_GEN : natural := 0;
	  constant MIN_OP_GEN : natural := 0;
	  constant CEILFLOOR_OP_GEN : natural := 0;
	  constant RINT_OP_GEN : natural := 0;
	  constant FRAC_OP_GEN : natural := 0;	 

  -----------------------------------------------------------------------
  -- Issue Types and Constants
  -----------------------------------------------------------------------	
	
	 -- Number of parallel instruction words 
    constant WARP_NUMB : natural := 2;	  
	 
  -----------------------------------------------------------------------
  -- Register Map
  -----------------------------------------------------------------------	
  
	 -- Width of every Register (32 bit) 
	 constant REGISTER_WIDTH : natural := 32;
	 
	 -- Number of registers in a Register Block, every block has REG_BLOCK_DEPTH registers of REG_BLOCK_WIDTH bits
	 constant REG_BLOCK_SIZE : natural := 8;
	 
	 -- Number of Register Block per FPU Core, REG_BLOCK_SIZE * REG_BLOCK_NUMB are the total register per FPU Core
	 constant REG_BLOCK_NUMB : natural := 8;
	 
	 -- Max number of Register Block per Warp
	 constant MAX_REG_BLOCK_TOEACH_WARP : natural := 2;
	 
	 -- Min number of Register Block per Warp
	 constant MIN_REG_BLOCK_TOEACH_WARP : natural := 1;
	 
	 
  -----------------------------------------------------------------------
  -- MEM - Shared Memory
  -----------------------------------------------------------------------
	 -- Shared Memory address length
    constant SHARED_MEM_ADDR_LENGTH : natural := 7;	 
		
end userpack;

package body userpack is



end userpack;