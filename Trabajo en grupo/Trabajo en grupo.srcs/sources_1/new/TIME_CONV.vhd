library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity TIME_CONV is
    Generic(
        input_width : positive := 13
        );
    Port(
        DATA_IN     : in std_logic_vector(input_width-1 downto 0);
        CLK         : in std_logic;
        MIN         : out std_logic_vector(6 downto 0);
        SEC         : out std_logic_vector(6 downto 0)
        );
end TIME_CONV;

architecture Behavioral of TIME_CONV is

begin
    process(CLK)
        variable entrada    : unsigned (DATA_IN'range);
        variable iminutos   : unsigned (DATA_IN'range);
        variable isegundos  : unsigned (DATA_IN'range);
    begin
        if rising_edge(CLK) then
            entrada := unsigned(DATA_in);
            iminutos := entrada/60;
            isegundos := entrada mod 60;
            MIN <= std_logic_vector(iminutos(6 downto 0));
            SEC <= std_logic_vector(isegundos(6 downto 0));
        end if;
    end process;

end Behavioral;
