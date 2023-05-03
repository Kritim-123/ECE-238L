----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/22/2023 03:21:46 PM
-- Design Name: 
-- Module Name: Lab_2C - Structural
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

entity Lab_2C is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           Cin : in STD_LOGIC;
           Sum : out STD_LOGIC_VECTOR (3 downto 0);
           Cout : out STD_LOGIC);
end Lab_2C;

architecture Structural of Lab_2C is

component  Lab2B 
    Port ( A,B,Cin : in STD_LOGIC;
           Sum,Count : out STD_LOGIC);
end component;

signal Carry0, Carry1, Carry2 :STD_LOGIC;

    

begin

fa0 : Lab2B port map( A => A(0), B => B(0), Cin => Cin, Sum => Sum(0), Count => Carry0);
fa1 : Lab2B port map( A => A(1), B => B(1), Cin => Carry0, Sum => Sum(1), Count => Carry1);
fa2 : Lab2B port map( A => A(2), B => B(2), Cin => Carry1, Sum => Sum(2), Count => Carry2);
fa3 : Lab2B port map( A => A(3), B => B(3), Cin => Carry2, Sum => Sum(3), Count => Cout);



end Structural;



