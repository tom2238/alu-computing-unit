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
    constant C_NBIT : natural := 7; -- number of bits for clock prescaler
    signal alu_result : std_logic_vector(3 downto 0);  -- Po vyberu operace
    signal rs_carry, rs_plus_c, rs_minus_c : std_logic;               -- Carry bit
    signal rs_inc_c, rs_dec_c, rs_plusc_c, rs_minusc_c : std_logic;   -- Carry bit
    signal rs_rr_c, rs_rl_c, rs_rrc_c, rs_rlc_c, rs_mul_c : std_logic;-- Carry bit
    signal rs_plus : std_logic_vector(3 downto 0);   -- Y = A + B        0x0
    signal rs_minus : std_logic_vector(3 downto 0);  -- Y = A - B        0x1
    signal rs_inc : std_logic_vector(3 downto 0);    -- Y = A + 1        0x2
    signal rs_dec : std_logic_vector(3 downto 0);    -- Y = A - 1        0x3
    signal rs_plusc : std_logic_vector(3 downto 0);  -- Y = A + B + c    0x4
    signal rs_minusc : std_logic_vector(3 downto 0); -- Y = A - B - c    0x5
    signal rs_or : std_logic_vector(3 downto 0);     -- Y = A or B       0x6
    signal rs_and : std_logic_vector(3 downto 0);    -- Y = A and B      0x7
    signal rs_xor : std_logic_vector(3 downto 0);    -- Y = A xor B      0x8
    signal rs_not : std_logic_vector(3 downto 0);    -- Y = not A        0x9
    signal rs_rr : std_logic_vector(3 downto 0);     -- Y = A >> 1       0xA
    signal rs_rl : std_logic_vector(3 downto 0);     -- Y = A << 1       0xB
    signal rs_rrc : std_logic_vector(3 downto 0);    -- Y = (A+c) >> 1   0xC
    signal rs_rlc : std_logic_vector(3 downto 0);    -- Y = (A+c) << 1   0xD
    signal rs_swap : std_logic_vector(3 downto 0);   -- Y = A'H <=> A'L  0xE
    signal rs_mul : std_logic_vector(3 downto 0);    -- Y = A * B        0xF
    
begin
    number_a_o <= number_a_i;
    number_b_o <= number_b_i;
    control_sig_o <= control_sig_i;
    
    DISP_MUX: entity work.disp_mux
    generic map (
       C_NBIT => C_NBIT                  -- N_bit binary counter
    )
    port map (
       -- Entity input signals
       data3_i => "0000",
       data2_i => number_a_i,
       data1_i => number_b_i,
       data0_i => alu_result,
       clk_i =>  clk_i,
       -- Entity output signals
       an_o  => disp_digit_o,    -- 1-of-4 decoder
       sseg_o => disp_sseg_o     -- 7-segment display
    );
    
    PARITY: entity work.parity
    port map (
        -- vstup dat z alu
        data_i => alu_result,
        -- vysledna parita vysledku
        parity_o => parity_o
    );
    
    -- Prepis carry na vystup 
    carry_o <= not rs_carry;
    
    -- scitacka
    RS_PLUS_COM: entity work.four_adder
    port map (
        -- vstup
        A_i => number_a_i,
        B_i => number_b_i,
        C_i => '0',
        -- vystup
        Y_o => rs_plus,
        C_o => rs_plus_c
    );
    
    RS_INC_COM: entity work.increment
    port map (
        -- Vstup
        A_i => number_a_i,
        C_i => '0',
        -- Vystup
        Y_o => rs_inc,
        C_o => rs_inc_c
    );
    
    -- logicky soucet
    RS_OR_COM: entity work.disjunction
    port map (
        -- vstup
        A_i => number_a_i,
        B_i => number_b_i,
        -- vystup
        Y_o => rs_or
    );
        
    
    -- logicky soucin
    RS_AND_COM: entity work.conjunction
    port map (
        -- vstup
        A_i => number_a_i,
        B_i => number_b_i,
        -- vystup
        Y_o => rs_and
    );
    
    -- logicky exkluzivni soucet
    RS_XOR_COM: entity work.exdisjunction
    port map (
        -- vstup
        A_i => number_a_i,
        B_i => number_b_i,
        -- vystup
        Y_o => rs_xor   
    );
    
    -- logicka negace
    RS_NOT_COM: entity work.negation
    port map (
        -- vstup
        A_i => number_a_i,
        -- vystup
        Y_o => rs_not
    );    
    
    -- Mux , vyber z vysledku z operace
    with control_sig_i select
        alu_result <= rs_plus when x"0",
                      rs_minus when x"1",
                      rs_inc when x"2",
                      rs_dec when x"3",
                      rs_plusc when x"4",
                      rs_minusc when x"5",
                      rs_or when x"6",
                      rs_and when x"7",
                      rs_xor when x"8",
                      rs_not when x"9",
                      rs_rr when x"A",
                      rs_rl when x"B",
                      rs_rrc when x"C",
                      rs_rlc when x"D",
                      rs_swap when x"E",
                      rs_mul when x"F",
                      x"0" when others;
     
     -- Mux , vyber z carry
     with control_sig_i select
         rs_carry <= rs_plus_c when x"0",
                     rs_minus_c when x"1",
                     rs_inc_c when x"2",
                     rs_dec_c when x"3",
                     rs_plusc_c when x"4",
                     rs_minusc_c when x"5",
                     rs_rr_c when x"A",
                     rs_rl_c when x"B",
                     rs_rrc_c when x"C",
                     rs_rlc_c when x"D",
                     rs_mul_c when x"F",
                     '0' when others;                

end Behavioral;
