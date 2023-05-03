----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/16/2023 04:16:34 PM
-- Design Name: 
-- Module Name: Lab2B - Boolean_Function
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

entity Lab2B is
    Port ( A,B,Cin : in STD_LOGIC;
           Sum,Count : out STD_LOGIC);
end Lab2B;

architecture Boolean_Function of Lab2B is

component Lab2A is
    Port ( A,B : in STD_LOGIC;
           Sum,Count : out STD_LOGIC);
end component;
 
 signal SUM_AB :  STD_LOGIC;
 signal Carry1 : STD_LOGIC;
 signal Carry2 : STD_LOGIC;
 
 
 begin
 
 ha1: Lab2A port map(A=>A, B=>B, Sum=>Sum_AB, Count=>Carry1 );
 ha2 : Lab2A port map (A=>Cin, B=>Sum_AB, Sum =>Sum, Count =>Carry2);
 
 Count <= Carry1 or carry2;
    
    
end Boolean_Function;
