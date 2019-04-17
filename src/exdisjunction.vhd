--------------------------------------------------------------------------------
-- Brno University of Technology, Department of Radio Electronics
--------------------------------------------------------------------------------
-- Author: Tomáš Dubina
-- Date: 2019-02-14 07:44
-- Design: exdisjunction
-- Description: XOR operation, Y = A xor B
--------------------------------------------------------------------------------
-- TODO: 
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

--------------------------------------------------------------------------------
-- Entity declaration for exdisjunction
--------------------------------------------------------------------------------
entity exdisjunction is
    port(
        -- Entity input signals
        A_i : in std_logic_vector(3 downto 0);     
        B_i : in std_logic_vector(3 downto 0); 
        -- Entity output signals
        Y_o : out std_logic_vector(3 downto 0)    
    );
end exdisjunction;

--------------------------------------------------------------------------------
-- Architecture declaration for exdisjunction
--------------------------------------------------------------------------------     
architecture Behavioral of exdisjunction is

begin

Y_o <= (A_i) xor (B_i); -- exkluzivni soucet po bitech

end Behavioral;
