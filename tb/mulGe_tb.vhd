library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity mulGe_tb is
end entity mulGe_tb;

architecture test_mulGe of mulGe_tb is

	component mulGe
	generic (
		sel_width : natural := 3
	);
	port(
		D   : in std_logic_vector((2**sel_width)-1 downto 0);
		sel : in std_logic_vector(sel_width-1 downto 0);
		EN  : in std_logic;
		Y   : out std_logic;
		W   : out std_logic
	);
	end component;

	signal t_D   : std_logic_vector(7 downto 0);
	signal t_sel : std_logic_vector(2 downto 0);
	signal t_EN  : std_logic;
	signal t_Y   : std_logic;
	signal t_W   : std_logic;

begin

	mul_1 : mulGe
	generic map (
		sel_width => 3
	)
	port map(
		D   => t_D,
		sel => t_sel,
		EN  => t_EN,
		Y   => t_Y,
		W   => t_W
	);

	estimulos: process
	begin
		
		t_EN  <= '0';
		t_D   <= (others => '0');
		t_sel <= "000";
		wait for 1 ms;

		t_D <= "00000001"; t_sel <= "000"; wait for 1 ms;
		t_D <= "00000010"; t_sel <= "001"; wait for 1 ms; 
		t_D <= "00000100"; t_sel <= "010"; wait for 1 ms; 
		t_D <= "00001000"; t_sel <= "011"; wait for 1 ms; 
		t_D <= "00010000"; t_sel <= "100"; wait for 1 ms;
		t_D <= "00100000"; t_sel <= "101"; wait for 1 ms; 
		t_D <= "01000000"; t_sel <= "110"; wait for 1 ms; 
		t_D <= "10000000"; t_sel <= "111"; wait for 1 ms;

		t_EN <= '1';
		wait for 2 ms;

		wait;
	end process;

end architecture test_mulGe;
