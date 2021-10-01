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

entity half_adder is
port(
	in1, in2	 : in std_logic;
	out1, out2:	out std_logic
);
end half_adder;

architecture structure of half_adder is
	component xor_gate is
	port(
		A, B: in std_logic;
		C   : out std_logic
 	);
	end component xor_gate;
	component and_gate is
	port(
		A, B: in std_logic;
		C   : out std_logic
	);
	end component and_gate;
begin
	xor_gate_instance: xor_gate port map (A=>in1, B=>in2, C=>out1);
	and_gate_instance: and_gate port map (A=>in1, B=>in2, C=>out2);
end structure;
