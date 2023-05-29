library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity FSMrelogio_TB is 
end FSMrelogio_TB;

architecture compFSMrelogio_TB of FSMrelogio_TB is
signal s_clk            			: std_logic;
signal s_up, s_down     			: std_logic;
signal s_tecla							: std_logic;
signal s_modo,s_ud,s_enH,s_enM 	: std_logic;
begin
		FSMm: entity work.FSMrelogio(compFSMRelogio)
				port map (clk		=> s_clk,
							 up		=> s_up,
							 down		=> s_down,
							 tecla	=> s_tecla,
							 modo		=> s_modo,
							 uD		=> s_uD,
							 enH		=> s_enH,
							 enM		=> s_enM);
		
		sync: process
				begin
					s_clk <= '0'; wait for 10 ns;
					s_clk <= '1'; wait for 10 ns;
				end process;	
					
		comb: process
				begin
					s_tecla <= '0'; wait for 20 ns;
					s_tecla <= '1'; wait for 20 ns;
					s_tecla <= '0'; wait for 20 ns;
					s_up	  <= '1'; wait for 50 ns;
					s_up	  <= '0'; wait for 30 ns;
					s_tecla <= '1'; wait for 60 ns;
					s_tecla <= '0'; wait;
				end process;
					
end compFSMrelogio_TB;
