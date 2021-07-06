LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY add is
port (
	ai,bi,ci_1 : in   std_logic;
	si1,ci1      : out  std_logic);
end add;


ARCHITECTURE add_a of add is
begin
	si1 <= ((ci_1 and (not ai) and (not bi)) or (ai and (not ci_1) and (not bi)) or (bi and (not ai) and (not ci_1)) or (ci_1 and ai and bi));
	ci1 <= ((ci_1 and ai and (not bi)) or (ci_1 and (not ai) and bi) or (bi and ai and (not ci_1)) or (ci_1 and ai and bi));
end add_a;