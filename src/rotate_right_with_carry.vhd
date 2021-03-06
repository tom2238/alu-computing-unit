--------------------------------------------------------------------------------
-- Brno University of Technology, Department of Radio Electronics
--------------------------------------------------------------------------------
-- Author: Milan hornik
-- Design: rotate_right_with_carry
-- Description: Implementation of >>
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

--------------------------------------------------------------------------------
-- Entity declaration for rotate_right_with_carry
--------------------------------------------------------------------------------
entity rotate_right_with_carry is
    port(
        -- Input
		  
		  A_i : in std_logic_vector(4-1 downto 0);
		  C_i : in std_logic;
			

        -- Output

		  Y_o : out std_logic_vector(4-1 downto 0) ;
		  C_o : out std_logic
    );
end rotate_right_with_carry;

--------------------------------------------------------------------------------
-- Architecture declaration for rotate_right_with_carry
--------------------------------------------------------------------------------
architecture Behavioral of rotate_right_with_carry is
    
begin

Y_o(0) <= A_i(1);           -- posun o jeden bit v pravo
Y_o(1) <= A_i(2);           -- posun o jeden bit v pravo
Y_o(2) <= A_i(3);           -- posun o jeden bit v pravo
Y_o(3) <= C_i;              -- vstup carry je nahran na nejvyssi bit vystupu
c_o	 <= A_i(0);             -- na carry vystup je zapsan nejvyssi bit vstupu

 
end Behavioral;