library IEEE;
use IEEE.std_logic_1164.all;

entity AmbienteBasico is
	
	port(clk, pulso			: in std_logic;
	     tSel					: in std_logic_vector(1 downto 0);
		  tGel, tLua, tSol	: in std_logic_vector(8 downto 0);
		  radiador				: out std_logic;
		  tAmb					: out std_logic_vector(8 downto 0));
		  
end AmbienteBasico;

architecture compAmbienteBasico of AmbienteBasico is

signal s_upD				: std_logic;
signal s_tAtual, s_tRef	: std_logic_vector(8 downto 0);

begin

	selecao:	entity work.MuxAmb(compMuxAmb)
				port map (TGel		=> tGel,
							 TLua		=> tLua,
							 TSol		=> tSol,
							 sel		=> tSel,
							 tRef		=> s_tRef);
	
	cont9:	entity work.TempSala(compTempSala)
				port map(clk		=> clk,
							enL		=> pulso,
							upD		=> s_upD,
							tempOut	=> s_tAtual);
							
	control:	entity work.tempControl(compTempControl)
				port map(clk			=> clk,
							tRef			=> S_tRef,
							tAtual		=> s_tAtual,
							controlOut	=> s_upD);
							
				radiador	<= s_upD;		
				tAmb 		<= s_tAtual;
				
end compAmbienteBasico;				
