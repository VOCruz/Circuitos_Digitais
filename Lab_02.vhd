library ieee;
use ieee.std_logic_1164.all;

entity Lab_02 is
	port (	SW7, SW6, SW5, SW4, SW3, SW2, SW1, SW0	:  in std_logic;
		HEX2, HEX1, HEX0 : out std_logic_vector (6 downto 0));
end Lab_02;

architecture logic of Lab_02 is


component BIN_BCD is
	port (	SW7, SW6, SW5, SW4, SW3, SW2, SW1, SW0	:  in std_logic;
		BCD					: out std_logic_vector (11 downto 0));
end component;


component Display_7segmentos is
  	port (	w, x, y, z		:  in std_logic;
		A, B, C, D, E, F, G	: out std_logic);
end component;

	signal BCD : std_logic_vector (11 downto 0);

begin

	C : BIN_BCD port map ( SW7, SW6, SW5, SW4, SW3, SW2, SW1, SW0, BCD);
	
	D2: Display_7segmentos port map ( BCD(11), BCD(10), BCD(9), BCD(8), HEX2(6), HEX2(5), HEX2(4), HEX2(3), HEX2(2), HEX2(1), HEX2(0));
	D1: Display_7segmentos port map ( BCD(7), BCD(6), BCD(5), BCD(4), HEX1(6), HEX1(5), HEX1(4), HEX1(3), HEX1(2), HEX1(1), HEX1(0));
	D0: Display_7segmentos port map ( BCD(3), BCD(2), BCD(1), BCD(0), HEX0(6), HEX0(5), HEX0(4), HEX0(3), HEX0(2), HEX0(1), HEX0(0));

end logic;


