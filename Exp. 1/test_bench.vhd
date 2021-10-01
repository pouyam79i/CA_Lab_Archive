----------------------------------------------------------------------------------
-- Create Date:    08:15:21 10/01/2021 
-- Designer Name:  Pouya Mohammadi		
-- Module Name:    test_bench
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity test_bench is
end test_bench;

architecture test of test_bench is
	component full_adder is
	port(
		I1, I2, Cin: in std_logic;
		Sum, Cout  : out std_logic
	);
	end component full_adder;
	signal wire_InN1  : std_logic := '0';
	signal wire_InN2  : std_logic := '0';
	signal wire_Cin   : std_logic := '0';
	signal wire_Sum   : std_logic;
	signal wire_Cout  : std_logic;
begin
	full_adder_instance : full_adder port map (I1=>wire_InN1, I2=>wire_InN2, Cin=>wire_Cin, Sum=>wire_Sum, Cout=>wire_Cout);
	tb:
	process begin 
		wire_InN1 <= '0';
		wire_InN2 <= '0';
		wire_Cin  <= '0';
		wait for 5 ns;
		wire_InN1 <= '0';
		wire_InN2 <= '1';
		wire_Cin  <= '0';
		wait for 5 ns;
		wire_InN1 <= '1';
		wire_InN2 <= '0';
		wire_Cin  <= '1';
		wait for 5 ns;
		wire_InN1 <= '1';
		wire_InN2 <= '1';
		wire_Cin  <= '0';
		wait for 5 ns;
		wire_InN1 <= '1';
		wire_InN2 <= '1';
		wire_Cin  <= '1';
		wait for 5 ns;
		wait;
	end process tb;
end architecture test;
