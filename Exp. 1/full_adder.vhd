----------------------------------------------------------------------------------
-- Create Date:    08:15:21 10/01/2021 
-- Designer Name:  Pouya Mohammadi		
-- Module Name:    full_adder
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_adder is
port(
	I1, I2, Cin: in std_logic;
	Sum, Cout  : out std_logic
);
end full_adder;

architecture structure of full_adder is
	component or_gate is
	port(
		A, B: in std_logic;
		C   : out std_logic
	);
	end component or_gate;
	component half_adder is
	port(
		in1, in2  : in std_logic;
		out1, out2: out std_logic
	);
	end component half_adder;
	signal internal_signal_0 : std_logic;
	signal internal_signal_1 : std_logic;
	signal internal_signal_2 : std_logic;
begin
	half_adder_instance_0 : half_adder port map (in1=>I1, in2=>I2, out1=>internal_signal_0, out2=>internal_signal_1);
	half_adder_instance_1 : half_adder port map (in1=>internal_signal_0, in2=>Cin, out1=>Sum, out2=>internal_signal_2);
	or_gate_instance_0    : or_gate port map    (A=>internal_signal_1, B=>internal_signal_2, C=>Cout);
end structure;
