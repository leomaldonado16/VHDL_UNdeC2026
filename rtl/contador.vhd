library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL; 

entity contador_binario is
    Port ( clk    : in  STD_LOGIC;      -- Señal de reloj
           reset  : in  STD_LOGIC;      -- Reset asíncrono
           count  : out STD_LOGIC_VECTOR(3 downto 0) -- Salida de 4 bits (0 a 15)
    );
end contador_binario;

architecture Behavioralcont of contador_binario is
    -- Señal interna para realizar la suma
    signal cuenta : unsigned(3 downto 0) := (others => '0');
begin

    process(clk, reset)
    begin
        if reset = '1' then
            -- Reset asíncrono: vuelve a cero inmediatamente
            cuenta <= (others => '0');
        elsif rising_edge(clk) then
            -- En cada flanco de subida, incrementamos
            cuenta <= registro_cuenta + 1;
        end if;
    end process;

    -- Pasamos el valor de la señal interna a la salida
    count <= std_logic_vector(cuenta);

end Behavioral;