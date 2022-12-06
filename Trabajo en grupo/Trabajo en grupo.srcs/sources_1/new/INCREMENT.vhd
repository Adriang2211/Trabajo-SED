----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.12.2022 18:09:14
-- Design Name: 
-- Module Name: INCREMENT - Behavioral
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
use IEEE.NUMERIC_STD.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity INCREMENT is
generic(
   out_width :positive := 7; 
   conversion: positive:=4 -- conversion para conseguir que una pulsacion implique cuatro en la salida
);
    Port ( ENTRY_UP : in STD_LOGIC; --'1' equals +1
           ENTRY_DOWN: in STD_LOGIC; --'1' equals -1
            CLK: in STD_LOGIC;
            RESET: in std_logic ;
           OUTPUT : out unsigned (out_width-1 downto 0));
end INCREMENT;

architecture Behavioral of INCREMENT is
signal increment: unsigned(OUTPUT'range);
begin
    increment<=(others =>'0');
        incrementador:process (RESET,CLK)
            begin
                if Reset='1' then
                        increment<=(others =>'0');
                elsif rising_edge(CLK) then
                    if ENTRY_UP='1' then
                    increment<=(increment+1)*conversion;
                    end if ;
                    if ENTRY_DOWN='1' then
                        increment<=(increment-1)*conversion;
                    end if ;
                
                end if;
            OUTPUT<= increment;   
            end process;   

end Behavioral;
