LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY add2 is
port (
	ai,bi,ci_1 : in   std_logic;
	si2,ci2      : out  std_logic);
end add2;

ARCHITECTURE add_b of add2 is
SIGNAL n : std_logic_vector (2 downto 0);

begin
	n <= ai&bi&ci_1;
	with n select
	si2 <= '1' when "001",
			'1' when "010",
			'1' when "100",
			'1' when "111",
			'0' when others;
	with n select
	ci2 <= '1' when "011",
			'1' when "101",
			'1' when "110",
			'1' when "111",
			'0' when others;
end add_b;