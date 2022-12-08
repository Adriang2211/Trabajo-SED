library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity top is
    generic(
        button_width    : positive := 4;      -- Numero de botones
        speed_width     : positive := 4;      -- Bits para la comunicacion con el motor
        incl_width      : positive := 4;      -- Bits para la comunicacion con el motor
        digits          : positive := 8      -- Numero de displays de 7 segmentos de la placa
    );
    port(
        BUTTONS     : in std_logic_vector(button_width-1 downto 0);     --Botones de la placa
        RESET       : in std_logic;                                     -- RESET de todo el sistema, asincrono
        CLK         : in std_logic;                                     -- Reloj
        START       : in std_logic;                                     -- Para que la cinta comience a funcionar  
        SPEED       : out std_logic_vector (speed_width - 1 downto 0);  -- Al control del motor de velocidad
        INCL        : out std_logic_vector (incl_width - 1 downto 0);   -- Al control del motor de inclinacion
        BCD_DATA    : out std_logic_vector (7 downto 0);                -- Salida datos a los displays
        BDC_SEL     : out std_logic_vector (digits - 1 downto 0)        -- Seleccion del digito
    );
end top;

architecture STRUCTURAL of top is
    component CRONO
        Generic (
            in_time_width : positive := 7; -- Ancho para minutos
            out_time_width : positive := 13;
            divide: positive:= 100000000;-- Ancho para segundos
           conversion: positive:=30;
            max_time: positive:=5940
        );
        Port ( 
            UP_INC:in  STD_LOGIC;
            DOWN_INC:in  STD_LOGIC;
            UP_NDOWN : in  STD_LOGIC; -- Habilitar cuenta hacia arriba o hacia abajo (salida negada)
            CE       : in  STD_LOGIC; -- Count enable
            CLK      : in  STD_LOGIC; -- Señal de reloj
            RESET    : in  STD_LOGIC; -- Reset asincrono
            ENABLE   : in  STD_LOGIC; -- Chip enable en la configuracion 
            LOAD_ENABLE:  IN STD_LOGIC; -- WHEN '1' LOAD 
            TIMES     : out UNSIGNED (out_time_width-1 downto 0); -- Salda del cronometro en segundos
            LOAD_OUT: out unsigned (in_time_width-1 downto 0);
            ENDING: out std_logic
        );
    end component;
    
    
    component MODOS
        Generic (
            speed_width : positive := 4;
            incl_width  : positive := 4;
            conversion_speed : positive := 1;
            conversion_incl : positive := 1;
            max : positive := 15
        );
        Port ( 
            SPEED_UP   : in  STD_LOGIC; -- Boton para subir de nivel de velocidad
            SPEED_DOWN : in  STD_LOGIC; -- Boton para bajar de nivel de velocidad
            INCL_UP    : in  STD_LOGIC; -- Boton para subir de nivel de inclinacion
            INCL_DOWN  : in  STD_LOGIC; -- Boton para bajar de nivel de inclinacion
            CLK        : in  STD_LOGIC; -- Señal de reloj
            RESET      : in  STD_LOGIC; -- Reset asincrono
            ENABLE     : in  STD_LOGIC; -- Chip enable
            SPEED      : out UNSIGNED (speed_width-1 downto 0); -- Control del motor de velocidad 
            INCL       : out UNSIGNED (incl_width-1 downto 0); -- Control del motor de inclinacion 
            SPEED_DATA : out UNSIGNED (speed_width-1 downto 0); -- Dato para mostrar en pantalla (display)
            INCL_DATA  : out UNSIGNED (incl_width-1 downto 0) -- Dato para mostrar en pantalla (display)
        );
    end component;
    
    component FSM
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
            EN_MODOS       : out STD_LOGIC; -- Habilitar configuracion de velocidad e inclinacion
            LOAD_EN_TIME   : out STD_LOGIC; -- Habilitar configuracion de tiempo   
            COUNT_EN_TIME  : out STD_LOGIC; -- Habilitar la cuenta
            CRONO_EN_TIME  : out STD_LOGIC; -- Habilitar CRONO
            MUX_SEL        : out STD_LOGIC -- Seleccionar o que se visualiza en los displays   
        );
    end component;
    
    component DISP_CTRL
        generic(
            speed_width : positive := 4;    -- Número de bits de los datos de velocidad
            incl_width  : positive := 4;    -- Número de bits de los datos de inclinación
            time_width  : positive := 13;   -- Número de bits de los datos de tiempos
            digits      : positive := 8;     -- Número de dígitos de la placa
            digits_range : positive := 3    -- Rango para la expresion del numero de digitos de la placa en binario
            );
            
        Port (
            DISP_SEL     : out STD_LOGIC_VECTOR (digits-1 downto 0);     -- Selección del dígito
            DISP_DATA    : out STD_LOGIC_VECTOR (6 downto 0);            -- 7 segmentos
            SPEED        : in STD_LOGIC_VECTOR (speed_width-1 downto 0); -- Dato de velocidad (0 a 16)
            INCL         : in STD_LOGIC_VECTOR (incl_width-1 downto 0);  -- Dato de inclinación (0 a 16)
            TIME_DATA    : in STD_LOGIC_VECTOR (time_width-1 downto 0);  -- Dato de tiempo (en segundos)
            CLK          : in STD_LOGIC;                                 -- Señal de reloj
            RESET        : in std_logic);                                -- Señal de RESET asincrono
               
    end component;
    
    component MUX2A1
        Generic(
            width   : positive := 13
            );
        Port(
            DATA1       : in  std_logic_vector(width-1 downto 0);
            DATA2       : in  std_logic_vector(width-1 downto 0);
            DATA_OUTPUT : out std_logic_vector(width-1 downto 0);
            SEL         : in  std_logic
        );
    end component;
begin


end STRUCTURAL;
