----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/13/2023 03:13:44 PM
-- Design Name: 
-- Module Name: tenState - Behavioral
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

entity tenState is
    Port ( Clock_System : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Direction : in STD_LOGIC;
           Cathode_7SD, Anode_7SD : out STD_LOGIC_VECTOR (7 downto 0));
end tenState;

architecture Behavioral of tenState is

component tenStateCounter is
    port(Clock_System, Direction, Reset: in STD_LOGIC;
        Count: out STD_LOGIC_VECTOR (3 downto 0));
end component;

component FrequencyDivider is
    Port ( Clock_System : in STD_LOGIC;
           Clock_1Hz : out STD_LOGIC);
end component;

component displayDigits is
    Port ( Count : in STD_LOGIC_VECTOR (3 downto 0);
           cathodes_7SD, Anodes_7SD : out STD_LOGIC_VECTOR (7 downto 0));
end component;

signal slowClock : STD_LOGIC;
signal Count : STD_LOGIC_VECTOR (3 downto 0);

begin

ff0: tenStateCounter port map (CLock_System => slowClock, Reset => Reset, Direction => Direction, Count => Count);
ff1: FrequencyDivider port map(Clock_System => Clock_System, Clock_1Hz => slowClock);
ff2: displayDigits port map (Count => Count, cathodes_7SD => Cathode_7SD, Anodes_7SD => Anode_7SD);         



end Behavioral;
