library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity tTodas is

	port (clk, enG, enL, enS, uD	: in std_logic;
			tG, tL, tS					: out std_logic_vector(8 downto 0));
end tTodas;

architecture comptTodas of tTodas is
begin

	GEL:	entity work.tGel(comptGel)
			port map (clk		=> clk,
						 enL		=> enG,
						 upD		=> uD,
						 tempOut	=> tG);
						 
	LUA:	entity work.tLua(comptLua)
			port map (clk		=> clk,
						 enL		=> enL,
						 upD		=> uD,
						 tempOut	=> tL);
						 
	SOL:	entity work.tSol(comptSol)
			port map (clk		=> clk,
						 enL		=> enS,
						 upD		=> uD,
						 tempOut	=> tS);
end comptTodas;						 
