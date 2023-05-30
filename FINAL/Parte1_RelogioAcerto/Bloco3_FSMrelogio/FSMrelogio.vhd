library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity FSMrelogio is 
	port(clk             : in std_logic;
		  up, down        : in std_logic;
		  tecla				: in std_logic;
		  modo,ud,mmH		: out std_logic;
		  enH,enM 			: out std_logic);
end FSMrelogio;

architecture compFSMrelogio of FSMrelogio is
type TState is (NORMAL, MINUTOS, HORAS);

signal pS,nS : TState;

begin 
	
	sync_proc:process(clk)
				 begin 
					if(rising_edge(clk))then
						pS <= nS;
					end if;
		
				 end process;
	
	proc_combin:process(pS, tecla, up, down)
					begin 
						
						case pS is
							
							when NORMAL =>
									modo	<= '0';
									enH	<= '0';
									enM	<= '0';
									ud		<= '1';
									mmH	<= '0';
			
								if (tecla = '1') then nS <= MINUTOS;
													  else ns <= NORMAL;
								end if;
				
							
							when MINUTOS =>
									modo	<= '1';
									enH	<= '0';
									enM	<= '0';
									ud		<= '0';
									mmH	<= '0';
			
								if (tecla = '1') then nS <=HORAS;
													  else nS <=MINUTOS;
								end if;
				
			
								if(up = '1')then
											enM	<='1';
											ud		<='1';
								elsif(down = '1')then
											enM	<='1';
											ud		<='0';
								end if;
							
							when HORAS =>
									modo	<= '1';
									enH	<= '0';
									enM	<= '0';
									ud		<= '0';
									mmH 	<= '1';
			
								if (tecla = '1') then nS <=NORMAL;
													  else nS <=HORAS;
								end if;
				
			
								if(up = '1')then
											enH	<='1';
											ud		<='1';
								elsif(down = '1')then
											enH	<='1';
											ud		<='0';
								end if;
								
						end case;
					end process;
					
end compFSMrelogio;
