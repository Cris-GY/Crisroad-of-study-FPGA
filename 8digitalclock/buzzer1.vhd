LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY buzzer1 is
port (
	ch        : in std_logic;
	cm        : in std_logic;
	cs        : in std_logic;
	inclk1000 : in std_logic;
	inclk500  : in std_logic;
	intm      : in std_logic_vector (3 downto 0);
	inm       : in std_logic_vector (3 downto 0);
	ints      : in std_logic_vector (3 downto 0);
	ins       : in std_logic_vector (3 downto 0);
	outsp     : out std_logic);
end buzzer1;

ARCHITECTURE buzzer_1 of buzzer1 is

begin
	process(inclk500, inclk1000, intm, inm, ins, ints)
		begin
			if (ch = '1' and cm = '1' and cs = '1') then
				if (intm = "0101" and inm = "1001" and ints = "0101") then
					if (ins = "0000" or ins = "0010" or ins = "0100" or ins = "0110" or ins = "1000") then
						outsp <= inclk500;
					else
						outsp <= '0';
					end if;
				elsif (intm = "0000" and inm = "0000" and ints = "0000" and ins = "0000") then
					outsp <= inclk1000;
				else
					outsp <= '0';
				end if;
			end if;
	end process;
end buzzer_1;