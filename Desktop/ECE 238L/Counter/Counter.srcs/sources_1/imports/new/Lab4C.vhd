----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/02/2023 04:43:02 PM
-- Design Name: 
-- Module Name: Lab4C - Boolean_Function
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

entity Lab4C is
    Port ( D : in STD_LOGIC_VECTOR (7 downto 0);
           clk : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (7 downto 0));
end Lab4C;

architecture Boolean_Function of Lab4C is

begin

state: process(D, clk)
begin
    if clk ='1' then
    Q<=D;
    end if;
end process;    

end Boolean_Function;
