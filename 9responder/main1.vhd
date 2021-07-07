LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY main1 is
port (
	judg  : in std_logic;
	cmp   : in std_logic_vector (0 to 3);
	se    : in std_logic_vector (3 downto 0);
	tense : in std_logic_vector (3 downto 0);
	onf   : out std_logic;
	buzco : out std_logic_vector (1 downto 0);
	dig   : out std_logic_vector (3 downto 0));
end main1;

ARCHITECTURE main_1 of main1 is
type state_re is (S0, S1, S2);

begin
	process(cmp, judg, se, tense)

		variable start : std_logic := '0';
		variable state : state_re := S0;

		begin
			if (judg = '0') then
				state := S1;
				dig <= "1111";
				buzco <= "00";
			end if;
			case state is
				when S0 => onf <= '0'; dig <= "1111"; buzco <= "00";
				when S1 => onf <= '1';
					if (cmp /= "1111") then
						case cmp is
							when "0111" => dig <= "0001"; 
							when "1011" => dig <= "0010";
							when "1101" => dig <= "0011";
							when "1110" => dig <= "0100";
							when others => dig <= "0000";
						end case;
						buzco <= "01"; onf <= '0'; state := S2;
					elsif (se = "0000" and tense = "0000") then
						onf <= '0'; buzco <= "10"; state := S2;
					end if;
				when S2 => onf <= '0';
				when others => state := S0;
			end case;
	end process;
end main_1;