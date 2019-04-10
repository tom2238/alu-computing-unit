--------------------------------------------------------------------------------
-- Brno University of Technology, Department of Radio Electronics
--------------------------------------------------------------------------------
-- Author: Milan hornik
-- Design: adder_with_carry
-- Description: Implementation of 4-bit adder.
--------------------------------------------------------------------------------
-- TODO: Use input devices from CPLD expansion board, implement 3-bit full
--       adder, and display result on seven-segment LED display.
--
-- NOTE: Copy "hex_to_sseg.vhd", "one_of_four.vhd", and "coolrunner.ucf" files
--       from previous lab to current working folder.
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

--------------------------------------------------------------------------------
-- Entity declaration for adder_with_carry
--------------------------------------------------------------------------------
entity adder_with_carry is
    port(
        -- Global input signals at CPLD expansion board
		  
			A_i : in std_logic_vector(4-1 downto 0);
			B_i : in std_logic_vector(4-1 downto 0);
			C_i : in std_logic;
			

        -- Global output signals at Coolrunner-II board

		  Y_o : out std_logic_vector(4-1 downto 0) ;
		  C_o : out std_logic
    );
end adder_with_carry;

--------------------------------------------------------------------------------
-- Architecture declaration for adder_with_carry
--------------------------------------------------------------------------------
architecture Behavioral of adder_with_carry is
    -- signal s_c0, s_c1, s_c2 : std_logic;  -- internal carry bits
begin

BA1: entity work.four_adder
	  port map(A_i,B_i,C_i,Y_o,C_o);

 
end Behavioral;