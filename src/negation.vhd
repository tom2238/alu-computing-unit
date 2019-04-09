--------------------------------------------------------------------------------
-- Brno University of Technology, Department of Radio Electronics
--------------------------------------------------------------------------------
-- Author: Milan Hornik
-- Date: 2019-02-14 07:44
-- Design: negation
-- Description: NOT operation
--------------------------------------------------------------------------------
-- TODO: 
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

--------------------------------------------------------------------------------
-- Entity declaration for negation
--------------------------------------------------------------------------------
entity negation is
    port(
        -- Entity input signals
        A_i : in std_logic;     -- input 

        -- Entity output signals
        Y_o : out std_logic    -- output 
    );
end negation;

--------------------------------------------------------------------------------
-- Architecture declaration for negation
--------------------------------------------------------------------------------     
architecture Behavioral of negation is

begin

Y_o <= not(A_i);

end Behavioral;
