library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity DISP_CRTL is

    generic(
        speed_width : positive := 4;
        incl_width  : positive := 4;
        time_width  : positive := 13;
        digits      : positive := 8
        );
        
    Port ( DISP_SEL     : out STD_LOGIC_VECTOR (digits-1 downto 0);
           DISP_DATA    : out STD_LOGIC_VECTOR (6 downto 0);
           SPEED        : in STD_LOGIC_VECTOR (speed_width-1 downto 0);
           INCL         : in STD_LOGIC_VECTOR (incl_width-1 downto 0);
           TIME         : in STD_LOGIC_VECTOR (time_width-1 downto 0);
           CLK          : in STD_LOGIC);
           
end DISP_CRTL;

architecture Behavioral of DISP_CRTL is

begin


end Behavioral;
