library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity mux3_3 is
		port(i0,i1, i2	  	: in std_logic_vector(2 downto 0);
			  sel     		: in std_logic_vector(1 downto 0);
			  yout    		: out std_logic_vector(2 downto 0));

end mux3_3;

architecture compMux3_3 of mux3_3 is
begin
	
	yout	<=	i0 when(sel = "01") else 
				i1 when(sel = "10") else 
				i2;
	
end compMux3_3;
		 
