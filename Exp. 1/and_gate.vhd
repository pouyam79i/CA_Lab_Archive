----------------------------------------------------------------------------------
-- Create Date:    08:15:21 10/01/2021 
-- Designer Name:  Pouya Mohammadi		
-- Module Name:    and_gate
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity and_gate is
port(
	A, B: in std_logic;
	C	: out std_logic
);
end and_gate;

architecture gatelevel of and_gate is
begin
	C <= A and B;
end gatelevel;
