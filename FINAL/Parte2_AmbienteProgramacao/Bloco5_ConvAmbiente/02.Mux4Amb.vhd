library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Mux4AMB is
		port(tNormal,TGel,TLua,TSol	: in std_logic_vector(8 downto 0);
			  sel								: in std_logic_vector(1 downto 0);
			  tRef							: out std_logic_vector(8 downto 0));
end Mux4AMB;



architecture compMux4AMB of Mux4AMB is
begin

		tRef	<=	TGel when (sel = "01") else
					TLua when (sel = "10") else
					TSol when (sel = "11") else
					tNORMAL;

		
end compMux4AMB;
