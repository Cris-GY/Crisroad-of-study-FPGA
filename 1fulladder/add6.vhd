library ieee;
use ieee.std_logic_1164.all;

entity add6 is
port(ai,bi,ci_1: in std_logic;
si,ci: out std_logic
);
end entity add6;

architecture full_adder_when_else_arch of add6 is
signal input: std_logic_vector(2 downto 0);
begin
input<=ci_1 & ai & bi;
si<='0' when input=("000" or "011" or "101" or "110")else '1';
ci<='1' when input=("011" or "101" or "110" or "111")else '0';
end full_adder_when_else_arch;