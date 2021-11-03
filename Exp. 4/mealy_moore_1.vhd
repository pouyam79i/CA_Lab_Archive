----------------------------------------------------------------------------------
-- Module Name:    mealy_moore_1 - Behavioral 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-------------------mealy-----------------------
entity mealy is
    Port ( clk : in STD_LOGIC;
               din : in STD_LOGIC;
               rst : in STD_LOGIC;
               dout : out STD_LOGIC
             );
end mealy;

architecture Behavioral of mealy is
    type state is (st1, st2, st3, st4, st5);
    signal present_state, next_state : state;
    begin
    synchronous_process: process (clk)
    begin
            if rising_edge(clk) then
                    if (rst = '1') then
                            present_state <= st1;
                    else
                            present_state <= next_state;
                    end if;
            end if;
    end process;

    output_decoder : process(present_state, din)
    begin
            next_state <= st1;
            case (present_state) is
                    when st1 =>
                            if (din = '1') then
                                    next_state <= st2;
                                    dout <= '0';
                            else
                                    next_state <= st1;
                                    dout <= '0';
                            end if;
                    when st2 =>
                            if (din = '1') then
                                    next_state <= st3;
                                    dout <= '0';
                            else
                                    next_state <= st1;
                                    dout <= '0';
                            end if;
                    when st3 =>
                            if (din = '1') then
                                    next_state <= st3;
                                    dout <= '0';
                            else
                                    next_state <= st4;
                                    dout <= '0';
                            end if;
                    when st4 =>
                            if (din = '1') then
                                    next_state <= st5;
                                    dout <= '1';
                            else
                                    next_state <= st1;
                                    dout <= '0';
                            end if;
                    when st5 =>
                            if (din = '1') then
                                    next_state <= st3;
                                    dout <= '0';
                            else
                                    next_state <= st1;
												dout <= '0';
                            end if;
                    when others =>
                            next_state <= st1;
                            dout <= '0';
            end case;
    end process;
end Behavioral;
------------------moore----------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity moore is
        Port ( clk : in STD_LOGIC;
                   din : in STD_LOGIC;
                   rst : in STD_LOGIC;
                   dout : out STD_LOGIC
                 );
end moore;

architecture Behavioral of moore is
        type state is (st0, st1, st2, st3, st4);
        signal present_state, next_state : state;
        begin
        synchronous_process: process (clk)
        begin
                if rising_edge(clk) then
                        if (rst = '1') then
                                present_state <= st0;
                        else
                                present_state <= next_state;
                        end if;
                end if;
        end process;

        output_decoder : process(present_state, din)
        begin
                next_state <= st0;
                case (present_state) is
                        when st0 =>
                                if (din = '1') then
                                        next_state <= st1;
                                else
                                        next_state <= st0;
                                end if;
                        when st1 =>
                                if (din = '1') then
                                        next_state <= st2;
                                else
                                        next_state <= st0;
                                end if;
                        when st2 =>
                                if (din = '1') then
                                        next_state <= st2;
                                else
                                        next_state <= st3;
                                        end if;
                        when st3 =>
                                if (din = '1') then
                                        next_state <= st4;
                                else
                                        next_state <= st0;
                                end if;
                        when st4 =>
                                if (din = '1') then
                                        next_state <= st2;
                                else
                                        next_state <= st0;
                                end if;
                        when others =>
                                next_state <= st0;
                end case;
        end process;
        next_state_decoder : process(present_state)
        begin
                case (present_state) is
                        when st0 =>
                                dout <= '0';
                        when st1 =>
                                dout <= '0';
                        when st2 =>
                                dout <= '0';
                        when st3 =>
                                dout <= '0';
                        when st4 =>
                                dout <= '1';
                        when others =>
                                dout <= '0';
                end case;
            end process;
        end Behavioral;
		  
-------------test_bench----------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mealy_and_moore is
end mealy_and_moore;

architecture test of mealy_and_moore is
    component mealy is
        Port ( clk : in STD_LOGIC;
        din : in STD_LOGIC;
        rst : in STD_LOGIC;
        dout : out STD_LOGIC
        );
    end component mealy;
    component moore is
        Port ( clk : in STD_LOGIC;
        din : in STD_LOGIC;
        rst : in STD_LOGIC;
        dout : out STD_LOGIC
        );
    end component moore;

    signal clk : std_logic := '0';
    signal din : std_logic:= '0';
    signal rst : std_logic:= '0';
    signal dout_moore: std_logic:= '0';
    signal dout_mealy: std_logic:= '0';

begin
    mealy_instance : mealy port map (clk => clk, din => din, rst => rst, dout => dout_mealy);
    moore_instance : moore port map (clk => clk, din => din, rst => rst, dout => dout_moore);

tb:
clk <= not clk after 5 ns;

    process begin
        rst <= '1';
        wait for 10 ns;

        rst <= '0';
        din <= '0';
        wait for 10 ns;

        din <= '1';
        wait for 10 ns;

        din <= '0';
        wait for 10 ns;

        din <= '1';
        wait for 10 ns;

        din <= '1';
        wait for 10 ns;

        din <= '0';
        wait for 10 ns;

        din <= '1';
        wait for 10 ns;

        din <= '1';
        wait for 10 ns;

        din <= '0';
        wait for 10 ns;

        din <= '1';
        wait for 10 ns;

        din <= '1';
        wait for 10 ns;

        din <= '0';
        wait for 10 ns;

        din <= '0';
        wait for 10 ns;

        din <= '1';
        wait for 10 ns;

        din <= '1';
        wait for 10 ns;

        din <= '0';
        wait for 10 ns;
		  
        rst <= '1';
        wait for 10 ns;

        report "simulation finished successfully" severity FAILURE;

    end process tb; 
end architecture test;

