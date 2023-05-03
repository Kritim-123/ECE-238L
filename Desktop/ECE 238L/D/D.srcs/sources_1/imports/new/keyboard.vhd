----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/27/2023 04:14:51 PM
-- Design Name: 
-- Module Name: keyboard - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity keyboard is
    Port ( usb_clk : in STD_LOGIC;
           usb_data : in STD_LOGIC;
           firstDigit : out STD_LOGIC_VECTOR (3 downto 0);
           secondDigit : out STD_LOGIC_VECTOR (3 downto 0));
           
end keyboard;

architecture Behavioral of keyboard is

    signal bitCount : integer range 0 to 100 := 0;
    signal scancodeReady: STD_LOGIC := '0';
    signal scancode: STD_LOGIC_VECTOR (7 downto 0);
    signal breakReceived: STD_LOGIC := '0';

begin

keyboard_scan_ready_enable: process (usb_clk) is

begin
    if falling_edge (usb_clk) then
        if bitCount = 0 AND usb_data = '0' then
            scancodeReady <= '0';
            bitCount <= bitCount + 1;
         elsif bitCount > 0 and bitCount < 9 then
            scancode <= usb_data & scancode (7 downto 1);
            bitCount <= bitCount + 1;
         elsif bitCount = 9 then
            bitCount <= bitCount + 1;
         elsif bitCount = 10 then 
            scancodeReady <= '1';
            bitcount <= 0;
         end if;
    end if;
    
end process keyboard_scan_ready_enable;

scan_keyboard: process (scancodeReady, scancode) is

begin
    if rising_edge (scancodeReady ) then
        if breakreceived = '1' then
            breakReceived <= '0';
        elsif breakReceived = '0' then
            if scancode = "11110000" then
                breakReceived <= '1';
            end if;
        end if;
        
        firstDigit <= scancode ( 3 downto 0);
        secondDigit <= scancode (7 downto 4);
        end if;
        
        
end process scan_keyboard;                        
               
               


end Behavioral;
