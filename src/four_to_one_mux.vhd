--------------------------------------------------------------------------------
-- Brno University of Technology, Department of Radio Electronics
--------------------------------------------------------------------------------
-- Author: Tomas Fryza (tomas.fryza@vut.cz)
-- Date: 2019-03-11 8:26 pm
-- Design: four_to_one_mux
-- Description: N-bit 4-to-1 multiplexer.
--------------------------------------------------------------------------------
-- TODO: Complete and simulate internal structure of N-bit 4-to-1 multiplexer.
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

--------------------------------------------------------------------------------
-- Entity declaration for N-bit 4-to-1 multiplexer
--------------------------------------------------------------------------------
entity four_to_one_mux is
    generic (
        g_NBIT : integer := 4   -- default number of bits for multiplexer inputs
    );
    port (
        -- Entity input signals
        data3_i : in std_logic_vector(g_NBIT-1 downto 0);   -- last N_BIT channel
        data2_i : in std_logic_vector(g_NBIT-1 downto 0);
        data1_i : in std_logic_vector(g_NBIT-1 downto 0);
        data0_i : in std_logic_vector(g_NBIT-1 downto 0);   -- first N_BIT channel
        sel_i   : in std_logic_vector(2-1 downto 0);        -- 2 selection bits

        -- Entity output signals
        y_o : out std_logic_vector(g_NBIT-1 downto 0)
    );
end four_to_one_mux;

--------------------------------------------------------------------------------
-- Architecture declaration for N-bit 4-to-1 multiplexer
--------------------------------------------------------------------------------
architecture Behavioral of four_to_one_mux is
begin
    y_o <= data0_i when (sel_i = "00") else
           data1_i when (sel_i = "01") else
           data2_i when (sel_i = "10") else
           data3_i;
end Behavioral;
