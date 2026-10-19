library ieee;
use ieee.std_logic_1164.all;

entity RippleTop is
    port(
        SW : in STD_LOGIC_VECTOR(8 downto 0);
        LEDR : out STD_LOGIC_VECTOR(4 downto 0);
        HEX0 : out STD_LOGIC_VECTOR(6 downto 0)
    );
end RippleTop;

architecture Structural of RippleTop is
    component RippleCarry is
    port(
        Cin :in STD_LOGIC;
        x, y :in STD_LOGIC_VECTOR(3 downto 0);
        s :out STD_LOGIC_VECTOR(3 downto 0);
        Cout :out STD_LOGIC
    );
    end component;

    signal  sum : STD_LOGIC_VECTOR(3 downto 0);
    signal carry : STD_LOGIC;
    
begin
    U1 : RippleCarry port map( 
        x => SW(7 downto 4),
        y => SW(3 downto 0),
        Cin => SW(8),
        s => sum,
        cout => carry
    );

    LEDR(3 downto 0) <= sum;
    LEDR(4) <= carry;

    with sum select
    HEX0 <= "1000000" when "0000",  -- 0
            "1111001" when "0001",  -- 1
            "0100100" when "0010",  -- 2
            "0110000" when "0011",  -- 3
            "0011001" when "0100",  -- 4
            "0010010" when "0101",  -- 5
            "0000010" when "0110",  -- 6
            "1111000" when "0111",  -- 7
            "0000000" when "1000",  -- 8
            "0010000" when "1001",  -- 9
            "0001000" when "1010",  -- A
            "0000011" when "1011",  -- b
            "1000110" when "1100",  -- C
            "0100001" when "1101",  -- d
            "0000110" when "1110",  -- E
            "0001110" when "1111";  -- F
end Structural;

