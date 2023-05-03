----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/23/2023 05:23:49 PM
-- Design Name: 
-- Module Name: grayCode - Behavioral
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

entity grayCode is
    Port ( Clock_System : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Count : out STD_LOGIC_VECTOR (1 downto 0));
end grayCode;

architecture Behavioral of grayCode is

component FrequencyDivider is
    Port ( Clock_System : in STD_LOGIC;
           Clock_1Hz : out STD_LOGIC);
end component;

signal presentState: STD_LOGIC_VECTOR (1 downto 0) := "00";
signal nextState: STD_LOGIC_VECTOR (1 downto 0);
signal SlowClock : STD_LOGIC;
begin
ff0: FrequencyDivider port map (Clock_System => Clock_System, Clock_1Hz => SlowClock);

process (SlowClock, Reset)
begin

if reset ='1' then
    presentState <= "00";
elsif rising_edge (SlowClock) then
    presentState <= nextstate;
    end if;
end process;

Count <= presentState;

nextState <= "01" when presentState = "00" else
              "11" when presentState = "01" else
              "10" when presentState = "11" else
              "00";
end Behavioral;
