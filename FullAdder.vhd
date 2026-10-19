library ieee;
use ieee.std_logic_1164.all;

entity FullAdder is
    port(
        a, b, c :in STD_LOGIC;
        Sum, Carry :out STD_LOGIC
    );
end FullAdder;

architecture LogicFunction of FullAdder is
    begin
        Sum <= a XOR b XOR c;
        Carry <= (a and b) or (b and c) or (a and c);
end LogicFunction;


