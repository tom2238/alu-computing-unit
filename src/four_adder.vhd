--------------------------------------------------------------------------------
-- Brno University of Technology, Department of Radio Electronics
--------------------------------------------------------------------------------
-- Author: Tomas Fryza (tomas.fryza@vut.cz)
-- Date: 2019-02-22 6:29
-- Design: top
-- Description: Implementation of 3-bit adder.
--------------------------------------------------------------------------------
-- TODO: Use input devices from CPLD expansion board, implement 3-bit full
--       adder, and display result on seven-segment LED display.
--
-- NOTE: Copy "hex_to_sseg.vhd", "one_of_four.vhd", and "coolrunner.ucf" files
--       from previous lab to current working folder.
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

--------------------------------------------------------------------------------
-- Entity declaration for top level
--------------------------------------------------------------------------------
entity four_adder is
    port(
        -- Global input signals at CPLD expansion board
--        cpld_sw_i : ;     -- switches or push buttons
		  
			A_i : in std_logic_vector(4-1 downto 0);
			B_i : in std_logic_vector(4-1 downto 0);
			C_i : in std_logic;
			
        -- Global output signals at CPLD expansion board
--        cpld_led_o : ;   -- active-high

        -- Global output signals at Coolrunner-II board
--        disp_digit_o : ;  -- active-low
--        disp_sseg_o  :    -- active-low cathodes
		  Y_o : out std_logic_vector(4-1 downto 0) ;
		  C_o : out std_logic
    );
end four_adder;

--------------------------------------------------------------------------------
-- Architecture declaration for top level
--------------------------------------------------------------------------------
architecture Behavioral of four_adder is
    signal s_c0, s_c1, s_c2 : std_logic;  -- internal carry bits
begin

    FA0: entity work.full_adder
        port map(C_i, B_i(0), A_i(0), s_c0, Y_o(0)); 
    FA1: entity work.full_adder
        port map(s_c0, B_i(1), A_i(1), s_c1, Y_o(1));  
    FA2: entity work.full_adder
        port map(s_c1, B_i(2), A_i(2), s_c2, Y_o(2)); 
    FA3: entity work.full_adder
        port map(s_c2, B_i(3), A_i(3), C_o, Y_o(3));  

 
end Behavioral;