library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity CRONO is
    Generic (
        in_time_width : positive := 7; -- Ancho para minutos
        out_time_width : positive := 13 -- Ancho para segundos
    );
    Port ( 
        LOAD     : in  UNSIGNED (in_time_width-1 downto 0); -- Tiempo en minutos
        UP_NDOWN : in  STD_LOGIC; -- Habilitar cuenta hacia arriba o hacia abajo (salida negada)
        CE       : in  STD_LOGIC; -- Count enable
        CLK      : in  STD_LOGIC; -- Se�al de reloj
        RESET    : in  STD_LOGIC; -- Reset asincrono
        ENABLE   : in  STD_LOGIC; -- Chip enable
        LOAD_ENABLE:  IN STD_LOGIC; -- WHEN '1' LOAD 
        TIMES     : out UNSIGNED (out_time_width-1 downto 0); -- Salda del cronometro en segundos
        ENDING: out std_logic
    );
end CRONO;

architecture Behavioral of CRONO is
    signal load_i : unsigned(LOAD'RANGE);
    signal count_i: unsigned(Times'range);
    
    --introducir el divisor de frecuencia para clk, utilizar esa salida donde clocklla .
begin
    process(CLK, RESET)
         begin 
                if RESET='1' THEN
                    load_i<=(others=>'0');
                     count_i<=(others=>'0');
               
               ELSIF LOAD_ENABLE ='1'  THEN 
                    load_i<=LOAD;
                    count_i<=(others=>'0');
               
                ELSIF rising_edge(clk) AND ENABLE='1' THEN 
                    if UP_NDOWN='1' THEN 
                         -- CONTADO HACIA ARRIBA DEL RELOJ HASTA LA CARGA
                        count_i<=(count_i+1) mod load_i;
                    
                    ELSE --CONTADO HACIA ABAJO
                       -- load_i<=
                      END IF;  
                END IF;
                
             TIMES<=count_i;
    end process


end Behavioral;
