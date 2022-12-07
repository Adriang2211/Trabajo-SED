library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity MUX is
    Generic(
        width   : positive := 3
    );
    Port (  DATA_IN1    : in STD_LOGIC_VECTOR (width-1 downto 0);
            DATA_IN2    : in std_logic_vector (width-1 downto 0);
            DATA_IN3    : in STD_LOGIC_VECTOR (width-1 downto 0);
            DATA_IN4    : in std_logic_vector (width-1 downto 0);
            DATA_IN5    : in STD_LOGIC_VECTOR (width-1 downto 0);
            DATA_IN6    : in std_logic_vector (width-1 downto 0);
            DATA_IN7    : in STD_LOGIC_VECTOR (width-1 downto 0);
            DATA_IN8    : in std_logic_vector (width-1 downto 0);
            OUTPUT      : out STD_LOGIC_vector(width-1 downto 0);
            SEL         : in std_logic_vector (2 downto 0)
           );
end MUX;

architecture Dataflow of MUX is

begin
    with SEL select
        OUTPUT  <=  DATA_IN1 when "000",
                    DATA_IN2 when "001",
                    DATA_IN3 when "010",
                    DATA_IN4 when "011",
                    DATA_IN5 when "100",
                    DATA_IN6 when "101",
                    DATA_IN7 when "110",
                    DATA_IN8 when "111",
                    (others => '0') when others;

end Dataflow;