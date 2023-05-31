library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity RelogioBasico_Tb is
end RelogioBasico_Tb;

architecture compRelogioBasico_Tb of RelogioBasico_Tb is

signal s_clk,s_pulso,s_modo,s_upD,s_enM,s_enH: std_logic;

signal s_minOut: std_logic_vector(5 downto 0);
signal s_horOut: std_logic_vector(4 downto 0);


begin 

uut: entity work.RelogioBasico(compRelogioBasico)
	port map(clk=>s_clk,
				pulso=>s_pulso,
				modo=>s_modo,
				upD=>s_upD,
				enM=>s_enM,
				enH=>s_enH,
				minOut=>s_minOut,
				horOut=>s_horOut);
				
				
				
				
clock_process:process
begin
    s_clk<='0';
	 wait for 10 ns;
	 s_clk<='1';
	 wait for 10 ns;
end process;
				
				
stim_proc:process
begin

	s_modo<='0';
	s_pulso<='0';
	s_upD<='1';
	s_enM<='0';
	s_enH<='0';
	
	wait for 40 ns;
	
	s_modo<='0';
	s_pulso<='0';
	s_upD<='0';
	s_enM<='0';
	s_enH<='0';
	
	wait for 40 ns;
	
	s_modo<='1';
	s_pulso<='1';
	s_upD<='1';
	s_enM<='0';
	s_enH<='0';
	
	wait for 40 ns;
	
	s_modo<='1';
	s_pulso<='1';
	s_upD<='1';
	s_enM<='1';
	s_enH<='0';
	
	wait for 40 ns;
	
	s_modo<='1';
	s_pulso<='1';
	s_upD<='1';
	s_enM<='0';
	s_enH<='1';
	
	wait for 40 ns;
	
	s_modo<='1';
	s_pulso<='1';
	s_upD<='1';
	s_enM<='1';
	s_enH<='1';
	
	wait for 40 ns;
	wait;
end process;
end compRelogioBasico_Tb;

