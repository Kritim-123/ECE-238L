----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/23/2023 03:45:45 PM
-- Design Name: 
-- Module Name: Gates - Boolean_Function
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

entity Gates is
    Port ( A,B : in STD_LOGIC;
           G_out : out STD_LOGIC_VECTOR (7 downto 0));
end Gates;

architecture Boolean_Function of Gates is

begin

G_out(0) <= A;
G_out(1) <= not B;
G_out(2) <= A and B;
G_out(3) <= A or B;
G_out(4) <= A nand B;
G_out(5) <= A nor B;
G_out(6) <= A xor B;
G_out(7) <=  not (A xor B);


end Boolean_Function;
