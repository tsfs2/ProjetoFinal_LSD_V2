library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity FSM_HM is 
	port(clk             : in std_logic;
		  keyp,keyn       : in std_logic;
		  s               : in std_logic;
		  enH,enM,modo,ud : out std_logic);
end FSM_HM;

architecture Behav_HM of FSM_HM is
	type TState is(NORMAL,MINUTOS,HORAS);
signal s_currentState,s_nextState:TState;
begin 
	
	sync_proc:process(clk)
	begin 
		if(rising_edge(clk))then
				s_currentState<=s_nextState;
		end if;
	end process;
	
	proc_combin:process(s_currentState)
	begin 
		case(s_currentState)is
			when NORMAL =>
				enH<='0';
				enM<='0';
				modo<='0';
				ud<='1';
				
				if(s='1')then
					s_nextState<=MINUTOS;
				else
					s_nextState<=NORMAL;
				end if;
				
			when MINUTOS =>
				enH<='0';
				modo<='1';
				
				if(s='1')then
					s_nextState<=HORAS;
				else
					s_nextState<=MINUTOS;
				end if;
				
				if(keyp='1')then
					ud<='1';
					enM<='1';
				elsif(keyn='1')then
					ud<='0';
					enM<='1';
				else
					enM<='0';
				end if;
				
			when HORAS =>
				enM<='0';
				modo<='1';
				if(s='1')then
					s_nextState<=NORMAL;
				else
					s_nextState<=HORAS;
				end if;
				
				if(keyp='1')then
					ud<='1';
					enM<='1';
				elsif(keyn='1')then
					ud<='0';
					enM<='1';
				else
					enM<='0';
				end if;
				
			end case;
			
		end process;
	end Behav_HM;
