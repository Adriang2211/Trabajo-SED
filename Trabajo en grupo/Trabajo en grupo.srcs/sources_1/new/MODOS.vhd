library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity MODOS is
    Generic (
        speed_width : positive := 4;
        incl_width  : positive := 4
    );
    Port ( 
        SPEED_UP   : in  STD_LOGIC; -- Boton para subir de nivel de velocidad
        SPEED_DOWN : in  STD_LOGIC; -- Boton para bajar de nivel de velocidad
        INCL_UP    : in  STD_LOGIC; -- Boton para subir de nivel de inclinacion
        INCL_DOWN  : in  STD_LOGIC; -- Boton para bajar de nivel de inclinacion
        CLK        : in  STD_LOGIC; -- Señal de reloj
        RESET      : in  STD_LOGIC; -- Reset asincrono
        ENABLE     : in  STD_LOGIC; -- Chip enable
        SPEED      : out STD_LOGIC; -- Al control del motor de velocidad (LED)
        INCL       : out STD_LOGIC; -- Al control del motor de inclinacion (LED)
        SPEED_DATA : out UNSIGNED (speed_width-1 downto 0); -- Dato para mostrar en pantalla (display)
        INCL_DATA  : out UNSIGNED (incl_width-1 downto 0) -- Dato para mostrar en pantalla (display)
    );
end MODOS;

architecture Behavioral of MODOS is

begin


end Behavioral;
