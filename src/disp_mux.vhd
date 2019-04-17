--------------------------------------------------------------------------------
-- Brno University of Technology, Department of Radio Electronics
--------------------------------------------------------------------------------
-- Author: Tomas Dubina, Milan Hornik
-- Date: 2019-03-14 08:04
-- Design: disp_mux
-- Description: 7-segment display time-multiplexing module.
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

--------------------------------------------------------------------------------
-- Entity declaration for display multiplexer
--------------------------------------------------------------------------------
entity disp_mux is
    generic	(
		constant c_NBIT: natural:=7 			
    ); 
    port (
        -- Entity input signals
        data3_i : in std_logic_vector(4-1 downto 0);
        data2_i : in std_logic_vector(4-1 downto 0);
        data1_i : in std_logic_vector(4-1 downto 0);
        data0_i : in std_logic_vector(4-1 downto 0);
        clk_i   : in std_logic;

        -- Entity output signals
        an_o   : out std_logic_vector(4-1 downto 0);    -- 1-of-4 decoder
        sseg_o : out std_logic_vector(7-1 downto 0)     -- 7-segment display
    );
end disp_mux;

--------------------------------------------------------------------------------
-- Architecture declaration for display multiplexer
--------------------------------------------------------------------------------
architecture Behavioral of disp_mux is
    constant g_NBIT : integer := 4; -- number of bits for clock multiplexer
    signal s_clk_mux : std_logic_vector(c_NBIT-1 downto 0); -- vystup delicky
    signal s_hex : std_logic_vector(4-1 downto 0);  -- internal 4-bit data
begin
    -- binarni delicka kmitoctu
    BINCNT : entity work.bin_cnt
      generic map (
            N_BIT => c_NBIT                 -- N_bit binary counter
      )
      port map (
            clk_i => clk_i,                 -- 10 kHz
            rst_n_i => '1',                 -- inactive reset
            bin_cnt_o => s_clk_mux          -- output bits
      );
      
      -- mux 
      FOUR_TO_ONE : entity work.four_to_one_mux
      generic map (
            g_NBIT => g_NBIT                 -- g_nbit multiplexer
      )
      port map (
        data3_i => data3_i,  -- last N_BIT channel
        data2_i => data2_i,
        data1_i => data1_i,
        data0_i => data0_i,  -- first N_BIT channel
        -- 2 selection bits
        sel_i   => s_clk_mux(c_NBIT-1 downto c_NBIT-2),       
        -- Entity output signals
        y_o => s_hex 
      );  
 
      -- NUM -> BCD
    HEX2SSEG : entity work.hex_to_sseg
        port map (
            hex_i => s_hex,     -- 4-bit data to decode
            sseg_o => sseg_o    -- 7-bit signal for 7-segment display
        );

    -- sub-block of one_of_four entity
    ONEOFFOUR : entity work.one_of_four
        port map (
            a_i => s_clk_mux(c_NBIT-1 downto c_NBIT-2),
            y_o => an_o     -- display select signals
        );

end Behavioral;
