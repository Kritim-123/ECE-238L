----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/30/2023 03:59:17 PM
-- Design Name: 
-- Module Name: Robot_Eye - Behavioral
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

entity Robot_Eye is
    Port ( Clock_System : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Cathode_7SD, Anode_7SD : out STD_LOGIC_VECTOR (7 downto 0));
end Robot_Eye;

architecture Behavioral of Robot_Eye is
component FrequencyDivider is
    Port ( Clock_System : in STD_LOGIC;
           Clock_1Hz : out STD_LOGIC);
end component;

signal presentState: STD_LOGIC_vector(4 downto 0) := "00000";
signal nextState: STD_LOGIC_vector(4 downto 0);
signal sClock_1Hz : STD_LOGIC;

begin
process(sClock_1Hz,reset)
begin 
if reset = '1' then
    presentState <= "00001";
elsif rising_edge(sClock_1Hz) then
    presentState <= nextState;
end if;
end process;

ff0: FrequencyDivider port map(Clock_1Hz => sClock_1Hz, Clock_System => Clock_System);   

Anode_7SD <= "1111" & not presentState(3 downto 0);
nextState <= "00010" when presentState = "00001" else
              "00100" when presentState = "00010" else
              "01000" when presentState = "00100" else
              "10100" when presentState = "01000" else
              "10010" when presentState = "10100" else
              "00001";
Cathode_7SD <= "11111101";
end Behavioral;
