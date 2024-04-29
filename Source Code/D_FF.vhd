----------------------------------------------------------------------------------
-- Company: CUHKSZ
-- Engineer: Jiahao YANG (not engineer,but student :))
-- 
-- Create Date: 2024/04/25 20:19:07
-- Design Name: D_FF
-- Module Name: D_FF - Behavioral
-- Project Name: Parallel In / Serial Out (PISO) Shift Registers
-- Target Devices: NAN
-- Tool Versions: NAN
-- Description: A Parallel In/ Serial Out (PISO) Shift Registers, which is composed of 4 D-Flip-Flops (D-FF) and some basic logic gates
-- 
-- Dependencies: NAN
-- 
-- Revision:Final
-- Revision 0.01 - File Created
-- Additional Comments:NAN
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

entity D_FF is
    Port (
        D : in std_logic;
        CLK : in std_logic;
        Q : out std_logic
    );
end D_FF;

architecture Behavioral of D_FF is

begin

    process(CLK)
    begin
        if CLK = '1' and CLK'event then
            Q <= D;
        end if;
    end process;

end Behavioral;
