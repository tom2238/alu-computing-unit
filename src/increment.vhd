--------------------------------------------------------------------------------
-- Brno University of Technology, Department of Radio Electronics
--------------------------------------------------------------------------------
-- Author: Tomas Dubina
-- Date: 2019-02-14 07:44
-- Design: increment A value
-- Description: INC operation, Y = A + 1
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

--------------------------------------------------------------------------------
-- Entity declaration for increment
--------------------------------------------------------------------------------
entity increment is
    port(
        -- Entity input signals
        A_i : in std_logic_vector(3 downto 0);     
        C_i : in std_logic;
        -- Entity output signals
        Y_o : out std_logic_vector(3 downto 0);    
        C_o : out std_logic
    );
end increment;

--------------------------------------------------------------------------------
-- Architecture declaration for increment
--------------------------------------------------------------------------------     
architecture Behavioral of increment is

begin

    -- scitacka
    RS_PLUS_COM: entity work.four_adder
    port map (
        -- vstup
        A_i => A_i,
        B_i => "0001", -- pricte 1 k signalu A_i
        C_i => C_i,
        -- vystup
        Y_o => Y_o,
        C_o => C_o
    );

end Behavioral;