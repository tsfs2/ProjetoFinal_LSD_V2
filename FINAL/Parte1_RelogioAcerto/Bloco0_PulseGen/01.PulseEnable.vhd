library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity PulseEnable is
	generic(contagem 	: natural := 20);
	port(clkIn	: in std_logic;
		  enable	: in std_logic;
		  clkOut	: out std_logic);
end PulseEnable;

architecture compPulseEnable of PulseEnable is

	signal s_divCounter : natural;

begin
	assert(contagem >= 2);
	
	process(clkIn)
	begin
		if (rising_edge(clkIn)) then
			if (enable = '1') then
				if (s_divCounter = contagem - 1) then
					clkOut		 <= '1';
					s_divCounter <= 0;
				else
					if (s_divCounter /= (contagem - 1)) then
						clkOut	 <= '0';
					end if;
				
					s_divCounter <= s_divCounter + 1;
			
				end if;
			end if;
		end if;
	end process;
end compPulseEnable;
