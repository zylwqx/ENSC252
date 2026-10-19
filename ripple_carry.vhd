library ieee;
use ieee.std_logic_1164.all;

entity RippleCarry is
    port(
        Cin :in STD_LOGIC;
        x, y :in STD_LOGIC_VECTOR(3 downto 0);
        s :out STD_LOGIC_VECTOR(3 downto 0);
        Cout :out STD_LOGIC
    ); 
end RippleCarry;

architecture LogicFunction of RippleCarry is
signal c1 : STD_LOGIC_VECTOR(1 to 3);
component RippleCarry
    port(
        Cin, x, y :in STD_LOGIC;
        s, Cout : OUT STD_LOGIC
    );
    end component;
begin
    stage0: RippleCarry port map(Cin, x(0), y(0), s(0), c(1));
    stage1: RippleCarry port map(c(1), x(1), y(1), s(1), c(2));
    stage2: RippleCarry port map(c(2), x(2), y(2), s(2), c(3));
    stage3: RippleCarry port map(Cin => c(3), Cout => Cout, x => x(3), y => y(3), s => s(3));
end LogicFunction;