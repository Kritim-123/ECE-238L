----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/06/2023 05:32:48 PM
-- Design Name: 
-- Module Name: oneHot_sim - Bench
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

entity oneHot_sim is
--  Port ( );
end oneHot_sim;

architecture Bench of oneHot_sim is

component oneHot is
    Port ( Clock_System : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Direction : in STD_LOGIC;
           Count : out STD_LOGIC_VECTOR (5 downto 0));
end component;

signal Clock_System_tb, Reset_tb, Direction_tb: STD_LOGIC;
signal count_tb: STD_LOGIC_vector (5 downto 0);
constant Clock_100MHz_Period : time := 5ns;

begin

uut: oneHot port map(Clock_System => Clock_System_tb,
                     Reset => Reset_tb,
                     Direction => Direction_tb,
                     Count => Count_tb);

clk_process: process

begin
    Clock_System_tb <= '0'; wait for Clock_100MHz_Period/2;
    Clock_System_tb <= '1'; wait for Clock_100MHz_Period/2;
end process;

stimulus: process
begin
    Direction_tb <= '0';
    Reset_tb <= '0'; wait for 100 ns;
    Reset_tb <= '1'; wait for 40 ns;
    Reset_tb <= '0'; wait for 600 ns;
    Direction_tb <= '1';
    wait;
    
    end process;                         

end Bench;
