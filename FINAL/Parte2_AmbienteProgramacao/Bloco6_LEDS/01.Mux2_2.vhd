library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity mux2_2 is
		port(i0,i1   : in std_logic_vector(1 downto 0);
			  sel     : in std_logic;
			  yout    : out std_logic_vector(1 downto 0));

end mux2_2;

architecture compMux2_2 of mux2_2 is
begin
	
	yout	<=	i1 when(sel = '1') else i0;
	
end compMux2_2;
		 
