----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/16/2023 03:29:05 PM
-- Design Name: 
-- Module Name: Lab2A_bench - bench
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

entity Lab2A_bench is
--  Port ( );
end Lab2A_bench;

architecture bench of Lab2A_bench is

component Lab2A
Port(A,B    : in STD_LOGIC;
    Sum,Count   : out STD_LOGIC);
end component;

signal A_tb,B_tb : STD_LOGIC;
signal Sum_tb  : STD_LOGIC;
signal Count_tb : STD_LOGIC;    

begin

uut: Lab2A port map (A => A_tb,
                     B => B_tb,
                     Sum => Sum_tb,
                     Count => Count_tb);
                     
stimulus: process

begin
A_tb <= '0'; B_tb<= '0'; wait for 100 ns;
A_tb <= '0'; B_tb<= '1'; wait for 100 ns;
A_tb <= '1'; B_tb<= '0'; wait for 100 ns;
A_tb <= '1'; B_tb<= '1'; wait for 100 ns;
wait;
end process;
                     


end bench;
