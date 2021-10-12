----------------------------------------------------------------------------------
-- Create Date:    08:15:21 10/01/2021 
-- Designer Name:  Pouya Mohammadi	
-- Module Name:    Decoder 2x4
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decoder2x4 is
port(
		A : in  std_logic_vector (1 downto 0); -- this is a 2 bit input (A0 and A1)
		En: in  std_logic;
		O : out std_logic_vector (3 downto 0) -- this is a 4 bit out put (O0, O1, O2, O3)
);
end decoder2x4;

architecture dataflow of decoder2x4 is
begin
    process(A, En)
    begin
        O <= "0000";
        if(En = '1') then
            case A is
                when "00" => O(0) <= '1';
                when "01" => O(1) <= '1';
                when "10" => O(2) <= '1';
                when "11" => O(3) <= '1';
                when others => O <= "0000";
            end case;
        end if;
    end process;
end dataflow;
