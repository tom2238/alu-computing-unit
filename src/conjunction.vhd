--------------------------------------------------------------------------------
-- Brno University of Technology, Department of Radio Electronics
--------------------------------------------------------------------------------
-- Author: Tomáš Dubina
-- Date: 2019-02-14 07:44
-- Design: conjunction
-- Description: AND operation, Y = A and B
--------------------------------------------------------------------------------
-- TODO: 
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

--------------------------------------------------------------------------------
-- Entity declaration for negation
--------------------------------------------------------------------------------
entity conjunction is
    port(
        -- Entity input signals
        A_i : in std_logic_vector(3 downto 0);     
        B_i : in std_logic_vector(3 downto 0); 
        -- Entity output signals
        Y_o : out std_logic_vector(3 downto 0)    
    );
end conjunction;

--------------------------------------------------------------------------------
-- Architecture declaration for negation
--------------------------------------------------------------------------------     
architecture Behavioral of conjunction is

begin

Y_o <= (A_i) and (B_i);

end Behavioral;
