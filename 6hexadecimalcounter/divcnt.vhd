LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY divcnt is
port (
	clri,ldi,clk50i  : in  std_logic;
   dini		        : in  std_logic_vector (3 downto 0);
	yo            : out std_logic_vector (0 to 6);
   co               : out std_logic);
end divcnt;

ARCHITECTURE cnt_1 of divcnt is
COMPONENT STcounter1
port (
	y          : out std_logic_vector (0 to 6);
	din        : in  std_logic_vector (3 downto 0);
	c          : out std_logic;
  	clr,ld,clk : in  std_logic);
end COMPONENT;

COMPONENT frediv1
	port (
	clk50 : in  std_logic;
   divclk : out std_logic);
end COMPONENT;

signal clknet : std_logic;
begin
	u1 : frediv1    port map (divclk => clknet, clk50 => clk50i);
	u2 : STcounter1 port map (clr => clri, ld => ldi, clk => clknet, din => dini, y => yo, c => co);
end cnt_1;