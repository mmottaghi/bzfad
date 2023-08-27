library IEEE;
use IEEE.std_logic_1164.all;
entity test is
end;
-----
architecture only of test is
  component evcCounter is
    generic (wdt: integer);
    port (rst:  in  std_logic;
          clk:  in  std_logic;
          dout: out std_logic_vector(wdt-1 downto 0);
          sa:   out integer);
  end component;
  component evRingCounter is
    generic (wdt: integer);
    port (reset_n: in  std_logic;
          clock:   in  std_logic;
          dout:out std_logic_vector(wdt-1 downto 0);
          sa:  out integer);
  end component;
  component evRingCounter_GtdClk is -- ring counter with gated clock
    generic (wdt : integer; 
             block_size : integer := 8);
    port (reset_n: in  std_logic;
          clock:   in  std_logic;
          dout:out std_logic_vector(wdt-1 downto 0);
          sa:  out integer);
  end component; 
  
  
  SIGNAL ring, ring_gclk: std_logic_vector(31 downto 0);
  SIGNAL bin: std_logic_vector(4 downto 0);
  SIGNAL rst, clk: std_logic := '1';
  signal bcd_sa, ring_sa, ring_gclk_sa: integer;
begin
  
  rst <= '0' after 70 ns, '1' after 120 ns;
  clk <= not clk after 100 ns; 

  bcd1: evcCounter generic map (5) port map(rst, clk, bin, bcd_sa);
  rng1: evRingCounter generic map (32) port map(rst, clk, ring, ring_sa);
  rng2: evRingCounter_GtdClk generic map (32,16) port map(rst, clk, ring_gclk, ring_gclk_sa);

end;
---------------------------------------------------------------
