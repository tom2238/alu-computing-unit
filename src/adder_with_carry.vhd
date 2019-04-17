--------------------------------------------------------------------------------
-- Brno University of Technology, Department of Radio Electronics
--------------------------------------------------------------------------------
-- Author: Milan hornik
-- Design: adder_with_carry
-- Description: Implementation of adder_with_carry.
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

--------------------------------------------------------------------------------
-- Entity declaration for adder_with_carry
--------------------------------------------------------------------------------
entity adder_with_carry is
    port(
        -- Input		  
			A_i : in std_logic_vector(4-1 downto 0);
			B_i : in std_logic_vector(4-1 downto 0);
			C_i : in std_logic;
			
        -- Output
		  Y_o : out std_logic_vector(4-1 downto 0) ;
		  C_o : out std_logic
    );
end adder_with_carry;

--------------------------------------------------------------------------------
-- Architecture declaration for adder_with_carry
--------------------------------------------------------------------------------
architecture Behavioral of adder_with_carry is
begin

BA1: entity work.four_adder
	  port map(A_i,B_i,C_i,Y_o,C_o);                -- secteni vstupu A a B + Carry na vstup carry

 
end Behavioral;