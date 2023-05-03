----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/09/2023 04:24:19 PM
-- Design Name: 
-- Module Name: Lab1B_tb - bench
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

entity Lab1B_tb is
--  Port ( );
end Lab1B_tb;

architecture bench of Lab1B_tb is

component Lab1B is
Port ( A,B : in STD_LOGIC;
      Cathod_7SD : out STD_LOGIC_VECTOR (7 downto 0);
      Anode_7SD : out STD_LOGIC_VECTOR (7 downto 0));
end component;

signal A_tb, B_tb :     STD_LOGIC;
signal Cathod_7SD_tb, Anode_7SD_tb :    STD_LOGIC_VECTOR(7 downto 0);      

begin

uut: Lab1B port map (A=>A_tb,
                     B=> B_tb,
                     Cathod_7SD => Cathod_7SD_tb,
                     Anode_7Sd => Anode_7SD_tb);

stimulus: process
begin
A_tb <= '0'; B_tb<= '0'; wait for 100 ns;
A_tb <= '0'; B_tb<= '1'; wait for 100 ns;
A_tb <= '1'; B_tb<= '1'; wait for 100 ns;
A_tb <= '1'; B_tb<= '0'; wait for 100 ns;
wait;
end process;
                     
                     


end bench;
