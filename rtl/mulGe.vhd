library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity mulGe is
  generic (
    sel_width : natural := 3  -- ancho del selector
  );
  port (
    D   : in  std_logic_vector((2**sel_width)-1 downto 0);
    sel : in  std_logic_vector(sel_width-1 downto 0);
    EN  : in  std_logic;
    Y   : out std_logic;
    W   : out std_logic
  );
end entity mulGe;

architecture beh of mulGe is
  signal temp : std_logic;
begin

  process(D, sel, EN)
  begin
    if EN = '0' then
      temp <= D(to_integer(unsigned(sel)));
    else
      temp <= '0';
    end if;
  end process;

  Y <= temp;
  W <= not temp;

end architecture;