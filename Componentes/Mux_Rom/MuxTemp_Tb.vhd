library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity MuxTemp_Tb is
end MuxTemp_Tb;

architecture Behavioral of MuxTemp_Tb is

signal s_s: std_logic_vector(1 downto 0);
signal s_TSol,s_TLua,S_TGel:std_logic_vector(8 downto 0);
signal s_ref: std_logic_vector(8 downto 0);

begin 

uut: entity work.MuxTemp(Behavioral)
	port map(s=>s_s,
				TSol=>s_TSol,
				TLua=>s_TLua,
				TGel=>s_TGel,
				Ref=>s_ref);
				
				
stim_proc:process
begin
	s_TSol<="000010100";
	s_TLua<="000010000";
	s_TGel<="000000100";
	s_s<="00";
	
	
	wait for 20 ns;
	s_s<="01";
	wait for 20 ns;
	s_s<="10";
	wait for 20 ns;
	s_s<="11";
	wait for 20 ns;
	wait;
end process;
end Behavioral;
				
