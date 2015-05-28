LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity sec_clock_generator is
  port( clk_32k   :   in  std_logic;    --32.768 kHz input for accurate clock generation
        rst_n     :   in  std_logic;    --async resest input
        clk_digit :   out std_logic;    --16kHz clock for digit multiplexing
        clk_1sec  :   out std_logic);    -- 1 second clock output
end entity;

architecture rtl  of sec_clock_generator  is
  signal counter : std_logic_vector(15 downto 0) := (others => '0');
  begin
end architecture;
