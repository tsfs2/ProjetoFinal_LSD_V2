library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity FSMrelogio_Tb is
end FSMrelogio_Tb;

architecture compFSMrelogio_Tb of FSMrelogio_Tb is

signal s_clk,s_up,s_down,s_tecla: std_logic;
 
signal s_modo,s_ud,s_mmH,s_enH,s_enM: std_logic;

begin

uut: entity work.FSMrelogio(compFSMrelogio)
			port map(clk=>s_clk,
						up=>s_up,
						down=>s_down,
						tecla=>s_tecla,
						modo=>s_modo,
						ud=>s_ud,
						mmH=>s_mmH,
						enH=>s_enH,
						enM=>s_enM);
			
			
clock_process:process
begin
    s_clk<='0';
	 wait for 10 ns;
	 s_clk<='1';
	 wait for 10 ns;
end process;

stim_proc:process
begin

	 s_up<='0';
	 s_down<='0';
	 s_tecla<='0';
	 
	 wait for 40 ns;
	 
	 s_up<='1';
	 s_down<='0';
	 s_tecla<='0';
	 
	 wait for 40 ns;
	 
	 s_up<='1';
	 s_down<='0';
	 s_tecla<='1';
	 
	 wait for 40 ns;
	 
	 s_up<='0';
	 s_down<='1';
	 s_tecla<='0';
	 
	 wait for 40 ns;
	 
	 s_up<='1';
	 s_down<='1';
	 s_tecla<='0';
	 
	 wait for 40 ns;
	 
	 s_up<='1';
	 s_down<='1';
	 s_tecla<='1';
	 
	 wait for 40 ns;
	 
	 
	 s_up<='0';
	 s_down<='0';
	 s_tecla<='0';
	 
	 wait for 40 ns;
	 
	 s_up<='0';
	 s_down<='0';
	 s_tecla<='1';
	 
	 wait for 40 ns;
	 
	 s_up<='0';
	 s_down<='0';
	 s_tecla<='1';
	 
	 wait for 40 ns;
	 
			



end process;
end compFSMrelogio_Tb;
