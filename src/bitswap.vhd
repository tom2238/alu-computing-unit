--------------------------------------------------------------------------------
-- Brno University of Technology, Department of Radio Electronics
--------------------------------------------------------------------------------
-- Author: Tomas Dubina
-- Date: 2019-02-14 07:44
-- Design: bitswap
-- Description: bitswap
--------------------------------------------------------------------------------
-- TODO: 
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

--------------------------------------------------------------------------------
-- Entity declaration for bitswap
--------------------------------------------------------------------------------
entity bitswap is
    port(
        -- Entity input signals
        A_i : in std_logic_vector(3 downto 0);     -- input 

        -- Entity output signals
        Y_o : out std_logic_vector(3 downto 0)    -- output 
    );
end bitswap;

--------------------------------------------------------------------------------
-- Architecture declaration for bitswap
--------------------------------------------------------------------------------     
architecture Behavioral of bitswap is

begin

Y_o(3 downto 2) <= A_i(1 downto 0); -- posunuti o dve pozice vlevo
Y_o(1 downto 0) <= A_i(3 downto 2); -- posunuti o dve pozice vpravo

end Behavioral;
