library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity TempSala is

	generic (contMax: integer :=511);
	port (clk    		: in std_logic;
			enL			: in std_logic;
			upD			: in std_logic;
			tempOut		: out std_logic_vector (8 downto 0));
end TempSala;

architecture compTempSala of TempSala is
signal s_cont : integer range 0 to 511;

begin
	
	process (clk)
	begin
	
		if (rising_edge(clk)) then
			if (enL = '1') then
				if (upD = '0') then
					s_cont <= s_cont -1;
				elsif (s_cont >= contMax) then
					s_cont <= 0;
				else
					s_cont <= s_cont + 1;
				end if;	
			end if;	
		end if;

		
	end process;
	
	tempOut <= std_logic_vector(to_unsigned((s_cont),9));
		
end compTempSala;	
