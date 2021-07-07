LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY dlatch1 is
port (
	d,clk : in   std_logic;
	q     : out  std_logic);
end dlatch1;

ARCHITECTURE dlatch_1 of dlatch1 is

begin
	process(clk)
		begin
            if (clk'event and clk = '1') then
                q <= d;
            end if;
	end process;
end dlatch_1;