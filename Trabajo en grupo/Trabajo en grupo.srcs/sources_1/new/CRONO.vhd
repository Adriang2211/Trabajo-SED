library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity CRONO is
    Generic (
        in_time_width : positive := 7; -- Ancho para minutos
        out_time_width : positive := 13 -- Ancho para segundos
    );
    Port ( 
        LOAD     : in  UNSIGNED (in_time_width-1 downto 0); -- Tiempo en minutos
        UP_NDOWN : in  STD_LOGIC; -- Habilitar cuenta hacia arriba o hacia abajo (salida negada)
        CE       : in  STD_LOGIC; -- Count enable
        CLK      : in  STD_LOGIC; -- Señal de reloj
        RESET    : in  STD_LOGIC; -- Reset asincrono
        ENABLE   : in  STD_LOGIC; -- Chip enable
        TIME     : out UNSIGNED (out_time_width-1 downto 0) -- Salda del cronometro en segundos
    );
end CRONO;

architecture Behavioral of CRONO is

begin


end Behavioral;
