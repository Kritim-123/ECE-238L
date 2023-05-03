----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/22/2023 03:43:48 PM
-- Design Name: 
-- Module Name: lab2C_bench - bench
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

entity lab2C_bench is
--  Port ( );
end lab2C_bench;

architecture bench of lab2C_bench is

component  Lab_2C is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           Cin : in STD_LOGIC;
           Sum : out STD_LOGIC_VECTOR (3 downto 0);
           Cout : out STD_LOGIC);
end component;

signal A_tb, B_tb, Sum_tb : STD_LOGIC_VECTOR(3 downto 0);
signal Cin_tb, Cout_tb : STD_LOGIC;

begin

uut: lab_2C port map (A => A_tb,
                       B=> B_tb,
                       Cin => Cin_tb, 
                       Sum=>Sum_tb, 
                       Cout => Cout_tb);

stimulus: process

begin
A_tb <= "0000"; B_tb <= "0001"; Cin_tb <= '0'; wait for 100 ns;
A_tb <= "1110"; B_tb <= "0001"; Cin_tb <= '0'; wait for 100 ns;
A_tb <= "1111"; B_tb <= "1110"; Cin_tb <= '0'; wait for 100 ns;
A_tb <= "0000"; B_tb <= "0000"; Cin_tb <= '0'; wait for 100 ns;
A_tb <= "1010"; B_tb <= "0101"; Cin_tb <= '0'; wait for 100 ns;
wait;
end process;
                       



end bench;
