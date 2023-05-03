----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/09/2023 05:35:22 PM
-- Design Name: 
-- Module Name: DisplayDigits_bench - bench
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

entity DisplayDigits_bench is
--  Port ( );
end DisplayDigits_bench;

architecture bench of DisplayDigits_bench is

component displayDigits is
    Port ( Count : in STD_LOGIC_VECTOR (3 downto 0);
           cathodes_7SD, Anodes_7SD : out STD_LOGIC_VECTOR (7 downto 0));
end component;

signal Count_tb: STD_LOGIC_VECTOR (3 downto 0);
signal cathodes_7SD_tb, Anodes_7SD_tb : STD_LOGIC_VECTOR (7 downto 0);




begin

uut: displayDigits port map (Count => Count_tb,
                              cathodes_7SD =>cathodes_7SD_tb,
                               Anodes_7SD => Anodes_7SD_tb);

stimulus: process
begin 

count_tb <= "0000"; wait for 100 ns;
count_tb <= "0001"; wait for 100 ns;
count_tb <= "0101"; wait for 100 ns;
count_tb <= "1111"; wait for 100 ns;
wait;

end process;



end bench;
