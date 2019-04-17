--------------------------------------------------------------------------------
-- Brno University of Technology, Department of Radio Electronics
--------------------------------------------------------------------------------
-- Author: Milan hornik
-- Design: substraction_with_carry
-- Description: Implementation of substraction_with_carry.
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

--------------------------------------------------------------------------------
-- Entity declaration for substraction_with_carry
--------------------------------------------------------------------------------
entity substraction_with_carry is
    port(
        -- Input
		  
			A_i : in std_logic_vector(4-1 downto 0);
			B_i : in std_logic_vector(4-1 downto 0);
			C_i : in std_logic;
	
        -- Output

		  Y_o : out std_logic_vector(4-1 downto 0) ;
		  C_o : out std_logic
    );
end substraction_with_carry;

--------------------------------------------------------------------------------
-- Architecture declaration for substraction_with_carry
--------------------------------------------------------------------------------
architecture Behavioral of substraction_with_carry is
    signal sig_1   : std_logic_vector(4-1 downto 0);
    signal sig_2   : std_logic_vector(2-1 downto 0);
    signal carry_s : std_logic_vector(4-1 downto 0);
begin

NA0: entity work.substraction
    port map (A_i,B_i,'0',sig_1,sig_2(0));              -- odecteni cisel A a B
    
NA1: entity work.substraction
    port map (sig_1, carry_s,'0',Y_o,sig_2(1));         -- Odecteni cisla z prvni odcitacky s carry na nejnizsim bitu
    
c_o <= sig_2(0) or sig_2(1);                            -- vystupy z obou odcitaacek secteny a privedeny na vystup c_o
carry_s(3 downto 1) <= "000";                           -- naplneni carry_s nulami krome nejnizsiho bitu
carry_s(0) <= C_i;                                      -- na posledni bit carry_s je zapsan vstup carry
 
 
end Behavioral;
