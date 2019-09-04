----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/29/2019 07:13:53 PM
-- Design Name: 
-- Module Name: tb_toplevel - Behavioral
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

entity tb_toplevel is
end tb_toplevel;

architecture Behavioral of tb_toplevel is

    component toplevel
        port (
            reset_pb : in std_logic;
            clk_in : in std_logic;
            leds : out std_logic_vector (7 downto 0)
        );
    end component;
    
    signal reset_pb : std_logic;
    signal clk_in : std_logic;
    signal leds : std_logic_vector (7 downto 0);
    
    constant TbPeriod : time := 10 ns;
    signal TbClock : std_logic := '0';

begin

    det : toplevel
        port map (
            reset_pb => reset_pb,
            clk_in => clk_in,
            leds => leds
        );
        
    TbClock <= not TbClock after TbPeriod/2;
    
    clk_in <= TbClock;
    
    stimuli : process
    begin
        reset_pb <= '0';
        wait for 232 ns;
        reset_pb <= '1';
        wait;
    end process;

end Behavioral;
