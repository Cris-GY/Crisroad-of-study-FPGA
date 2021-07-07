LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY buzzer1 is
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
end buzzer1;

ARCHITECTURE buzzer_1 of buzzer1 is

begin
	process(ka, kb, kc, kd, ke, kf, kg, ki)
	begin
		if (ka = '0') then
			outsp <= buza;
		elsif (kb = '0') then
			outsp <= buzb;
		elsif (kc = '0') then
			outsp <= buzc;
		elsif (kd = '0') then
			outsp <= buzd;
		elsif (ke = '0') then
			outsp <= buze;
		elsif (kf = '0') then
			outsp <= buzf;
		elsif (kg = '0') then
			outsp <= buzg;
		elsif (ki = '0') then
			outsp <= buzi;
		else
			outsp <= '0';
		end if;
	end process;
end buzzer_1;