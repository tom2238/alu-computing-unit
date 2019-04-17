--------------------------------------------------------------------------------
-- Brno University of Technology, Department of Radio Electronics
--------------------------------------------------------------------------------
-- Author: Milan Horník
-- Date: 2019-02-14 07:44
-- Design: multiply
-- Description: MUL operation, Y = A * B
--------------------------------------------------------------------------------
-- TODO: all
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

--------------------------------------------------------------------------------
-- Entity declaration for multiply
--------------------------------------------------------------------------------
entity multiply is
    port(
        -- Entity input signals
        A_i : in std_logic_vector(3 downto 0);     
        B_i : in std_logic_vector(3 downto 0); 
        -- Entity output signals
        Y_o : out std_logic_vector(3 downto 0);
        C_o : out std_logic    
    );
end multiply;

--------------------------------------------------------------------------------
-- Architecture declaration for multiply
--------------------------------------------------------------------------------     
architecture Behavioral of multiply is
    signal sig_1 : std_logic_vector(4-1 downto 0); -- 1 nasobek
    signal sig_2 : std_logic_vector(4-1 downto 0); -- 2 nasobek
	 signal sig_3 : std_logic_vector(4-1 downto 0); -- 3 nasobek
	 signal sig_4 : std_logic_vector(4-1 downto 0); -- 4 nasobek
	 signal sig_5 : std_logic_vector(4-1 downto 0); -- sig1 + sig2
	 signal sig_6 : std_logic_vector(4-1 downto 0); -- sig3 + sig4
--	 signal sig_7 : std_logic_vector(4-1 downto 0); -- sig5 + sig6
	 signal sig_8 : std_logic_vector(4-1 downto 0); -- carry bity
	 signal sig_2_p : std_logic_vector(4-1 downto 0); -- 1 nasobek posun
	 signal sig_3_p : std_logic_vector(4-1 downto 0); -- 1 nasobek posun
	 signal sig_4_p : std_logic_vector(4-1 downto 0); -- 1 nasobek posun
	 signal sig_8_p : std_logic_vector(2-1 downto 0); -- carry 
	 
begin
sig_1 <= A_i AND (B_i(0)&B_i(0)&B_i(0)&B_i(0));         -- vstup A je roznasoben 0 bitem ze vstupu B
sig_2 <= A_i AND (B_i(1)&B_i(1)&B_i(1)&B_i(1));         -- vstup A je roznasoben 1 bitem ze vstupu B
sig_3 <= A_i AND (B_i(2)&B_i(2)&B_i(2)&B_i(2));         -- vstup A je roznasoben 2 bitem ze vstupu B
sig_4 <= A_i AND (B_i(3)&B_i(3)&B_i(3)&B_i(3));         -- vstup A je roznasoben 3 bitem ze vstupu B

sig_2_p(3 downto 1) <= sig_2(2 downto 0);               -- posunuti bitu ze signalu sig_2 o 1 misto
sig_2_p(0) <= '0';                                      -- zapsani 0 na pozici 0

sig_3_p(3 downto 2) <= sig_3(1 downto 0);               -- posunuti bitu ze signalu sig_2 o 2 mista
sig_3_p(1 downto 0) <= "00";                            -- zapsani 0 na pozici 0 a 1

sig_4_p(3 downto 3) <= sig_4(0 downto 0);               -- posunuti bitu ze signalu sig_2 o 3 mista
sig_4_p(2 downto 0) <= "000";                           -- zapsani 0 na pozici 0 , 1 a 2

sig_8_p(1) <= (sig_8(0) OR sig_8(1));                   -- carry bity secteny z citacek 
-- sig_8_p(0) <= ((not(sig_2(3)) and sig_3(2) and not(sig_4(1))) or (sig_2(3) and sig_3(2) and sig_4(1)) or (sig_2(3) and not(sig_3(2)) and not(sig_4(1))) or (not(sig_2(3)) and not(sig_3(2)) and sig_4(1)));
-- OR sig_2(3) OR sig_3(2) OR sig_3(3) OR sig_4(1) OR sig_4(2) OR sig_4(3)

sig_8_p(0) <= sig_8(2) or sig_2(3) or sig_3(2) or sig_3(3) or sig_4(1) or sig_4(2) or sig_4(3);     -- secteni carry bitu a bitu kter se nepouzivaji

c_o <= sig_8_p(0);                                      -- zapsani carry na vystup carry

MA1: entity work.four_adder                             -- secteni sig_1 a sig_2_p
    port map (
        -- vstup
        A_i => sig_1,
        B_i => sig_2_p,
        C_i => '0',
        -- vystup
        Y_o => sig_5,
        C_o => sig_8(0)
);

MA2: entity work.four_adder                             -- secteni sig_3_p a sig_4_p
    port map (
        -- vstup
        A_i => sig_3_p,
        B_i => sig_4_p,
        C_i => '0',
        -- vystup
        Y_o => sig_6,
        C_o => sig_8(1)
);

MA3: entity work.four_adder                             -- secteni signalu z predchozich citacek
    port map (
        -- vstup
        A_i => sig_5,
        B_i => sig_6,
        C_i => '0',
        -- vystup
        Y_o => Y_o,
        C_o => sig_8(2)
);

end Behavioral;