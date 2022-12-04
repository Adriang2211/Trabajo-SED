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

architecture Behavioral of top is

begin


end Behavioral;
