----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/09/2023 03:22:39 PM
-- Design Name: 
-- Module Name: Lab1A_tb - bench
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

entity Lab1A_tb is
--  Port ( );
end Lab1A_tb;

architecture bench of Lab1A_tb is

component Lab1A
    Port(A,B    :in STD_LOGIC;
    F_E, F_G, F_L : out STD_LOGIC);
end component;

signal A_tb, B_tb   : STD_LOGIC;
signal F_E_tb, F_G_tb, F_L_tb : STD_LOGIC;    

begin

uut : Lab1A port map(A => A_tb,
                     B => B_tb,
                     F_E => F_E_tb,
                     F_G => F_G_tb,
                     F_L => F_L_tb);

stimulus: process
begin

A_tb <='0'; B_tb <= '0'; wait for 100 ns;
A_tb <='0'; B_tb <= '1'; wait for 100 ns; 
A_tb <='1'; B_tb <= '1'; wait for 100 ns; 
A_tb <='1'; B_tb <= '0'; wait for 100 ns;
wait;
end process;                     
                     
                     

end bench;
