----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.10.2022 16:57:22
-- Design Name: 
-- Module Name: SYNCHRNZR - Behavioral
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity SYNCHRNZR is
    Port ( 
    CLK : in STD_LOGIC;
           ASYNC_IN : in STD_LOGIC;
           Reset : in STD_LOGIC;
           SYNC_OUT : out STD_LOGIC);
end SYNCHRNZR;

architecture Behavioral of SYNCHRNZR is
signal sreg: std_logic_vector (1 downto 0);
begin
    process (Reset,CLK)
    begin
    if reset='0' then
    sreg<=(others=>'0');
        elsif rising_edge(CLK) then
            SYNC_OUT <= sreg(1);
            sreg<= sreg(0) & async_in;
            end if;
end process;
end Behavioral;
