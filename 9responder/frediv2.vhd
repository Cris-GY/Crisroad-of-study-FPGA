LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY frediv2 is
port (
	clk50   : in  std_logic;
    divclk  : out std_logic;
	clk1000  : out std_logic;
	clk500 : out std_logic);
end frediv2;

ARCHITECTURE frediv_2 of frediv2 is

signal cnt  : std_logic_vector (24 downto 0) := (others => '0');--"000";
signal cnt1 : std_logic_vector (14 downto 0) := (others => '0');--"000";
signal i    : std_logic := '0';
signal j    : std_logic := '0';
signal k    : std_logic := '0';

begin
	process(clk50, i, j, k)
		begin
			if (clk50'event and clk50 = '1') then
				if (cnt = "101111101011110000100000") then
				--if (cnt = "100") then
					i <= NOT i;
					cnt <= (others => '0');--"000";
				else
					cnt <= cnt + '1';
				end if;
				if (cnt1 = "110000110101000") then
					j <= NOT j;
					cnt1 <= (others => '0');
				else
					cnt1 <= cnt1 + '1';
				end if;
			end if;
			if (j'event and j = '1') then
				k <= NOT k;
			end if;
		divclk <= i;
		clk1000 <= j;
		clk500 <= k;
	end process;
end frediv_2;