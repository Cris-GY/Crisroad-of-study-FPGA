LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY main2 is
port (
	s   : out std_logic_vector (7 downto 0);
	m   : out std_logic_vector (7 downto 0);
	h   : out std_logic_vector (7 downto 0);
	ch  : in std_logic;
	cm  : in std_logic;
	cs  : in std_logic;
  	clk : in std_logic);
end main2;

ARCHITECTURE main_2 of main2 is

begin
	process(clk, ch, cm, cs)
		variable second : std_logic_vector (7 downto 0);
		variable minute : std_logic_vector (7 downto 0);
		variable hour   : std_logic_vector (7 downto 0);
		begin
			if (cs = '0') then
				second := "00000000";
			elsif (clk'event and clk = '1') then
				if (ch = '0') then 
					if (hour = "00010111") then 
						hour := "00000000";
					else
						hour := hour + '1';
					end if;
				elsif (cm = '0') then
					if (minute = "00111011") then 
						minute := "00000000";
					else
						minute := minute + '1';
					end if;
				else
					if (hour = "00010111" and minute = "00111011" and second = "00111011") then
						hour   := "00000000";
						minute := "00000000";
						second := "00000000";
					elsif (minute = "00111011" and second = "00111011") then
						hour   := hour + '1';
						minute := "00000000";
						second := "00000000";
					elsif (second = "00111011") then
						minute := minute + '1';
						second := "00000000";
					else
						second := second + '1';
					end if;
				end if;
			end if;
			if (hour > "00010011") then
				h <= hour + "00001100";
			elsif (hour > "00001001") then
				h <= hour + "00000110";
			else
				h <= hour;
			end if;
			if (minute > "00110001") then
				m <= minute + "00011110";
			elsif (minute > "00100111") then
				m <= minute + "00011000";
			elsif (minute > "00011101") then
				m <= minute + "00010010";
			elsif (minute > "00010011") then
				m <= minute + "00001100";
			elsif (minute > "00001001") then
				m <= minute + "00000110";
			else
				m <= minute;
			end if;
			if (second > "00110001") then
				s <= second + "00011110";
			elsif (second > "00100111") then
				s <= second + "00011000";
			elsif (second > "00011101") then
				s <= second + "00010010";
			elsif (second > "00010011") then
				s <= second + "00001100";
			elsif (second > "00001001") then
				s <= second + "00000110";
			else
				s <= second;
			end if;
	end process;
end main_2;