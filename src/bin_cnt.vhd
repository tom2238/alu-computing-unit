--------------------------------------------------------------------------------
-- Brno University of Technology, Department of Radio Electronics
--------------------------------------------------------------------------------
-- Author: Tomas Fryza (tomas.fryza@vut.cz)
-- Date: 2019-02-20 12:17
-- Design: bin_cnt
-- Description: N-bit binary counter with synchronous reset.
--------------------------------------------------------------------------------
-- TODO: Verify functionality of N-bit binary counter.
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;    -- for +/- arithmetic operations

--------------------------------------------------------------------------------
-- Entity declaration for binary counter
--------------------------------------------------------------------------------
entity bin_cnt is
    generic (
        N_BIT : integer := 12        -- default number of bits
    );
    port (
        -- Entity input signals
        clk_i   : in std_logic;
        rst_n_i : in std_logic;     -- reset =0: reset active
                                    --       =1: no reset
        -- Entity output signals
        bin_cnt_o : out std_logic_vector(N_BIT-1 downto 0)
    );
end bin_cnt;

--------------------------------------------------------------------------------
-- Architecture declaration for binary counter
--------------------------------------------------------------------------------
architecture Behavioral of bin_cnt is
    signal s_reg  : std_logic_vector(N_BIT-1 downto 0);
    signal s_next : std_logic_vector(N_BIT-1 downto 0);
begin
    --------------------------------------------------------------------------------
    -- Register
    --------------------------------------------------------------------------------
    p_bin_cnt: process(clk_i)
    begin
        if rising_edge(clk_i) then
            if rst_n_i = '0' then           -- synchronous reset
                s_reg <= (others => '0');   -- clear all bits in register
            -- elsif s_reg = x"8" then 
            --    s_reg <= (others => '0');
            else
                s_reg <= s_next;            -- update register value
            end if;
        end if;
    end process p_bin_cnt;

    --------------------------------------------------------------------------------
    -- Next-state logic
    --------------------------------------------------------------------------------
    s_next <= s_reg + 1;

    --------------------------------------------------------------------------------
    -- Output logic
    --------------------------------------------------------------------------------
    bin_cnt_o <= s_reg;
end Behavioral;
