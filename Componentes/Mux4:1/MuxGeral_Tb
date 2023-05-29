library IEEE;
use IEEE.STD_LOGIC_1164.all;
entity MuxGeral is
		port(i0,i1,i2,i3:   	 in std_logic;
			  s: 					 in std_logic_vector(1 downto 0);
			  yout:            out std_logic);
end MuxGeral;



architecture Behavioral of MuxGeral is
begin

		yout<=i0 when (s="00") else
			   i1 when (s="01") else
			   i2 when (s="10") else
				i3;

end Behavioral;
