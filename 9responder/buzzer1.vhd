LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY buzzer1 is
port (
	buzc      : in std_logic_vector (1 downto 0);
	inclk1000 : in std_logic;
	inclk500  : in std_logic;
	outsp     : out std_logic);
end buzzer1;

ARCHITECTURE buzzer_1 of buzzer1 is

begin
	process(inclk500, inclk1000, buzc)

		variable cnt : integer range 0 to 1000;
		
	begin
		if (buzc = "00") then
			outsp <= '0';
			cnt := 0;
		else
			if (inclk1000'event and inclk1000 = '1') then
				if (cnt = 1000) then
					outsp <= '0';
				else
					cnt := cnt + 1;
				end if;
			end if;
			if (cnt < 1000) then
				case buzc is
					when "01" => outsp <= inclk500;
					when "10" => outsp <= inclk1000;
					when others => outsp <= '0';
				end case;
			else
				outsp <= '0';
			end if;
		end if;
	end process;
end buzzer_1;