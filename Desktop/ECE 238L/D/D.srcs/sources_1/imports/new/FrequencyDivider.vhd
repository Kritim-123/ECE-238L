----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/09/2023 01:41:08 PM
-- Design Name: 
-- Module Name: FrequencyDivider - Boolean_Function
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity FrequencyDivider is
    Port ( Clock_System : in STD_LOGIC;
           Clock_1Hz : out STD_LOGIC);
end FrequencyDivider;

architecture Boolean_Function of FrequencyDivider is

signal count: INTEGER := 1;
signal sClock_1Hz : STD_LOGIC := '0';

begin

process (Clock_System)
begin
    if Clock_System' event and Clock_System = '1' then
    count <= count +1;
    
        if count = 50000000 then
            Clock_1Hz <= not sClock_1Hz;
            sClock_1Hz <= not sClock_1Hz;
            count<=1;
        end if;
    end if;
end process;    
        
end Boolean_Function;
