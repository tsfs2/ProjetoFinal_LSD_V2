library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity ROMFp_Tb is
end ROMFp_Tb;

architecture Behavioral of ROMFp_Tb is

signal s_horas: std_logic_vector(4 downto 0);
signal s_indicador: std_logic_vector(1 downto 0);

begin 

uut: entity work.ROMFp(Behavioral)
	port map(horas=>s_horas,
				indicador=>s_indicador);
				
				
stim_proc:process
begin
	s_horas<="01000";
	wait for 20 ns;
	s_horas <="10100";
	wait for 40 ns;
	s_horas<="10010";
	wait for 40 ns;
	
	s_horas<="00000";
	wait for 40 ns;
	s_horas<="11111";
	wait;

end process;
end Behavioral;
				
