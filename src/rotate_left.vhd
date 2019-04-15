--------------------------------------------------------------------------------
-- Brno University of Technology, Department of Radio Electronics
--------------------------------------------------------------------------------
-- Author: Milan hornik
-- Design: rotate_left
-- Description: Implementation of <<
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

--------------------------------------------------------------------------------
-- Entity declaration for rotate_left
--------------------------------------------------------------------------------
entity rotate_left is
    port(
        -- Global input signals at CPLD expansion board
		  
		  A_i : in std_logic_vector(4-1 downto 0);
		  C_i : in std_logic;
			

        -- Global output signals at Coolrunner-II board

		  Y_o : out std_logic_vector(4-1 downto 0) ;
		  C_o : out std_logic
    );
end rotate_left;

--------------------------------------------------------------------------------
-- Architecture declaration for rotate_right
--------------------------------------------------------------------------------
architecture Behavioral of rotate_left is
    
begin



 
end Behavioral;