library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity FSMambiente is 
	port(clk             : in std_logic;
		  up, down        : in std_logic;
		  tecla				: in std_logic;
		  stOut				: out std_logic_vector(1 downto 0);
		  modo,ud			: out std_logic;
		  eG,eL, eS			: out std_logic);
end FSMambiente;

architecture compFSMambiente of FSMambiente is
type TState is (NORMAL, GEL, LUA, SOL);

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
									stOut <= "00";
									eG		<= '0';
									eL		<=	'0';
									eS		<=	'0';
			
								if (tecla = '1') then nS <= GEL;
													  else ns <= NORMAL;
								end if;
				
							
							when GEL =>
									modo	<= '1';
									stOut <= "01";
									eG		<= '0';
									eL		<=	'0';
									eS		<=	'0';
			
								if (tecla = '1') then nS <= LUA;
													  else nS <= GEL;
								end if;
				
			
								if(up = '1')then
									eG		<='1';
									ud		<='1';
								elsif(down = '1')then
									eG		<='1';
									ud		<='0';
								end if;
							
							when LUA =>
									modo	<= '1';
									stOut <= "10";
									eG		<=	'0';
									eL		<= '0';
									eS		<=	'0';
			
								if (tecla = '1') then nS <= SOL;
													  else nS <= LUA;
								end if;
				
			
								if(up = '1')then
									eL		<='1';
									ud		<='1';
								elsif(down = '1')then
									eL		<='1';
									ud		<='0';
								end if;
								
							when SOL =>
									modo	<= '1';
									stOut <= "11";
									eG		<= '0';
									eL		<=	'0';
									eS		<=	'0';
			
								if (tecla = '1') then nS <= NORMAL;
													  else nS <= SOL;
								end if;
				
			
								if(up = '1')then
									eS		<='1';
									ud		<='1';
								elsif(down = '1')then
									eS		<='1';
									ud		<='0';
								end if;	
								
						end case;
					end process;
					
end compFSMambiente;
