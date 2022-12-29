library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity CRONO is
    Generic (
        in_time_width : positive := 13; -- Ancho para segundos
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
end CRONO;

architecture Behavioral of CRONO is
    signal Load: UNSIGNED (in_time_width-1 downto 0);
    signal load_i : unsigned(Times'range);--
    signal count_i: unsigned(Times'range):=(others=>'0');
    signal clk_1_sec: std_logic ;
    signal ending_i: std_logic;
  component FREQ_DIV is
     Generic(
        DIVIDE  : positive := 10
    );
    Port ( 
        CLK_IN : in STD_LOGIC;
         RESET: in std_logic ;
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
begin
   
   freq_div_1_sec: FREQ_DIV -- generador de un flanco de subida cada 100MHz/DIVIDE
        generic map(
            DIVIDE =>divide
            )
        port map(
            CLK_IN=>CLK,
            reset=>reset,
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
            ENABLE=>LOAD_ENABLE,--CAMBIO CAMBIO CAMBIO ENABLE POR LOAD ENABLE
            OUTP=>LOAD
        );
   up_down_counter: process(CLK,clk_1_sec, RESET,LOAD_ENABLE)
     variable ceros: unsigned(LOAD'length-1 downto 0):= (others=>'0');
     variable final: std_logic :='0';-- se vcrea una variable para jugar con la logica que implica
     variable maxi: unsigned (Times'range) := to_unsigned (max_time, Times'length);
         begin 
                ENDING<='0';
                if RESET='0' THEN
                    load_i<=(others=>'0');
                     count_i<=(others=>'0');
                    final:='0';
             
                ELSIF LOAD_ENABLE ='1'  THEN 
                    
                    load_i<=LOAD; 
                  
                ELSIF rising_edge(clk_1_sec) THEN 
                IF ENABLE='1' THEN 
                 if  CE='1'  THEN 
                   if UP_NDOWN='1'  THEN 
                         -- CONTADO HACIA ARRIBA DEL RELOJ HASTA máximo
                        count_i<=(count_i+1);
                            if count_i > maxi-1 then --debido a que count_i es una señal, la comprobación de final debe 
                                                    -- hacerse para un valor anterior ya que así para el siguiente periodo ya valdrá 0
                                                    -- si esta fuese una variable, la cndición de final sería la normal
                                
                                count_i<=maxi;
                               
                            end if;
                    ELSIF UP_NDOWN='0' and final='0' THEN  --CONTADO HACIA ABAJO
                       load_i<=load_i-1;
                       count_i<=load_i;
                            if load_i<=ceros then--debido a que load_i es una señal, la comprobación de final debe 
                                                   -- hacerse para un valor anterior ya que así para el siguiente periodo ya valdrá 0
                                final:='1';
                            end if;
                      
                      END IF; 
                   end if; 
                   END IF;
                END IF;
                ending<=final;
           
             
    end process;

             LOAD_OUT<=STD_LOGIC_VECTOR(LOAD);   
             TIMES<=STD_LOGIC_VECTOR(count_i);
end Behavioral;
