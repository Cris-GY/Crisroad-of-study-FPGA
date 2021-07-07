LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY segment_display is
port (
	bi        : in  std_logic;
    lt        : in  std_logic;
   	a         : in  std_logic_vector (3 downto 0);
	y         : out std_logic_vector (0 to 6));
end segment_display;

ARCHITECTURE digdecoder_1 of segment_display is
signal n : std_logic_vector (3 downto 0);
begin
	process(bi, lt, rbi, a)
		begin
			if (bi = '0') then 
				y <= "1111111";
			elsif (lt = '0') then
				y <= "0000000";
			else
				case a is
					when "0000" => y <= "0000001";
					when "0001" => y <= "1001111";
					when "0010" => y <= "0010010";
					when "0011" => y <= "0000110";
					when "0100" => y <= "1001100";
					when "0101" => y <= "0100100";
					when "0110" => y <= "0100000";
					when "0111" => y <= "0001111";
					when "1000" => y <= "0000000";
					when "1001" => y <= "0001100";
					when others => y <= "1111111";
				end case;
			end if;
	end process;
end digdecoder_1;