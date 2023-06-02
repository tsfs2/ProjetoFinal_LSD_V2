library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity ConvAmbiente is

	port (divF, modo						: in std_logic;
			estado							: in std_logic_vector(1 downto 0);
			tNormal, tGel, tLua, tSol	: in std_logic_vector(8 downto 0);
			temp2, temp1, temp0			: out std_logic_vector(6 downto 0));
end ConvAmbiente;

architecture compConvAmbiente	of ConvAmbiente is

signal s_enH				: std_logic;
signal s_t2, s_t1, s_t0 : std_logic_vector (3 downto 0);
signal s_tRef				: std_logic_vector (8 downto 0);

begin
	
	enableConv:	entity work.mux2_1Modo(compMux2_1Modo)
					port map	(i0		=> '1',
								 i1		=> divF,
								 sel		=> modo,
								 yOut		=> s_enH);
								 
	inRefConv:	entity work.Mux4Amb(compMux4Amb)
					port map (tNormal	=> tNormal,
								 tGel		=> tGel,
								 tLua		=> tLua,
								 tSol		=> tSol,
								 Sel		=> estado,
								 tRef		=> s_tRef);
	
	
	conv3Dig:	entity work.ConversorAmbiente(compConversorAmbiente)
					port map (tempIn	=> s_tRef,
								 t10		=> s_t2,
								 t1		=> s_t1,
								 t01		=> s_t0);
						
	conv7seg:	entity work.Conv7Amb(compConv7Amb)
					port map (en			=> s_enH,
								 inPort0		=> s_t0,
								 inPort1		=> s_t1,
								 inPort2		=> s_t2,
								 outPort0	=> temp0,
								 outPort1	=> temp1,
								 outPort2	=> temp2);
								 
end compConvAmbiente;								 
