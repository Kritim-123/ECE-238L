----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/23/2023 04:33:59 PM
-- Design Name: 
-- Module Name: Multiplexer_bench - bench
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

entity Multiplexer_bench is
--  Port ( );
end Multiplexer_bench;

architecture bench of Multiplexer_bench is

component Multiplexer is
    Port ( G_out : in STD_LOGIC_VECTOR (7 downto 0);
           Selector : in STD_LOGIC_VECTOR (2 downto 0);
           Mux_out : out STD_LOGIC);
end component; 

signal Selector_tb : STD_LOGIC_VECTOR (2 downto 0);
signal G_out_tb : STD_LOGIC_VECTOR (7 downto 0);
signal Mux_out_tb : STD_LOGIC;

begin

uut: Multiplexer port map (Selector => Selector_tb,
                           G_out => G_out_tb,
                           Mux_out => Mux_out_tb);

stimulus: process

begin 
Selector_tb <= "000"; G_out_tb <= "00000001"; wait for 100 ns;
Selector_tb <= "001"; G_out_tb <= "00000010"; wait for 100 ns;
Selector_tb <= "010"; G_out_tb <= "00000100"; wait for 100 ns;
Selector_tb <= "011"; G_out_tb <= not "00001000"; wait for 100 ns;
Selector_tb <= "100"; G_out_tb <= "00010000"; wait for 100 ns;
Selector_tb <= "101"; G_out_tb <= "00100000"; wait for 100 ns;
Selector_tb <= "110"; G_out_tb <= "01000000"; wait for 100 ns;
Selector_tb <= "111"; G_out_tb <= "10000000"; wait for 100 ns;
wait;
end process;
                          
                           


end bench;
