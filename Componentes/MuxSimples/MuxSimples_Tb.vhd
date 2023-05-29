library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity MuxSimples_Tb is
end MuxSimples_Tb;

architecture Behavioral of MuxSimples_Tb is

signal s_s         : std_logic;
signal s_i0,s_i1   :std_logic;
signal s_yout      : std_logic;

begin 

uut: entity work.MuxSimples(Behavioral)
	port map(s=>s_s,
				i0=>s_i0,
				i1=>s_i1,
				yout=>s_yout);
				
				
stim_proc:process
begin
	s_i0<='0';
	s_i1<='0';
	wait for 20 ns;
	s_s<='1';
	wait for 40 ns;
	s_s<='0';
	wait for 40 ns;
	s_s<='1';
	wait;
end process;
end Behavioral;
				
