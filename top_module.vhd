LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity top_module
  port( clk:    in  std_logic;
        an:     out std_logic_vector(3 downto 0);
        cx:     out std_logic_vector(7 downto 0);
        rst_n:  in  std_logic;
        start:  in  std_logic);
end entity;

architecture rtl of top_module is
  signal clk_digit :  std_logic;
  signal clk_1sec  :  std_logic;
  signal dig0, dig1, dig2, dig3 : integer range 0 to 9
begin
  component sec_clock_generator is
    port( clk_32k   :   in  std_logic;    --32.768 kHz input for accurate clock generation
        rst_n     :   in  std_logic;    --async resest input
        clk_digit :   out std_logic;    --16kHz clock for digit multiplexing
        clk_1sec  :   out std_logic);    -- 1 second clock output
  end component;
  component dsp_driver is
    port( clk                     :   in    std_logic;
        dig0, dig1, dig2, dig3  :   in    integer range 0 to 9;
        an_port                 :   out   std_logic_vector(3 downto 0);
        digit_port              :   out   std_logic_vector(7 downto 0));
  end component;
  sec_gen_inst :  sec_clock_generator port map( clk_32k <= clk, rst_n <= rst_n, clk_digit <= clk_digit, clk_1sec <=clk_1sec);
  
  process ( clk_1sec) is
    if (start = '0') then
     dig3 = 6; dig2 <= 0; dig1 <=0; dig0 <= 0;
    elsif(rising_edge(clk_1sec))then
      --todo: clock stuff
    end if;
  end process;
  dsp_driver_inst: dsp_driver port map( clk<=clk_digit, dig0<=dig0, dig1<=dig1, dig2<=dig2, dig3<=dig3, an_port<=an, cx_port<=cx);
  --todo: add logic for number composition
end architecture;
