library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity Conversor2Dig is

	port (horaIn 				: in std_logic_vector(4 downto 0);
			minIn 				: in std_logic_vector(5 downto 0);
			horaDez, horaUnd	: out std_logic_vector(3 downto 0);
			minDez, minUnd		: out std_logic_vector(3 downto 0));

end Conversor2Dig;

architecture compConversor2Dig of Conversor2Dig is
signal s_Min, s_Hora : integer;
begin
	
	s_Min <= to_integer(unsigned(minIn));
	s_Hora <= to_integer(unsigned(horaIn));
	
	
	minUnd <= std_logic_vector(to_unsigned((s_Min rem 10), 4));
	minDez <= std_logic_vector(to_unsigned((s_Min / 10), 4));
	
	horaUnd <= std_logic_vector(to_unsigned((s_Hora rem 10), 4));
	horaDez <= std_logic_vector(to_unsigned((s_Hora / 10), 4));
	
end compConversor2Dig;
