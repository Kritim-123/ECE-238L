----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/27/2023 04:42:21 PM
-- Design Name: 
-- Module Name: TopModule - Behavioral
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

entity TopModule is
    Port ( USB_CLK : in STD_LOGIC;
           USB_DATA : in STD_LOGIC;
           System_Clock : in STD_LOGIC;
           sigDigitDisp : out STD_LOGIC_VECTOR (7 downto 0);
           Anode_7SD : out STD_LOGIC_VECTOR (7 downto 0));
end TopModule;

architecture Behavioral of TopModule is

component  FrequencyDivider is
    Port ( Clock_System : in STD_LOGIC;
           Clock_1Hz : out STD_LOGIC);
end component;

component HexDisp is
    Port ( clk : in STD_LOGIC;
           ins: in STD_LOGIC_VECTOR (3 downto 0);
           outs: out STD_LOGIC_VECTOR (7 downto 0));
end component;

component keyboard is
    Port ( usb_clk : in STD_LOGIC;
           usb_data : in STD_LOGIC;
           firstDigit : out STD_LOGIC_VECTOR (3 downto 0);
           secondDigit : out STD_LOGIC_VECTOR (3 downto 0));
           
end component;


signal sigSevSeAnToggle: STD_LOGIC := '0';
signal sigfirstDigit, sigsecondDigit : STD_LOGIC_VECTOR (3 downto 0);
signal sigCurrDigit : STD_LOGIC_VECTOR(3 downto 0);
signal sigSevSegAn : STD_LOGIC_VECTOR (7 downto 0) := "11111110";

begin 
FreqDiv : FrequencyDivider port map (Clock_System => System_Clock, Clock_1Hz => sigSevSeAnToggle);
kbController:  Keyboard port map (usb_clk => USB_CLK, usb_data => USB_DATA, firstDigit => sigfirstDigit, secondDigit => sigsecondDigit);
SevSegDisp: HexDisp port map (clk => System_clock, ins => sigCurrDigit, outs => sigDigitDisp);

process (sigSevSeAnToggle) is
begin
    if (rising_edge(sigSevSeAnToggle)) then
        if (sigSevSegAn = "11111110") then
            sigCurrDigit <= sigfirstDigit;
            sigSevSegAn <= "11111101";
        elsif (sigSevSegAn = "11111101") then
            sigCurrDigit <= sigsecondDigit;
            sigSevSegAn <= "11111110";
       end if;
       end if;
end process; 

Anode_7SD <= sigSevSegAn;               




end Behavioral;
