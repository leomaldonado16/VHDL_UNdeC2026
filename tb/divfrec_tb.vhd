library IEEE;
use IEEE.std_logic_1164.all;

entity divfrec_tb is
end entity;

architecture div_freq of divfrec_tb is

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
    signal clk1Hz : std_logic := '0'; --ver

begin

    mi_divisor : div_freq;

    portmap(clk => clk_tb,
            reset => reset_tb,
            clk1Hz =>clk1Hz_tb);



process
begin
    clk1Hz_tb <= '0';
     wait for 1 ms;
    clk1Hz_tb <= '1';
    wait for 1 ms;
end process;

reset_tb <= 0 

    

end architecture;