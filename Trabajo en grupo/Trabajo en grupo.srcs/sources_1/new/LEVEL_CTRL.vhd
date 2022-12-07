library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity LEVEL_CTRL is
    Generic(
    lv_width : positive := 4 -- ¿LO GENERALIZO?
    );
    
    Port ( 
        UP         : in  STD_LOGIC; -- Subir de nivel
        DOWN       : in  STD_LOGIC; -- Bajar de nivel
        CLK        : in  STD_LOGIC; -- Señal de reloj
        RESET      : in  STD_LOGIC; -- Reset asincrono
        CE         : in  STD_LOGIC; -- Clock enable
        LEVEL      : out UNSIGNED (lv_width-1 downto 0) -- Nivel
    );
end LEVEL_CTRL;

architecture Behavioral of LEVEL_CTRL is
    signal level_i : unsigned (LEVEL'range):= (others => '0'); -- Señal para trabajar con la subida y bajada de niveles, se inicializa a 0
begin
    process (CLK, RESET)
    variable max : unsigned (LEVEL'range):= (others => '1'); -- Variable creada con el valor maximo que el vector LEVEL podria tomar, para evitar el overflow
    begin
        if RESET = '1' then
            level_i <= (others => '0');
        elsif rising_edge(CLK) then
            if CE = '1' then
 -- No se sube ni se baja de nivel si los dos botones estan pulsados, ademas se impide que el contador de vueltas           
                if UP = '1' and DOWN = '0' and level_i /= max then
                    level_i <= level_i + 1;
                elsif DOWN = '1' and UP = '0' and level_i > 0 then
                    level_i <= level_i - 1;
                end if;    
            end if;
        end if;
    end process;
    LEVEL <= level_i;
end Behavioral;
