----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/02/2023 04:12:01 PM
-- Design Name: 
-- Module Name: Lab_4B - Boolean_Function
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

entity Lab_4B is
    Port ( D, clk : in STD_LOGIC;
           Q : out STD_LOGIC);
end Lab_4B;

architecture Boolean_Function of Lab_4B is


begin

state: process(clk)
begin
    
    if clk 'event and clk = '1' then
    Q <= D;
    
    end if;
    end process;

end Boolean_Function;
