library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity MuxAMB is
		port(TGel,TLua,TSol	: in std_logic_vector(8 downto 0);
			  sel					: in std_logic_vector(1 downto 0);
			  tRef				: out std_logic_vector(8 downto 0));
end MuxAMB;



architecture compMuxAMB of MuxAMB is
begin

		tRef	<=	TGel when (sel = "01") else
					TLua when (sel = "10") else
					TSol;

		
end compMuxAMB;
