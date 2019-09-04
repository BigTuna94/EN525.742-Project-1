--Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
--Date        : Thu Aug 29 20:37:02 2019
--Host        : ZPCX running 64-bit major release  (build 9200)
--Command     : generate_target proc_system_wrapper.bd
--Design      : proc_system_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity proc_system_wrapper is
  port (
    Clk : in STD_LOGIC;
    dips_8bits_tri_i : in STD_LOGIC_VECTOR ( 7 downto 0 );
    leds_8bits_tri_o : out STD_LOGIC_VECTOR ( 7 downto 0 );
    reset_rtl : in STD_LOGIC;
    usb_uart_rxd : in STD_LOGIC;
    usb_uart_txd : out STD_LOGIC
  );
end proc_system_wrapper;

architecture STRUCTURE of proc_system_wrapper is
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
proc_system_i: component proc_system
     port map (
      Clk => Clk,
      dips_8bits_tri_i(7 downto 0) => dips_8bits_tri_i(7 downto 0),
      leds_8bits_tri_o(7 downto 0) => leds_8bits_tri_o(7 downto 0),
      reset_rtl => reset_rtl,
      usb_uart_rxd => usb_uart_rxd,
      usb_uart_txd => usb_uart_txd
    );
end STRUCTURE;
