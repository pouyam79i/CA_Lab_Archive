----------------------------------------------------------------------------------
-- Create Date:    08:15:21 10/01/2021 
-- Designer Name:  Pouya Mohammadi		
-- Module Name:    or_gate
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity or_gate is
port(
	A, B: in std_logic;
	C	: out std_logic
);
end or_gate;

architecture gatelevel of or_gate is
begin
	C <= A or B;
end gatelevel;
