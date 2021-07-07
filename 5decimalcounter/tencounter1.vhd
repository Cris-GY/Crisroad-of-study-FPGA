LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY tencounter1 is
port (
	clr,ld,clk,ep,et : in  std_logic;
   din              : in  std_logic_vector (3 downto 0);
	qout             : out std_logic_vector (3 downto 0);
   c                : out std_logic);
end tencounter1;

ARCHITECTURE tencounter_1 of tencounter1 is
signal n : std_logic_vector (3 downto 0);
begin
	process(clk, ld, clr, et, ep)
		begin
			if (clr = '0') then 
				n <= "0000";
				c <= '0';
			elsif (clk'event and clk = '1') then
				if (ld = '0') then
					n <= din;
					c <= '0';
				elsif (clr = '1' and ld = '1') then
					if (ep = '1' and et = '1') then
						if (n = "1001") then
							n <= "0000";
							c <= '1';
						elsif (n > "1001") then
							n <= "0000";
						elsif (n = "0000") then
							c <= '0';
							n <= n + '1';
						else
							n <= n + '1';
						end if;
					end if;
				end if;
			end if;
			qout <= n;
	end process;
end tencounter_1;