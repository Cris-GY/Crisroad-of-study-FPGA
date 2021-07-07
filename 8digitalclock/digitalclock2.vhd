LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY digitalclock2 is
port (
	clk50i     : in std_logic;
	cho        : in std_logic;
	cmo        : in std_logic;
	cso        : in std_logic;
    tensecondo : out std_logic_vector (0 to 6);
	secondo    : out std_logic_vector (0 to 6);
	tenminuteo : out std_logic_vector (0 to 6);
	minuteo    : out std_logic_vector (0 to 6);
	tenhouro   : out std_logic_vector (0 to 6);
	houro      : out std_logic_vector (0 to 6));
end digitalclock2;

ARCHITECTURE digitalclock_2 of digitalclock2 is
COMPONENT main2 is
port (
	s   : out std_logic_vector (7 downto 0);
	m   : out std_logic_vector (7 downto 0);
	h   : out std_logic_vector (7 downto 0);
	ch  : in std_logic;
	cm  : in std_logic;
	cs  : in std_logic;
  	clk : in std_logic);
end COMPONENT;

COMPONENT frediv1
port (
	clk50  : in  std_logic;
	divclk : out std_logic);
end COMPONENT;

COMPONENT digdecoder2 is
port (
	ini     : in std_logic_vector (3 downto 0);
	outo    : out std_logic_vector (0 to 6));
end COMPONENT;

signal snet, mnet, hnet, tsnet, tmnet, thnet : std_logic_vector (3 downto 0);
signal secondnet, minutenet, hournet : std_logic_vector (7 downto 0);
signal clknet : std_logic;

begin
	u1 : frediv1     port map (divclk => clknet, clk50 => clk50i);
	u2 : main2       port map (s => secondnet, m => minutenet, h => hournet, ch => cho, cm => cmo, cs => cso, clk => clknet);
	u3 : digdecoder2 port map (ini => snet, outo => secondo);
	u4 : digdecoder2 port map (ini => tsnet, outo => tensecondo);
	u5 : digdecoder2 port map (ini => mnet, outo => minuteo);
	u6 : digdecoder2 port map (ini => tmnet, outo => tenminuteo);
	u7 : digdecoder2 port map (ini => hnet, outo => houro);
	u8 : digdecoder2 port map (ini => thnet, outo => tenhouro);
	snet  <= secondnet (3 downto 0);
	tsnet <= secondnet (7 downto 4);
	mnet  <= minutenet (3 downto 0);
	tmnet <= minutenet (7 downto 4);
	hnet  <= hournet (3 downto 0);
	thnet <= hournet (7 downto 4);
end digitalclock_2;