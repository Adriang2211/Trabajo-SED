library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity DIG_SEL_TB1 is
end DIG_SEL_TB1;

architecture Behavioral of DIG_SEL_TB1 is
    component DIG_SEL is
        generic (
            DIGITS  : positive := 8;
            DIGITS_RANGE    : positive := 3
            );
        port (
            CLK      : in std_logic;
            RESET    : in std_logic;
            UINT_SEL : out std_logic_vector (DIGITS_RANGE-1 downto 0); -- Valor codificado en entero sin signo del digito seleccionado para la entrada de seleccion del multiplexor
            BIN_SEL  : out std_logic_vector (DIGITS-1 downto 0)
        );
    end component;
    
    signal clk  : std_logic;
    signal reset    : std_logic;
    signal uint_sel : std_logic_vector(2 downto 0);
    signal bin_sel  : std_logic_vector(7 downto 0);
    
    constant clkPeriod : time := 10 ns;
    
begin

    test_unit: DIG_SEL port map(
        CLK => clk,
        RESET => reset,
        UINT_SEL => uint_sel,
        BIN_SEL => bin_Sel
        );

    clk_gen: process
    begin
        clk <= '1';
        wait for 0.5*clkPeriod;
        clk <= '0';
        wait for 0.5*clkPeriod;
    end process;
    
    test: process
    begin
        reset <= '0';
        wait for clkPeriod*10;
        reset <= '1';
        wait for clkPeriod*3;
        reset <= '0';
        wait for clkPeriod*3;
        reset <= '1';
        wait for clkPeriod*20;
        
        report "End of simulation";
        std.env.finish;
        
    end process;    

end Behavioral;
