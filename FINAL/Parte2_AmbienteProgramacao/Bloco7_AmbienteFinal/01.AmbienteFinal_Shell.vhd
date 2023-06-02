library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity AmbienteFinal is

	port(clk, pulso, divF	: in std_logic;
		  up, dw, tP			: in std_logic;
		  horaROM				: in std_logic_vector(4 downto 0);
		  radiador				: out std_logic;
		  tDzn, tUni, tDcm	: out std_logic_vector(6 downto 0);
		  modoLED				: out std_logic_vector(2 downto 0));
end AmbienteFinal;

architecture compAmbienteFinal of AmbienteFinal is

signal s_modo, s_uD				: std_logic;
signal s_stAtual 					: std_logic_vector(1 downto 0);

signal s_eG, s_eL, s_eS			: std_logic;

signal s_tROM						: std_logic_vector(1 downto 0);
signal s_tG, s_tL, s_tS, s_tA	: std_logic_vector(8 downto 0);

begin
	ROM:			entity work.romTemp(compRomTemp)
					port map(horas		=> horaROM,
								tAtual	=> s_tROM);
	
	
	FSM:		entity work.FSMambiente(compFSMambiente)
				port map(clk		=> clk,
							up			=> up,
							down		=> dw,
							tecla		=> tP,
							stOut		=> s_stAtual,
							modo		=> s_modo,
							ud			=> s_uD,
							eG			=> s_eG,
							eL			=> s_eL,
							eS			=> s_eS);
							
	tRef:		entity work.tTodas(comptTodas)
				port map (clk		=>	clk,
							 enG		=>	s_eG,
							 enL		=>	s_eL,
							 enS		=>	s_eS,
							 uD		=>	s_uD,
							 tG		=>	s_tG,
							 tL		=> s_tL,
							 tS		=> s_tS);
							 
	tSelect:	entity work.AmbienteBasico(compAmbienteBasico)
				port map (clk		=> clk,
							 pulso	=>	pulso,
							 tSel		=>	s_tROM,
							 tGel		=>	s_tG,
							 tLua		=>	s_tL,
							 tSol		=> s_tS,
							 radiador=> radiador,
							 tAmb		=>	s_tA);
							 		 
							 
	conv:		entity work.ConvAmbiente(compConvAmbiente)
				port map (divF			=> divF,
							 modo			=>	s_modo,
							 estado		=>	s_stAtual,
							 tNormal		=>	s_tA,
							 tGel			=>	s_tG,
							 tLua			=>	s_tL,
							 tSol			=>	s_tS,
							 temp2		=>	tDzn,
							 temp1		=> tUni,
							 temp0		=>	tDcm);
							 
	LEDs:		entity work.outLEDS(compOutLEDS)
				port map (modo			=> s_modo,
							 hRom			=>	s_tROM,
							 estado		=>	s_stAtual,
							 ledArray	=>	modoLED);

end compAmbienteFinal;							 
