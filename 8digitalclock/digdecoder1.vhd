LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY digdecoder1 is
port (
	s         : in integer range 9 downto 0;
	ts        : in integer range 6 downto 0;
	m         : in integer range 9 downto 0;
	tm        : in integer range 6 downto 0;
	h         : in integer range 9 downto 0;
	th        : in integer range 2 downto 0;
	tensecond : out std_logic_vector (0 to 6);
	second    : out std_logic_vector (0 to 6);
	tenminute : out std_logic_vector (0 to 6);
	minute    : out std_logic_vector (0 to 6);
	tenhour   : out std_logic_vector (0 to 6);
	hour      : out std_logic_vector (0 to 6));
end digdecoder1;

ARCHITECTURE digdecoder_1 of digdecoder1 is

begin
	process(s, ts, m, tm, h, th)
		begin
			case s is
				when 0 => second <= "0000001";
				when 1 => second <= "1001111";
				when 2 => second <= "0010010";
				when 3 => second <= "0000110";
				when 4 => second <= "1001100";
				when 5 => second <= "0100100";
				when 6 => second <= "0100000";
				when 7 => second <= "0001111";
				when 8 => second <= "0000000";
				when 9 => second <= "0001100";
				when others => second <= "1111111";
			end case;
			case ts is
				when 0 => tensecond <= "0000001";
				when 1 => tensecond <= "1001111";
				when 2 => tensecond <= "0010010";
				when 3 => tensecond <= "0000110";
				when 4 => tensecond <= "1001100";
				when 5 => tensecond <= "0100100";
				when 6 => tensecond <= "0100000";
				when others => tensecond <= "1111111";
			end case;
			case m is
				when 0 => minute <= "0000001";
				when 1 => minute <= "1001111";
				when 2 => minute <= "0010010";
				when 3 => minute <= "0000110";
				when 4 => minute <= "1001100";
				when 5 => minute <= "0100100";
				when 6 => minute <= "0100000";
				when 7 => minute <= "0001111";
				when 8 => minute <= "0000000";
				when 9 => minute <= "0001100";
				when others => minute <= "1111111";
			end case;
			case tm is
				when 0 => tenminute <= "0000001";
				when 1 => tenminute <= "1001111";
				when 2 => tenminute <= "0010010";
				when 3 => tenminute <= "0000110";
				when 4 => tenminute <= "1001100";
				when 5 => tenminute <= "0100100";
				when 6 => tenminute <= "0100000";
				when others => tenminute <= "1111111";
			end case;
			case h is
				when 0 => hour <= "0000001";
				when 1 => hour <= "1001111";
				when 2 => hour <= "0010010";
				when 3 => hour <= "0000110";
				when 4 => hour <= "1001100";
				when 5 => hour <= "0100100";
				when 6 => hour <= "0100000";
				when 7 => hour <= "0001111";
				when 8 => hour <= "0000000";
				when 9 => hour <= "0001100";
				when others => hour <= "1111111";
			end case;
			case th is
				when 0 => tenhour <= "0000001";
				when 1 => tenhour <= "1001111";
				when 2 => tenhour <= "0010010";
				when others => tenhour <= "1111111";
			end case;
	end process;
end digdecoder_1;