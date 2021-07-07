LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY trafficlight1 is
port (
	El        : out std_logic_vector (2 downto 0);
	Wl        : out std_logic_vector (2 downto 0);
	Sl        : out std_logic_vector (2 downto 0);
	Nl        : out std_logic_vector (2 downto 0);
	second    : out std_logic_vector (0 to 6);
	tensecond : out std_logic_vector (0 to 6);
	rst       : in  std_logic;
  	clk       : in  std_logic);
end trafficlight1;

ARCHITECTURE trafficlight_1 of trafficlight1 is

type state_traffic is (S0, S1, S2, S3);
signal state : state_traffic;
constant red    : std_logic_vector := "001";
constant yellow : std_logic_vector := "010";
constant green  : std_logic_vector := "100";

begin
	process(clk, rst)

		variable countsecond    : integer range 9 downto 0;
		variable counttensecond : integer range 6 downto 0;

		begin
			if (rst = '0') then 
				state <= S0;
				countsecond := 5;
				counttensecond := 3;
			else
				if (clk'event and clk = '1') then
					if (counttensecond = 0 and countsecond = 1) then
						case(state) is
							when S0 => state <= S1; countsecond := 3; counttensecond := 0;
							when S1 => state <= S2; countsecond := 0; counttensecond := 6;
							when S2 => state <= S3; countsecond := 3; counttensecond := 0;
							when S3 => state <= S0; countsecond := 5; counttensecond := 3;
							when others => state <= S0; countsecond := 5; counttensecond := 3;
						end case ;
					elsif (countsecond = 0) then
						counttensecond := counttensecond - 1;
						countsecond := 9;
					else
						countsecond := countsecond - 1;
					end if;	
				end if;
			end if;
			case state is
				when S0 => El <= red; Wl <= red; Sl <= green; Nl <= green;
				when S1 => El <= red; Wl <= red; Sl <= yellow; Nl <= yellow;
				when S2 => El <= green; Wl <= green; Sl <= red; Nl <= red;
				when S3 => El <= yellow; Wl <= yellow; Sl <= red; Nl <= red;
			end case;
			case countsecond is
				when 0 => second <= "0000001";
				when 1 => second <= "1001111";
				when 2 => second <= "0010010";
				when 3 => second <= "0000110";
				when 4 => second <= "1001100";
				when 5 => second <= "0100100";
				when 6 => second <= "0100000";
				when 7 => second <= "0001111";
				when 8 => second <= "0000000";
				when 9 => second <= "0001100";
				when others => second <= "1111111";
			end case;
			case counttensecond is
				when 0 => tensecond <= "1111111";
				when 1 => tensecond <= "1001111";
				when 2 => tensecond <= "0010010";
				when 3 => tensecond <= "0000110";
				when 4 => tensecond <= "1001100";
				when 5 => tensecond <= "0100100";
				when 6 => tensecond <= "0100000";
				when others => tensecond <= "1111111";
			end case;
	end process;
end trafficlight_1;