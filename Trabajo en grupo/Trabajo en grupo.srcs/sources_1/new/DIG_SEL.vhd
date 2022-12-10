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
        RESET    : in std_logic;
        UINT_SEL : out std_logic_vector (DIGITS_RANGE-1 downto 0); -- Valor codificado en entero sin signo del digito seleccionado para la entrada de seleccion del multiplexor
        BIN_SEL  : out std_logic_vector (DIGITS-1 downto 0)
    );
end DIG_SEL;

architecture Behavioral of DIG_SEL is
    signal contador : integer := 0;
begin
    process(CLK)
    begin
        if (RESET = '1') then
            contador <= 0;
        elsif rising_edge(CLK) then
            contador <= contador + 1;
            if (contador >= DIGITS-1) then
                contador <= 0;
            end if;
        end if;
    end process;
 
    
    asignacion_salida: process (CLK)
    begin
        if Reset='1' then
             BIN_SEL <= (others => '1');
             UINT_SEL <= (others=> '1');   
        elsif rising_edge (CLK) then
            BIN_SEL <= (others => '1');
            BIN_SEL(contador) <= '0';
            UINT_SEL <= std_logic_vector(to_unsigned(contador, DIGITS_RANGE));   
            end if;
        end process;
        
end Behavioral;
