----------------------------------------------------------------------------------
-- Module Name:    mealy2 - Behavioral 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mealy2 is
        Port ( clk : in STD_LOGIC;
                   din : in STD_LOGIC;
                   rst : in STD_LOGIC;
                   dout : out STD_LOGIC
        );
end mealy2;

architecture Behavioral of mealy2 is
        type state is (st0, st1, st2, st3, st4);
        signal present_state, next_state : state;
        begin
        synchronous_process: process (clk)
        begin
                if rising_edge(clk) then
                        if (rst = '1') then
                                present_state <= st4;
                        else
                                present_state <= next_state;
                        end if;
                end if;
        end process;

        output_decoder : process(present_state, din)
        begin
                next_state <= st4;
                case (present_state) is
                        when st0 =>
                                if (din = '1') then
                                        next_state <= st1;
													 dout <= '0';
                                else
                                        next_state <= st0;
													 dout <= '0';

                                end if;
                        when st1 =>
                                if (din = '1') then
                                        next_state <= st3;
													 dout <= '0';
													 
                                else
                                        next_state <= st2;
													 dout <= '0';
													 
                                end if;
                        when st2 =>
                                if (din = '1') then
                                        next_state <= st1;
													 dout <= '1';
												
                                else
                                        next_state <= st0;
													 dout <= '0';
													 
                                        end if;
                        when st3 =>
                                if (din = '1') then
                                        next_state <= st4;
													 dout <= '0';
													 
                                else
                                        next_state <= st0;
													 dout <= '1';

                                end if;
								when st4 =>
                                if (din = '1') then
                                        next_state <= st4;
													 dout <= '0';
													 
                                else
                                        next_state <= st0;
													 dout <= '0';
													 
                                end if;
                        when others =>
                                next_state <= st4;
                end case;
        end process;
end Behavioral;

---------------test_bench-----------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mealy_tb is
end mealy_tb;

architecture test of mealy_tb is
	component mealy2 is
		Port ( clk : in STD_LOGIC;
                   din : in STD_LOGIC;
                   rst : in STD_LOGIC;
                   dout : out STD_LOGIC
                 );
	end component mealy2;
	
	signal clk : std_logic := '0';	
	signal din : std_logic:= '0';
	signal rst : std_logic:= '0';
	signal dout: std_logic:= '0';

begin
	mealy2_instance : mealy2 port map (clk => clk, din => din, rst => rst, dout => dout);
	tb:
	clk <= not clk after 5 ns;

	process begin 
		rst <= '1';
		wait for 7 ns;
		
		rst <= '0';
		din <= '0';
		wait for 10 ns;
		
		din <= '1';
		wait for 10 ns;
		
		din <= '0';
		wait for 10 ns;
		
		din <= '1';
		wait for 10 ns;
		--0101 detected
		
		din <= '1';
		wait for 10 ns;
		
		din <= '0';
		wait for 10 ns;
		--0110 detected

		din <= '0';
		wait for 10 ns;
		
		din <= '0';
		wait for 10 ns;
		
		din <= '1';
		wait for 10 ns;
		
		din <= '1';
		wait for 10 ns;
		
		din <= '1';
		wait for 10 ns;
		
		din <= '0';
		wait for 10 ns;
		--go to s0
		
		din <= '0';
		wait for 10 ns;
		
		din <= '1';
		wait for 10 ns;
		
		din <= '1';
		wait for 10 ns;
		
		din <= '0';
		wait for 10 ns;
		--0110 dtected
		
		rst <= '1';
		wait for 10 ns;

	report "simulation finished successfully" severity FAILURE;
	end process tb;
end architecture test;
