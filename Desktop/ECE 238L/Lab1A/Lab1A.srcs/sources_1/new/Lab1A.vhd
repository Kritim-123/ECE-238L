----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/09/2023 03:18:05 PM
-- Design Name: 
-- Module Name: Lab1A - Boolean_Function
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

entity Lab1A is
    Port ( A,B : in STD_LOGIC;
           F_E : out STD_LOGIC;
           F_G : out STD_LOGIC;
           F_L : out STD_LOGIC);
end Lab1A;

architecture Boolean_Function of Lab1A is

begin
F_E <= (not A and not B) or (A and B);
F_G <= not(A) and B;
F_L <= A and not (B);


end Boolean_Function;
