library IEEE;
use IEEE.STD_LOGIC_1164.all;
entity Mux4 is
		port(i0,i1,i2,i3	:in std_logic;
			  sel				:in std_logic_vector(1 downto 0);
			  yout			:out std_logic);
end Mux4;



architecture compMux4 of Mux4 is
begin

		yout<=i0 when (sel = "00") else
			   i1 when (sel = "01") else
			   i2 when (sel = "10") else
				i3;

end compMux4;
