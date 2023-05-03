----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/13/2023 03:17:46 PM
-- Design Name: 
-- Module Name: tenStateCounter - Behavioral
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

entity tenStateCounter is
    Port ( Clock_System : in STD_LOGIC;
           Direction : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Count : out STD_LOGIC_VECTOR (3 downto 0));
end tenStateCounter;

architecture Behavioral of tenStateCounter is

type state_type is(s0, s1, s2, s3, s4, s5, s6, s7, s8, s9);
signal presentState, nextState : state_type;

begin

syncProc: process(Clock_System, Reset)

begin
    if Reset ='1' then
        presentState <= s0;
    
    elsif rising_edge (Clock_System) then
        presentState <= nextState;
    end if;
end process;

combinatoralProcess: process (presentState, Direction)

begin
    case presentState is
        when s0 => Count <= "0000";
            if Direction ='1' then nextState <= s1;
        else nextState <= s9;
        end if;
        
        when s1 => Count <= "0001";
            nextState <= s2;
            
        when s2 => Count <= "0010";
            nextState <= s3;
            
        when s3 => Count <= "0011";
            nextState <= s4;
        
        when s4 => Count <= "0100";
            nextState <= s0;
            
        when s5 => Count <= "0101";
            nextState <= s9;
            
        when s6 => Count <= "0110";
            nextState <= s5;
            
        when s7 => Count <= "0111";
            nextState <= s6;
            
        when s8 => Count <= "1000";
            nextState <= s7;
            
        when s9 => Count <= "1001";
            if Direction = '0' then nextState <= s8;
          else nextState <= s0;
          end if;
          end case;
          end process;                           

end Behavioral;
