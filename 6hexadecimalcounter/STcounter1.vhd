LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY STcounter1 is
port (
	y          : out std_logic_vector (0 to 6);
	din        : in  std_logic_vector (3 downto 0);
	c          : out std_logic;
  	clr,ld,clk : in  std_logic);
end STcounter1;

ARCHITECTURE STcounter_1 of STcounter1 is
signal n : std_logic_vector (3 downto 0);
begin
	process(clk, ld, clr, din)
		begin
			if (clr = '0') then 
				n <= "0000";
				c <= '0';
			elsif (clk'event and clk = '1') then
				if (ld = '0') then
					n <= din;
					c <= '0';
				else
					if (n = "1111") then
						n <= "0000";
						c <= '1';
					elsif (n = "0000") then
						c <= '0';
						n <= n + '1';
					else
						n <= n + '1';
					end if;
				end if;
			end if;
				case n is
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
					when "1010" => y <= "0001000";
					when "1011" => y <= "1100000";
					when "1100" => y <= "1110010";
					when "1101" => y <= "1000010";
					when "1110" => y <= "0110000";
					when "1111" => y <= "0111000";
			end case;
	end process;
end STcounter_1;