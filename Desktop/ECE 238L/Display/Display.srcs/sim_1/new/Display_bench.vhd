----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/23/2023 05:26:56 PM
-- Design Name: 
-- Module Name: Display_bench - bench
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

entity Display_bench is
--  Port ( );
end Display_bench;

architecture bench of Display_bench is

component Display is
    Port ( Mux_out : in STD_LOGIC;
           Cathode_7SD, Anode_7SD : out STD_LOGIC_VECTOR (7 downto 0));
end component;

signal Mux_out_tb : STD_LOGIC;
signal cathode_7SD_tb, Anode_7SD_tb : STD_LOGIC_VECTOR(7 downto 0);



begin

uut : Display port map (Mux_out => Mux_out_tb,
                        Cathode_7SD => cathode_7SD_tb,
                        Anode_7SD => Anode_7SD_tb);

stimuus: process

begin
Mux_out_tb <= '0'; wait for 100 ns;
Mux_out_tb <= '1'; wait for 100 ns;
wait;
end process;                        
                        


end bench;
