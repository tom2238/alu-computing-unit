--------------------------------------------------------------------------------
-- Brno University of Technology, Department of Radio Electronics
--------------------------------------------------------------------------------
-- Author: Tomáš Dubina
-- Date: 2019-02-14 07:44
-- Design: multiply
-- Description: MUL operation, Y = A * B
--------------------------------------------------------------------------------
-- TODO: all
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

--------------------------------------------------------------------------------
-- Entity declaration for multiply
--------------------------------------------------------------------------------
entity multiply is
    port(
        -- Entity input signals
        A_i : in std_logic_vector(3 downto 0);     
        B_i : in std_logic_vector(3 downto 0); 
        -- Entity output signals
        Y_o : out std_logic_vector(3 downto 0);
        C_o : out std_logic    
    );
end multiply;

--------------------------------------------------------------------------------
-- Architecture declaration for multiply
--------------------------------------------------------------------------------     
architecture Behavioral of multiply is

begin



end Behavioral;

