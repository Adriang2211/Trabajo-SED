library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity DECOD is
    generic(
        width   : positive := 8;
        width_uint  : positive := 3
        );
    port(
        SEL     : in unsigned(width_uint-1 downto 0);
        DECODED : out std_logic_vector(width-1 downto 0)
    );
end DECOD;

architecture Behavioral of DECOD is

begin
    process
    begin
        DECODED <= (others => '0');
        DECODED(to_integer(SEL)) <= '1';
    end process;

end Behavioral;
