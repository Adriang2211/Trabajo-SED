
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
   conversion: positive:=4;
   maximo: positive:=16 -- conversion para conseguir que una pulsacion implique cuatro en la salida
);
    Port ( ENTRY_UP : in STD_LOGIC; --'1' equals +1
           ENTRY_DOWN: in STD_LOGIC; --'1' equals -1
            CLK: in STD_LOGIC;
            RESET: in std_logic ;
           OUTP : out unsigned (out_width-1 downto 0));
end INCREMENT;

architecture Behavioral of INCREMENT is

begin

   
        incrementador:process (RESET,CLK)
            variable increment: integer:=0;
             variable count: integer:=0;
            begin
                if Reset='1' then
                        increment:=0;
                        count:=0;
                elsif rising_edge(CLK) then
                    if ENTRY_UP='1' and ENTRY_DOWN='0' AND increment<maximo then
                    count:=count+1;
                    increment:=(count)*conversion;
                        
                    end if ;
                    if ENTRY_DOWN='1'AND ENTRY_UP='0' and increment>0 then
                        count:=count-1;
                        increment:=(count)*conversion;
                    end if ;
                
                end if;
            OUTP<= TO_UNSIGNED (increment,OUTP'length) ;   
            end process;   

end Behavioral;
