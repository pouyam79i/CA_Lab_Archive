----------------------------------------------------------------------------------
-- Module Name:    mux4x1 - Gate level 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux4x1 is
	port(
		A, B: in std_logic;	--select
		D : in std_logic_vector( 3 downto 0);
		Q_out: out std_logic
	);
end mux4x1;

architecture gatelevel of mux4x1 is
	signal A_not	: std_logic;
	signal B_not : std_logic;
	signal q : std_logic_vector( 3 downto 0);
begin
	A_not <= not A;
	B_not <= not B;
	
	q(0) <= A_not and B_not and D(0);
	q(1) <= A_not and B and D(1);
	q(2) <= A and B_not and D(2);
	q(3) <= A and B and D(3);

	Q_out <= q(0) or q(1) or q(2) or q(3);
end gatelevel;
