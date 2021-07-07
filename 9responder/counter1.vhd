LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY counter1 is
port (
	clk1  : in std_logic;
	onf   : in std_logic;
	judge : in std_logic;
	s     : out std_logic_vector (3 downto 0);
	ts    : out std_logic_vector (3 downto 0));
end counter1;

ARCHITECTURE counter_1 of counter1 is

begin
	process(clk1, onf, judge)

		variable tensecond : std_logic_vector (3 downto 0) := "0010";
		variable second    : std_logic_vector (3 downto 0) := "0000";

		begin
			if (judge = '0') then
				second := "0000";
				tensecond := "0010";
			elsif (onf = '1') then
				if (clk1'event and clk1 = '1') then
					if (tensecond > "0000" and second = "0000") then
						second := "1001";
						tensecond := tensecond - '1';
					else
						second := second - '1';
					end if;
				end if;
			end if;
			s <= second;
			ts <= tensecond;
	end process;
end counter_1;