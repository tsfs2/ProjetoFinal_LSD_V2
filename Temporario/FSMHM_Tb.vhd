library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity FSM_HM_Tb is
end FSM_HM_Tb;

architecture Behavioral of FSM_HM_Tb is

signal s_clk,s_keyp,s_keyn,s_s : std_logic;
signal s_enH,s_enM,s_modo,s_ud : std_logic;
		 
begin
 uut:entity work.FSM_HM(Behav_HM)
        port map(clk=>s_clk,
					  keyp=>s_keyp,
					  keyn=>s_keyn,
					  s=>s_s,
					  enH=>s_enH,
					  enM=>s_enM,
					  modo=>s_modo,
					  ud=>s_ud);
					  
clock_process:process
				  begin
						s_clk<='0'; wait for 10 ps;
						s_clk<='1';	wait for 10 ps;
				  end process;

stim_proc:process
			 begin
			 
				--normal
				s_s	 <= '0';
				s_keyp <= '0';
				s_keyn <= '0';
				wait for 2 ns;
				
				s_s	 <= '1';
				wait for 2 ns;
				
				s_keyp <= '1';
				wait for 2 ns;
				
				s_keyp <= '0';
				s_keyn <= '1';
				wait for 2 ns;
				
				s_s	 <= '1';
				s_keyp <= '0';
				s_keyn <= '0';
				wait for 20 ps;
				
				s_s	 <= '1';
				wait for 2 ns;
		
end process;
end Behavioral;
