LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY main1 is
port (
	s   : out integer range 9 downto 0;
	ts  : out integer range 5 downto 0;
	m   : out integer range 9 downto 0;
	tm  : out integer range 5 downto 0;
	h   : out integer range 9 downto 0;
	th  : out integer range 2 downto 0;
	ch  : in std_logic;
	cm  : in std_logic;
	cs  : in std_logic;
  	clk : in std_logic);
end main1;

ARCHITECTURE main_1 of main1 is

begin
	process(clk, ch, cm, cs)
		variable second    : integer range 9 downto 0 := 0;
		variable tensecond : integer range 5 downto 0 := 0;
		variable minute    : integer range 9 downto 0 := 0;
		variable tenminute : integer range 5 downto 0 := 0;
		variable hour      : integer range 9 downto 0 := 0;
		variable tenhour   : integer range 2 downto 0 := 0;
		begin
			if (cs = '0') then
				second    := 0;
				tensecond := 0;
			--elsif (clk'event and clk = '1') then
				elsif (ch = '0') then 
				if (clk'event and clk = '1') then--
					if (tenhour = 2 and hour = 3) then 
						tenhour := 0;
						hour    := 0;
					elsif (hour = 9) then
						tenhour := tenhour + 1;
						hour    := 0;
					else
						hour := hour + 1;
					end if;
					end if;--
				elsif (cm = '0') then
				if (clk'event and clk = '1') then--
					if (tenminute = 5 and minute = 9) then 
						tenminute := 0;
						minute    := 0;
					elsif (minute = 9) then
						tenminute := tenminute + 1;
						minute    := 0;
					else
						minute := minute + 1;
					end if;
					end if;--
				else
				if (clk'event and clk = '1') then--
					if (tenhour = 2 and hour = 3 and tenminute = 5 and minute = 9 and tensecond = 5 and second = 9) then
						tenhour   := 0;
						hour      := 0;
						tenminute := 0;
						minute    := 0;
						second    := 0;
						tensecond := 0;
					elsif (hour = 9 and tenminute = 5 and minute = 9 and tensecond = 5 and second = 9) then
						tenhour   := tenhour + 1;
						hour      := 0;
						tenminute := 0;
						minute    := 0;
						second    := 0;
						tensecond := 0;
					elsif (tenminute = 5 and minute = 9 and tensecond = 5 and second = 9) then
						hour      := hour + 1;
						tenminute := 0;
						minute    := 0;
						second    := 0;
						tensecond := 0;
					elsif (minute = 9 and tensecond = 5 and second = 9) then
						tenminute := tenminute + 1;
						minute    := 0;
						second    := 0;
						tensecond := 0;
					elsif (tensecond = 5 and second = 9) then
						minute    := minute + 1;
						second    := 0;
						tensecond := 0;
					elsif (second = 9) then
						second    := 0;
						tensecond := tensecond + 1;
					else
						second := second + 1;
					end if;
				end if;
			end if;
			s <= second;
			ts <= tensecond;
			m <= minute;
			tm <= tenminute;
			h <= hour;
			th <= tenhour;
	end process;
end main_1;