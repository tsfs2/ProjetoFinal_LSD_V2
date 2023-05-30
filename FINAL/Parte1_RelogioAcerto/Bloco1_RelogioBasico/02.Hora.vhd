library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity Hora is

	generic (contMax: integer :=23);
	port (clk 			: in std_logic;
			enL	: in std_logic;
			upD			: in std_logic;
			horaOut		: out std_logic_vector (4 downto 0));
end Hora;

architecture compHora of Hora is
signal s_cont : integer range 0 to 23;
begin

	process (clk)
	begin
		
		if (rising_edge(clk)) then
			if (enL = '1') then
				if (upD = '0') then
					s_cont <= s_cont -1;
				elsif (s_cont = contMax) then
					s_cont <= 0;
				else
					s_cont <= s_cont + 1;
				end if;
			end if;	
		end if;	
	end process;
	
	horaOut <= std_logic_vector(to_unsigned((s_cont),5));
	
end compHora;	
