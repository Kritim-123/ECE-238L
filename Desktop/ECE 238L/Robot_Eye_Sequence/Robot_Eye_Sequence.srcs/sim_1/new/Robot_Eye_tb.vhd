----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/30/2023 04:40:37 PM
-- Design Name: 
-- Module Name: Robot_Eye_tb - Bench
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

entity Robot_Eye_tb is
--  Port ( );
end Robot_Eye_tb;

architecture Bench of Robot_Eye_tb is

component Robot_Eye is
    Port ( Clock_System : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Cathode_7SD, Anode_7SD : out STD_LOGIC_VECTOR (7 downto 0));
end component;

signal Clock_System_tb, reset_tb : STD_LOGIC;
signal Cathode_7SD_tb, Anode_7SD_tb: STD_LOGIC_VECTOR (7 downto 0);
constant Clock_100Mhz_Period: time := 10ns;

begin
uut: Robot_Eye port map (Clock_System => Clock_System_tb,
                         reset => reset_tb,
                         Cathode_7SD => Cathode_7SD_tb,
                         Anode_7SD => Anode_7Sd_tb);

clk_process : process
begin
    Clock_System_tb <= '0'; wait for Clock_100Mhz_Period/2;
    Clock_System_tb <= '1'; wait for Clock_100Mhz_Period/2;
end process;

stimulus: process
begin
    Reset_tb <= '0'; wait for 100 ns;
    Reset_tb <= '1'; wait for 40 ns;
    Reset_tb <= '0'; wait for 600 ns;
end process;    


end Bench;
