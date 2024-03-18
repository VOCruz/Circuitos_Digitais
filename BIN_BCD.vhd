library ieee;
use ieee.std_logic_1164.all;

entity BIN_BCD is
	port (	SW7, SW6, SW5, SW4, SW3, SW2, SW1, SW0	:  in std_logic;
		BCD					: out std_logic_vector (11 downto 0));
end BIN_BCD;

architecture logic of BIN_BCD is


component Bloco_Conversor is
	port (	A3, A2, A1, A0	:  in std_logic;
		S3, S2, S1, S0	: out Std_logic);
end component;


	signal bloco1 : std_logic_vector (3 downto 0);
	signal bloco2 : std_logic_vector (3 downto 0);
	signal bloco3 : std_logic_vector (3 downto 0);
	signal bloco4 : std_logic_vector (3 downto 0);
	signal bloco5 : std_logic_vector (3 downto 0);
	signal bloco6 : std_logic_vector (3 downto 0);
	signal bloco7 : std_logic_vector (3 downto 0);


begin
	
	B1 : Bloco_Conversor port map ( '0', SW7, SW6, SW5, bloco1(3), bloco1(2), bloco1(1), bloco1(0));
	B2 : Bloco_Conversor port map ( bloco1(2), bloco1(1), bloco1(0), SW4, bloco2(3), bloco2(2), bloco2(1), bloco2(0));
	B3 : Bloco_Conversor port map ( bloco2(2), bloco2(1), bloco2(0), SW3, bloco3(3), bloco3(2), bloco3(1), bloco3(0));
	B4 : Bloco_Conversor port map ( bloco3(2), bloco3(1), bloco3(0), SW2, bloco4(3), bloco4(2), bloco4(1), bloco4(0));
	B5 : Bloco_Conversor port map ( bloco4(2), bloco4(1), bloco4(0), SW1, bloco5(3), bloco5(2), bloco5(1), bloco5(0));
	B6 : Bloco_Conversor port map ( '0', bloco1(3), bloco2(3), bloco3(3), bloco6(3), bloco6(2), bloco6(1), bloco6(0));
	B7 : Bloco_Conversor port map ( bloco6(2), bloco6(1), bloco6(0), bloco4(3), bloco7(3), bloco7(2), bloco7(1), bloco7(0));


	BCD(11)	<= '0';
	BCD(10)	<= '0';
	BCD(9)	<= bloco6(3);
	BCD(8)	<= bloco7(3);
	BCD(7)	<= bloco7(2);
	BCD(6)	<= bloco7(1);
	BCD(5)	<= bloco7(0);
	BCD(4)	<= bloco5(3);
	BCD(3)	<= bloco5(2);
	BCD(2)	<= bloco5(1);
	BCD(1)	<= bloco5(0);
	BCD(0)	<= SW0;

end logic;
