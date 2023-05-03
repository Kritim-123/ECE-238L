----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/06/2023 04:46:04 PM
-- Design Name: 
-- Module Name: oneHot - Behavioral
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

entity oneHot is
    Port ( Clock_System : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Direction : in STD_LOGIC;
           Count : out STD_LOGIC_VECTOR (5 downto 0));
end oneHot;

architecture Behavioral of oneHot is

component FrequencyDivider is
    Port ( Clock_System : in STD_LOGIC;
           Clock_1Hz : out STD_LOGIC);
end component;
type state_type is (s1, s2, s4, s8, s16, s32);
signal presentState, nextState : state_type;
signal slowClock : STD_LOGIC;



begin

ff0: FrequencyDivider port map (Clock_System => Clock_System , Clock_1Hz => slowClock);

syncProc: process (slowClock, reset)
begin
if reset ='1' then
    presentState <= s1;
elsif rising_edge(slowClock) then
    presentState <= nextState;
end if;
end process;

combinatoralProcess: process (presentState, Direction)

begin
    case presentState is
    when s1 => count <= "000001";
        if Direction = '1' then nextState <= s2;
        else nextState <= s32;
        end if;
    when s2 => count <= "000010";
        if Direction = '1' then nextState <= s4;
        else nextState <= s1;
        end if;
    when s4 => count <= "000100";
        if Direction = '1' then nextState <= s8;
        else nextState <= s2;
        end if;
    when s8 => count <= "001000";
        if Direction = '1' then nextState <= s16;
        else nextState <= s4;
        end if;
    when s16 => count <= "010000";
        if Direction = '1' then nextState <= s32;
        else nextState <= s8;
        end if;
    when s32 => count <= "100000";
        if Direction = '1' then nextState <= s1;
        else nextState <= s16;
        end if;
        end case;
end process;                                        

end Behavioral;
