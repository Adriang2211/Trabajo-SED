library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity FREQ_DIV is
    Generic(
        DIVIDE  : positive := 10
    );
    Port ( 
        CLK_IN  : in STD_LOGIC;
        RESET   : in std_logic;
        CLK_OUT : out STD_LOGIC
        );
end FREQ_DIV;

architecture Behavioral of FREQ_DIV is
    signal counter : integer := 0;
begin
    process (CLK_IN)
    begin
        CLK_OUT <= '0';
        if (RESET = '1') then
            counter <= 0;
        elsif (rising_edge(CLK_IN)) then
            counter <= counter +1;
            if (counter = DIVIDE) then
                counter <= 0;
                CLK_OUT <= '1';
            end if;
        end if;
    end process;

end Behavioral;
