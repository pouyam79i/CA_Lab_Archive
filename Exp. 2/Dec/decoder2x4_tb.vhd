----------------------------------------------------------------------------------
-- Create Date:    08:15:21 10/01/2021 
-- Designer Name:  Pouya Mohammadi	
-- Module Name:    Test bench of Decoder 2x4
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity dec2x4_tb is
end dec2x4_tb;

architecture test of dec2x4_tb is
	component decoder2x4 is
	port(
		A : in std_logic_vector (1 downto 0);
		En: in std_logic;
		O : out std_logic_vector (3 downto 0)
	);
	end component decoder2x4;
	signal wire_A : std_logic_vector (1 downto 0) := "00";
	signal wire_En: std_logic := '0';
	signal wire_O : std_logic_vector (3 downto 0);
begin
	decoder2x4_instance : decoder2x4 port map (A=>wire_A, En=>wire_En, O=>wire_O);
	tb:
	process begin 
		wire_A  <= "00";
		wire_En <= '0';
		wait for 5 ns;
		wire_A  <= "10";
		wire_En <= '0';
		wait for 5 ns;
		wire_A  <= "00";
		wire_En <= '1';
		wait for 5 ns;
		wire_A  <= "01";
		wire_En <= '1';
		wait for 5 ns;
		wire_A  <= "11";
		wire_En <= '1';
		wait for 5 ns;
		wait;
	end process tb;
end architecture test;
