library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity TIME_CONV_TB1 is
--  Port ( );
end TIME_CONV_TB1;

architecture Behavioral of TIME_CONV_TB1 is
    component TIME_CONV is
        Generic(
            input_width : positive := 13
            );
        Port(
            DATA_IN     : in std_logic_vector(input_width-1 downto 0);
            CLK         : in std_logic;
            MIN         : out std_logic_vector(6 downto 0);
            SEC         : out std_logic_vector(6 downto 0)
            );
    end component;
    
    signal data_in  : std_logic_vector(12 downto 0);
    signal clk      : std_logic;
    signal minutos  : std_logic_vector(6 downto 0);
    signal segundos : std_logic_vector(6 downto 0);
    
    constant clkPeriod : time := 10 ns;
    
begin

    test_unit: TIME_CONV Port map(
        DATA_IN => data_in,
        CLK => clk,
        MIN => minutos,
        SEC => segundos
    );
    
    clk_gen: process
    begin
        clk <= '1';
        wait for clkPeriod*0.5;
        clk <= '0';
        wait for clkPeriod*0.5;
    end process;

    main_test: process
    begin
        data_in <= (others=>'0');
        wait for clkPeriod*2;
        assert minutos = "0000000"
            report "[FAILED] Expected 0 minutes."
            severity failure;
        assert segundos = "0000000"
            report "[FAILED] Expected 0 seconds."
            severity failure;
        
        wait for clkPeriod*2;
        
        data_in <= "0000000000001";
        wait for clkPeriod;
        assert segundos = "0000001"
            report "[FAILED] Expected 1 second"
            severity failure;
        assert minutos = "0000000"
            report "[FAILED] Expected 0 minutes"
            severity failure;
            
        wait for clkPeriod*2;
        
        data_in <= "0000000111011"; --59 segundos
        wait for clkPeriod;
        assert minutos = "0000000"
            report "[FAILED] Expected 0 minutes."
            severity failure;
        assert segundos = "0111011"
            report "[FAILED] Expected 59 seconds."
            severity failure;
         
        wait for clkPeriod*2;
        
        data_in <= "0000000111100"; -- 60 segundos
        wait for clkPeriod;
        assert minutos = "0000001"
            report "[FAILED] Expected 1 minute"
            severity failure;
        assert segundos = "0000000"
            report "[FAILED] Expected 0 seconds"
            severity failure;
            
         wait for clkPeriod*2;
         
         data_in <= "0000000111101"; -- 60 segundos
         wait for clkPeriod;
         assert minutos = "0000001"
             report "[FAILED] Expected 1 minute"
             severity failure;
         assert segundos = "0000001"
             report "[FAILED] Expected 1 seconds"
             severity failure;
    
        wait for clkPeriod*2;
        
        data_in <= "1010000101001"; -- 86 minutos y 1 segundo
        wait for clkPeriod;
        assert minutos = "1010110"
            report "[FAILED] Expected 86 minutes"
            severity failure;
        assert segundos = "0000001"
            report "[FAILED] Expected 1 second"
            severity failure;
        
            
        report "/////////TEST PASSED//////// End simulation";
        std.env.finish;
    end process;
    
end Behavioral;
