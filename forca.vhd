library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity forca is
	port(
		V_SW	:	in	std_logic_vector(10 downto 0);		-- Vetor de entrada
		HEX4	:	out	std_logic_vector(6 downto 0);		-- Saída para o display
		HEX3	:	out	std_logic_vector(6 downto 0);		-- Saída para o display
		HEX2	:	out	std_logic_vector(6 downto 0);		-- Saída para o display
		HEX1	:	out	std_logic_vector(6 downto 0);		-- Saída para o display
		HEX0	:	out	std_logic_vector(6 downto 0)		-- Saída para o display
		);
		
end forca;

architecture behavior of forca is

	signal output_1_main : std_logic_vector(3 downto 0);	-- Sinais da maquina de estados
	signal output_2_main : std_logic_vector(3 downto 0);	-- Sinais da maquina de estados
	signal output_3_main : std_logic_vector(3 downto 0);	-- Sinais da maquina de estados
	signal output_4_main : std_logic_vector(3 downto 0);	-- Sinais da maquina de estados
	signal output_erro_main : std_logic_vector(3 downto 0);	-- Sinais da maquina de estados
	
	signal y1_decod	:	std_logic_vector(6 downto 0);		-- Sinais do decodificador
	signal y2_decod	:	std_logic_vector(6 downto 0);		-- Sinais do decodificador
	signal y3_decod	:	std_logic_vector(6 downto 0);		-- Sinais do decodificador
	signal y4_decod	:	std_logic_vector(6 downto 0);		-- Sinais do decodificador
	signal y_erro_decod	:	std_logic_vector(6 downto 0);	-- Sinais do decodificador
	
	
-- Declaração dos componentes

	component top is
	port(
		entrada	:	in std_logic_vector(10 downto 0);
		output_1	:	out	std_logic_vector(3 downto 0);
		output_2	:	out	std_logic_vector(3 downto 0);
		output_3	:	out	std_logic_vector(3 downto 0);
		output_4	:	out	std_logic_vector(3 downto 0);
		output_erro	:	out	std_logic_vector(3 downto 0)
		);
	end component;
	
	component decodificador is
	port(
		x_decod	:	in	std_logic_vector(3 downto 0);
		y_decod	:	out	std_logic_vector(6 downto 0)
		);
	end component;
	
begin

	out_main	:	top port map (V_SW(10 downto 0), output_1_main, output_2_main, output_3_main, output_4_main, output_erro_main);
	
	out_decod_0	:	decodificador port map (output_1_main, y1_decod);			-- Obtendo a saída no formato para o display
	out_decod_1	:	decodificador port map (output_2_main, y2_decod);			-- Obtendo a saída no formato para o display
	out_decod_2	:	decodificador port map (output_3_main, y3_decod);			-- Obtendo a saída no formato para o display
	out_decod_3	:	decodificador port map (output_4_main, y4_decod);			-- Obtendo a saída no formato para o display
	out_decod_4	:	decodificador port map (output_erro_main, y_erro_decod);	-- Obtendo a saída no formato para o display
	
	HEX3(6 downto 0) <= y1_decod;			-- Atribuindo o valor de saída ao display
	HEX2(6 downto 0) <= y2_decod;			-- Atribuindo o valor de saída ao display
	HEX1(6 downto 0) <= y3_decod;			-- Atribuindo o valor de saída ao display
	HEX0(6 downto 0) <= y4_decod;			-- Atribuindo o valor de saída ao display
	HEX4(6 downto 0) <= y_erro_decod;		-- Atribuindo o valor de saída ao display
	
end behavior;
	
	
	