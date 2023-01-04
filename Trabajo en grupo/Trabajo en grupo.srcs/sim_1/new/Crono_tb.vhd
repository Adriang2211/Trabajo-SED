----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.12.2022 21:17:52
-- Design Name: 
-- Module Name: Crono_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Crono_tb is

end Crono_tb;

architecture Behavioral of Crono_tb is
 CONSTANT OUT_WIDTH: POSITIVE:= 13;
 constant IN_TIME: positive:=13;
  CONSTANT CONVERSION: POSITIVE:=  5;
  constant maximo: positive:= 100;
   constant CLKPeriod: time:=10 ns;
   constant newclk: time:=0.01 ms;
  SIGNAL      ENTRY_UP :  STD_LOGIC; --'1' equals +1
   SIGNAL        ENTRY_DOWN: STD_LOGIC; --'1' equals -1
   signal         CLK:  STD_LOGIC;
   signal         RESET: std_logic ;
    SIGNAL       OUTP :  STD_LOGIC_VECTOR (out_width-1 downto 0);
     SIGNAL       LOAD_OUT :  STD_LOGIC_VECTOR (IN_TIME-1 downto 0);
    signal ENABLE: STD_LOGIC;
    signal LOAD_ENABLE:STD_LOGIC;
    signal CE:STD_LOGIC;
    signal ENDING: STD_LOGIC;
     signal UP_NDOWN: STD_LOGIC;

component CRONO is
    Generic (
        in_time_width : positive := 13; -- Ancho para minutos
        out_time_width : positive := 13;
        divide: positive:= 100000000; -- Ancho para segundos
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
end component;

begin

crono_tb: CRONO
    generic map(
    in_time_width => IN_TIME,
        out_time_width =>OUT_WIDTH,
        DIVIDE=>1000,--CADA 10MS
       conversion=>conversion,
        max_time=>maximo
    )
    port map(
        UP_INC=>ENTRY_UP,
        DOWN_INC=>ENTRY_DOWN,
        UP_NDOWN =>UP_NDOWN,
        CE=> CE,-- Count enable
        CLK=>CLK,-- Señal de reloj
        RESET=>RESET, -- Reset asincrono
        ENABLE=> enable,-- Chip enable en la configuracion 
        LOAD_ENABLE=> LOAD_ENABLE, -- WHEN '1' LOAD 
        TIMES =>OUTP,-- Salda del cronometro en segundos
        LOAD_OUT=>LOAD_OUT,
        ENDING=>ENDING
          );

clk_generate: process
 begin
    wait for 0.5*CLKPeriod;
    CLK<='0';
    wait for 0.5*CLKPeriod;
    CLK<='1';
    
end process;
  ENTRY_up<='1' after 0.25 ms, '0' after 0.40 ms;
   ENTRY_DOWN<='1' after 0.30 ms, '0' after 0.32 ms;
process
begin
    	wait for 500*newclk;
        	std.env.finish;
end process;

LOAD_ENABLE<='0' after 0.05 ms, '1' after 0.1 ms, '0' after 0.33 ms;
ENABLE<='0' after 0.1 ms,'1' after 0.2 ms;
CE<= '0' after 0.1 ms, '1' after 0.32005 ms;
reset<= '0' after 0.001ms, '1' after 0.3 ms;
UP_NDOWN<='1' after 0.1 ms, '0' after 0.8 ms;
end Behavioral;
