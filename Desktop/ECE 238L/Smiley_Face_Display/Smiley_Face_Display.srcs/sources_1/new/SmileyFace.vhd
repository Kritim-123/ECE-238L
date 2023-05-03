----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/06/2023 03:19:47 PM
-- Design Name: 
-- Module Name: SmileyFace - Behavioral
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

entity SmileyFace is
    Port ( Clock_System : in STD_LOGIC;
           Cathode_7SD, Anode_7SD : out STD_LOGIC_VECTOR (7 downto 0));
end SmileyFace;

architecture Behavioral of SmileyFace is

component FrequencyDivider is
    Port ( Clock_System : in STD_LOGIC;
           Clock_1Hz : out STD_LOGIC);
end component;

signal presentState: STD_LOGIC_vector(5 downto 0) := "000000";
signal nextState: STD_LOGIC_vector(5 downto 0);
signal sClock_1Hz : STD_LOGIC;

begin

ff0: FrequencyDivider port map(Clock_1Hz => sClock_1Hz, Clock_System => Clock_System);

Anode_7SD <= "1111" & not presentState(3 downto 0);

process(sClock_1Hz)

begin

if rising_edge(sClock_1Hz) then
    presentState <= nextState;
    
    end if;
end process;    

nextState <= "100000" when presentState = "000000" else
              "000110" when presentState = "100000" else
              "010110" when presentState = "000110" else
              "001111" when presentState = "010110" else
              "011111" when presentState = "001111" else
              "101111" when presentState = "011111" else
              "111111" when presentState = "101111" else
              "000000";

Cathode_7SD <= "11111101";


end Behavioral;
