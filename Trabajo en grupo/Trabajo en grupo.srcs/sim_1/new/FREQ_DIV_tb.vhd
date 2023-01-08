library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity FREQ_DIV_tb is
end FREQ_DIV_tb;

architecture Behavioral of FREQ_DIV_tb is
	component FREQ_DIV is
    	Generic(
        	DIVIDE  : positive := 10
    	);
    	Port ( 
	        CLK_IN : in STD_LOGIC;
	        RESET  : in STD_LOGIC;
	        CLK_OUT : out STD_LOGIC
	    );
    end component;
    
    signal clk_test_in	: std_logic;
    signal reset_test	: std_logic;
    signal clk_test_out : std_logic;

	constant ClkPeriod : time := 10 ns;
    
begin
	divisor: FREQ_DIV generic map(
    	DIVIDE => 10
        )
    port map(
    	CLK_IN => clk_test_in,
    	RESET => reset_test,
        CLK_OUT => clk_test_out
        ); 
	

    clkgen: process
    begin
        clk_test_in <= '0';
        wait for 0.5*ClkPeriod;
        clk_test_in <= '1';
        wait for 0.5*ClkPeriod;
    end process;
   
    test: process
    begin
        reset_test <= '1';
        wait for 14*ClkPeriod;
        reset_test <= '0';
        wait for 4*ClkPeriod;
        reset_test <= '1';
        
    	wait for 500 ns;
        report "FIN";
        std.env.finish;
    end process;

end Behavioral;


