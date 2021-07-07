LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY digdecoder2 is
port (
	ini     : in std_logic_vector (3 downto 0);
	outo    : out std_logic_vector (0 to 6));
end digdecoder2;

ARCHITECTURE digdecoder_2 of digdecoder2 is

begin
	process(ini)
		begin
			case ini is
				when "0000" => outo <= "0000001";
				when "0001" => outo <= "1001111";
				when "0010" => outo <= "0010010";
				when "0011" => outo <= "0000110";
				when "0100" => outo <= "1001100";
				when "0101" => outo <= "0100100";
				when "0110" => outo <= "0100000";
				when "0111" => outo <= "0001111";
				when "1000" => outo <= "0000000";
				when "1001" => outo <= "0001100";
				when others => outo <= "1111111";
			end case;
	end process;
end digdecoder_2;