library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity Minuto is

	generic (contMax: integer :=59);
	port (clk    		: in std_logic;
			enL			: in std_logic;
			upD			: in std_logic;
			minOut		: out std_logic_vector (5 downto 0);
			contFim		: out std_logic);
end Minuto;

architecture compMinuto of Minuto is
signal s_cont : integer range 0 to 59;
begin

	process (clk)
	begin
	
		if (rising_edge(clk)) then
			if (enL = '1') then
				if (upD = '0') then
					s_cont <= s_cont -1;
				elsif (s_cont = contMax) then
					s_cont <= 0;
					contFim <= '0';
				else
					s_cont <= s_cont + 1;
		
					if (s_cont = contMAX - 1) then
						contFim <= '1';
					else
						contFim <= '0';
					end if;
				end if;	
			end if;	
		end if;

		
	end process;
	
	minOut <= std_logic_vector(to_unsigned((s_cont),6));
		
end compMinuto;	
