----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/06/2023 03:45:13 PM
-- Design Name: 
-- Module Name: Smiley_Face_tb - bench
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

entity Smiley_Face_tb is
--  Port ( );
end Smiley_Face_tb;

architecture bench of Smiley_Face_tb is

component SmileyFace is
    Port ( Clock_System : in STD_LOGIC;
           Cathode_7SD, Anode_7SD : out STD_LOGIC_VECTOR (7 downto 0));
end component;

signal Clock_System_tb : STD_LOGIC;
signal Cathode_7SD_tb, Anode_7SD_tb : STD_LOGIC_vector(7 downto 0);
constant Clock_100MHz_Period: time := 10ns;

begin

    uut: SmileyFace port map(Clock_System => Clock_System_tb,
                             Cathode_7SD => Cathode_7SD_tb,
                             Anode_7SD => Anode_7SD_tb);
    clk_process: process
    begin
        Clock_System_tb <= '0'; wait for Clock_100MHz_period/2;
        Clock_System_tb <= '1'; wait for Clock_100MHz_Period/2;
    end process;
    
    stimulus: process
    
    begin
        wait for 100 ns;
    end process;
                                    


end bench;
