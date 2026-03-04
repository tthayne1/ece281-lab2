----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/24/2026 03:26:25 PM
-- Design Name: 
-- Module Name: sevenseg_decoder_tb - Behavioral
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

entity sevenseg_decoder_tb is
end sevenseg_decoder_tb;

architecture test of sevenseg_decoder_tb is

    component sevenseg_decoder is
        Port (
            i_Hex   : in  STD_LOGIC_VECTOR(3 downto 0);
            o_seg_n : out STD_LOGIC_VECTOR(6 downto 0)
        );
    end component;

    signal s_hex   : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
    signal s_seg_n : STD_LOGIC_VECTOR(6 downto 0);

begin

    uut: sevenseg_decoder
        port map (
            i_Hex   => s_hex,
            o_seg_n => s_seg_n
        );

    stim: process
    begin
        -- Expected patterns are GFEDCBA (seg[6]=G ... seg[0]=A), active-low
        s_hex <= x"0"; wait for 10 ns; assert (s_seg_n = "1000000") report "FAIL: 0" severity error;
        s_hex <= x"1"; wait for 10 ns; assert (s_seg_n = "1111001") report "FAIL: 1" severity error;
        s_hex <= x"2"; wait for 10 ns; assert (s_seg_n = "0100100") report "FAIL: 2" severity error;
        s_hex <= x"3"; wait for 10 ns; assert (s_seg_n = "0110000") report "FAIL: 3" severity error;
        s_hex <= x"4"; wait for 10 ns; assert (s_seg_n = "0011001") report "FAIL: 4" severity error;
        s_hex <= x"5"; wait for 10 ns; assert (s_seg_n = "0010010") report "FAIL: 5" severity error;
        s_hex <= x"6"; wait for 10 ns; assert (s_seg_n = "0000010") report "FAIL: 6" severity error;
        s_hex <= x"7"; wait for 10 ns; assert (s_seg_n = "1111000") report "FAIL: 7" severity error;
        s_hex <= x"8"; wait for 10 ns; assert (s_seg_n = "0000000") report "FAIL: 8" severity error;
        s_hex <= x"9"; wait for 10 ns; assert (s_seg_n = "0011000") report "FAIL: 9" severity error;
        s_hex <= x"A"; wait for 10 ns; assert (s_seg_n = "0001000") report "FAIL: A" severity error;
        s_hex <= x"B"; wait for 10 ns; assert (s_seg_n = "0000011") report "FAIL: b" severity error;
        s_hex <= x"C"; wait for 10 ns; assert (s_seg_n = "1000111") report "FAIL: C" severity error;
        s_hex <= x"D"; wait for 10 ns; assert (s_seg_n = "0100001") report "FAIL: d" severity error;
        s_hex <= x"E"; wait for 10 ns; assert (s_seg_n = "0000110") report "FAIL: E" severity error;
        s_hex <= x"F"; wait for 10 ns; assert (s_seg_n = "0001110") report "FAIL: F" severity error;

        report "pass" severity note;
        wait;
    end process;

end test;