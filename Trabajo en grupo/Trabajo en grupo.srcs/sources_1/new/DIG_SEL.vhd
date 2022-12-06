library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity DIG_SEL is
    generic (
        DIGITS  : positive := 8;
        DIGITS_RANGE    : positive := 3
        );
    port (
        CLK      : in std_logic;
        UINT_SEL : out unsigned (DIGITS_RANGE-1 downto 0) -- Valor codificado en entero sin signo del digito seleccionado para la entrada de seleccion del multiplexor
    );
end DIG_SEL;

architecture Behavioral of DIG_SEL is
    signal contador : integer := 0;
begin
    process(CLK)
    begin
        if rising_edge(CLK) then
            contador <= contador + 1;
            if (contador >= DIGITS) then
                contador <= 0;
            end if;
        end if;
    end process;
    UINT_SEL <= to_unsigned(contador, DIGITS_RANGE);
end Behavioral;
