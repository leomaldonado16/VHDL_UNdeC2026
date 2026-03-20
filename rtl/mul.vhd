library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- Interfaz
entity mux is
  port (
    D : in std_logic_vector(7 downto 0); -- Entradas D0 a D7
    sel : in std_logic_vector(2 downto 0); -- Selectores S0 S1 S2
    EN : in std_logic; -- Enable (activo en 0)
    Y  : out std_logic; -- salida
    W  : out std_logic  -- salida complementaria
  );
end entity mux;

-- Arquitectura
architecture beh of mux is
  signal temp : std_logic;
begin

  process(D, sel, EN)
  begin
    if EN = '0' then  -- habilitado
      case sel is
        when "000" => temp <= D(0);
        when "001" => temp <= D(1);
        when "010" => temp <= D(2);
        when "011" => temp <= D(3);
        when "100" => temp <= D(4);
        when "101" => temp <= D(5);
        when "110" => temp <= D(6);
        when "111" => temp <= D(7);
        when others => temp <= '0';
      end case;
    else
      temp <= '0'; -- deshabilitado
    end if;
  end process;

  Y <= temp;
  W <= not temp;

end architecture;