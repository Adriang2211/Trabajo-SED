library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity LEVEL_CTRL_tb is

end LEVEL_CTRL_tb;

architecture Behavioral of LEVEL_CTRL_tb is

    component LEVEL_CTRL
  
        Port ( 
            UP         : in  STD_LOGIC; -- Subir de nivel
            DOWN       : in  STD_LOGIC; -- Bajar de nivel
            CLK        : in  STD_LOGIC; -- Señal de reloj
            RESET      : in  STD_LOGIC; -- Reset asincrono
            CE         : in  STD_LOGIC; -- Clock enable
            LEVEL      : out UNSIGNED (3 downto 0) -- Nivel
        );
    end component;

    signal UP         : STD_LOGIC;
    signal DOWN       : STD_LOGIC; 
    signal CLK        : STD_LOGIC; 
    signal RESET      : STD_LOGIC; 
    signal CE         : STD_LOGIC; 
    signal LEVEL      : UNSIGNED (3 downto 0);

    constant TbPeriod : time := 10 ns;
    signal TbClock : std_logic := '0';
 
begin

    dut : LEVEL_CTRL
    port map (UP => UP,
              DOWN => DOWN,
              CLK => CLK,
              RESET => RESET,
              CE => CE,
              LEVEL => LEVEL);

    -- Clock generation
    TbClock <= not TbClock after TbPeriod/2;
             
       CLK <= TbClock;
   
    stimuli : process
    begin
        UP <= '0';
        DOWN <= '0';
        CE <= '0';
        RESET <= '1';
        wait for 1.25 * TbPeriod;
            DOWN <= '1';
        wait for 1.5 * TbPeriod;
            DOWN <= '0';
            UP <= '1';
            RESET <= '0';
        wait for 1.5 * TbPeriod;
            DOWN <= '1';
            UP <= '0';
            CE<= '1';
        wait for 2.5 * TbPeriod;
            DOWN <= '0';
            UP <= '1';
        wait for 4.5 * TbPeriod;
            DOWN <= '1';
            UP <= '0';
        wait for 1.5 * TbPeriod;
            CE<= '0';
        wait for 1.5 * TbPeriod;
            CE<= '1';
        wait for 7.5 * TbPeriod;
            DOWN <= '0';
            UP <= '1';
        wait for 7.5 * TbPeriod;
            UP <= '0';    
        wait for 7.5 * TbPeriod;
            UP <= '1';            
        wait for 10.5 * TbPeriod;
            RESET <= '1';
        wait for 3 * TbPeriod;
            RESET <= '0';
        wait for 3 * TbPeriod;


    end process;

end Behavioral;
