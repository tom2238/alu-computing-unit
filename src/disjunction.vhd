--------------------------------------------------------------------------------
-- Brno University of Technology, Department of Radio Electronics
--------------------------------------------------------------------------------
-- Author: Tomáš Dubina
-- Date: 2019-02-14 07:44
-- Design: disjunction
-- Description: OR operation, Y = A or B
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

--------------------------------------------------------------------------------
-- Entity declaration for disjunction
--------------------------------------------------------------------------------
entity disjunction is
    port(
        -- Entity input signals
        A_i : in std_logic_vector(3 downto 0);     
        B_i : in std_logic_vector(3 downto 0); 
        -- Entity output signals
        Y_o : out std_logic_vector(3 downto 0)    
    );
end disjunction;

--------------------------------------------------------------------------------
-- Architecture declaration for disjunction
--------------------------------------------------------------------------------     
architecture Behavioral of disjunction is

begin

Y_o <= (A_i) or (B_i); -- logicky soucet po bitech

end Behavioral;
