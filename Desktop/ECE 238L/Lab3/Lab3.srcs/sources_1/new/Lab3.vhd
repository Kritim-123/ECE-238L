----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/23/2023 05:50:43 PM
-- Design Name: 
-- Module Name: Lab3 - Boolean_Function
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

entity Lab3 is
    Port ( A,B : in STD_LOGIC;
           Cathodes_7SD, Anodes_7SD : out STD_LOGIC_VECTOR (7 downto 0);
           Selector : in STD_LOGIC_VECTOR (2 downto 0);
           Mux_out : out STD_LOGIC);
end Lab3;

architecture Boolean_Function of Lab3 is

component Gates is
    Port ( A,B : in STD_LOGIC;
           G_out : out STD_LOGIC_VECTOR (7 downto 0));
end component;

component  Multiplexer is
    Port ( G_out : in STD_LOGIC_VECTOR (7 downto 0);
           Selector : in STD_LOGIC_VECTOR (2 downto 0);
           Mux_out : out STD_LOGIC);
end component;

component Display is
    Port ( Mux_out : in STD_LOGIC;
           Cathode_7SD, Anode_7SD : out STD_LOGIC_VECTOR (7 downto 0));
end component;

signal G_out : STD_LOGIC_VECTOR (7 downto 0);
signal Mux : STD_LOGIC;



begin

fa0: Gates port map (A => A, B=> B, G_out => G_out);
fa1 : Multiplexer port map(G_out => G_out, Selector => Selector, Mux_out => Mux);
fa2: Display port map(Mux_out => Mux, Cathode_7SD => Cathodes_7SD, Anode_7SD => Anodes_7SD);
Mux_out <= Mux;




end Boolean_Function;
