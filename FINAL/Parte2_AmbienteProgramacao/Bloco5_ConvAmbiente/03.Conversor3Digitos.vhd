library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity ConversorAmbiente is

	port (tempIn					: in std_logic_vector(8 downto 0);
			t10, t1, t01			: out std_logic_vector(3 downto 0));

end ConversorAmbiente;

architecture compConversorAmbiente of ConversorAmbiente is
signal s_temp : integer;
begin
	
	s_temp <= to_integer(unsigned(tempIn));
	
	t01  	 <= std_logic_vector(to_unsigned((s_temp rem 10), 4));
	t1 	 <= std_logic_vector(to_unsigned(((s_temp / 10) rem 10), 4));
	t10	 <= std_logic_vector(to_unsigned((s_temp / 100), 4));
	
end compConversorAmbiente;
