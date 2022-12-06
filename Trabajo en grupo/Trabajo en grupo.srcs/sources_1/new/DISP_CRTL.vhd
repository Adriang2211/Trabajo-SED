library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity DISP_CRTL is

    generic(
        speed_width : positive := 4;    -- N�mero de bits de los datos de velocidad
        incl_width  : positive := 4;    -- N�mero de bits de los datos de inclinaci�n
        time_width  : positive := 13;   -- N�mero de bits de los datos de tiempos
        digits      : positive := 8     -- N�mero de d�gitos de la placa
        );
        
    Port ( DISP_SEL     : out STD_LOGIC_VECTOR (digits-1 downto 0);     -- Selecci�n del d�gito
           DISP_DATA    : out STD_LOGIC_VECTOR (6 downto 0);            -- 7 segmentos
           SPEED        : in STD_LOGIC_VECTOR (speed_width-1 downto 0); -- Dato de velocidad (0 a 16)
           INCL         : in STD_LOGIC_VECTOR (incl_width-1 downto 0);  -- Dato de inclinaci�n (0 a 16)
           TIME_DATA    : in STD_LOGIC_VECTOR (time_width-1 downto 0);  -- Dato de tiempo (en segundos)
           CLK          : in STD_LOGIC);    -- Se�al de reloj
           
end DISP_CRTL;

architecture Behavioral of DISP_CRTL is

begin


end Behavioral;
