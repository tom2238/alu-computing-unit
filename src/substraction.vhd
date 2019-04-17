--------------------------------------------------------------------------------
-- Brno University of Technology, Department of Radio Electronics
--------------------------------------------------------------------------------
-- Author: Milan Hornik 
-- Date: 2019-04-9 
-- Design: substraction
-- Description: Structure of substraction.
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

--------------------------------------------------------------------------------
-- Entity declaration for substraction
--------------------------------------------------------------------------------
entity substraction is
    port(
        -- Entity input signals
        A_i : in std_logic_vector(4-1 downto 0);     -- input 
        B_i : in std_logic_vector(4-1 downto 0);
        c_i : in std_logic;

        -- Entity output signals
        Y_o : out std_logic_vector(4-1 downto 0);    -- output 
        c_o : out std_logic
    );
end substraction;

--------------------------------------------------------------------------------
-- Architecture declaration for substraction
--------------------------------------------------------------------------------
architecture Behavioral of substraction is
    signal sig_1 : std_logic_vector(4-1 downto 0);      -- vektor signaly
    signal sig_2 : std_logic_vector(4-1 downto 0);
    signal sig_3 : std_logic_vector(2-1 downto 0);
           
begin


HA0: entity work.negation
	  port map(B_i, sig_1);                             -- negace vstupu B

HA1: entity work.four_adder
	  port map(sig_1,"0001",'0',sig_2,sig_3(0));        -- pricteni nejnižšího bitu na vstup citacky B a negovaneho vstupu na A

HA2: entity work.four_adder
	  port map(sig_2,A_i,'0',Y_o,sig_3(1));             -- secteni vystupu z 1 citacky a signalu z B klavesnice
	  
c_o <= sig_3(0) nor sig_3(1);                           -- negovany soucet vystupu carry z citacu
	  
	  
	  
end Behavioral;