----------------------------------------------------------------------------------
-- Module Name:    comparator4bit - Behavioral 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity comparator4bit is
port(
		A, B: in std_logic_vector( 3 downto 0);
		lt, eq, grt: out std_logic
);
end comparator4bit;

architecture gatelevel of comparator4bit is
	signal xor_A_B : std_logic_vector( 3 downto 0);
	signal and_A_complement : std_logic_vector( 3 downto 0);
	signal and_B_complement : std_logic_vector( 3 downto 0);
begin
	xor_A_B(0) <= A(0) xor B(0);
	xor_A_B(1) <= A(1) xor B(1);
	xor_A_B(2) <= A(2) xor B(2);
	xor_A_B(3) <= A(3) xor B(3);
	
	and_A_complement(0) <= (not A(0)) and B(0) and xor_A_B(3) and xor_A_B(2) and xor_A_B(1);
	and_A_complement(1) <= (not A(1)) and B(1) and xor_A_B(3) and xor_A_B(2);
	and_A_complement(2) <= (not A(2)) and B(2) and xor_A_B(3);
	and_A_complement(3) <= (not A(3)) and B(3);

	and_B_complement(0) <= (not B(0)) and A(0) and xor_A_B(3) and xor_A_B(2) and xor_A_B(1);
	and_B_complement(1) <= (not B(1)) and A(1) and xor_A_B(3) and xor_A_B(2);
	and_B_complement(2) <= (not B(2)) and A(2) and xor_A_B(3);
	and_B_complement(3) <= (not B(3)) and A(3);
	
	lt <= and_A_complement(0) or and_A_complement(1) or and_A_complement(2) or and_A_complement(3);
	grt <= and_B_complement(0) or and_B_complement(1) or and_B_complement(2) or and_B_complement(3);
	eq <= xor_A_B(0) and xor_A_B(1) and xor_A_B(2) and xor_A_B(3);	
end gatelevel;
