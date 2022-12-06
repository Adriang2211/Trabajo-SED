library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity DISP_CRTL is

    generic(
        speed_width : positive := 4;    -- N�mero de bits de los datos de velocidad
        incl_width  : positive := 4;    -- N�mero de bits de los datos de inclinaci�n
        time_width  : positive := 13;   -- N�mero de bits de los datos de tiempos
        digits      : positive := 8;     -- N�mero de d�gitos de la placa
        digits_range : positive := 3    -- Rango para la expresion del numero de digitos de la placa en binario
        );
        
    Port ( DISP_SEL     : out STD_LOGIC_VECTOR (digits-1 downto 0);     -- Selecci�n del d�gito
           DISP_DATA    : out STD_LOGIC_VECTOR (6 downto 0);            -- 7 segmentos
           SPEED        : in STD_LOGIC_VECTOR (speed_width-1 downto 0); -- Dato de velocidad (0 a 16)
           INCL         : in STD_LOGIC_VECTOR (incl_width-1 downto 0);  -- Dato de inclinaci�n (0 a 16)
           TIME_DATA    : in STD_LOGIC_VECTOR (time_width-1 downto 0);  -- Dato de tiempo (en segundos)
           CLK          : in STD_LOGIC;                                 -- Se�al de reloj
           RESET        : in std_logic);                                -- Se�al de RESET asincrono
           
end DISP_CRTL;

architecture Structural of DISP_CRTL is
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
    
    signal dig_sel2decod_and_mux    : std_logic_vector (digits_range-1 downto 0);
    signal mux2dcdr         : std_logic_vector(3 downto 0); --Ancho fijo puesto que es BCD siempre
    signal internal_clk     : std_logic;
    
begin
    divisor_de_frecuencia : FREQ_DIV Generic map(
        DIVIDE => 100
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
        DATA_IN1 => "0000", --  EN PRUEBAS / PROVISIONAL
        DATA_IN2 => "0001",
        DATA_IN3 => "0010",
        DATA_IN4 => "0011",
        DATA_IN5 => "0100",
        DATA_IN6 => "0101",
        DATA_IN7 => "0110",
        DATA_IN8 => "0111",
        SEL => dig_sel2decod_and_mux,
        OUTPUT => mux2dcdr
        );
        
    decod7seg : DCDR7SEG Port map(
        code => mux2dcdr,
        led => DISP_DATA
        );
        
    

end Structural;
