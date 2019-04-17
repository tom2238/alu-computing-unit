--------------------------------------------------------------------------------
-- Brno University of Technology, Department of Radio Electronics
--------------------------------------------------------------------------------
-- Author: Tomáš Dubina
-- Date: 2019-02-14 07:44
-- Design: parity
-- Description: parity function
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity parity is
 Port ( 
   -- vstup
   data_i : in std_logic_vector(3 downto 0);
   -- vystup
   parity_o : out std_logic
 );
end parity;

architecture Behavioral of parity is
begin
    parity_o <= not ((data_i(0) xor data_i(1)) xor (data_i(2) xor data_i(3))); -- paritni kod

end Behavioral;
