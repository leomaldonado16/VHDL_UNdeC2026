library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

--Declara la interfaz del bloque
entity mux is
  port (
    A,B,C,D : in std_logic;
    sel : in std_logic_vector(1 downto 0);
    S : out std_logic
    );
end entity mux;

--Describe la funcionalidad del bloque
architecture beh of mux is
begin
  
  --proceso secuencial
  process(A,B,C,D,sel)
  begin
    case sel is
      when "00" =>
        S <= A;
      when "01" =>
        S <= B;
      when "10" =>
        S <= C;
      when "11" =>
        S <= D;
      when others =>
        null;
     end case;     
    end process;
       
end architecture;
