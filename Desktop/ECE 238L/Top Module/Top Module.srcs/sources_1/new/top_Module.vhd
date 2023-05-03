----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/23/2023 03:53:38 PM
-- Design Name: 
-- Module Name: top_Module - Behavioral
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

entity top_Module is
    Port ( Clock_System : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Cathode_7SD : out STD_LOGIC_VECTOR(7 downto 0);
           Anode_7SD : out STD_LOGIC_VECTOR (7 downto 0));
end top_Module;

architecture Behavioral of top_Module is

component Counter is
    Port ( Clock_System : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Count : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component displayDigits is
    Port ( Count : in STD_LOGIC_VECTOR (3 downto 0);
           cathodes_7SD, Anodes_7SD : out STD_LOGIC_VECTOR (7 downto 0));
end component;

signal COUNT: STD_LOGIC_VECTOR (3 downto 0);

begin

ff0 : counter port map (CLock_System => Clock_System, Reset => Reset, Count => COUNT);
ff1 : displayDigits port map(Count => COUNT, cathodes_7SD => Cathode_7SD, Anodes_7SD => Anode_7SD);




end Behavioral;
