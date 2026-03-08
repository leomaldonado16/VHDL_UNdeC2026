library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity tb_mux is
end entity tb_mux;

architecture test_mux of tb_mux is
	
	--Declaración de componentes
	component mux
	port(
		A,B,C,D : in std_logic;
		sel : in std_logic_vector(1 downto 0);
		S : out std_logic
		);
	end component;
	
	--Declaración de señales
	signal t_A ,t_B,t_C,t_D,t_S : std_logic;
	signal t_sel : std_logic_vector(1 downto 0);


begin
	
	--Instanciación de componentes 
	--y sus conexiones
	mux_1 : mux
		port map (
			A => t_A,
			B => t_B,
			C => t_C,
			D => t_D,
			sel => t_sel,
			S => t_S
			);
		
	--Estímulos
	estimulos: process
	begin
		t_sel <= "00";
		wait for 1 ms;
		t_sel <= "01";
		t_A <= '1';
		t_B <= '0';
		wait for 4 ms;
		t_sel <= "11";
		t_D <= '1';
		t_C <= '1';
		wait for 1 ms;
		t_sel <= "10";
		wait for 2 ms;
		t_sel <= "00";
		--wait;
	end process;

end architecture test_mux;