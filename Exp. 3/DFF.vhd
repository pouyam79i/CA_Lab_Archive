----------------------------------------------------------------------------------
-- Designer Name:  Pouya Mohammadi	
-- Module Name:    DFF
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DFF is
	port(
		Data : in std_logic;  --  input data 
		Clk  : in std_logic;  --  clock
        Reset: in std_logic;  --  active-low asynchronous reset
		Q    : out std_logic; --  output (saved data)
		Qbar : out std_logic  -- ~output
	);
end DFF;

architecture Behavioral of DFF is
begin
	process(Clk, Reset)
	begin
		if(Reset = '0') then
		    Q <= '0';
			Qbar <= '1';
		else
			Q <= Data;
			Qbar <= not Data;
		end if;
	end process;
end Behavioral;

----------------------test_bech----------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_dff is
end tb_dff;

architecture test_bendch of tb_dff is
   component DFF is
	port(
		Data : in std_logic;  --  input data 
		Clk  : in std_logic;  --  clock
      Reset: in std_logic;  --  active-low asynchronous reset
		Q    : out std_logic; --  output (saved data)
		Qbar : out std_logic  -- ~output
	);
	end component DFF;
	signal wire_Data : std_logic := '0';
	signal wire_Clk  : std_logic := '0';
	signal wire_Reset: std_logic := '0';
	signal wire_Q    : std_logic;
	signal wire_Qbar : std_logic;
begin
   uut : DFF port map (Data =>wire_Data, Clk=>wire_Clk, Reset=>wire_Reset, Q=>wire_Q, Qbar=>wire_Qbar);
	tb:
	wire_Clk <= not wire_Clk after 5 ns;
	process begin 
		wire_Reset <= '0';
		wire_Data  <= '0';
		wait for 10 ns;
		wire_Reset <= '0';
		wire_Data  <= '1';
		wait for 10 ns;
		wire_Reset <= '1';
		wire_Data  <= '0';
		wait for 10 ns;
		wire_Reset <= '1';
		wire_Data  <= '1';
		wait for 10 ns;
		wire_Reset <= '1';
		wire_Data  <= '0';
		wait for 10 ns;
		wire_Reset <= '1';
		wire_Data  <= '1';
		wait for 10 ns;
		wire_Reset <= '0';
		wire_Data  <= '1';
		wait for 10 ns;
		assert false
			report "simulation ended"
			severity failure;
	end process tb;
end test_bendch;
