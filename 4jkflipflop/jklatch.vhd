LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY jklatch1 is
port (
	sd,rd,clk,j,k : in  std_logic;
	q,qb          : out std_logic);
end jklatch1;

ARCHITECTURE jklatch_1 of jklatch1 is
signal jk : std_logic_vector (1 downto 0);
signal n  : std_logic;
begin
	process(clk,sd,rd)
		begin
            jk <= j & k;
            if (sd = '0' and rd = '1') then 
                n <= '1';
            elsif (sd = '1' and rd = '0') then
                n <= '0';
            elsif (sd = '1' and rd = '1') then
                if (clk'event and clk = '1') then
                    case jk is
                        when "00" => n <= n;
                        when "01" => n <= '0';
                        when "10" => n <= '1';
                        when "11" => n <= NOT n;
                    end case;
                end if;
				else
					n <= 'Z';
            end if;
	end process;
	q <= n;
   qb <= NOT n;
end jklatch_1;