library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity decodificador is
	port(
		x_decod	:	in	std_logic_vector(3 downto 0);		-- Entrada do decodificador (4 bits)
		y_decod	:	out	std_logic_vector(6 downto 0)	-- Saída do decodificador (7 bits)
		);
end decodificador;

architecture hex of decodificador is

signal ytemp_decod	:	std_logic_vector(6 downto 0);	-- Saída temporária

begin
	process(x_decod)
	begin
		case x_decod is
			when "0000" => ytemp_decod <= "0111111"; -- Display exibindo 0
			when "0001" => ytemp_decod <= "0000110"; -- Display exibindo 1
			when "0010" => ytemp_decod <= "1011011"; -- Display exibindo 2
			when "0011" => ytemp_decod <= "1001111"; -- Display exibindo 3
			when "0100" => ytemp_decod <= "1100110"; -- Display exibindo 4
			when "0101" => ytemp_decod <= "1101101"; -- Display exibindo 5
			when "0110" => ytemp_decod <= "1111101"; -- Display exibindo 6
			when "0111" => ytemp_decod <= "0000111"; -- Display exibindo 7
			when "1000" => ytemp_decod <= "1111111"; -- Display exibindo 8
			when "1001" => ytemp_decod <= "1101111"; -- Display exibindo 9
			when "1010" => ytemp_decod <= "0001000"; -- Display exibindo traço
			when "1011" => ytemp_decod <= "1110011"; -- Display exibindo P
			when "1100" => ytemp_decod <= "0111101"; -- Display exibindo G
			when others => ytemp_decod <= "0001000";
		end case;
	end process;
	y_decod <= not ytemp_decod;		-- Atribuindo o valor temporário à saída do decodificador
end hex;