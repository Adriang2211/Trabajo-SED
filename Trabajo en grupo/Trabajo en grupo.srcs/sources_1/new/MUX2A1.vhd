library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity MUX2A1 is
    Generic(
        width   : positive := 13
        );
    Port(
        DATA1       : in  std_logic_vector(width-1 downto 0);
        DATA2       : in  std_logic_vector(width-1 downto 0);
        DATA_OUTPUT : out std_logic_vector(width-1 downto 0);
        SEL         : in  std_logic
    );
end MUX2A1;

architecture BEHAVIORAL of MUX2A1 is

begin
    process (SEL)
    begin
        if (SEL = '1') then
            DATA_OUTPUT <= DATA2;
        else
            DATA_OUTPUT <= DATA1;
        end if;
    end process;

end BEHAVIORAL;
