----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.12.2022 21:17:52
-- Design Name: 
-- Module Name: Increment_tb - Behavioral
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

entity Increment_tb is
--  Port ( );
end Increment_tb;

architecture Behavioral of Increment_tb is
  CONSTANT OUT_WIDTH: POSITIVE:= 13;
  CONSTANT CONVERSION: POSITIVE:=  4;
   constant CLKPeriod: time:=100 ns;
  SIGNAL      ENTRY_UP :  STD_LOGIC; --'1' equals +1
   SIGNAL        ENTRY_DOWN: STD_LOGIC; --'1' equals -1
   signal         CLK:  STD_LOGIC;
   signal         RESET: std_logic ;
    SIGNAL       OUTP :  unsigned (out_width-1 downto 0);

COMPONENT INCREMENT IS 
generic(
  out_width  :positive := 7; 
   conversion: positive:=4 -- conversion para conseguir que una pulsacion implique cuatro en la salida
);
    Port ( ENTRY_UP : in STD_LOGIC; --'1' equals +1
           ENTRY_DOWN: in STD_LOGIC; --'1' equals -1
            CLK: in STD_LOGIC;
            RESET: in std_logic ;
           OUTP : out unsigned (out_width-1 downto 0));
END component ;

begin


INCREMENT_TB : INCREMENT
    GENERIC MAP(
              out_width =>OUT_WIDTH,
              conversion=>CONVERSION
              
    )
    PORT MAP(
    ENTRY_UP =>ENTRY_UP,
           ENTRY_DOWN =>ENTRY_DOWN,
            CLK=> CLK,
            RESET =>RESET,
           OUTP =>outp
           );
    
    clkgen: process
    begin
    wait for 0.5*CLKPeriod;
    CLK<='0';
    wait for 0.5*CLKPeriod;
    CLK<='1';
    
    end process;
    
         input: process
    begin
    wait for 0.25*CLKPeriod;
    ENTRY_UP<='0';
    wait for 0.25*CLKPeriod;
    ENTRY_UP<='1';
     if(Entry_down='1') then
           ENTRY_UP<='0';
      
        end if;
    end process;  
    Entry_down<='0' after 4*CLKPeriod, '1' after 5 * CLKPeriod, '0' after 6*CLKPeriod;
   Reset<='1' after 1.25*CLKPeriod, '0' after 1.5 * CLKPeriod;
end Behavioral;
