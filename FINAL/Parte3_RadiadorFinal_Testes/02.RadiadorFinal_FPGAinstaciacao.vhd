library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity RadiadorFinalTESTE is
	
	port (CLOCK_50						: in std_logic;
			SW								: in std_logic_vector(1 downto 0);
			KEY							: in std_logic_vector(3 downto 0);
			LEDR							: out std_logic_vector(17 downto 0);
			LEDG							: out std_logic_vector(8 downto 0);
			HEX0, HEX1, HEX2, HEX3	: out std_logic_vector(6 downto 0);
			HEX7, HEX6, HEX5			: out std_logic_vector(6 downto 0));
			
end RadiadorFinalTESTE;

architecture comp of RadiadorFinalTESTE is
begin
		
	inst: entity work.RadiadorFinal(compRadiadorFinal)	
			port map (clk		=> CLOCK_50,
						tUp		=> KEY(1),
						tDw		=> KEY(0),
						tS			=> KEY(2),
						tP			=> KEY(3),
						acel		=> SW(1 downto 0),
						
						Radiador	=> LEDR(0),
						LedG		=> LEDG(0),
						LedL		=> LEDG(3),
						LedS		=> LEDG(6),
						gDzn		=> HEX7(6 downto 0),
						gUni		=> HEX6(6 downto 0),
						gDcm		=> HEX5(6 downto 0),
						hD			=> HEX3(6 downto 0),
						hU			=> HEX2(6 downto 0),
						mD			=> HEX1(6 downto 0),
						mU			=> HEX0(6 downto 0));
					
			LEDR(17 downto 1) <= (others => '0');
			LEDG(2 downto 1)	<= "00";
			LEDG(5 downto 4)	<= "00";
			LEDG(8 downto 7)	<= "00";
		
end comp;
