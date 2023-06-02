--INTRODUZIR NO PROJECTO TODOS OS COMPONENTES INSTANCIADOS NAS DUAS PARTES ANTERIORES

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity RadiadorFinal is
	
	port (clk					: in std_logic;
			tUp, tDw, tS, tP	: in std_logic;
			acel					: in std_logic_vector(1 downto 0);
			
			radiador				: out std_logic;
			LedG, LedL, LedS	: out std_logic;
			gDzn, gUni, gDcm	: out std_logic_vector(6 downto 0);
			hD, hU, mD, mU		: out std_logic_vector(6 downto 0));
			
end RadiadorFinal;

architecture compRadiadorFinal of RadiadorFinal is

signal s_divF, s_pulso				: std_logic;
signal s_tUp, s_tDw, s_tS, s_tP	: std_logic;
signal s_hROM							: std_logic_vector(4 downto 0);

begin
	teclaU:		entity work.DebounceUnit(Behavioral)	
					generic map (kHzClkFreq 		=> 50000,
									 mSecMinInWidth 	=>	100,
									 inPolarity 		=> '0',
									 outPolarity 		=> '1')
 
					port map (refClk					=> clk,
								 dirtyIn 				=> tUp,
								 pulsedOut				=> s_tUp);
								 
	teclaD:		entity work.DebounceUnit(Behavioral)	
					generic map (kHzClkFreq 		=> 50000,
									 mSecMinInWidth 	=>	100,
									 inPolarity 		=> '0',
									 outPolarity 		=> '1')
 
					port map (refClk					=> clk,
								 dirtyIn 				=> tDw,
								 pulsedOut				=> s_tDw);								 
	
	teclaS:		entity work.DebounceUnit(Behavioral)	
					generic map (kHzClkFreq 		=> 50000,
									 mSecMinInWidth 	=>	100,
									 inPolarity 		=> '0',
									 outPolarity 		=> '1')
 
					port map (refClk					=> clk,
								 dirtyIn 				=> tS,
								 pulsedOut				=> s_tS);
								 
	teclaP:		entity work.DebounceUnit(Behavioral)	
					generic map (kHzClkFreq 		=> 50000,
									 mSecMinInWidth 	=>	100,
									 inPolarity 		=> '0',
									 outPolarity 		=> '1')
 
					port map (refClk					=> clk,
								 dirtyIn 				=> tP,
								 pulsedOut				=> s_tP);
	
	Pulsos:		entity work.PulseGen(compPulseGen)
					port map(clockIn		=> clk,
								acel			=> acel,
								pulseHex		=> s_divF,
								pulseOut		=> s_pulso);
								
	Relogio:		entity work.RelogioFinal(compRelogioFinal)
					port map(clk		=> clk,
								pulso		=>	s_pulso,
								divF		=>	s_divF,
								up			=>	s_tUp,
								dw			=> s_tDw,
								tS			=> s_tS,
								horaRom	=>	s_hROM,
								hD			=>	hD,
								hU			=> hU,
								mD			=> mD,
								mU			=> mU);
								
	Ambiente:	entity work.AmbienteFinal(compAmbienteFinal)
					port map(clk			=> clk,
								pulso			=> s_pulso,
								divF			=> s_divF,
								up				=> s_tUp,
								dw				=> s_tDw,
								tP				=> s_tP,
								horaROM		=> s_hROM,
								radiador		=> radiador,
								tDzn			=> gDzn,
								tUni			=> gUni,
								tDcm			=> gDcm,
								modoLED(2)	=> LedS,
								modoLED(1)	=> LedL,
								modoLED(0)	=> LedG);
								
end compRadiadorFinal;								
