----------------------------------------------------------------------------------
-- Create Date:    08:15:21 10/01/2021 
-- Designer Name:  Pouya Mohammadi	
-- Module Name:    Encoder 4x2
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity encoder4x2 is
	port(
		D : in  std_logic_vector (3 downto 0); -- this is a 2 bit input (A0 and A1)
		O : out std_logic_vector (1 downto 0) -- this is a 4 bit out put (O0, O1, O2, O3)
	);
end encoder4x2;

architecture gatelevel of encoder4x2 is
begin
	O(0) <= D(1) or D(3);
	O(1) <= D(2) or D(3);
end gatelevel;
