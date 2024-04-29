----------------------------------------------------------------------------------
-- Company: CUHKSZ
-- Engineer: Jiahao YANG (not engineer,but student :))
-- 
-- Create Date: 2024/04/25 15:15:47
-- Design Name: PISO Shift
-- Module Name: piso_shift - Behavioral
-- Project Name: Parallel In / Serial Out (PISO) Shift Registers
-- Target Devices: NAN
-- Tool Versions: NAN
-- Description:  A Parallel In/ Serial Out (PISO) Shift Registers, which is composed of 4 D-Flip-Flops (D-FF) and some basic logic gates
-- 
-- Dependencies: NAN 
-- 
-- Revision: Final
-- Revision 0.01 - File Created
-- Additional Comments: NAN
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.All; 
use IEEE.STD_LOGIC_UNSIGNED.All;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity piso_shift is
    Port (
        CLK: in std_logic;
        Shift: in std_logic;
        PI: in std_logic_vector(3 downto 0);
        SO: out std_logic
    );
end piso_shift;

architecture Behavioral of piso_shift is
    component D_FF
        Port (
            D : in std_logic;
            CLK : in std_logic;
            Q : out std_logic
        );
    end component;
    signal din : std_logic_vector(3 downto 0);
    signal dout : std_logic_vector(3 downto 0);
    signal gsg : std_logic_vector(6 downto 0);
begin

    gsg(0) <= (not Shift) and PI(0);
    gsg(1) <= (not Shift) and PI(1);
    gsg(2) <= (not Shift) and PI(2);
    gsg(3) <= (not Shift) and PI(3);
    
    GSG(4) <= Shift and dout(0);
    GSG(5) <= Shift and dout(1);
    GSG(6) <= Shift and dout(2);

    din(0) <= gsg(0);
    din(1) <= gsg(1) or gsg(4);
    din(2) <= gsg(2) or gsg(5);
    din(3) <= gsg(3) or gsg(6);
      
    DFF0: D_FF port map(din(0), CLK, dout(0));
    DFF1: D_FF port map(din(1), CLK, dout(1));
    DFF2: D_FF port map(din(2), CLK, dout(2));
    DFF3: D_FF port map(din(3), CLK, dout(3));
 
    SO <= dout(3);
    
end Behavioral;