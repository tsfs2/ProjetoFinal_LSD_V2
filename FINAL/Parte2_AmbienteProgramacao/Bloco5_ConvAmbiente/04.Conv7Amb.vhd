library IEEE;
use IEEE.std_logic_1164.all;

entity Conv7Amb is

	port (en				: in std_logic;
			inPort2  	: in std_logic_vector(3 downto 0);
			inPort1  	: in std_logic_vector(3 downto 0);
			inPort0  	: in std_logic_vector(3 downto 0);
	
			outPort2		: out std_logic_vector(6 downto 0);
			outPort1		: out std_logic_vector(6 downto 0);
			outPort0		: out std_logic_vector(6 downto 0));
			
end Conv7Amb;

architecture compConv7Amb of Conv7Amb is
begin

		outPort0 <="1111111" when (en = '0') else
					  "1111001" when (inPort0 	= "0001") else --1
					  "0100100" when (inPort0 	= "0010") else --2
					  "0110000" when (inPort0 	= "0011") else --3
					  "0011001" when (inPort0 	= "0100") else --4
					  "0010010" when (inPort0 	= "0101") else --5
					  "0000010" when (inPort0 	= "0110") else --6
					  "1111000" when (inPort0 	= "0111") else --7
					  "0000000" when (inPort0 	= "1000") else --8
					  "0010000" when (inPort0 	= "1001") else --9
					  "1000000";
					  
		outPort1 <="1111111" when (en = '0') else
					  "1111001" when (inPort1 	= "0001") else --1
					  "0100100" when (inPort1 	= "0010") else --2
					  "0110000" when (inPort1 	= "0011") else --3
					  "0011001" when (inPort1 	= "0100") else --4
					  "0010010" when (inPort1 	= "0101") else --5
					  "0000010" when (inPort1 	= "0110") else --6
					  "1111000" when (inPort1 	= "0111") else --7
					  "0000000" when (inPort1 	= "1000") else --8
					  "0010000" when (inPort1 	= "1001") else --9
					  "1000000";
					  
		outPort2 <="1111111" when (en = '0') else 
					  "1111001" when (inPort2 	= "0001") else --1
					  "0100100" when (inPort2 	= "0010") else --2
					  "0110000" when (inPort2	= "0011") else --3
					  "0011001" when (inPort2 	= "0100") else --4
					  "0010010" when (inPort2 	= "0101") else --5
					  "0000010" when (inPort2 	= "0110") else --6
					  "1111000" when (inPort2 	= "0111") else --7
					  "0000000" when (inPort2 	= "1000") else --8
					  "0010000" when (inPort2 	= "1001") else --9
					  "1000000";
					  
end compConv7Amb;			
