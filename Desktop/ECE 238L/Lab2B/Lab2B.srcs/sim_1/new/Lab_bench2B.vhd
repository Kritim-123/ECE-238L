----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/16/2023 05:29:13 PM
-- Design Name: 
-- Module Name: Lab_bench2B - bench
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

entity Lab_bench2B is
--  Port ( );
end Lab_bench2B;

architecture bench of Lab_bench2B is

component Lab2B
    Port ( A,B,Cin : in STD_LOGIC;
           Sum,Count : out STD_LOGIC);
           
end component;

signal A_tb, B_tb, Cin_tb : STD_LOGIC;
signal Sum_tb, Count_tb : STD_LOGIC;
           

begin

uut: Lab2B port map (A => A_tb,
                     B => B_tb,
                     Cin => Cin_tb,
                     Sum => Sum_tb,
                     Count => Count_tb);
stimulus: process
begin
A_tb <= '0'; B_tb <= '0'; Cin_tb <= '0'; wait for 100 ns;
A_tb <= '1'; B_tb <= '0'; Cin_tb <= '0'; wait for 100 ns;
A_tb <= '0'; B_tb <= '1'; Cin_tb <= '0'; wait for 100 ns;
A_tb <= '0'; B_tb <= '0'; Cin_tb <= '1'; wait for 100 ns;
A_tb <= '1'; B_tb <= '1'; Cin_tb <= '0'; wait for 100 ns;
A_tb <= '1'; B_tb <= '0'; Cin_tb <= '1'; wait for 100 ns;
A_tb <= '0'; B_tb <= '1'; Cin_tb <= '1'; wait for 100 ns;
A_tb <= '1'; B_tb <= '1'; Cin_tb <= '1'; wait for 100 ns;
wait;
end process;                   



end bench;
