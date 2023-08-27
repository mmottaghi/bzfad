---------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
entity ctest is
end;
-----
architecture CMUL of ctest is
  component evlpMultiplier is
    generic (wdt: integer);
    port (a:  	in  std_logic_vector(wdt-1 downto 0);
          b: 	in  std_logic_vector(wdt-1 downto 0);
          rst:	in  std_logic;
          clk:	in  std_logic;
          res:	out std_logic_vector(2*wdt-1 downto 0);
          ready:	out  std_logic;
          sa:  	out integer);
  end component;
  component evcMultiplier is
    generic (wdt: integer);
    port (a:  	in  std_logic_vector(wdt-1 downto 0);
          b: 		in  std_logic_vector(wdt-1 downto 0);
          rst:	in  std_logic;
          clk:	in  std_logic;
          res:	out std_logic_vector(2*wdt-1 downto 0);
          ready:	out  std_logic;
          sa:  	out integer);
  end component;
  
  constant ad_width: integer := 32;
  SIGNAL a, b: std_logic_vector(ad_width-1 downto 0);
  SIGNAL c_pdct: std_logic_vector(2*ad_width-1 downto 0);
  SIGNAL clk, c_rdy: std_logic := '0';--
  SIGNAL rst: std_logic := '1';--
  signal c_sa: integer:=0;
  
  constant clk_period: TIME := 50 ns;
  constant test_count: integer := 100;
  TYPE AB_ValuePair IS ARRAY(1 downto 0) OF std_logic_vector(31 downto 0);
  TYPE stdlogic_array IS ARRAY(test_count-1 downto 0) OF AB_ValuePair;
  constant AB_val: stdlogic_array:= (
-- 32
(x"8C4EAFCA", x"00000000"), 
(x"0C05276D", x"00000000"), 
(x"6DB62D8B", x"00000000"), 
(x"F47462B0", x"00000000"), 
(x"C96F2E94", x"00000000"), 
(x"CE6D06B0", x"00000000"), 
(x"EADF3AA9", x"00000000"), 
(x"4C29D183", x"00000000"), 
(x"3EDF8BBA", x"00000000"), 
(x"0885DD68", x"00000000"), 
(x"9BE85C8C", x"00000000"), 
(x"F2BD2576", x"00000000"), 
(x"0778B818", x"00000000"), 
(x"ED244A20", x"00000000"), 
(x"1769AF44", x"00000000"), 
(x"A5C35408", x"00000000"), 
(x"B8F9E808", x"00000000"), 
(x"69C626F7", x"00000000"), 
(x"E71EFA7B", x"00000000"), 
(x"E3405274", x"00000000"), 
(x"EB23EEC7", x"00000000"), 
(x"6CC7A2D1", x"00000000"), 
(x"9DD16F45", x"00000000"), 
(x"05CBEE61", x"00000000"), 
(x"D00B0498", x"00000000"), 
(x"A1C4BCEC", x"00000000"), 
(x"513B86F0", x"00000000"), 
(x"36F33623", x"00000000"), 
(x"1213CADA", x"00000000"), 
(x"07E5371D", x"00000000"), 
(x"792A2846", x"00000000"), 
(x"E0030A38", x"00000000"), 
(x"F3C098B6", x"00000000"), 
(x"3965C7C0", x"00000000"), 
(x"65ECE87D", x"00000000"), 
(x"ED48FF22", x"00000000"), 
(x"D41CF980", x"00000000"), 
(x"5689CD1C", x"00000000"), 
(x"DB8E05BB", x"00000000"), 
(x"B76BDF9C", x"00000000"), 
(x"B776880D", x"00000000"), 
(x"86183C17", x"00000000"), 
(x"DB72543A", x"00000000"), 
(x"D0E1406F", x"00000000"), 
(x"AC3E2CAA", x"00000000"), 
(x"A4788B16", x"00000000"), 
(x"1FFC96C5", x"00000000"), 
(x"D5F9AFC1", x"00000000"), 
(x"36295C66", x"00000000"), 
(x"0602793A", x"00000000"), 
(x"C01F02C4", x"00000000"), 
(x"601AB87C", x"00000000"), 
(x"A17637AF", x"00000000"), 
(x"668FE100", x"00000000"), 
(x"1B002A4D", x"00000000"), 
(x"DB4A962B", x"00000000"), 
(x"47ED0EE9", x"00000000"), 
(x"A8A6146F", x"00000000"), 
(x"E311BEB5", x"00000000"), 
(x"17172E18", x"00000000"), 
(x"E5FC9951", x"00000000"), 
(x"FE114852", x"00000000"), 
(x"5E119BE7", x"00000000"), 
(x"E7DBB956", x"00000000"), 
(x"26CE0A3A", x"00000000"), 
(x"9EC6F412", x"00000000"), 
(x"D726FBC4", x"00000000"), 
(x"75E54F6D", x"00000000"), 
(x"CF8D1932", x"00000000"), 
(x"6CBBD1DF", x"00000000"), 
(x"01BCC2A7", x"00000000"), 
(x"CE4781ED", x"00000000"), 
(x"58272EBB", x"00000000"), 
(x"12C3C797", x"00000000"), 
(x"5B0E14FB", x"00000000"), 
(x"ABA30F4B", x"00000000"), 
(x"BC3A7E98", x"00000000"), 
(x"1D321B38", x"00000000"), 
(x"332642FA", x"00000000"), 
(x"464DF11A", x"00000000"), 
(x"65B16179", x"00000000"), 
(x"F287A572", x"00000000"), 
(x"E5B7FE00", x"00000000"), 
(x"03FAC439", x"00000000"), 
(x"ADA0C848", x"00000000"), 
(x"B8852EDC", x"00000000"), 
(x"F5BFE51F", x"00000000"), 
(x"AAD6E76A", x"00000000"), 
(x"7A6FEB91", x"00000000"), 
(x"6577C367", x"00000000"), 
(x"A8F99DB0", x"00000000"), 
(x"732DCBE5", x"00000000"), 
(x"65C4FD23", x"00000000"), 
(x"692581AF", x"00000000"), 
(x"515A4481", x"00000000"), 
(x"5FD04082", x"00000000"), 
(x"0C1959BA", x"00000000"), 
(x"14E0ADE7", x"00000000"), 
(x"4413DB35", x"00000000"), 
(x"10489232", x"00000000")
  ); 
  
  signal test_num:integer;

begin


    putting_a_b_vlaues: PROCESS 
    
    Variable delay:Time;
    Variable ctr:integer:=0;
    
    BEGIN
        ctr := 0;
        for i in 1 to test_count loop
          
          delay := (i-1) * 2 * (ad_width+1) * clk_period + clk_period-20ns;
          a <= transport AB_val(i-1)(1) after delay;
          b <= transport AB_val(i-1)(0) after delay;
          rst <= transport '0' after delay, 
          	  '1' after delay+40 ns;
          test_num <= transport ctr after delay;
          ctr := ctr + 1;
        end loop;
        wait;
    END PROCESS;
  
   
  -- rst <= '0' after 10 ns , '1' after 70 ns;
  clk <= not clk after clk_period;
         
   
  cmmul: evcMultiplier generic map(ad_width) port map (a, b, rst, clk, c_pdct, c_rdy, c_sa);
end;
---------------------------------------------------------------
