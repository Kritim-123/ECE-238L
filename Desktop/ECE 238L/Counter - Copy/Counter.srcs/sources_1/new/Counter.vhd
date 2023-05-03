----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/09/2023 02:39:14 PM
-- Design Name: 
-- Module Name: Counter - Boolean_Function
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

entity Counter is
    Port ( Clock_System : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Count : out STD_LOGIC_VECTOR (3 downto 0));
end Counter;

      

architecture Boolean_Function of Counter is

component  FrequencyDivider is
    Port ( Clock_System : in STD_LOGIC;
           Clock_1Hz : out STD_LOGIC);
end component;

component Lab_4B is
    Port ( D, clk : in STD_LOGIC;
           Q : out STD_LOGIC;
           Reset : in STD_LOGIC);
 end component;
 
 signal temp: STD_LOGIC_VECTOR (3 downto 0) := "0000";
 signal notTemp: STD_LOGIC_VECTOR (3 downto 0);
 signal Clk_1Hz: STD_LOGIC:='0';
 
 begin
    notTemp <= not(Temp);
    
    fd : FrequencyDivider port map(Clock_System => Clock_System, Clock_1Hz => Clk_1Hz);
    ff0 : Lab_4B port map (clk => Clk_1Hz, D=> notTemp(0), Q=> temp(0), Reset => Reset);
    ff1 : Lab_4B port map (clk => temp(0), D=> notTemp(1), Q=> temp(1), Reset => Reset);
    ff2 : Lab_4B port map (clk => temp(1), D=> notTemp(2), Q=> temp(2), Reset => Reset);
    ff3 : Lab_4B port map (clk => temp(2), D=> notTemp(3), Q=> temp(3), Reset => Reset);
    
    count <= temp;
end Boolean_Function;
