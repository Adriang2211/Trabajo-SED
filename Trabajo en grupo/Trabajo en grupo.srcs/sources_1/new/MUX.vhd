library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity MUX is
    Generic(
        width   : positive := 3
    );
    Port ( DATA_IN : in STD_LOGIC_VECTOR ((2**width)-1 downto 0);
           OUTPUT : out STD_LOGIC;
           SEL : in std_logic_vector (width-1 downto 0)
           );
end MUX;

architecture Behavioral of MUX is

begin
    process
    begin
        OUTPUT <= DATA_IN(to_integer(unsigned(SEL)));
    end process;

end Behavioral;