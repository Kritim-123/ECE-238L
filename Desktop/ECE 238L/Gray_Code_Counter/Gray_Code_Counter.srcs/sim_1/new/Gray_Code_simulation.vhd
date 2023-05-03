----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/23/2023 06:01:58 PM
-- Design Name: 
-- Module Name: Gray_Code_simulation - bench
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

entity Gray_Code_simulation is
--  Port ( );
end Gray_Code_simulation;

architecture bench of Gray_Code_simulation is

component grayCode is
    Port ( Clock_System : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Count : out STD_LOGIC_VECTOR (1 downto 0));
end component;

signal Clock_System_tb, Reset_tb : STD_LOGIC;
signal Count_tb : STD_LOGIC_VECTOR (1 downto 0);
constant Clock_100Mhz_Period: time := 10ns;

begin

uut: grayCode port map (Clock_System => Clock_System_tb,
                        reset => reset_tb,
                        count => count_tb);

ckl_process: process

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
                       


end bench;
