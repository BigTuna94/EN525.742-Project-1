----------------------------------------------------------------------------------
-- Company: JHU
-- Engineer: Zach Richard
-- 
-- Create Date: 08/29/2019 07:06:38 PM
-- Design Name: 
-- Module Name: toplevel - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

entity toplevel is Port (  
        reset_pb : in STD_LOGIC;
        clk_in : in STD_LOGIC;
        leds : out STD_LOGIC_VECTOR (7 downto 0);
        sw : in std_logic_vector(7 downto 0);
        uart_rx : in std_logic;
        uart_tx : out std_logic
    );
end toplevel;

architecture Behavioral of toplevel is
    signal ctr : unsigned (7 downto 0);
    signal clk, rst, ena_2Hz : std_logic;
    
    component clkdivider is 
        generic (divideby : natural := 2);
        port ( 
            clk : in std_logic;
            reset : in std_logic;
            pulseout : out std_logic
        );
    end component;
    
  component proc_system is
      port (
        Clk : in STD_LOGIC;
        reset_rtl : in STD_LOGIC;
        usb_uart_rxd : in STD_LOGIC;
        usb_uart_txd : out STD_LOGIC;
        dips_8bits_tri_i : in STD_LOGIC_VECTOR ( 7 downto 0 );
        leds_8bits_tri_o : out STD_LOGIC_VECTOR ( 7 downto 0 )
      );
  end component proc_system;
        
begin

    clk <= clk_in;
    rst <= reset_pb; --not
    
    make2Hz: clkdivider 
        generic map (divideby => 50000000)
        port map (clk => clk, reset => rst, pulseout => ena_2hz);
        
        
    -- just a silly counter for demo purposes, we'll delete this later
    process(clk, rst)
    begin
        if rst = '1' then
            ctr <= (others => '0');
        elsif rising_edge(clk) then
            if ena_2hz = '1' then
                ctr <= ctr + 1; 
            end if;
        end if;
    end process;
    
    --leds <= std_logic_vector(ctr);
    
    
    proc_system_i: component proc_system
     port map (
      Clk => Clk,
      dips_8bits_tri_i(7 downto 0) => sw,
      leds_8bits_tri_o(7 downto 0) => leds,
      reset_rtl => rst,
      usb_uart_rxd => uart_rx,
      usb_uart_txd => uart_tx
    );
    

end Behavioral;
