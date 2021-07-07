LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY frediv2 is
port (
	clk50 : in  std_logic;
    clka  : out std_logic;
	clkb  : out std_logic;
	clkc  : out std_logic;
	clkd  : out std_logic;
	clke  : out std_logic;
	clkf  : out std_logic;
	clkg  : out std_logic;
	clki  : out std_logic);
end frediv2;

ARCHITECTURE frediv_2 of frediv2 is

signal cnti : std_logic_vector (15 downto 0) := (others => '0');
signal cntb : std_logic_vector (16 downto 0) := (others => '0');
signal cntc : std_logic_vector (16 downto 0) := (others => '0');
signal cntd : std_logic_vector (16 downto 0) := (others => '0');
signal cnte : std_logic_vector (15 downto 0) := (others => '0');
signal cntf : std_logic_vector (15 downto 0) := (others => '0');
signal cntg : std_logic_vector (15 downto 0) := (others => '0');
signal a    : std_logic := '0';
signal b    : std_logic := '0';
signal c    : std_logic := '0';
signal d    : std_logic := '0';
signal e    : std_logic := '0';
signal f    : std_logic := '0';
signal g    : std_logic := '0';
signal i    : std_logic := '0';

begin
	process(clk50, a, b, c, d, e, f, g, i)
		begin
			if (clk50'event and clk50 = '1') then
				if (cnti = "1011101010111001") then
					i <= NOT i;
					cnti <= (others => '0');
				else
					cnti <= cnti + '1';
				end if;
				if (cntb = "10100110000101010") then
					b <= NOT b;
					cntb <= (others => '0');
				else
					cntb <= cntb + '1';
				end if;
				if (cntc = "10010011111101110") then
					c <= NOT c;
					cntc <= (others => '0');
				else
					cntc <= cntc + '1';
				end if;
				if (cntd = "10001011111010001") then
					d <= NOT d;
					cntd <= (others => '0');
				else
					cntd <= cntd + '1';
				end if;
				if (cnte = "1111100100011111") then
					e <= NOT e;
					cnte <= (others => '0');
				else
					cnte <= cnte + '1';
				end if;
				if (cntf = "1101110111110010") then
					f <= NOT f;
					cntf <= (others => '0');
				else
					cntf <= cntf + '1';
				end if;
				if (cntg = "1100011001111101") then
					g <= NOT g;
					cntg <= (others => '0');
				else
					cntg <= cntg + '1';
				end if;
			end if;
			if (i'event and i = '1') then
				a <= NOT a;
			end if;
		clka <= a;
		clkb <= b;
		clkc <= c;
		clkd <= d;
		clke <= e;
		clkf <= f;
		clkg <= g;
		clki <= i;
	end process;
end frediv_2;