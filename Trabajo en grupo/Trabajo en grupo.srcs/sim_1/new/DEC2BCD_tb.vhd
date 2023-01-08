library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity DEC2BCD_tb is
end DEC2BCD_tb;

architecture Behavioral of DEC2BCD_tb is

    component DEC2BCD
  
        Port ( 
            DATA_IN : in  std_logic_vector(6 downto 0); -- Entrada de un numero de 0 a 99 (7 bits)
            CLK     : in  std_logic;
            BCD1    : out std_logic_vector(3 downto 0); -- Decenas
            BCD2    : out std_logic_vector(3 downto 0)  -- Unidades
        );
    end component;

    signal DATA_IN   : STD_LOGIC_VECTOR(6 downto 0);
    signal CLK       : STD_LOGIC; 
    signal BCD1      : STD_LOGIC_VECTOR (3 downto 0);
    signal BCD2       : STD_LOGIC_VECTOR (3 downto 0);
     
    constant TbPeriod : time := 10 ns;
    signal TbClock : std_logic := '0';

begin

    dutt : DEC2BCD
    port map (
        DATA_IN => DATA_IN,
        CLK => CLK,
        BCD1 => BCD1,
        BCD2 => BCD2        
    );

    -- Clock generation
    TbClock <= not TbClock after TbPeriod/2;   
        CLK <= TbClock;
   
    stimulii : process
    begin
        DATA_IN <= "0000000";
        wait for 1.25 * TbPeriod;
            DATA_IN <= "0001000";
        wait for 2.5 * TbPeriod;
            DATA_IN <= "0110010";
        wait for 4.5 * TbPeriod;
            DATA_IN <= "1011101";
        wait for 5 * TbPeriod;
            DATA_IN <= "1111111";
        wait for 2 * TbPeriod;           

    end process;

end Behavioral;

