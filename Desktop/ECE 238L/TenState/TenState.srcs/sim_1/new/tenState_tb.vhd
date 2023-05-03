----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/13/2023 03:54:53 PM
-- Design Name: 
-- Module Name: tenState_tb - Bench
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

entity tenState_tb is
--  Port ( );
end tenState_tb;

architecture Bench of tenState_tb is

component tenState is
    Port ( Clock_System : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Direction : in STD_LOGIC;
           Cathode_7SD, Anode_7SD : out STD_LOGIC_VECTOR (7 downto 0));
end component;

signal Clock_System_tb, Direction_tb, Reset_tb : STD_LOGIC;
signal Cathode_7SD_tb, Anode_7SD_tb : STD_LOGIC_VECTOR (7 downto 0);
constant Clock_100MHz_Period : time := 10ns;

begin

    uut: tenState port map(Clock_System => Clock_System_tb, Direction => Direction_tb,
        Reset => Reset_tb, Cathode_7SD => Cathode_7SD_tb, Anode_7SD => Anode_7SD_tb);
        
    Clk_process: process
    
begin
    Clock_System_tb <= '0'; wait for Clock_100MHz_Period/4;
    Clock_System_tb <= '1'; wait for Clock_100MHz_Period/4;
end process;

direction: process
    begin
        Direction_tb <='0'; wait for 300 ns;
        Direction_tb <= '1'; wait for 300 ns;
        
    end process;
    
stimulus: process
    begin
        Reset_tb <= '0'; wait for 100 ns;
        Reset_tb  <= '1'; wait for 40 ns;
        Reset_tb <= '0'; wait for 600 ns;
    end process;
                      


end Bench;
