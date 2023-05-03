----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/23/2023 04:13:17 PM
-- Design Name: 
-- Module Name: Multiplexer - Boolean_Function
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

entity Multiplexer is
    Port ( G_out : in STD_LOGIC_VECTOR (7 downto 0);
           Selector : in STD_LOGIC_VECTOR (2 downto 0);
           Mux_out : out STD_LOGIC);
end Multiplexer;

architecture Boolean_Function of Multiplexer is






begin

Mux_out <= G_out(0) when Selector = "000" else
           G_out(1) when Selector = "001" else
           G_out(2) when Selector = "010" else
           G_out(3) when Selector = "011" else
           G_out(4) when Selector = "100" else
           G_out(5) when Selector = "101" else
           G_out(6) when Selector = "110" else
           G_out(7);



end Boolean_Function;
