LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY add4 is
port (
	ai,bi,ci_1 : in   std_logic;
	si4,ci4    : out  std_logic);
end add4;

ARCHITECTURE add_d of add4 is
SIGNAL n : std_logic_vector (2 downto 0);

begin
	process(ai, bi, ci_1)
		begin
		n <= ai&bi&ci_1;
		if (n = "100" or n = "010" or n = "001") then
			si4 <= '1';
			ci4 <= '0';
		elsif (n = "110" or n = "101" or n = "011") then
			si4 <= '0';
			ci4 <= '1';
		elsif (n = "111") then
			si4 <= '1';
			ci4 <= '1';
		else
			si4 <= '0';
			ci4 <= '0';
		end if;
	end process;
end add_d;