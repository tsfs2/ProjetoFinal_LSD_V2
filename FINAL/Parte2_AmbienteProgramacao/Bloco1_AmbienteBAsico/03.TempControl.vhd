library IEEE;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;

entity tempControl is
	port (clk				: in std_logic;
			tRef, tAtual 	: in std_logic_vector(8 downto 0);
			controlOut		: out std_logic);
end tempControl;

architecture compTempControl of tempControl is

signal s_maxVal, s_minVal, s_Ref, s_Count : integer;

begin
	
	
	s_Ref		<= to_integer (unsigned (tRef));
	s_Count	<= to_integer (unsigned (tAtual));
	s_minVal <= s_Ref - 20;
	s_maxVal <= s_Ref + 20;
	
	process(clk, tRef)
	begin
		
		if (rising_edge(clk)) then
			if (s_Count <= s_minVal) then
				controlOut <= '1';
			elsif (s_Count >= s_maxVal)	then
				controlOut <= '0';
			end if;
		end if;
	
	end process;

end compTempControl;
