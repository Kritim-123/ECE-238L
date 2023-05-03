----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/23/2023 03:18:11 PM
-- Design Name: 
-- Module Name: Lab5_bench - Behavioral
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

entity Lab5_bench is
--  Port ( );
end Lab5_bench;

architecture Bench of Lab5_bench is

component Lab5 is
    Port ( Clock_System : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Cathoes_7SD, Anodes_7SD : out STD_LOGIC_VECTOR (7 downto 0));
end component;

signal Clock_System_tb, Reset_tb : STD_LOGIC;
signal Cathoes_7SD_tb, Anodes_7SD_tb : STD_LOGIC_VECTOR (7 downto 0);
constant Clock_100Mhz_Period: time := 15ns;


begin

    uut: Lab5 port map(Clock_System => Clock_System_tb, Reset => Reset_tb, Cathoes_7SD => cathoes_7SD_tb, Anodes_7SD => Anodes_7SD_tb);
    
Clk_process: process
begin

    Clock_System_tb <= '0'; wait for Clock_100Mhz_Period/2;
    Clock_System_tb <= '1'; wait for Clock_100Mhz_Period/2;
    
end process;    
    
    
stimulus: process

begin
    Reset_tb <= '0'; wait for 300 ns;
    Reset_tb <= '1'; wait for 40 ns;
    Reset_tb <= '0'; wait for 600 ns;
    end process;    
    


end Bench;
