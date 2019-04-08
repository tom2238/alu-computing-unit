--------------------------------------------------------------------------------
-- Brno University of Technology, Department of Radio Electronics
--------------------------------------------------------------------------------
-- Author: Tomas Fryza (tomas.fryza@vut.cz)
-- Date: 2019-02-14 07:30
-- Design: half_adder
-- Description: Structure of half adder.
--------------------------------------------------------------------------------
-- TODO: Complete and simulate functionality of half adder.
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

--------------------------------------------------------------------------------
-- Entity declaration for half adder
--------------------------------------------------------------------------------
entity half_adder is
    port(
        -- Entity input signals
        b_i : in std_logic;
        a_i : in std_logic;

        -- Entity output signals
        c_o : out std_logic;    -- output carry
        s_o : out std_logic
    );
end half_adder;

--------------------------------------------------------------------------------
-- Architecture declaration for half adder
--------------------------------------------------------------------------------
architecture Behavioral of half_adder is
begin
   s_o <= b_i xor a_i; -- WRITE YOUR CODE HERE
   c_o <= b_i and a_i;
    
end Behavioral;
