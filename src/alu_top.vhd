--------------------------------------------------------------------------------
-- Brno University of Technology, Department of Radio Electronics
--------------------------------------------------------------------------------
-- Author: Tomas Dubina, Milan Hornik, Tomas Fryza (tomas.fryza@vut.cz)
-- Date: 2019-04-06 17:25
-- Design: alu_top
-- Description: 
--------------------------------------------------------------------------------
-- TODO:
--
-- NOTE: 
--
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

--------------------------------------------------------------------------------
-- Entity declaration for alu_top level
--------------------------------------------------------------------------------
entity alu_top is
    port (
        -- Global input signals at CPLD expansion board
        number_a_i : in std_logic_vector(3 downto 0);     -- number A switch channel
        number_b_i : in std_logic_vector(3 downto 0);     -- number B switch channel
        control_sig_i : in std_logic_vector(3 downto 0);  -- control signal switch channel

        -- Global input signals at Coolrunner-II board
        clk_i : in std_logic;                             -- use jumpers and select 10 kHz clock

        -- Global output signals at Coolrunner-II board
        carry_o : out std_logic;                          -- carry flag
        parity_o : out std_logic;                         -- parity flag
        number_a_o : out std_logic_vector(3 downto 0);    -- number A LED channel
        number_b_o : out std_logic_vector(3 downto 0);    -- number B LED channel
        control_sig_o : out std_logic_vector(3 downto 0); -- control signal LED channel 
        disp_digit_o : out std_logic_vector(3 downto 0);  -- 7-segment digit
        disp_sseg_o  : out std_logic_vector(6 downto 0)   -- 7-segment data
    );
end alu_top;

--------------------------------------------------------------------------------
-- Architecture declaration for alu_top level
--------------------------------------------------------------------------------
architecture Behavioral of alu_top is

begin
    number_a_o <= number_a_i;
    number_b_o <= number_b_i;
    control_sig_o <= control_sig_i;
    
    disp_digit_o <= (others => '0'); 
    disp_sseg_o <= (others => '0'); 
    carry_o <= '0';
    parity_o <= '0';

end Behavioral;
