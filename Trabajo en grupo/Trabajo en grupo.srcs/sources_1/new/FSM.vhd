
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity FSM is
    Port ( 
        TIME_FIN       : in  STD_LOGIC; -- Se ha acabado el tiempo
        START          : in  STD_LOGIC; -- Switch para pasar a funcionamiento
        BUTTON_CONFIG  : in  STD_LOGIC; -- Boton para pasar a configuracion y ready
        BUTTON_BACK    : in  STD_LOGIC; -- Boton para volver a la configuracion
        RESET          : in  STD_LOGIC; -- Reset asincrono
        CLK            : in  STD_LOGIC; -- Señal de reloj
        UP_NDOWN       : out STD_LOGIC; -- Habilitar cuenta hacia arriba o hacia abajo (salida negada)
        EN_SPEED       : out STD_LOGIC; -- Habilitar configuracion de velocidad
        EN_INCL        : out STD_LOGIC; --  Habilitar configuracion de inclinacion
        EN_TIME_CONFIG : out STD_LOGIC -- Habilitar configuracion de tiempo    
    );
end FSM;

architecture Behavioral of FSM is

begin


end Behavioral;
