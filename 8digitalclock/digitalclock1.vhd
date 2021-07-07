LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY digitalclock1 is
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
end digitalclock1;

ARCHITECTURE digitalclock_1 of digitalclock1 is
COMPONENT main1 is
port (
	s   : out integer range 9 downto 0;
	ts  : out integer range 5 downto 0;
	m   : out integer range 9 downto 0;
	tm  : out integer range 5 downto 0;
	h   : out integer range 9 downto 0;
	th  : out integer range 2 downto 0;
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

COMPONENT digdecoder1 is
port (
	s         : in integer range 9 downto 0;
	ts        : in integer range 5 downto 0;
	m         : in integer range 9 downto 0;
	tm        : in integer range 5 downto 0;
	h         : in integer range 9 downto 0;
	th        : in integer range 2 downto 0;
	tensecond : out std_logic_vector (0 to 6);
	second    : out std_logic_vector (0 to 6);
	tenminute : out std_logic_vector (0 to 6);
	minute    : out std_logic_vector (0 to 6);
	tenhour   : out std_logic_vector (0 to 6);
	hour      : out std_logic_vector (0 to 6));
end COMPONENT;

signal snet, mnet, hnet : integer range 9 downto 0;
signal tsnet, tmnet     : integer range 5 downto 0;
signal thnet            : integer range 2 downto 0;
signal clknet           : std_logic;

begin
	u1 : frediv1     port map (divclk => clknet, clk50 => clk50i);
	u2 : main1       port map (s => snet, ts => tsnet, m => mnet, tm => tmnet, h => hnet, th => thnet, ch => cho, cm => cmo, cs => cso, clk => clknet);
	u3 : digdecoder1 port map (s => snet, ts => tsnet, m => mnet, tm => tmnet, h => hnet, th => thnet, tensecond => tensecondo, second => secondo, tenminute => tenminuteo, minute => minuteo, tenhour => tenhouro, hour => houro);
end digitalclock_1;