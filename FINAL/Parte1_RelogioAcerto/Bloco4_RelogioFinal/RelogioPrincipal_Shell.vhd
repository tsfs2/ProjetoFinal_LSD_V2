library IEEE;
use ieee.std_logic_1164.all;

entity RelogioFinal is

	port (clk, pulso, div	: in std_logic;
			up, dw, tS			: in std_logic;
			hD, hU, mD, mU		: out std_logic_vector(6 downto 0));
end RelogioFinal;

architecture compRelogioFinal of RelogioFinal is
--sinais de saida da FSM
signal s_modo, s_mmH, s_ud, s_enM, s_enH	: std_logic;
--sinais de saida do RelogioBasico
signal s_minCont									: std_logic_vector(5 downto 0);
signal s_horCont									: std_logic_vector(4 downto 0);


begin
		
		FSMrel:	entity work.FSMrelogio(compFSMrelogio)
					port map (clk		=> clk,
								 up		=> up,
								 down		=> dw,
								 tecla	=> tS,
								 modo		=> s_modo,
								 uD		=> s_uD,
								 mmH		=> s_mmH,
								 enM		=> s_enM,
								 enH		=> s_enH);
								 
		relBas:	entity work.RelogioBasico(compRelogioBasico)
					port map(clk		=> clk,
								pulso		=> pulso,
								upD		=> s_uD,
								modo		=> s_modo,
								enM		=> s_enM,
								enH		=> s_enH,
								minOut	=> s_minCont,
								horOut	=> s_horCont);
								
		convRel:	entity work.ConversorRelogio(compConversorRelogio)
					port map (pulseIn	=> div,
								 modo		=> s_modo,
								 mmH		=> s_mmH,
								 minuIn	=> s_minCont,
								 horaIn	=> s_horCont,
								 horaD	=> hD,
								 horaU	=> hU,
								 minuD	=> mD,
								 minuU	=> mU);

end compRelogioFinal;								 
