----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/09/2023 05:08:59 PM
-- Design Name: 
-- Module Name: displayDigits - Boolean_Function
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

entity displayDigits is
    Port ( Count : in STD_LOGIC_VECTOR (3 downto 0);
           cathodes_7SD, Anodes_7SD : out STD_LOGIC_VECTOR (7 downto 0));
end displayDigits;

architecture Boolean_Function of displayDigits is

begin


Anodes_7SD <= "11111110";

    
       Cathodes_7SD  <= "00000011" when Count = "0000" else
             "10011111" when Count = "0001" else
             "00100101" when Count = "0010" else
             "00001101" when Count = "0011" else
             "10011001" when Count = "0100" else
             "01001001" when Count = "0101" else
             "11000001" when Count = "0110" else
             "00011101" when Count = "0111" else
             "00000000" when Count = "1000" else
             "00001001" when Count = "1001" else
             "01100001";


end Boolean_Function;
