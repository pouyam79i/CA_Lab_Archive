----------------------------------------------------------------------------------
-- Create Date:    08:15:21 10/01/2021 
-- Designer Name:  Pouya Mohammadi		
-- Module Name:    xor_gate
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity xor_gate is
port(
	A, B: in std_logic;
	C   : out std_logic
);
end xor_gate;

architecture gatelevel of xor_gate is
begin
	C <= A xor B;
end gatelevel;
