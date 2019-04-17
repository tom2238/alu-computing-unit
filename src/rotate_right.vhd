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
-- Entity declaration for rotate_right
--------------------------------------------------------------------------------
entity rotate_right is
    port(
        -- Input
		  
		  A_i : in std_logic_vector(4-1 downto 0);
		  C_i : in std_logic;
			

        -- Output

		  Y_o : out std_logic_vector(4-1 downto 0) ;
		  C_o : out std_logic
    );
end rotate_right;

--------------------------------------------------------------------------------
-- Architecture declaration for rotate_right
--------------------------------------------------------------------------------
architecture Behavioral of rotate_right is
    
begin

Y_o(0) <= A_i(1);           -- posun o jeden bit v pravo
Y_o(1) <= A_i(2);           -- posun o jeden bit v pravo
Y_o(2) <= A_i(3);           -- posun o jeden bit v pravo
Y_o(3) <= A_i(0);           -- nejnizsi bit je presunut na nejvyssi bit vystupu
c_o	 <= A_i(0);             -- na c_o je zapsan nejnizsi bit vstupu

 
end Behavioral;