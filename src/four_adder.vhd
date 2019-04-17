--------------------------------------------------------------------------------
-- Brno University of Technology, Department of Radio Electronics
--------------------------------------------------------------------------------
-- Author: Milan Hornik 
-- Date: 2019-02-22 6:29
-- Design: four_adder
-- Description: Implementation of 4-bit adder.
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

--------------------------------------------------------------------------------
-- Entity declaration for 4-bit full
--------------------------------------------------------------------------------
entity four_adder is
    port(
        -- vstupy
			A_i : in std_logic_vector(4-1 downto 0);
			B_i : in std_logic_vector(4-1 downto 0);
			C_i : in std_logic;

        -- vystupy
		  Y_o : out std_logic_vector(4-1 downto 0) ;
		  C_o : out std_logic
    );
end four_adder;

--------------------------------------------------------------------------------
-- Architecture declaration for 4-bit full
--------------------------------------------------------------------------------
architecture Behavioral of four_adder is
    signal s_c0, s_c1, s_c2 : std_logic;  -- definice carry signalu
begin

    FA0: entity work.full_adder
        port map(C_i, B_i(0), A_i(0), s_c0, Y_o(0));        -- uplna scitacka 1
    FA1: entity work.full_adder
        port map(s_c0, B_i(1), A_i(1), s_c1, Y_o(1));       -- uplna scitacka 2
    FA2: entity work.full_adder
        port map(s_c1, B_i(2), A_i(2), s_c2, Y_o(2));       -- uplna scitacka 3
    FA3: entity work.full_adder
        port map(s_c2, B_i(3), A_i(3), C_o, Y_o(3));        -- uplna scitacka 4

 
end Behavioral;