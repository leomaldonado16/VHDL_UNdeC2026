library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity div_freq is
port(
    -- Puertos de Entrada
    reset,clk : in std_logic;
    -- Pines de Salida
    clk1Hz: out std_logic := '0'
);
end div_freq;

architecture beh of div_freq is
    signal conta: unsigned();
    constant const1HZ : integer := 100000000/2;
    signal data_out_aux : std_logic;
    
begin
    clk1Hz <= data_out_aux;
    process(reset,clk) is
    begin
        if (reset = '1') begin
            data_out_aux <= '0';
            conta <= 0;
        elsif (rising_edge(clk)) begin
            if (conta = const1HZ) begin
                data_out_aux <= not data_out_aux;
                conta <= 0;
            else
                conta <= conta + 1;
            end if;
        end if;
    end process;

    clk1Hz <= temp;
end rtl;



