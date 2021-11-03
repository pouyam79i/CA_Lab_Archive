----------------------------------------------------------------------------------
-- Create Date:    08:15:21 10/01/2021 
-- Designer Name:  Pouya Mohammadi	
-- Module Name:    Test Bench of Encoder 4x2
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity encoder2x4_tb is
end encoder2x4_tb;

architecture test of encoder2x4_tb is
	component encoder4x2 is
		port(
			D : in  std_logic_vector (3 downto 0); -- this is a 2 bit input (A0 and A1)
			O : out std_logic_vector (1 downto 0) -- this is a 4 bit out put (O0, O1, O2, O3)
		);
	end component encoder4x2;
	signal wire_D : std_logic_vector (3 downto 0) := "0000";
	signal wire_O : std_logic_vector (1 downto 0);
begin
	encoder4x2_instance : encoder4x2 port map (D=>wire_D, O=>wire_O);
	tb:
	process begin 
		wire_D  <= "0000";
		wait for 5 ns;
		wire_D  <= "1000";
		wait for 5 ns;
		wire_D  <= "0010";
		wait for 5 ns;
		wire_D  <= "0100";
		wait for 5 ns;
		wire_D  <= "0001";
		wait for 5 ns;
		wire_D  <= "0011";
		wait for 5 ns;
		wire_D  <= "0100";
		wait for 5 ns;
		wire_D  <= "1010";
		wait for 5 ns;
		wait;
	end process tb;
end architecture test;
