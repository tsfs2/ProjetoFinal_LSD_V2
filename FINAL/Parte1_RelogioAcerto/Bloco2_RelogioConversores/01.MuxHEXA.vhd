library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity MuxHEXA is
		port(i0,i1,i2		:in std_logic_vector(1 downto 0);
			  sel				:in std_logic_vector(1 downto 0);
			  yout			:out std_logic_vector(1 downto 0));
end MuxHEXA;



architecture compMuxHEXA of MuxHEXA is
begin

		yout<=i2 when (sel = "11") else
			   i1 when (sel = "10") else
			   i0;

end compMuxHEXA;
