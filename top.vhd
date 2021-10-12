library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity top is
	port(
		entrada	:	in std_logic_vector(10 downto 0);		-- Switches utilizados na placa FPGA
		output_1	:	out	std_logic_vector(3 downto 0);		--	Resultado de saida
		output_2	:	out	std_logic_vector(3 downto 0);		--	Resultado de saida
		output_3	:	out	std_logic_vector(3 downto 0);		--	Resultado de saida
		output_4	:	out	std_logic_vector(3 downto 0);		--	Resultado de saida
		output_erro	:	out	std_logic_vector(3 downto 0)	-- Contador de vidas
		);
end top;

architecture hardware of top is

begin

process(entrada)

	variable output_1_temp	:	std_logic_vector(3 downto 0);	-- Variavel temporaria para saída
	variable output_2_temp	:	std_logic_vector(3 downto 0);	-- Variavel temporaria para saída
	variable output_3_temp	:	std_logic_vector(3 downto 0);	-- Variavel temporaria para saída
	variable output_4_temp	:	std_logic_vector(3 downto 0);	-- Variavel temporaria para saída
	variable vidas	:	integer range 5 downto 0;					-- Variavel temporaria para vidas
	
begin
	output_1_temp := "1010";			-- Definindo o estado inicial com "traço" no display
	output_2_temp := "1010";			-- Definindo o estado inicial com "traço" no display
	output_3_temp := "1010";			-- Definindo o estado inicial com "traço" no display
	output_4_temp := "1010";			-- Definindo o estado inicial com "traço" no display
	
	
	if (entrada(0) = '1') then		-- Condiçao para ativar display do numero 0
		output_3_temp := "0000";
	end if;

	if (entrada(1) = '1') then		-- Condiçao para ativar display do numero 1
		output_1_temp := "0001";
	end if;
	
	if (entrada(3) = '1') then		-- Condiçao para ativar display do numero 3
		output_4_temp := "0011";
	end if;
	
	if (entrada(8) = '1') then		-- Condiçao para ativar display do numero 8
		output_2_temp := "1000";
	end if;
	
	vidas := 5;
	
	if (entrada(2) = '1') then		-- Condiçao para perder uma vida (entrada 2)
		vidas := vidas - 1;
	end if;
	
	if (entrada(4) = '1') then		-- Condiçao para perder uma vida (entrada 4)
		vidas := vidas - 1;
	end if;
	
	if (entrada(5) = '1') then		-- Condiçao para perder uma vida (entrada 5)
		vidas := vidas - 1;
	end if;
	
	if (entrada(6) = '1') then		-- Condiçao para perder uma vida (entrada 6)
		vidas := vidas - 1;
	end if;
	
	if (entrada(7) = '1') then		-- Condiçao para perder uma vida (entrada 7)
		vidas := vidas - 1;
	end if;
	
	if (entrada(9) = '1') then		-- Condiçao para perder uma vida (entrada 9)
		vidas := vidas - 1;
	end if;
	
	if vidas = 0 then					-- Condição para perder (P no display)
		output_1_temp := "1011";
		output_2_temp := "1011";
		output_3_temp := "1011";
		output_4_temp := "1011";
	end if;
	
	if ((entrada(0) and entrada(1) and entrada(3) and entrada(8)) = '1') and vidas > 0 then
		output_1_temp := "1100";
		output_2_temp := "1100";
		output_3_temp := "1100";	-- Condição para ganhar (G no display)
		output_4_temp := "1100";
	end if;
	
	if entrada(10) = '1' then		-- Reset para reiniciar o jogo
		vidas := (vidas/vidas) + 4;
		output_1_temp := "1010";
		output_2_temp := "1010";
		output_3_temp := "1010";
		output_4_temp := "1010";
	end if;
		
	
	output_1 <= output_1_temp;		-- Atribuir as variaveis temporarias às variaveis finais
	output_2 <= output_2_temp;		-- Atribuir as variaveis temporarias às variaveis finais
	output_3 <= output_3_temp;		-- Atribuir as variaveis temporarias às variaveis finais
	output_4 <= output_4_temp;		-- Atribuir as variaveis temporarias às variaveis finais
	
	output_erro <= conv_std_logic_vector (vidas, 4); -- Atribuir as variaveis temporarias às variaveis finais
	
end process;

end hardware;

	
	