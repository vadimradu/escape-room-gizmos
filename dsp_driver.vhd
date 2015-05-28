LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity dsp_driver is
  port( clk                     :   in    std_logic;
        dig0, dig1, dig2, dig3  :   in    integer range 0 to 9;
        an_port                 :   out   std_logic_vector(3 downto 0);
        digit_port              :   out   std_logic_vector(7 downto 0));
end entity;

architecture rtl of dsp_driver is
  signal an_counter : std_logic_vector(1 downto 0);
  signal crt_digit : integer range 0 to 9;
begin
  
  process(clk, dig0, dig1, dig2, dig3) is
  begin
    if( rising_edge(clk) then
      an_counter = an_counter +1;
    end if;
    case(an_counter) is
      when "00" : an_port <= "1000";
                  crt_digit <=dig3;
      when "01" : an_port <= "0100";
                  crt_digit <=dig2;
      when "10" : an_port <= "0010";
                  crt_digit <=dig1;
      when "11" : an_port <= "0001";
                  crt_digit <=dig0;
      when others : an_port <= "0000";
                    crt_digit <=0;
    end case;

  end process;

  process (crt_dig) is
  begin
    case(crt_dig) is -- port is organised as a b c d e f g dp
      when 0 : dig_port<="00000011";
      when 1 : dig_port<="10011111";
      when 2 : dig_port<="00100101";
      when 3 : dig_port<="00001101";
      when 4 : dig_port<="10011001";
      when 5 : dig_port<="01001001";
      when 6 : dig_port<="01000001";
      when 7 : dig_port<="00011111";
      when 8 : dig_port<="00000001";
      when 9 : dig_port<="00001001";
      when others : dig_port<="11111111";
    end case;
  end process;
end architecture;
        
