library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity romTemp is
	port(horas		: in std_logic_vector(4 downto 0);
		  tAtual		: out std_logic_vector(1 downto 0));
end romTemp;

architecture compRomTemp of romTemp is
	subtype tipo is std_logic_vector(1 downto 0);
	type tipoROM is array(0 to 23) of tipo;
	constant c_memory : tipoROM :=("01","01","01","01","01",													 --00:00 - 04:00
											 "10","10",                											 	 --05:00 - 06:00
											 "11","11","11","11","11","11","11","11","11","11","11", 		 --07:00 - 17:00
											 "10","10",																		 --18:00 - 19:00
											 "01","01","01","01", others=> "00");       							 --20:00 - 23:00
											 
	begin 
	
		tAtual<=c_memory(to_integer(unsigned(horas)));
		end compRomTemp;
