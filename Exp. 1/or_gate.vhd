----------------------------------------------------------------------------------
-- Create Date:    08:15:21 10/01/2021 
-- Designer Name:  Pouya Mohammadi		
-- Module Name:    and_gate - Structural 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity or_gate is
port(
	A, B: in std_logic;
	C	 : out std_logic
);
end or_gate;

architecture gatelevel of or_gate is
begin
	C <= A or B;
end gatelevel;
