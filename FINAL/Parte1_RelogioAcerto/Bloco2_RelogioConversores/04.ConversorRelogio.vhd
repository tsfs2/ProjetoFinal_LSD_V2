library IEEE;
use ieee.std_logic_1164.all;

entity ConversorRelogio is

	port (pulseIn				: in std_logic;
			modo, mmH			: in std_logic;
			minuIn				: in std_logic_vector(5 downto 0);
			horaIn				: in std_logic_vector(4 downto 0);
			horaD, horaU		: out std_logic_vector(6 downto 0);
			minuD, minuU		: out std_logic_vector(6 downto 0));
end ConversorRelogio;

architecture compConversorRelogio of ConversorRelogio is
	signal s_enM, s_enH					 : std_logic;
	signal s_mmU, s_mmD, s_hhU, s_hhD : std_logic_vector(3 downto 0);

begin

		pulsos:	entity work.MuxHEXA(compMuxHEXA)
					port map (i0		=> "11",
								 i1(0)	=> pulseIn,
								 i1(1)	=> '1',
								 i2(0)	=> '1',
								 i2(1)	=> pulseIn,
								 sel(0)	=> mmH,
								 sel(1)	=>	modo,
								 Yout(0)	=> s_enM,
								 Yout(1)	=> s_enH);
		
		conv2D:	entity work.Conversor2Dig(compConversor2Dig)
					port map (minIn	=> minuIn,
								 horaIn	=> horaIn,
								 horaDez	=> s_hhD,
								 horaUnd	=> s_hhU,
								 minDez	=> s_mmD,
								 minUnd	=> s_mmU);
								 
		convHx:	entity work.Conv7Rel(compConv7Rel)
					port map (enMM			=> s_enM,
								 enHH			=> s_enH,
								 inPort0		=> s_mmU,
								 inPort1		=> s_mmD,
								 inPort2		=> s_hhU,
								 inPort3		=> s_hhD,
								 outPort0	=> minuU,
								 outPort1	=> minuD,
								 outPort2	=> horaU,
								 outPort3	=> horaD);

end compConversorRelogio;								 
