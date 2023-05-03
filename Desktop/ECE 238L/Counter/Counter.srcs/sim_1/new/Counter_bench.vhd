----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/09/2023 04:50:23 PM
-- Design Name: 
-- Module Name: Counter_bench - bench
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

entity Counter_bench is
--  Port ( );
end Counter_bench;

architecture bench of Counter_bench is

component Counter is
    Port ( Clock_System : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Count : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal Clock_System_tb, Reset_tb : STD_LOGIC;
signal Count_tb: STD_LOGIC_VECTOR (3 downto 0);
constant Clock_100MHz_Period: time := 15 ns;
           

begin

uut: Counter port map (Clock_System => Clock_System_tb,
                       Reset => Reset_tb,
                       Count => Count_tb);

clk_process: process

begin

Clock_System_tb <= '0'; wait for Clock_100MHz_Period/2;
Clock_System_tb <= '1'; wait for Clock_100MHz_Period/2;
end process;

stimulus: process
begin
    Reset_tb <='0'; wait for 300 ns;
    Reset_tb <= '1'; wait for 40 ns;
    Reset_tb <= '0'; wait for 600 ns;
end process;                           

end bench;
