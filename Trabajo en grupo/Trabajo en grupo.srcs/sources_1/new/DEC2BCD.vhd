library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity DEC2BCD is
    port(
        DATA_IN : in  std_logic_vector(6 downto 0); -- Entrada de un numero de 0 a 99 (7 bits)
        CLK     : in  std_logic;
        BCD1    : out std_logic_vector(3 downto 0); -- Decenas
        BCD2    : out std_logic_vector(3 downto 0)  -- Unidades
    );
end DEC2BCD;

architecture Behavioral of DEC2BCD is

begin
    process (clk)
        variable decenas    : unsigned (DATA_IN'range);
        variable unidades   : unsigned (DATA_IN'range);
        variable entrada    : unsigned (DATA_IN'range);
    begin
        if rising_edge(CLK) then
            entrada := unsigned(DATA_IN);
            if (entrada > 99) then -- No se puede representar, se convierte en 99
                entrada := (others => '1');
            end if;
            decenas := entrada/10;
            unidades := entrada mod 10;
            BCD1 <= std_logic_vector(decenas(3 downto 0));
            BCD2 <= std_logic_vector(unidades(3 downto 0));  
        end if;  
    end process;
    
end Behavioral;
