library IEEE;
use IEEE.std_logic_1164.all;

entity div_freq_tb is
end entity;

architecture prueba of div_freq_tb is

    component div_freq is
        port(
            -- Puertos de Entrada
            reset, clk : in std_logic;
            -- Pines de Salida
            clk1Hz : out std_logic
        );
    end component;

    -- Declaración de señales
    signal reset  : std_logic := '1';
    signal clk    : std_logic := '0';
    signal clk1Hz : std_logic := '0';

begin

    -- Instancia del DUT
    cont: div_freq port map(reset, clk, clk1Hz);

    -- Generación de clock (50 MHz)
    clk <= not clk after 10 ns;

    -- Generación de estímulos (RESET correcto)
    process
    begin
        reset <= '0';      -- activar reset
        wait for 50 ns;

        reset <= '1';      -- liberar reset

        -- tiempo suficiente para observar funcionamiento
        wait for 2 sec;

        wait;
    end process;

end architecture;