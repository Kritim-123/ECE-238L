----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/09/2023 04:09:17 PM
-- Design Name: 
-- Module Name: Lab1B - Comparator
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

entity Lab1B is
    Port ( A,B : in STD_LOGIC;
           Cathod_7SD : out STD_LOGIC_VECTOR (7 downto 0);
           Anode_7SD : out STD_LOGIC_VECTOR (7 downto 0));
end Lab1B;

architecture Comparator of Lab1B is

signal F_E, F_L, F_G : STD_LOGIC;
begin

F_E <= (not(A) and not (B)) or (A and B);
F_L <= (A) and not (B);
F_G <= not (A) and (B);

process (F_E, F_L, F_G)
begin

if F_E = '1' then
    Cathod_7SD <= "01100001";
elsif F_L = '1' then
    Cathod_7SD <= "11100011";
elsif F_G = '1' then
    Cathod_7SD <="01000001";
else
    Cathod_7SD <= "11111101";
end if;    

end process;

Anode_7SD <= "11111110";       
    


end Comparator;
