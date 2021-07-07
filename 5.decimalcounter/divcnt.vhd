LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY divcnt is
port (
	clri,ldi,clk50i,epi,eti : in  std_logic;
   dini		            	: in  std_logic_vector (3 downto 0);
	qouto                   : out std_logic_vector (3 downto 0);
   co              	      : out std_logic);
end divcnt;

ARCHITECTURE cnt_1 of divcnt is
COMPONENT tencounter1
	port (
	clr,ld,clk,ep,et : in  std_logic;
   din              : in  std_logic_vector (3 downto 0);
	qout             : out std_logic_vector (3 downto 0);
   c                : out std_logic);
end COMPONENT;

COMPONENT frediv1
	port (
	clk50 : in  std_logic;
   divclk : out std_logic);
end COMPONENT;

signal clknet : std_logic;
begin
	u1 : frediv1     port map (divclk => clknet, clk50 => clk50i);
	u2 : tencounter1 port map (clr => clri, ld => ldi, clk => clknet, ep => epi, et => eti, din => dini, qout => qouto, c => co);
end cnt_1;