LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY frediv1 is
port (
	clk50 : in  std_logic;
   divclk : out std_logic);
end frediv1;

ARCHITECTURE frediv_1 of frediv1 is
signal cnt : std_logic_vector (24 downto 0) := (others => '0');--"000";
signal i   : std_logic := '0';
begin
	process(clk50)
		begin
			if (clk50'event and clk50 = '1') then
				if (cnt = "10111110101111000010000") then
				--if (cnt = "100") then
					i <= NOT i;
					cnt <= (others => '0');--"000";
				else
					cnt <= cnt + '1';
				end if;
			end if;
		divclk <= i;
	end process;
end frediv_1;