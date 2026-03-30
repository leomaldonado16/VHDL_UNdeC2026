library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity mul_tb is
end entity mul_tb;

architecture test_mul of mul_tb is

	-- Declaración del componente
	component mul
	port(
		D   : in std_logic_vector(7 downto 0);
		sel : in std_logic_vector(2 downto 0);
		EN  : in std_logic;
		Y   : out std_logic;
		W   : out std_logic
	);
	end component;

	-- Señales de prueba
	signal t_D   : std_logic_vector(7 downto 0);
	signal t_sel : std_logic_vector(2 downto 0);
	signal t_EN  : std_logic;
	signal t_Y   : std_logic;
	signal t_W   : std_logic;

begin

	-- Instanciación
	mul_1 : mul
	port map(
		D   => t_D,
		sel => t_sel,
		EN  => t_EN,
		Y   => t_Y,
		W   => t_W
	);

	-- Estímulos
	estimulos: process
	begin
		
		-- Inicialización
		t_EN <= '0'; -- habilitado
		t_D  <= "00000000";
		
		-- Prueba D0
		t_D <= "00000001";
		t_sel <= "000";
		wait for 1 ms;
		
		-- Prueba D1
		t_D <= "00000010";
		t_sel <= "001";
		wait for 1 ms;

		-- Prueba D2
		t_D <= "00000100";
		t_sel <= "010";
		wait for 1 ms;

		-- Prueba D3
		t_D <= "00001000";
		t_sel <= "011";
		wait for 1 ms;

		-- Prueba D4
		t_D <= "00010000";
		t_sel <= "100";
		wait for 1 ms;

		-- Prueba D5
		t_D <= "00100000";
		t_sel <= "101";
		wait for 1 ms;

		-- Prueba D6
		t_D <= "01000000";
		t_sel <= "110";
		wait for 1 ms;

		-- Prueba D7
		t_D <= "10000000";
		t_sel <= "111";
		wait for 1 ms;

		-- Deshabilitar
		t_EN <= '1';
		wait for 2 ms;

		wait;
	end process;

end architecture test_mul;