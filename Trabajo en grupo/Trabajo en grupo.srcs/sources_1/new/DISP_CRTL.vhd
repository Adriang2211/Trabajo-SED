library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity DISP_CTRL is

    generic(
        speed_width : positive := 4;    -- Número de bits de los datos de velocidad
        incl_width  : positive := 4;    -- Número de bits de los datos de inclinación
        time_width  : positive := 13;   -- Número de bits de los datos de tiempos
        digits      : positive := 8;     -- Número de dígitos de la placa
        digits_range : positive := 3    -- Rango para la expresion del numero de digitos de la placa en binario
        );
        
    Port ( DISP_SEL     : out STD_LOGIC_VECTOR (digits-1 downto 0);     -- Selección del dígito
           DISP_DATA    : out STD_LOGIC_VECTOR (6 downto 0);            -- 7 segmentos
           SPEED        : in STD_LOGIC_VECTOR (speed_width-1 downto 0); -- Dato de velocidad (0 a 16)
           INCL         : in STD_LOGIC_VECTOR (incl_width-1 downto 0);  -- Dato de inclinación (0 a 16)
           TIME_DATA    : in STD_LOGIC_VECTOR (time_width-1 downto 0);  -- Dato de tiempo (en segundos)
           CLK          : in STD_LOGIC;                                 -- Señal de reloj
           RESET        : in std_logic);                                -- Señal de RESET asincrono
           
end DISP_CTRL;

architecture Structural of DISP_CTRL is
    component FREQ_DIV generic(
        DIVIDE  : positive := 10
    );
    Port ( 
        CLK_IN  : in STD_LOGIC;
        RESET   : in std_logic;
        CLK_OUT : out STD_LOGIC
        );
    end component;
    
    component DIG_SEL generic(
        DIGITS  : positive := 8;
        DIGITS_RANGE    : positive := 3
        );
    port (
        CLK      : in std_logic;
        RESET    : in std_logic;
        UINT_SEL : out std_logic_vector (DIGITS_RANGE-1 downto 0); -- Valor codificado en entero sin signo del digito seleccionado para la entrada de seleccion del multiplexor
        BIN_SEL  : out std_logic_vector (DIGITS-1 downto 0)
    );
    end component;
    
    component DCDR7SEG port (
        code : IN std_logic_vector(3 DOWNTO 0);
        led : OUT std_logic_vector(6 DOWNTO 0)
        );
    end component;
    
    component MUX Generic(
        width   : positive := 4
    );
    Port (  DATA_IN1    : in STD_LOGIC_VECTOR (width-1 downto 0);
            DATA_IN2    : in std_logic_vector (width-1 downto 0);
            DATA_IN3    : in STD_LOGIC_VECTOR (width-1 downto 0);
            DATA_IN4    : in std_logic_vector (width-1 downto 0);
            DATA_IN5    : in STD_LOGIC_VECTOR (width-1 downto 0);
            DATA_IN6    : in std_logic_vector (width-1 downto 0);
            DATA_IN7    : in STD_LOGIC_VECTOR (width-1 downto 0);
            DATA_IN8    : in std_logic_vector (width-1 downto 0);
            OUTPUT      : out STD_LOGIC_vector(width-1 downto 0);
            SEL         : in std_logic_vector (2 downto 0)
           );
    end component;
    
    component DEC2BCD Port(
        DATA_IN : in  std_logic_vector(6 downto 0); -- Entrada de un numero de 0 a 99 (7 bits)
        CLK     : in  std_logic;
        BCD1    : out std_logic_vector(3 downto 0); -- Decenas
        BCD2    : out std_logic_vector(3 downto 0)  -- Unidades
    );
    end component;
    
    component TIME_CONV Generic (
        input_width : positive := 13
        );
        Port(
            DATA_IN     : in std_logic_vector(input_width-1 downto 0);
            CLK         : in std_logic;
            MIN         : out std_logic_vector(6 downto 0);
            SEC         : out std_logic_vector(6 downto 0)
        );
    end component;
    
    signal dig_sel2decod_and_mux    : std_logic_vector (digits_range-1 downto 0);
    signal mux2dcdr         : std_logic_vector(3 downto 0); --Ancho fijo puesto que es BCD siempre
    signal internal_clk     : std_logic;
    signal speed7b  : std_logic_vector(6 downto 0);
    signal incl7b   : std_logic_vector(6 downto 0);
    signal data1    : std_logic_vector(3 downto 0);
    signal data2    : std_logic_vector(3 downto 0);
    signal data3    : std_logic_vector(3 downto 0);
    signal data4    : std_logic_vector(3 downto 0);
    signal data5    : std_logic_vector(3 downto 0);
    signal data6    : std_logic_vector(3 downto 0);
    signal data7    : std_logic_vector(3 downto 0);
    signal data8    : std_logic_vector(3 downto 0);
    signal minutos  : std_logic_vector(6 downto 0);
    signal segundos : std_logic_vector(6 downto 0);
    
begin
    divisor_de_frecuencia : FREQ_DIV Generic map(
        DIVIDE => 1000
        )
        Port map(
            CLK_IN => CLK,
            RESET => RESET,
            CLK_OUT => internal_clk  
        );
        
    selector_de_digito : DIG_SEL Port map(
        CLK => internal_clk,
        RESET => RESET,
        UINT_SEL => dig_sel2decod_and_mux,
        BIN_SEL =>  disp_sel
        );
        
    multiplexor : MUX Port Map(
        DATA_IN1 => data1, --  EN PRUEBAS / PROVISIONAL
        DATA_IN2 => data2,
        DATA_IN3 => data3,
        DATA_IN4 => data4,
        DATA_IN5 => data5,
        DATA_IN6 => data6,
        DATA_IN7 => data7,
        DATA_IN8 => data8,
        SEL => dig_sel2decod_and_mux,
        OUTPUT => mux2dcdr
        );
        
    decod7seg : DCDR7SEG Port map(
        code => mux2dcdr,
        led => DISP_DATA
        );
    
    --Conversion de n=4 a 7 bits para la velocidad
    speed7b (speed_width-1 downto 0) <= speed;
    speed7b (6 downto speed_width) <= (others => '0');
    
    --Conversion de n=4 a 7 bits para la inclinacion
    incl7b (incl_width-1 downto 0) <= incl;
    incl7b (6 downto incl_width) <= (others => '0');
    
    speed_BCD_conversion : DEC2BCD Port map(
        DATA_IN => speed7b,
        CLK => CLK,
        BCD1 => data1, --Decenas
        BCD2 => data2 --Unidades
        );
    
    incl_BCD_conversion : DEC2BCD Port map(
        DATA_IN => incl7b,
        CLK => CLK,
        BCD1 => data3, --Decenas
        BCD2 => data4 --Unidades
        );
        
        
    conversor_tiempo    : TIME_CONV
        Generic map(
            input_width => time_width
            )
        Port map(
            DATA_IN => TIME_DATA,
            CLK => CLK,
            MIN => minutos,
            SEC => segundos
            );
            
    minutes_BCD_conversion  : DEC2BCD Port map(
        DATA_IN => minutos,
        CLK => CLK,
        BCD1 => data5, --Decenas
        BCD2 => data6 --Unidades
        );
        
    seconds_BCD_conversion  : DEC2BCD Port map(
        DATA_IN => segundos,
        CLK => CLK,
        BCD1 => data7, --Decenas
        BCD2 => data8 --Unidades
        );

end Structural;
