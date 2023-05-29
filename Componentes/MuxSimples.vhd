library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity MuxSimples is
		port(i0,i1   : in std_logic;
			  s       : in std_logic;
			  yout    : out std_logic);

end MuxSimples;

architecture Behavioral of MuxSimples is
begin
	
	yout<=i1 when(s='1')else i0;
	
end Behavioral;
		 
