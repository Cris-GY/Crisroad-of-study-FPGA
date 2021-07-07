LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY add3 is
port (
	ai,bi,ci_1 : in   std_logic;
	si3,ci3      : out  std_logic);
end add3;

ARCHITECTURE add_c of add3 is
SIGNAL n : std_logic_vector (2 downto 0);

begin
	n <= ai&bi&ci_1;
	si3 <= '1' when n = "001" else
			 '1' when n = "010" else
		 	 '1' when n = "100" else
			 '1' when n = "111" else
			 '0';
	ci3 <= '1' when n = "011" else
			 '1' when n = "101" else
			 '1' when n = "110" else
			 '1' when n = "111" else
			 '0';
end add_c;