library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity MODOS is
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
end MODOS;

architecture Behavioral of MODOS is

component INCREMENT is 
    Generic (
        out_width :positive ; 
        conversion: positive;
        maximo: positive
    );
    Port ( 
        ENTRY_UP   : in  STD_LOGIC; --'1' equals +1
        ENTRY_DOWN : in  STD_LOGIC; --'1' equals -1
        CLK        : in  STD_LOGIC;
        RESET      : in  STD_LOGIC;
        ENABLE     : in  STD_LOGIC;
        OUTP       : out UNSIGNED (out_width-1 downto 0)
    );
end component;

    signal speed_level : unsigned (speed_width-1 downto 0);
    signal incl_level : unsigned (incl_width-1 downto 0); 

begin 
   
   velocidad : INCREMENT 
    generic map (
        out_width => speed_width,
        conversion => conversion_speed,
        maximo => max
    )
    port map (
        ENTRY_UP => SPEED_UP,
        ENTRY_DOWN => SPEED_DOWN,
        CLK => CLK,
        RESET => RESET,
        ENABLE => ENABLE,
        OUTP => speed_level
    );
        
   inclinacion : INCREMENT 
    generic map (
        out_width => incl_width,
        conversion => conversion_incl,
        maximo => max
    )
    port map (
        ENTRY_UP => INCL_UP,
        ENTRY_DOWN => INCL_DOWN,
        CLK => CLK,
        RESET => RESET,
        ENABLE => ENABLE,
        OUTP => incl_level
    );
    
    process (CLK)
    begin
    if rising_edge (CLK) then
        if ENABLE = '1' then
            SPEED_DATA <= STD_LOGIC_VECTOR(speed_level);
            SPEED <= STD_LOGIC_VECTOR(speed_level / conversion_speed);
        else 
            SPEED_DATA <= (others => '0');
            SPEED <= (others => '0');
        end if;
        
        if ENABLE = '1' then
            INCL_DATA <= STD_LOGIC_VECTOR(incl_level);
            INCL <=STD_LOGIC_VECTOR(incl_level / conversion_incl);
        else 
            INCL_DATA <= (others => '0');
            INCL <= (others => '0');
        end if;
    end if;
    end process;
     

    
end Behavioral;
