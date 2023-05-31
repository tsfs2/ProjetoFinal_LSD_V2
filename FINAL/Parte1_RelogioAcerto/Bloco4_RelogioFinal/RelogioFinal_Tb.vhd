library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity RelogioFinal_Tb is
end RelogioFinal_Tb;

architecture compRelogioFinal_Tb of RelogioFinal_Tb is
signal s_clk,s_pulso,s_divF,s_up,s_dw,s_ts: std_logic;

signal s_horaRom : std_logic_vector(4 downto 0);
signal s_hD,s_hU,s_mD,s_mU : std_logic_vector(6 downto 0);

begin
uut: entity work.RelogioFinal(compRelogioFinal)
			port map(clk=>s_clk,
						divF=>s_divF,
						pulso=>s_pulso,
						up=>s_up,
						dw=>s_dw,
						ts=>s_ts,
						horaRom=>s_horaRom,
						hD=>s_hD,
						hU=>s_hU,
						mD=>s_mD,
						mU=>s_mU);
						
						
clock_process:process
begin
    s_clk<='0';
	 wait for 10 ns;
	 s_clk<='1';
	 wait for 10 ns;
end process;

stim_proc:process
begin

	s_pulso<='0';
	s_up<='0';
	s_dw<='0';
	s_ts<='0';
	s_divF<='0';
	
	wait for 20 ns;
	
	s_divF<='0';
	s_pulso<='1';
	s_up<='1';
	s_dw<='0';
	s_ts<='0';
	s_divF<='1';
	
	wait for 20 ns;
	
	s_pulso<='1';
	s_up<='1';
	s_dw<='0';
	s_ts<='1';
	
	wait for 20 ns;
	
	s_pulso<='1';
	s_up<='0';
	s_dw<='1';
	s_ts<='0';
	
	wait for 20 ns;
	
	s_pulso<='1';
	s_up<='1';
	s_dw<='0';
	s_ts<='1';
	
	wait for 20 ns;
	
	s_pulso<='1';
	s_up<='1';
	s_dw<='0';
	s_ts<='0';
	
	wait for 20 ns;
	
	s_pulso<='1';
	s_up<='1';
	s_dw<='0';
	s_ts<='1';
	
	wait for 40 ns;


end process;
end compRelogioFinal_Tb;
		
