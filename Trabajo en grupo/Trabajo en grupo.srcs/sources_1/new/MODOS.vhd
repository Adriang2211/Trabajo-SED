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
        CLK        : in  STD_LOGIC; -- Se�al de reloj
        RESET      : in  STD_LOGIC; -- Reset asincrono
        ENABLE     : in  STD_LOGIC; -- Chip enable
        SPEED      : out UNSIGNED (speed_width-1 downto 0); -- Al control del motor de velocidad (LED)
        INCL       : out UNSIGNED (incl_width-1 downto 0); -- Al control del motor de inclinacion (LED)
        SPEED_DATA : out UNSIGNED (speed_width-1 downto 0); -- Dato para mostrar en pantalla (display)
        INCL_DATA  : out UNSIGNED (incl_width-1 downto 0) -- Dato para mostrar en pantalla (display)
    );
end MODOS;

architecture Structural of MODOS is

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
           OUTP : out unsigned (out_width-1 downto 0));
   end component;
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
        OUTP => SPEED
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
        OUTP => INCL
    );
--    component LEVEL_CTRL is
--        Generic(
--            lv_width : positive := 4
--        );
    
--        Port ( 
--            UP         : in  STD_LOGIC; 
--            DOWN       : in  STD_LOGIC; 
--            CLK        : in  STD_LOGIC; 
--            RESET      : in  STD_LOGIC; 
--            CE         : in  STD_LOGIC; 
--            LEVEL      : out UNSIGNED (lv_width-1 downto 0)
--        );
--    end component LEVEL_CTRL;
    

--begin
--    spd : if SPEED_UP = '1' or SPEED_DOWN = '1' generate
--    inst_S : LEVEL_CTRL
--    generic map (
--        lv_width => speed_width
--    )
--    port map (
--        UP => SPEED_UP,
--        DOWN => SPEED_DOWN,
--        CLK => CLK,
--        RESET => RESET,
--        CE => ENABLE,
--        LEVEL => SPEED
--    );
--    end generate spd;
    
--    inc : if INCL_UP = '1' or INCL_DOWN = '1' generate
--    inst_I : LEVEL_CTRL
--    generic map (
--        lv_width => incl_width
--    )
--    port map (
--        UP => INCL_UP,
--        DOWN => INCL_DOWN,
--        CLK => CLK,
--        RESET => RESET,
--        CE => ENABLE,
--        LEVEL => INCL
--    );
--    end generate inc;
    
    
end Structural;
