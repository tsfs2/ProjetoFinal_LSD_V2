library ieee;
use ieee.std_logic_1164.all;

entity RelogioBasico is

port (clk, pulso, modo	: in std_logic;
		upD, enM, enH		: in std_logic;
		minOut				: out std_logic_vector(5 downto 0);
		horOut				: out std_logic_vector(4 downto 0));
end RelogioBasico;

architecture compRelogioBasico of RelogioBasico is

	signal s_minMux, s_horMux 	: std_logic;
	signal s_contFim				: std_logic;

begin
	
	muxMin:	entity work.mux2_1Modo(compMux2_1Modo)
				port map (i0	=> pulso,
							 i1	=> enM,
							 sel	=> modo,
							 yOut	=> s_minMux);
							 
	Minutos:	entity work.Minuto(compMinuto)
				port map (clk		=> clk,
							 enL		=> s_minMux,
							 upD		=> upD,
							 minOut	=> minOut,
							 contFim	=> s_contFim);
							 
	muxHrs:	entity work.mux2_1Modo(compMux2_1Modo)
				port map (i0	=> (pulso and s_contFim),
							 i1	=> enH,
							 sel	=> modo,
							 yOut	=> s_horMux);
	
	Horas:	entity work.Hora(compHora)
				port map (clk		=> clk,
							 enL		=> s_horMux,
							 upD		=> upD,
							 horaOut	=> horOut);
end compRelogioBasico;							 
