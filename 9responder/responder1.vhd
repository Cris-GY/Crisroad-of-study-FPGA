LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY responder1 is
port (
	clk50i : in std_logic;
	judgi  : in std_logic;
	cmpi   : in std_logic_vector (0 to 3);
	buzo   : out std_logic;
	so     : out std_logic_vector (0 to 6);
	tso    : out std_logic_vector (0 to 6);
	digo   : out std_logic_vector (0 to 6));
end responder1;

ARCHITECTURE responder_1 of responder1 is
COMPONENT main1 is
port (
	judg  : in std_logic;
	cmp   : in std_logic_vector (0 to 3);
	se    : in std_logic_vector (3 downto 0);
	tense : in std_logic_vector (3 downto 0);
	onf   : out std_logic;
	buzco : out std_logic_vector (1 downto 0);
	dig   : out std_logic_vector (3 downto 0));
end COMPONENT;

COMPONENT frediv2
port (
	clk50   : in  std_logic;
   divclk  : out std_logic;
	clk1000 : out std_logic;
	clk500  : out std_logic);
end COMPONENT;

COMPONENT buzzer1
port (
	buzc      : in std_logic_vector (1 downto 0);
	inclk1000 : in std_logic;
	inclk500  : in std_logic;
	outsp     : out std_logic);
end COMPONENT;

COMPONENT counter1
port (
	clk1  : in std_logic;
	onf   : in std_logic;
	judge : in std_logic;
	s     : out std_logic_vector (3 downto 0);
	ts    : out std_logic_vector (3 downto 0));
end COMPONENT;

COMPONENT digdecoder2
port (
	ini     : in std_logic_vector (3 downto 0);
	outo    : out std_logic_vector (0 to 6));
end COMPONENT;

signal clknet, clk500net, clk1000net, onfnet : std_logic;
signal buzcnet : std_logic_vector (1 downto 0);
signal snet, tsnet, dignet : std_logic_vector (3 downto 0);

begin
	u1 : frediv2     port map (divclk => clknet, clk50 => clk50i, clk1000 => clk1000net, clk500 => clk500net);
	u2 : main1       port map (judg => judgi, cmp => cmpi, se => snet, tense => tsnet, onf => onfnet, buzco => buzcnet, dig => dignet);
	u3 : buzzer1     port map (buzc => buzcnet, inclk1000 => clk1000net, inclk500 => clk500net, outsp => buzo);
	u4 : digdecoder2 port map (ini => snet, outo => so);
	u5 : digdecoder2 port map (ini => tsnet, outo => tso);
	u6 : digdecoder2 port map (ini => dignet, outo => digo);
	u7 : counter1    port map (clk1 => clknet, onf => onfnet, judge => judgi, s => snet, ts => tsnet);

end responder_1;