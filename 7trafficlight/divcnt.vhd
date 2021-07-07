LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY divcnt is
port (
	Elo        : out std_logic_vector (2 downto 0);
	Wlo        : out std_logic_vector (2 downto 0);
	Slo        : out std_logic_vector (2 downto 0);
	Nlo        : out std_logic_vector (2 downto 0);
	secondo    : out std_logic_vector (0 to 6);
	tensecondo : out std_logic_vector (0 to 6);
	rsti       : in  std_logic;
  	clk50i     : in  std_logic);
end divcnt;

ARCHITECTURE cnt_1 of divcnt is
COMPONENT trafficlight1 is
port (
	El        : out std_logic_vector (2 downto 0);
	Wl        : out std_logic_vector (2 downto 0);
	Sl        : out std_logic_vector (2 downto 0);
	Nl        : out std_logic_vector (2 downto 0);
	second    : out std_logic_vector (0 to 6);
	tensecond : out std_logic_vector (0 to 6);
	rst       : in  std_logic;
  	clk       : in  std_logic);
end COMPONENT;

COMPONENT frediv1
	port (
	clk50  : in  std_logic;
   divclk : out std_logic);
end COMPONENT;

signal clknet : std_logic;
begin
	u1 : frediv1       port map (divclk => clknet, clk50 => clk50i);
	u2 : trafficlight1 port map (El =>Elo, Wl => Wlo, Sl => Slo, Nl => Nlo, second =>secondo, tensecond => tensecondo, rst => rsti, clk => clknet);

end cnt_1;