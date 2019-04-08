--------------------------------------------------------------------------------
-- Brno University of Technology, Department of Radio Electronics
--------------------------------------------------------------------------------
-- Author: Tomas Fryza (tomas.fryza@vut.cz)
-- Date: 2019-02-14 07:44
-- Design: full_adder
-- Description: Structure of full adder.
--------------------------------------------------------------------------------
-- TODO: Complete and simulate functionality of full adder.
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

--------------------------------------------------------------------------------
-- Entity declaration for full adder
--------------------------------------------------------------------------------
entity full_adder is
    port(
        -- Entity input signals
        c_i : in std_logic;     -- input carry
        b_i : in std_logic;
        a_i : in std_logic;

        -- Entity output signals
        c_o : out std_logic;    -- output carry
        s_o : out std_logic
    );
end full_adder;

--------------------------------------------------------------------------------
-- Architecture declaration for full adder
--------------------------------------------------------------------------------
architecture Behavioral of full_adder is
    -- internal signals between two half adders
    signal sig_s : std_logic;
    signal sig_c1 : std_logic;
    signal sig_c2 : std_logic;
    
    
           
begin
    -- sub-blocks of two half_adder entities
    -- b a c s
    HA0: entity work.half_adder
        port map(b_i, a_i, sig_c1, sig_s);

    HA1: entity work.half_adder
        port map(c_i, sig_s, sig_c2, s_o);

        c_o <= sig_c1 or sig_c2;

    -- output carry
end Behavioral;
