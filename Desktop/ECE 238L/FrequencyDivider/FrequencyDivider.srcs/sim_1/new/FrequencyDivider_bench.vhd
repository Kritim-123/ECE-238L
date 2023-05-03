----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/09/2023 01:57:22 PM
-- Design Name: 
-- Module Name: FrequencyDivider_bench - bench
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

entity FrequencyDivider_bench is
--  Port ( );
end FrequencyDivider_bench;

architecture bench of FrequencyDivider_bench is

component  FrequencyDivider is
    Port ( Clock_System : in STD_LOGIC;
           Clock_1Hz : out STD_LOGIC);
end component;

signal Clock_System_tb, Clock_Slow_tb : STD_LOGIC;
constant Clock_100MHz_Period : time := 10ns;           

begin

    uut: FrequencyDivider port map (Clock_System => Clock_System_tb,
                                     Clock_1Hz => Clock_Slow_tb);
                                     
    Clk_process: process
    begin
        Clock_System_tb <= '0'; wait for Clock_100MHz_Period/2;
        Clock_System_tb <= '1'; wait for Clock_100MHz_Period/2;
    end process;
    
    stimulus: process
    begin
        wait;
   end process;                                           
                                     


end bench;
