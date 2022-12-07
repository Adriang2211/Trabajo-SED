library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity CRONO is
    Generic (
        in_time_width : positive := 7; -- Ancho para minutos
        out_time_width : positive := 13; -- Ancho para segundos
       conversion: positive:=30;
        max_time: positive:=5940
    );
    Port ( 
        UP_INC:in  STD_LOGIC;
        DOWN_INC:in  STD_LOGIC;
        UP_NDOWN : in  STD_LOGIC; -- Habilitar cuenta hacia arriba o hacia abajo (salida negada)
        CE       : in  STD_LOGIC; -- Count enable
        CLK      : in  STD_LOGIC; -- Se�al de reloj
        RESET    : in  STD_LOGIC; -- Reset asincrono
        ENABLE   : in  STD_LOGIC; -- Chip enable en la configuracion 
        LOAD_ENABLE:  IN STD_LOGIC; -- WHEN '1' LOAD 
        TIMES     : out UNSIGNED (out_time_width-1 downto 0); -- Salda del cronometro en segundos
        LOAD_OUT: out unsigned (in_time_width-1 downto 0);
        ENDING: out std_logic
    );
end CRONO;

architecture Behavioral of CRONO is
    signal Load: UNSIGNED (in_time_width-1 downto 0);
    signal load_i : unsigned(Times'range);--
    signal count_i: unsigned(Times'range);
    signal clk_1_sec: std_logic ;
  component FREQ_DIV is
     Generic(
        DIVIDE  : positive := 10
    );
    Port ( 
        CLK_IN : in STD_LOGIC;
        CLK_OUT : out STD_LOGIC
        );
  end component;
  
   component INCREMENT is 
    generic(
   out_width :positive ; 
   conversion: positive;
   maximo: positive -- conversion para conseguir que una pulsacion implique cuatro en la salida
);
    Port ( ENTRY_UP : in STD_LOGIC; --'1' equals +1
           ENTRY_DOWN: in STD_LOGIC; --'1' equals -1
            CLK: in STD_LOGIC;
            RESET: in std_logic ;
            ENABLE: in std_logic;
           OUTP : out unsigned (out_width-1 downto 0));
   end component;
    --introducir el divisor de frecuencia para clk, utilizar esa salida donde clocklla .
begin
   
   freq_div_1_sec: FREQ_DIV -- generador de un flanco de subida cada 100MHz/DIVIDE
        generic map(
            DIVIDE =>1000000
            )
        port map(
            CLK_IN=>CLK,
            CLK_OUT=>clk_1_sec
             );
           
  increment_load: INCREMENT
        generic map(
            out_width => in_time_width, 
            conversion=>conversion,
            maximo=>max_time
        )
        port map(
            ENTRY_UP=>UP_INC,
            ENTRY_DOWN=>DOWN_INC,
            CLK=>CLK,  
            RESET=>RESET,
            ENABLE=>ENABLE,
            OUTP=>LOAD
        );
   up_down_counter: process(CLK, RESET,LOAD_ENABLE)
     variable ceros: unsigned(LOAD'length-1 downto 0):= (others=>'0');
         begin 
         
                if RESET='1' THEN
                    load_i<=(others=>'0');
                     count_i<=(others=>'0');
               
               ELSIF rising_edge(clk_1_sec) and LOAD_ENABLE ='1' and ENABLE='1'  THEN 
                    load_i(load_i'length-1 downto LOAD'length)<=(others=>'0');
                    load_i(LOAD'length-1 downto 0)<=LOAD; -- es necesaria esta asignacion debido a que load_i y coun_i deben de tener
                                                            -- la misma dimension por requisitos del programa
                    count_i<=(others=>'0');
               
                ELSIF rising_edge(clk_1_sec) and ENABLE='1' THEN 
                 if  CE='1'  THEN 
                    if UP_NDOWN='1' THEN 
                         -- CONTADO HACIA ARRIBA DEL RELOJ HASTA LA CARGA
                        count_i<=(count_i+1) mod load_i;
                    
                    ELSE --CONTADO HACIA ABAJO
                       load_i<=load_i-1;
                            if load_i=ceros then
                                ending<='1';
                            end if;
                       count_i<=load_i-1;
                      END IF; 
                   end if; 
                END IF;
             LOAD_OUT<=Load;   
             TIMES<=count_i;
             
    end process;


end Behavioral;
