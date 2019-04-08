--------------------------------------------------------------------------------
-- Brno University of Technology, Department of Radio Electronics
--------------------------------------------------------------------------------
-- Author: Tomas Fryza (tomas.fryza@vut.cz)
-- Date: 2019-02-13 14:22
-- Design: one_of_four
-- Description: 1-of-4 decoder.
--------------------------------------------------------------------------------
-- TODO: Complete and simulate internal structure of 1 of 4 decoder.
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

--------------------------------------------------------------------------------
-- Entity declaration for 1 of 4 decoder
--------------------------------------------------------------------------------
entity one_of_four is
    port(
        -- Entity input signals
        a_i : in std_logic_vector(2-1 downto 0);    -- 2 address inputs

        -- Entity output signals
        y_o : out std_logic_vector(4-1 downto 0)    -- active-low outputs
    );
end one_of_four;

--------------------------------------------------------------------------------
-- Architecture declaration for 1 of 4 decoder
--------------------------------------------------------------------------------
architecture Behavioral of one_of_four is
begin
    --  addr | outputs
    -- ------+---------
    --   0 0 | H H H L
    --   0 1 | H H L H
    --   1 0 | H L H H
    --   1 1 | L H H H
    y_o(3) <= not(a_i(0)) or not(a_i(1)); -- WRITE YOUR CODE HERE
    y_o(2) <= a_i(0) or not(a_i(1)); -- WRITE YOUR CODE HERE
    y_o(1) <= not(a_i(0)) or a_i(1); -- WRITE YOUR CODE HERE
    y_o(0) <= a_i(0) or a_i(1); -- WRITE YOUR CODE HERE
end Behavioral;