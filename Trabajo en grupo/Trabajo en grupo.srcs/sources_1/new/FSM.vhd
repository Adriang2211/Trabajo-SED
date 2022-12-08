
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity FSM is
    Port ( 
        TIME_FIN       : in  STD_LOGIC; -- Se ha acabado el tiempo
        START          : in  STD_LOGIC; -- Switch para pasar a funcionamiento
        BUTTON_CONFIG  : in  STD_LOGIC; -- Boton para pasar a configuracion y ready
        BUTTON_BACK    : in  STD_LOGIC; -- Boton para volver a la configuracion
        BUTTON_UP      : in  STD_LOGIC; -- Boton para seleccionar cuenta hacia arriba
        BUTTON_DOWN    : in  STD_LOGIC; -- Boton para seleccionar cuenta hacia abajo
        RESET          : in  STD_LOGIC; -- Reset asincrono
        CLK            : in  STD_LOGIC; -- Señal de reloj
        UP_NDOWN       : out STD_LOGIC; -- Habilitar cuenta hacia arriba o hacia abajo (salida negada)
        EN_SPEED       : out STD_LOGIC; -- Habilitar configuracion de velocidad
        EN_INCL        : out STD_LOGIC; --  Habilitar configuracion de inclinacion
        EN_TIME_CONFIG : out STD_LOGIC  -- Habilitar configuracion de tiempo    
    );
end FSM;

architecture Behavioral of FSM is
    type TipoEstados is (REPOSO, CONFIG, CONFIG_OK, READY_UP, FUNCIONA_UP, READY_DOWN, FUNCIONA_DOWN);
    signal EstadoActual, EstadoSiguiente : TipoEstados;
begin
    state_reg: process (CLK, RESET)
    begin
        if RESET = '1' then
            EstadoActual <= REPOSO;
        elsif rising_edge (CLK) then
            EstadoActual <= EstadoSiguiente;
        end if;
    end process state_reg;
    
    next_state_dec: process ( EstadoActual, TIME_FIN, START, BUTTON_CONFIG, BUTTON_BACK, BUTTON_UP, BUTTON_DOWN)
    begin
        EstadoSiguiente <= EstadoActual;
        case (EstadoActual) is
            when REPOSO =>
                if BUTTON_CONFIG = '1' then
                    EstadoSiguiente <= CONFIG;
                end if;
            when CONFIG =>
                if BUTTON_CONFIG = '1' then
                    EstadoSiguiente <= CONFIG_OK;
                end if;
            when CONFIG_OK =>
                if BUTTON_UP = '1' then
                    EstadoSiguiente <= READY_UP;
                elsif BUTTON_DOWN = '1' then
                    EstadoSiguiente <= READY_DOWN;
                elsif BUTTON_BACK = '1' then
                    EstadoSiguiente <= CONFIG;
                end if;
            when READY_UP =>
                if START = '1' then
                    EstadoSiguiente <= FUNCIONA_UP;
                elsif BUTTON_BACK = '1' then
                    EstadoSiguiente <= CONFIG;
                end if;
            when FUNCIONA_UP =>
                if START = '0' then
                    EstadoSiguiente <= READY_UP;
                end if;
            when READY_DOWN =>
                if START = '1' then
                    EstadoSiguiente <= FUNCIONA_DOWN;
                elsif BUTTON_BACK = '1' then
                    EstadoSiguiente <= CONFIG;
                end if;
            when FUNCIONA_DOWN =>
                if START = '0' then
                    EstadoSiguiente <= READY_DOWN;
                elsif TIME_FIN = '1' then
                    EstadoSiguiente <= CONFIG;
                end if;      
        end case;                
    end process next_state_dec;
    
    output_dec : process (EstadoActual)
    begin
    end process output_dec;

end Behavioral;
