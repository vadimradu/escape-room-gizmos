entity dsp_driver is
  port( clk                     :   in    std_logic;
        dig0, dig1, dig2, dig3  :   in    integer range 0 to 9;
        an_port                 :   out   std_logic_vector(3 downto 0);
        digit_port              :   out   std_logic_vector(7 downto 0));
end entity;

architecture rtl of dsp_driver is
begin
  
  process(clk, dig0, dig1, dig2, dig3) is
  begin
  --todo: an switching
  end process;

  process (clk, crt_dig) is
  begin
  --todo: integer to 7seg conversion
  end process;
end architecture;
        
