----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/27/2023 03:18:30 PM
-- Design Name: 
-- Module Name: HexDisp - Behavioral
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
library UNISIM;
use UNISIM.VComponents.all;

entity HexDisp is
    Port ( clk : in STD_LOGIC;
           ins: in STD_LOGIC_VECTOR (3 downto 0);
           outs: out STD_LOGIC_VECTOR (7 downto 0));
end HexDisp;

architecture Behavioral of HexDisp is

component ROM 
    port ( a: in STD_LOGIC_VECTOR (3 downto 0);
    clk : in STD_LOGIC;
    qspo: out STD_LOGIC_VECTOR ( 7 downto 0));
end component;    
    

begin

    SevSegvalues : ROM 
        port map ( a => ins,
                  clk => Clk,
                  qspo => outs);
end Behavioral;
