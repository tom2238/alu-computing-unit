--------------------------------------------------------------------------------
-- Brno University of Technology, Department of Radio Electronics
--------------------------------------------------------------------------------
-- Author: Milan hornik
-- Design: rotate_right
-- Description: Implementation of >>
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

--------------------------------------------------------------------------------
-- Entity declaration for rotate_left
--------------------------------------------------------------------------------
entity rotate_left is
    port(
        -- Input
		  
		  A_i : in std_logic_vector(4-1 downto 0);
		  C_i : in std_logic;
			

        -- Output

		  Y_o : out std_logic_vector(4-1 downto 0) ;
		  C_o : out std_logic
    );
end rotate_left;

--------------------------------------------------------------------------------
-- Architecture declaration for rotate_left
--------------------------------------------------------------------------------
architecture Behavioral of rotate_left is
    
begin

Y_o(0) <= A_i(3);           -- nejvyssi bit je presunut na nejnizsi  bit vystupu
Y_o(1) <= A_i(0);           -- posun o jeden bit v levo
Y_o(2) <= A_i(1);           -- posun o jeden bit v levo
Y_o(3) <= A_i(2);           -- posun o jeden bit v levo
c_o	 <= A_i(3);             -- na c_o je zapsan nejvyssi bit vstupu

 
end Behavioral;