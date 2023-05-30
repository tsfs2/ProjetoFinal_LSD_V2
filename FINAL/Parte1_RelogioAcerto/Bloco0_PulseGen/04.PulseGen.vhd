library IEEE;
use ieee.std_logic_1164.all;

entity PulseGen is

	port (clockIn	: in std_logic;
			acel		: in std_logic_vector(1 downto 0);
			pulseHex	: out std_logic;
			pulseOut	: out std_logic);
end PulseGen;

architecture compPulseGen of PulseGen is
	signal s_normal					: std_logic;
	signal s_v0, s_v1, s_v2, s_v3	: std_logic;
begin

		Normal1:	entity work.PulseEnable(compPulseEnable)
					generic map (contagem => 2)
					port map (clkIN 	=> ClockIn,
								 enable	=> '1',
								 clkOut	=> s_normal);
		
		Normal2:	entity work.PulseEnable(compPulseEnable)
					generic map (contagem => 150000000)
					port map (clkIN 	=> ClockIn,
								 enable	=> s_normal,
								 clkOut	=> s_v0);
								 
		acel01:	entity work.PulseEnable(compPulseEnable)
					generic map (contagem => 50000000)
					port map (clkIN 	=> ClockIn,
								 enable	=> '1',
								 clkOut	=> s_v1);						 
								 
		acel10:	entity work.PulseEnable(compPulseEnable)
					generic map (contagem => 5000000)
					port map (clkIN 	=> ClockIn,
								 enable	=> '1',
								 clkOut	=> s_v2);
								 
		acel11:	entity work.PulseEnable(compPulseEnable)
					generic map (contagem => 833333)
					port map (clkIN 	=> ClockIn,
								 enable	=> '1',
								 clkOut	=> s_v3);
								 
		saida1:	entity work.Mux4(compMux4)
					port map (i0	=> s_v0,
								 i1	=> s_v1,
								 i2	=> s_v2,
								 i3	=> s_v3,
								 sel	=> acel,
								 yOut	=> pulseOut);
								 
		saida2:	entity work.DivFreq(compDivFreq)
					generic map (contagem => 50000000)
					port map (clkIn	=> clockIn,
								 clkOut	=> pulseHex);
								 
end compPulseGen;								 
