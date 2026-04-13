library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

--Declara la interfaz del bloque (entrada y salidas)
entity bcd7seg is
	port(
		data_in : in std_logic_vector(3 downto 0);
		data_out : out std_logic_vector(6 downto 0)
	);
end entity bcd7seg;

--Describe la funcionalidad del bloque

architecture beh_bcd7seg of bcd7seg is
signal data_out_signal : std_logic_vector(6 downto 0);

begin
data_out <= not data_out_signal;
	process(data_in)
	begin
        -- Para numeros
            -- Para los pines del display 7 seg
            -- p  g  f  e  d  c  b  a
            -- 0  0  0  0  0  0  0  0
             case data_in is
                -- Mostrar 0
                when "0000" =>
                    data_out_signal <= "0111111";
                -- Mostrar 1
                when "0001" =>
                    data_out_signal <= "0000110";
                -- Mostrar 2
                when "0010" =>
                    data_out_signal <= "1011011";
                -- Mostrar 3
                when "0011" =>
                    data_out_signal <= "1001111";
                -- Mostrar 4
                when "0100" =>
                    data_out_signal <= "1100110";
                -- Mostrar 5
                when "0101" =>
                    data_out_signal <= "1101101";
                -- Mostrar 6
                when "0110" =>
                    data_out_signal <= "1111100";
                -- Mostrar 7
                when "0111" =>
                    data_out_signal <= "0000111";
                -- Mostrar 8
                when "1000" =>
                    data_out_signal <= "1111111";
                -- Mostrar 9
                when "1001" =>
                    data_out_signal <= "1101111";
                
                -- Mostrar a
                when "1010" =>
                    data_out_signal <= "1011111";
                -- Mostrar b
                when "1011" =>
                    data_out_signal <= "1111100";
                -- Mostrar c
                when "1100" =>
                    data_out_signal <= "0111001";
                -- Mostrar d
                when "1101" =>
                    data_out_signal <= "1011110";
                -- Mostrar e
                when "1110" =>
                    data_out_signal <= "1111001";
                -- Mostrar f
                when "1111" =>
                    data_out_signal <= "1110001";
                when others =>
                    null;
			end case;
	end process;
end architecture;