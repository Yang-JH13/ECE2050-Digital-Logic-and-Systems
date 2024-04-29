----------------------------------------------------------------------------------
-- Company: CUHKSZ
-- Engineer: Jiahao YANG (not engineer,but student :))
-- 
-- Create Date: 2024/04/25 22:55:37
-- Design Name: PISO Shift Testbench
-- Module Name: tb_piso_shift - Behavioral
-- Project Name: Parallel In / Serial Out (PISO) Shift Registers Testbench
-- Target Devices: NAN
-- Tool Versions: NAN
-- Description:  Testbench for a Parallel In/ Serial Out (PISO) Shift Registers, which is composed of 4 D-Flip-Flops (D-FF) and some basic logic gates
-- 
-- Dependencies: piso_shift.vhd 
-- 
-- Revision: Final
-- Revision 0.01 - File Created
-- Additional Comments: NAN
-- 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_piso_shift is
end tb_piso_shift;

architecture Behavioral of tb_piso_shift is
    component piso_shift
        Port (
            CLK: in std_logic;
            Shift: in std_logic;
            PI: in std_logic_vector(3 downto 0);
            SO: out std_logic
        );
    end component;

    signal tb_CLK: std_logic := '0';
    signal tb_Shift: std_logic;
    signal tb_PI: std_logic_vector(3 downto 0);
    signal tb_SO: std_logic;

    constant CLK_period : time := 10 ns;

begin
    uut: piso_shift port map (
        CLK => tb_CLK,
        Shift => tb_Shift,
        PI => tb_PI,
        SO => tb_SO
    );

    tb_CLK_process :process
    begin
        tb_CLK <= '0';
        wait for CLK_period/2;
        tb_CLK <= '1';
        wait for CLK_period/2;
    end process;

    stim_proc: process
    begin
        -- Insert stimulus here 

        -- Example:
        tb_Shift <= '0';
        tb_PI <= "0101";
        wait for 10 ns;
        tb_Shift <= '1';
        wait for 20 ns;
        tb_shift <= '0';
        wait for 10 ns;
        tb_shift <= '1';
        wait;

        -- This is just an example. You should replace it with your own test scenarios.
    end process;

end Behavioral;