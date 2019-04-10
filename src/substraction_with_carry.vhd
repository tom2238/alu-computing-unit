--------------------------------------------------------------------------------
-- Brno University of Technology, Department of Radio Electronics
--------------------------------------------------------------------------------
-- Author: Milan hornik
-- Design: substraction_with_carry
-- Description: Implementation of substraction_with_carry.
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
-- Entity declaration for substraction_with_carry
--------------------------------------------------------------------------------
entity substraction_with_carry is
    port(
        -- Global input signals at CPLD expansion board
		  
			A_i : in std_logic_vector(4-1 downto 0);
			B_i : in std_logic_vector(4-1 downto 0);
			C_i : in std_logic;
			

        -- Global output signals at Coolrunner-II board

		  Y_o : out std_logic_vector(4-1 downto 0) ;
		  C_o : out std_logic
    );
end substraction_with_carry;

--------------------------------------------------------------------------------
-- Architecture declaration for substraction_with_carry
--------------------------------------------------------------------------------
architecture Behavioral of substraction_with_carry is
    signal sig_1 : std_logic_vector(4-1 downto 0);
    signal sig_2 : std_logic_vector(2-1 downto 0);
    signal carry_s : std_logic_vector(4-1 downto 0);
    -- signal s_c0, s_c1, s_c2 : std_logic;  -- internal carry bits
begin

NA0: entity work.substraction
    port map (A_i,B_i,'0',sig_1,sig_2(0));
    
NA1: entity work.substraction
    port map (sig_1, carry_s,'0',Y_o,sig_2(1));
    
c_o <= sig_2(0) or sig_2(1);
carry_s(3 downto 1) <= "000";
carry_s(0) <= C_i;
 
 
end Behavioral;
