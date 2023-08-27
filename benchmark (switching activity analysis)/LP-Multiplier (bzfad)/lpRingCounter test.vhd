---------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
entity test_ring is
end;
-----
architecture LPMUL of test_ring is
  component evRingCounter_GtdClk is -- ring counter with gated clock
    generic (wdt : integer; 
             block_size : integer := 8);
    port (reset_n: in  std_logic;
          clock:   in  std_logic;
          dout:out std_logic_vector(wdt-1 downto 0);
          sa:  out integer);
  end component;
  component evRingCounter is
    generic (wdt: integer);
    port (reset_n: in  std_logic;
          clock:   in  std_logic;
          dout:out std_logic_vector(wdt-1 downto 0);
          sa:  out integer);
  end component;
  
  signal rst, clk :std_logic:='1';
  signal sa4, sa6, sa8, sa_conv:integer:=0;
  
  constant ad_width:integer := 64;
  signal data4, data6, data8, data_conv:std_logic_vector(ad_width-1 downto 0);

begin

  rst <= '0' after 5 ns, '1' after 30 ns;
  rngcnt4: evRingCounter_GtdClk   generic map (ad_width, 4) port map (rst, clk, data4, sa4);
  rngcnt6: evRingCounter_GtdClk   generic map (ad_width, 6) port map (rst, clk, data6, sa6);
  rngcnt8: evRingCounter_GtdClk   generic map (ad_width, 8) port map (rst, clk, data8, sa8);

  rngcnt_conv: evRingCounter   	generic map (ad_width) port map (rst, clk, data_conv, sa_conv);
   
   
  clk <= not clk after 25 ns;
         
   
end;
---------------------------------------------------------------
