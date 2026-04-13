library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity contador_tb is
end contador_tb;

architecture Behavioral of contador_tb is

    -- Señales para conectar con el DUT (Device Under Test)
    signal clk   : STD_LOGIC := '0';
    signal reset : STD_LOGIC := '0';
    signal count : STD_LOGIC_VECTOR(3 downto 0);

    -- Instancia del contador
    component contador_binario
        Port ( clk    : in  STD_LOGIC;
               reset  : in  STD_LOGIC;
               count  : out STD_LOGIC_VECTOR(3 downto 0)
        );
    end component;

begin

    -- Instanciación del DUT
    uut: contador_binario
        port map (
            clk   => clk,
            reset => reset,
            count => count
        );

    -- Generación de reloj (periodo = 10 ns)
    clk_process : process
    begin
        while true loop
            clk <= '0';
            wait for 5 ns;
            clk <= '1';
            wait for 5 ns;
        end loop;
    end process;

    -- Estímulos
    stim_proc: process
    begin
        -- Aplicar reset
        reset <= '1';
        wait for 20 ns;

        -- Quitar reset
        reset <= '0';

        -- Dejar correr el contador
        wait for 200 ns;

        -- Volver a aplicar reset en medio
        reset <= '1';
        wait for 20 ns;
        reset <= '0';

        -- Continuar simulación
        wait for 100 ns;

        -- Finalizar simulación
        wait;
    end process;

end Behavioral;