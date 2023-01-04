library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity DISP_CTRL_TB1 is
--  Port ( );
end DISP_CTRL_TB1;

architecture Behavioral of DISP_CTRL_TB1 is
    component DISP_CTRL
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
    end component;
    
    signal clk  : std_logic;
    constant ClkPeriod : time := 10 ns;
    signal disp_sel     : std_logic_vector (7 downto 0);
    signal disp_data    : std_logic_vector (6 downto 0);
    signal speed        : std_logic_vector (3 downto 0);
    signal incl         : std_logic_vector (3 downto 0);
    signal time_data    : std_logic_vector (12 downto 0);
    signal reset        : std_logic;
begin
    test : DISP_CTRL Port map(
        DISP_SEL => disp_sel,
        DISP_DATA => disp_data,
        SPEED => speed,
        INCL => incl,
        TIME_DATA => time_data,
        CLK => clk,
        RESET => reset
        );
        
    clk_gen: process
    begin
        clk <= '1';
        wait for 0.5*ClkPeriod;
        clk <= '0';
        wait for 0.5*ClkPeriod;
    end process;
    
    
    test_process: process
    begin
        speed <= "0101";
        incl <= "0010";
        time_data <= (others=>'0');
        reset <= '1';
        wait for 10000*ClkPeriod;
        report "FIN";
        std.env.finish;
    end process;

end Behavioral;
