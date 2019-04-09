--------------------------------------------------------------------------------
-- Brno University of Technology, Department of Radio Electronics
--------------------------------------------------------------------------------
-- Author: Tomas Dubina
-- Date: 2019-02-14 07:44
-- Design: decrement A value
-- Description: DEC operation, Y = A - 1
--------------------------------------------------------------------------------
-- TODO: 
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

--------------------------------------------------------------------------------
-- Entity declaration for decrement
--------------------------------------------------------------------------------
entity decrement is
    port(
        -- Entity input signals
        A_i : in std_logic_vector(3 downto 0);     
        C_i : in std_logic;
        -- Entity output signals
        Y_o : out std_logic_vector(3 downto 0);    
        C_o : out std_logic
    );
end decrement;

--------------------------------------------------------------------------------
-- Architecture declaration for decrement
--------------------------------------------------------------------------------     
architecture Behavioral of decrement is

begin

    -- odcitacka
    RS_MINUS_COM: entity work.substraction
    port map (
        -- vstup
        A_i => A_i,
        B_i => "0001",
        C_i => C_i,
        -- vystup
        Y_o => Y_o,
        C_o => C_o
    );

end Behavioral;