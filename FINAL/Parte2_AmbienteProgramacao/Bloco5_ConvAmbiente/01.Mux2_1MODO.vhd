library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity mux2_1Modo is
		port(i0,i1   : in std_logic;
			  sel     : in std_logic;
			  yout    : out std_logic);

end mux2_1Modo;

architecture compMux2_1Modo of mux2_1Modo is
begin
	
	yout<=i1 when(sel = '1') else i0;
	
end compMux2_1Modo;
