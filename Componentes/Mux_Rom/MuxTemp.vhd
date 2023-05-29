library IEEE;
use IEEE.STD_LOGIC_1164.all;
entity MuxTemp is
		port(TGel,TLua,TSol:  in std_logic_vector(8 downto 0);
			  s: 				      	in std_logic_vector(1 downto 0);
			  Ref:              out std_logic_vector(8 downto 0));
end MuxTemp;






architecture Behavioral of MuxTemp is
begin

		Ref<=TGel when (s="01") else
			  TLua when (s="10") else
			  TSol;

		
end Behavioral;
