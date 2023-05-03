----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/23/2023 06:15:24 PM
-- Design Name: 
-- Module Name: Lab_bench - bench
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

entity Lab_bench is
--  Port ( );
end Lab_bench;

architecture bench of Lab_bench is

component  Lab3 is
    Port ( A,B : in STD_LOGIC;
           Cathodes_7SD, Anodes_7SD : out STD_LOGIC_VECTOR (7 downto 0);
           Selector : in STD_LOGIC_VECTOR (2 downto 0);
           Mux_out : out STD_LOGIC);
end component;

signal Selector_tb : STD_LOGIC_VECTOR (2 downto 0);
signal A_tb,B_tb :  STD_LOGIC;
signal Cathodes_7SD_tb, Anodes_7SD_tb : STD_LOGIC_VECTOR (7 downto 0);
signal Mux_out_tb : STD_LOGIC;


begin

uut: Lab3 port map (Selector => Selector_tb,
                    A => A_tb,
                    B => B_tb,
                    Cathodes_7SD => Cathodes_7SD_tb,
                    Mux_out => Mux_out_tb,
                    Anodes_7SD => Anodes_7SD_tb);
                    
stimulus: process
begin
Selector_tb <= "000"; A_tb <= '0'; B_tb <= '0'; wait for 100 ns;
Selector_tb <= "001"; A_tb <= '0'; B_tb <= '0'; wait for 100 ns;
Selector_tb <= "111"; A_tb <= '1'; B_tb <= '0'; wait for 100 ns;
Selector_tb <= "111"; A_tb <= '0'; B_tb <= '1'; wait for 100 ns;
Selector_tb <= "000"; A_tb <= '1'; B_tb <= '1'; wait for 100 ns;
Selector_tb <= "010"; A_tb <= '0'; B_tb <= '0'; wait for 100 ns;
Selector_tb <= "010"; A_tb <= '1'; B_tb <= '0'; wait for 100 ns;
wait;
end process;                                 
                    

end bench;
