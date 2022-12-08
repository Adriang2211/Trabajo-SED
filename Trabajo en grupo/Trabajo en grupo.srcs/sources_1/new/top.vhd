library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity top is
    generic(
        button_width    : positive := 4;      -- Numero de botones
        speed_width     : positive := 4;      -- Bits para la comunicacion con el motor
        incl_width      : positive := 4;      -- Bits para la comunicacion con el motor
        digits          : positive := 8;      -- Numero de displays de 7 segmentos de la placa
         digits_range          : positive := 3;
        in_time_width : positive := 13; -- Ancho para segundos de carga
        out_time_width : positive := 13;
        divide: positive:= 100000000;-- Ancho para segundos
        conversion: positive:=30;
        max_time: positive:=5940; --El valor corresponde a 99 Minutos, valor maximo mostrable
        conversion_speed : positive := 1;
        conversion_incl : positive := 1;
        max : positive := 15
    );
    port(
        BUTTONS     : in std_logic_vector(button_width-1 downto 0);     --Botones de la placa
        RESET       : in std_logic;                                     -- RESET de todo el sistema, asincrono
        CLK         : in std_logic;                                     -- Reloj
        START       : in std_logic;                                     -- Para que la cinta comience a funcionar  
        SPEED       : out std_logic_vector (speed_width - 1 downto 0);  -- Al control del motor de velocidad
        INCL        : out std_logic_vector (incl_width - 1 downto 0);   -- Al control del motor de inclinacion
        BCD_DATA    : out std_logic_vector (7 downto 0);                -- Salida datos a los displays
        BCD_SEL     : out std_logic_vector (digits - 1 downto 0)        -- Seleccion del digito
    );
end top;

architecture STRUCTURAL of top is
    signal synch_to_edge: std_logic_vector(button_width-1 downto 0); 
    signal edge_to_comp: std_logic_vector(button_width-1 downto 0); 
    signal S_TIME_FIN: std_logic ;
    signal S_UP_NDOWN:std_logic ;
    signal S_EN_MODOS:std_logic;
    signal S_LOAD_EN_TIME: std_logic ;
    signal S_COUNT_EN_TIME: std_logic;
    signal S_CRONO_EN_TIME: std_logic ;
    signal S_MUX_SEL:std_logic ;
    signal TIMES_TO_MUX:std_logic_vector(out_time_width-1 downto 0);
    signal LOAD_TO_MUX: std_logic_vector(out_time_width-1 downto 0);
    signal SPEED_TO_DISP:std_logic_vector(speed_width-1 downto 0);
    signal INCL_TO_DISP:std_logic_vector(incl_width-1 downto 0);
    signal MUX_TO_DISP:std_logic_vector(out_time_width-1 downto 0);
     
    component EDGEDTCTR is
        Port ( CLK : in STD_LOGIC;
               SYNC_IN : in STD_LOGIC;
               Reset : in STD_LOGIC;
               EDGE : out STD_LOGIC);
            
    end component;
    
    component SYNCHRNZR is
        Port ( 
                CLK : in STD_LOGIC;
               ASYNC_IN : in STD_LOGIC;
               Reset : in STD_LOGIC;
               SYNC_OUT : out STD_LOGIC);
    end component;
    
        component CRONO is
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
            TIMES     : out STD_LOGIC_VECTOR (out_time_width-1 downto 0); -- Salda del cronometro en segundos
            LOAD_OUT: out STD_LOGIC_VECTOR (in_time_width-1 downto 0);
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
            SPEED      : out STD_LOGIC_VECTOR (speed_width-1 downto 0); -- Control del motor de velocidad 
            INCL       : out STD_LOGIC_VECTOR (incl_width-1 downto 0); -- Control del motor de inclinacion 
            SPEED_DATA : out STD_LOGIC_VECTOR (speed_width-1 downto 0); -- Dato para mostrar en pantalla (display)
            INCL_DATA  : out STD_LOGIC_VECTOR (incl_width-1 downto 0) -- Dato para mostrar en pantalla (display)
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

        synchs: for i in 0 to button_width-1 generate
            synch: SYNCHRNZR 
                PORT map(
                    CLK =>CLK,
                   ASYNC_IN =>BUTTONS(i),
                   Reset =>RESET,
                   SYNC_OUT =>synch_to_edge(i)
                );
        end generate synchs;
    
      edges: for i in 0 to button_width-1 generate
            edge: EDGEDTCTR 
                PORT map(
                    CLK =>CLK,
                   SYNC_IN =>synch_to_edge(i),
                   Reset =>RESET,
                   EDGE =>edge_to_comp(i)
                );
            end generate edges;
   
    FSM_C: FSM
        PORT MAP(
                TIME_FIN      =>S_TIME_FIN, -- Se ha acabado el tiempo
                START         =>START, -- Switch para pasar a funcionamiento
                BUTTON_CONFIG  => edge_to_comp(2), -- Boton para pasar a configuracion y ready
                BUTTON_BACK    =>edge_to_comp(1), -- Boton para volver a la configuracion
                BUTTON_UP      =>edge_to_comp(0), -- Boton para seleccionar cuenta hacia arriba
                BUTTON_DOWN   =>edge_to_comp(3), -- Boton para seleccionar cuenta hacia abajo
                RESET         =>RESET, -- Reset asincrono
                CLK            =>CLK, -- Señal de reloj
                UP_NDOWN       =>S_UP_NDOWN,
                EN_MODOS       =>S_EN_MODOS,
                LOAD_EN_TIME  =>S_LOAD_EN_TIME,
                COUNT_EN_TIME  =>S_COUNT_EN_TIME,
                CRONO_EN_TIME  =>S_CRONO_EN_TIME,
                MUX_SEL       =>S_MUX_SEL
        );
      
     CRONO_C: CRONO
       Generic  Map(
            in_time_width => in_time_width, -- Ancho para minutos
            out_time_width => out_time_width,
            divide=> divide,     --100000000;-- Ancho para segundos
           conversion=> conversion,--=30;
            max_time=> max_time--5940
        )
        Port Map(
        UP_INC=> edge_to_comp(0),
        DOWN_INC=>edge_to_comp(3),
        UP_NDOWN => S_UP_NDOWN,-- Habilitar cuenta hacia arriba o hacia abajo (salida negada)
        CE       =>S_COUNT_EN_TIME,
        CLK      =>CLK,
        RESET    =>RESET,
        ENABLE   =>S_CRONO_EN_TIME,
        LOAD_ENABLE=>S_LOAD_EN_TIME,
        TIMES   => TIMES_TO_MUX,
        LOAD_OUT=> LOAD_TO_MUX,
        ENDING=>S_TIME_FIN
        );
    
    MUX_C: MUX2A1
    Generic map(
        width =>   out_time_width
        )
    Port Map(
        DATA1      => LOAD_TO_MUX,
        DATA2      =>TIMES_TO_MUX ,
        DATA_OUTPUT =>MUX_TO_DISP,
        SEL      => S_MUX_SEL
    );
    MODOS_C: MODOS
      Generic Map(
        speed_width => speed_width,
        incl_width  => incl_width,
        conversion_speed =>   conversion_speed,
        conversion_incl => conversion_incl,
        max => max 
    )
    Port Map ( 
        SPEED_UP => edge_to_comp(0),
        SPEED_DOWN =>edge_to_comp(3),
        INCL_UP    => edge_to_comp(2),
        INCL_DOWN=> edge_to_comp(1),
        CLK       => CLK,
        RESET     => RESET,
        ENABLE    => S_EN_MODOS,
        SPEED=>SPEED ,
        INCL      =>  INCL   ,
        SPEED_DATA=> SPEED_TO_DISP,
        INCL_DATA  =>INCL_TO_DISP 
    );

    DISP_CTRL_C: DISP_CTRL
    
     Generic Map(
        speed_width =>  speed_width,   -- Número de bits de los datos de velocidad
        incl_width   =>incl_width ,   -- Número de bits de los datos de inclinación
        time_width   => out_time_width,   -- Número de bits de los datos de tiempos
        digits       => digits  ,      -- Número de dígitos de la placa
        digits_range  => digits_range     -- Rango para la expresion del numero de digitos de la placa en binario
        )
        
    Port Map ( 
           DISP_SEL      =>BCD_SEL , 
           DISP_DATA    => BCD_DATA,         
           SPEED         => SPEED_TO_DISP, 
           INCL          => INCL_TO_DISP, 
           TIME_DATA     => MUX_TO_DISP, 
           CLK          => CLK,                                -- Señal de reloj
           RESET        => RESET
           );  

end STRUCTURAL;
