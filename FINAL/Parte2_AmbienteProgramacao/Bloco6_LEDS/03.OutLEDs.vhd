library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity outLEDS is

	port (modo				: in std_logic;
			hRom, estado	: in std_logic_vector(1 downto 0);
			ledArray			: out std_logic_vector(2 downto 0));
end outLEDS;

architecture compOutLEDS of outLEDS is
signal s_sel2 : std_logic_vector(1 downto 0);

begin

	mux1:		entity work.Mux2_2(compMux2_2)
				port map(i0		=> hRom,
							i1		=> estado,
							sel	=> modo,
							yOut	=> s_sel2);
							
	mux2:		entity work.mux3_3(compMux3_3)
				port map(i0		=> "001",
							i1		=> "010",
							i2		=> "100",
							sel	=> s_sel2,
							yOut	=> ledArray);
							
end compOutLEDS;							
