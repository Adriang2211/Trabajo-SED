library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity MODOS_tb is
end MODOS_tb;

architecture Behavioral of MODOS_tb is

    component MODOS
  
        Port ( 
        SPEED_UP   : in  STD_LOGIC; -- Boton para subir de nivel de velocidad
        SPEED_DOWN : in  STD_LOGIC; -- Boton para bajar de nivel de velocidad
        INCL_UP    : in  STD_LOGIC; -- Boton para subir de nivel de inclinacion
        INCL_DOWN  : in  STD_LOGIC; -- Boton para bajar de nivel de inclinacion
        CLK        : in  STD_LOGIC; -- Señal de reloj
        RESET      : in  STD_LOGIC; -- Reset asincrono
        ENABLE     : in  STD_LOGIC; -- Chip enable
        SPEED      : out UNSIGNED (3 downto 0); -- Al control del motor de velocidad (LED)
        INCL       : out UNSIGNED (3 downto 0); -- Al control del motor de inclinacion (LED)
        SPEED_DATA : out UNSIGNED (3 downto 0); -- Dato para mostrar en pantalla (display)
        INCL_DATA  : out UNSIGNED (3 downto 0)
        );
    end component;

    signal SPEED_UP   : STD_LOGIC;
    signal SPEED_DOWN : STD_LOGIC; 
    signal INCL_UP    : STD_LOGIC;
    signal INCL_DOWN  : STD_LOGIC; 
    signal CLK        : STD_LOGIC; 
    signal RESET      : STD_LOGIC; 
    signal ENABLE     : STD_LOGIC; 
    signal SPEED      : UNSIGNED (3 downto 0);
    signal INCL       : UNSIGNED (3 downto 0);
    signal SPEED_DATA : UNSIGNED (3 downto 0);
    signal INCL_DATA  : UNSIGNED (3 downto 0);
    
    constant TbPeriod : time := 10 ns;
    signal TbClock : std_logic := '0';
 
begin

    dutt : MODOS
    port map (
        SPEED_UP => SPEED_UP,
        SPEED_DOWN => SPEED_DOWN,
        INCL_UP => INCL_UP,
        INCL_DOWN => INCL_DOWN,
        CLK => CLK,
        RESET => RESET,
        ENABLE => ENABLE,
        SPEED => SPEED,
        INCL => INCL,
        SPEED_DATA => SPEED_DATA,
        INCL_DATA => INCL_DATA        
    );

    -- Clock generation
    TbClock <= not TbClock after TbPeriod/2;   
        CLK <= TbClock;
   
    stimulii : process
    begin
        SPEED_UP <= '0';
        SPEED_DOWN <= '0';
        INCL_UP <= '0';
        INCL_DOWN <= '0';
        ENABLE <= '0';
        RESET <= '1';
        wait for 1.25 * TbPeriod;
            SPEED_DOWN <= '1';
        wait for 1.5 * TbPeriod;
            SPEED_DOWN <= '0';
            INCL_UP <= '1';
            RESET <= '0';
        wait for 1.5 * TbPeriod;
            SPEED_UP <= '1';
            ENABLE <= '1';
        wait for 1.5 * TbPeriod;
            INCL_DOWN <= '1';
            INCL_UP <= '0';
        wait for 2.5 * TbPeriod;
            INCL_DOWN <= '0';
            INCL_UP <= '1';
        wait for 4.5 * TbPeriod;
            SPEED_DOWN <= '1';
            SPEED_UP <= '0';
            INCL_UP <= '0';
        wait for 5 * TbPeriod;
            ENABLE<= '0';
        wait for 1.5 * TbPeriod;
            ENABLE<= '1';
        wait for 4.5 * TbPeriod;
            SPEED_DOWN <= '0';
            INCL_DOWN <= '1';
        wait for 7.5 * TbPeriod;

    end process;

end Behavioral;
