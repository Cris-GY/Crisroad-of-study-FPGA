LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY add5 is
port (
	ai,bi,ci_1 : in   std_logic;
	si5,ci5      : out  std_logic);
end add5;

ARCHITECTURE add_e of add5 is
SIGNAL n : std_logic_vector (2 downto 0);

begin
	process(ai, bi, ci_1)
		begin
		n <= ai&bi&ci_1;
		case n is
			when "000" => si5 <= '0'; ci5 <= '0';
			when "001" => si5 <= '1'; ci5 <= '0';
			when "010" => si5 <= '1'; ci5 <= '0';
			when "011" => si5 <= '0'; ci5 <= '1';
			when "100" => si5 <= '1'; ci5 <= '0';
			when "101" => si5 <= '0'; ci5 <= '1';
			when "110" => si5 <= '0'; ci5 <= '1';
			when "111" => si5 <= '1'; ci5 <= '1';
		end case;
	end process;
end add_e;