LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY electronicorgan1 is
port (
	clk50i : in std_logic;
	kai    : in std_logic;
	kbi    : in std_logic;
	kci    : in std_logic;
	kdi    : in std_logic;
	kei    : in std_logic;
	kfi    : in std_logic;
	kgi    : in std_logic;
	kii    : in std_logic;
	outspo : out std_logic);
end electronicorgan1;

ARCHITECTURE electronicorgan_1 of electronicorgan1 is

COMPONENT frediv2
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
end COMPONENT;

COMPONENT buzzer1
port (
	buza  : in std_logic;
	buzb  : in std_logic;
	buzc  : in std_logic;
	buzd  : in std_logic;
	buze  : in std_logic;
	buzf  : in std_logic;
	buzg  : in std_logic;
	buzi  : in std_logic;
	ka    : in std_logic;
	kb    : in std_logic;
	kc    : in std_logic;
	kd    : in std_logic;
	ke    : in std_logic;
	kf    : in std_logic;
	kg    : in std_logic;
	ki    : in std_logic;
	outsp : out std_logic);
end COMPONENT;

signal clkanet, clkbnet, clkcnet, clkdnet, clkenet, clkfnet, clkgnet, clkinet : std_logic;

begin
	u1 : frediv2 port map (clk50 => clk50i, clka => clkanet, clkb => clkbnet, clkc => clkcnet, clkd => clkdnet, clke => clkenet, clkf => clkfnet, clkg => clkgnet, clki => clkinet);
	u2 : buzzer1 port map (buza => clkanet, buzb => clkbnet, buzc => clkcnet, buzd => clkdnet, buze => clkenet, buzf => clkfnet, buzg => clkgnet, buzi => clkinet, ka => kai,  kb => kbi, kc => kci, kd => kdi, ke => kei, kf => kfi, kg => kgi, ki => kii, outsp => outspo);

end electronicorgan_1;