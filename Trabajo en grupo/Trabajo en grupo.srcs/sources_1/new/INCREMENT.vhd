
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity INCREMENT is
    Generic (
       out_width :positive; 
       conversion: positive; -- conversion para conseguir que una pulsacion implique cinco en la salida
       maximo: positive 
    );
    Port ( 
        ENTRY_UP   : in  STD_LOGIC; -- '1' equals +1
        ENTRY_DOWN : in  STD_LOGIC; -- '1' equals -1
        CLK        : in  STD_LOGIC;
        RESET      : in  STD_LOGIC; -- Reset asincrono
        ENABLE     : in  STD_LOGIC;
        OUTP       : out UNSIGNED (out_width-1 downto 0)
    );
end INCREMENT;

architecture Behavioral of INCREMENT is

begin
    incrementador: process (RESET,CLK)
        variable increment: integer:=0;
        variable count: integer:=0;
    begin
        if Reset='0' then
            increment:=0;
            count:=0;
        elsif rising_edge(CLK) and ENABLE='1' then
            if ENTRY_UP='1' and ENTRY_DOWN='0' and increment<maximo then
                 count := count + 1;
                 increment := (count) * conversion; 
            end if ;
            if ENTRY_DOWN='1'and ENTRY_UP='0' and increment>0 then
                 count := count - 1;
                 increment := (count) * conversion;
            end if ;
        end if;
        OUTP<= TO_UNSIGNED (increment,OUTP'length) ;   
    end process;   

end Behavioral;
