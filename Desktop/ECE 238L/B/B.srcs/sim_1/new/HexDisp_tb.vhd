----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/27/2023 03:45:00 PM
-- Design Name: 
-- Module Name: HexDisp_tb - bench
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

entity HexDisp_tb is
--  Port ( );
end HexDisp_tb;

architecture bench of HexDisp_tb is
    
    component HexDisp is
    Port ( clk : in STD_LOGIC;
           ins: in STD_LOGIC_VECTOR (3 downto 0);
           outs: out STD_LOGIC_VECTOR (7 downto 0));
    end component;
    
signal Clk_tb : STD_LOGIC;
signal ins_tb : STD_LOGIC_VECTOR (3 downto 0);
signal outs_tb : STD_LOGIC_VECTOR (7 downto 0);
constant Clock_100MHz_Period : time := 15ns;

           

begin

    uut: HExDisp port map (Clk  => Clk_tb,
                           ins => ins_tb,
                           outs => outs_tb);

clk_process : process

begin
    clk_tb <= '0'; wait for Clock_100MHz_Period/2;
    clk_tb <= '1'; wait for Clock_100MHz_Period/2;
    
    end process;
    
    input: process
    begin
    ins_tb <= "0000"; wait for 100ns;  
    ins_tb <= "0001"; wait for 100ns;
    ins_tb <= "0010"; wait for 100ns;
    ins_tb <= "0011"; wait for 100ns;
    ins_tb <= "0100"; wait for 100ns;
    ins_tb <= "0101"; wait for 100ns;
    ins_tb <= "0110"; wait for 100ns;                               
    ins_tb <= "0111"; wait for 100ns; 
    ins_tb <= "1000"; wait for 100ns;
    wait;
    end process; 
end bench;
