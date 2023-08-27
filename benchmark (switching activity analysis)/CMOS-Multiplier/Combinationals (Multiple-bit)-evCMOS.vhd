library IEEE;
use IEEE.std_logic_1164.all;
entity evCRCAdder is
  generic (wdt: integer);
  port (a:   in  std_logic_vector(wdt-1 downto 0);
        b:   in  std_logic_vector(wdt-1 downto 0);
        cin: in  std_logic;
        sum: out std_logic_vector(wdt-1 downto 0);
        cout:out std_logic;
        sa:  out integer);
end;
-----
architecture only of evCRCAdder is
  component evCFullAdder is
    port (a: 	in  std_logic;
    	  b: 	in  std_logic;
    	  cin: 	in  std_logic;
          sum: 	out std_logic;
          cout:	out std_logic;
          sa:  out integer);
  end component;

  type int_vec is array (natural range<>) of integer;
  signal imsg: 	std_logic_vector(wdt downto 0);
  signal fa_sa: int_vec(wdt downto 0);
  signal in_sa: int_vec(wdt downto 0);
begin
  imsg(0)  <= cin;
  cout     <= imsg(wdt);
  in_sa(0) <= 0;

fa_chain:
  for i in 0 to wdt-1 generate
    adder: evCFullAdder PORT MAP(a(i), b(i), imsg(i), sum(i), imsg(i+1), fa_sa(i));
    in_sa(i+1) <= fa_sa(i) + in_sa(i);
  end generate;
  
  sa <= in_sa(wdt);
end;
---------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
entity evCMux2t1 is
  generic (wdt: integer);
  port (a:   in  std_logic_vector(wdt-1 downto 0);
        b:   in  std_logic_vector(wdt-1 downto 0);
        sel: in  std_logic;
        dout: out std_logic_vector(wdt-1 downto 0);
        sa:  out integer);
end;
-----
architecture only of evCMux2t1 is
  component evCMuxCell2t1 is
    port (a: 	in  std_logic;
          b: 	in  std_logic;
          sel: 	in  std_logic;
          dout: out std_logic;
          sa:  out integer);
  end component;

  type int_vec is array (natural range<>) of integer;
  signal mx_sa: int_vec(wdt downto 0);
  signal in_sa: int_vec(wdt downto 0);
begin
  in_sa(0) <= 0;

mx_chain:
  for i in 0 to wdt-1 generate
    adder: evCMuxCell2t1 PORT MAP(a(i), b(i), sel, dout(i), mx_sa(i));
    in_sa(i+1) <= mx_sa(i) + in_sa(i);
  end generate;
  
  sa <= in_sa(wdt);
end;
---------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
entity evCAorZeroMux is
  generic (wdt: integer);
  port (a:   in  std_logic_vector(wdt-1 downto 0);
        sel: in  std_logic;
        dout: out std_logic_vector(wdt-1 downto 0);
        sa:  out integer);
end;
-----
architecture only of evCAorZeroMux is
  component evcNAND2 is
    port (a: 	in  std_logic;
          b: 	in  std_logic;
          ab: 	out std_logic;
          sa:  out integer);
  end component;
  component evCINV is
    port (a: 	in  std_logic;
          a_not: 	out std_logic;
          sa:  out integer);
  end component;

  signal inv_dout: std_logic_vector(wdt-1 downto 0);
  type int_vec is array (natural range<>) of integer;
  signal inv_sa, mx_sa: int_vec(wdt downto 0);
  signal in_sa: int_vec(wdt downto 0);
begin
  in_sa(0) <= 0;

mx_chain:
  for i in 0 to wdt-1 generate
    nr: evcNAND2 PORT MAP(a(i), sel, inv_dout(i), mx_sa(i));
    nt: evCINV PORT MAP(inv_dout(i), dout(i), inv_sa(i));
    in_sa(i+1) <= inv_sa(i) + mx_sa(i) + in_sa(i);
  end generate;
  
  sa <= in_sa(wdt);
end;
---------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
entity evcRegister is
  generic (wdt: integer);
  port (din:  in  std_logic_vector(wdt-1 downto 0);
        clk:  in  std_logic;
        dout: out std_logic_vector(wdt-1 downto 0);
        sa:   out integer);
end;
-----
architecture only of evcRegister is
  component evcMSFlipFlop is
    port (din: 	in  std_logic;
          clk: 	in  std_logic;
          dout: out std_logic;
          sa:  out integer);
  end component;

  type int_vec is array (natural range<>) of integer;
  signal ff_sa: int_vec(wdt downto 0);
  signal in_sa: int_vec(wdt downto 0);
begin
  in_sa(0) <= 0;

ff_chain:
  for i in 0 to wdt-1 generate
    ff: evcMSFlipFlop PORT MAP(din(i), clk, dout(i), ff_sa(i));
    in_sa(i+1) <= ff_sa(i) + in_sa(i);
  end generate;
  
  sa <= in_sa(wdt);
end;
---------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
entity evcCounter is
  generic (wdt: integer);
  port (rst:  in  std_logic;
        clk:  in  std_logic;
        dout: out std_logic_vector(wdt-1 downto 0);
        sa:   out integer);
end;
-----
architecture only of evcCounter is
  component evcMSTFlipFlop is
    port (rst: 	in  std_logic;
          tgl: 	in  std_logic;
          dout: out std_logic;
          sa:  out integer);
  end component;

  type int_vec is array (natural range<>) of integer;
  signal ff_sa: int_vec(wdt downto 0);
  signal in_sa: int_vec(wdt downto 0);
  signal inclk: std_logic_vector(wdt downto 0);
begin
  in_sa(0) <= 0;
  inclk(0) <= clk;

ff_chain:
  for i in 0 to wdt-1 generate
    adder: evcMSTFlipFlop PORT MAP(rst, inclk(i), inclk(i+1), ff_sa(i));
    dout(i) <= inclk(i+1);
    in_sa(i+1) <= ff_sa(i) + in_sa(i);
  end generate;
  
  sa <= in_sa(wdt);
end;
---------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
entity evcMultiplier is
  generic (wdt: integer);
  port (a:  	in  std_logic_vector(wdt-1 downto 0);
        b: 		in  std_logic_vector(wdt-1 downto 0);
        rst:	in  std_logic;
        clk:	in  std_logic;
        res:	out std_logic_vector(2*wdt-1 downto 0);
        ready:	out  std_logic;
        sa:  	out integer);
end;
-----
architecture only of evcMultiplier is
  component evcNAND2 is
    port (a: 	in  std_logic;
          b: 	in  std_logic;
          ab: 	out std_logic;
          sa:  out integer);
  end component;
  component evcNOR2 is
    port (a: 	in  std_logic;
          b: 	in  std_logic;
          ab: 	out std_logic;
          sa:  out integer);
  end component;
  component evcNOR4 is
    port (a: 	in  std_logic;
          b: 	in  std_logic;
          c: 	in  std_logic;
          d: 	in  std_logic;
          abcd: out std_logic;
          sa:  out integer);
  end component;
  component evCMux2t1 is
    generic (wdt: integer);
    port (a:   in  std_logic_vector(wdt-1 downto 0);
          b:   in  std_logic_vector(wdt-1 downto 0);
          sel: in  std_logic;
          dout: out std_logic_vector(wdt-1 downto 0);
          sa:  out integer);
  end component;
  component evcRegister is
    generic (wdt: integer);
    port (din:  in  std_logic_vector(wdt-1 downto 0);
          clk:  in  std_logic;
          dout: out std_logic_vector(wdt-1 downto 0);
          sa:   out integer);
  end component;
  component evcRCAdder is
    generic (wdt: integer);
    port (a:   in  std_logic_vector(wdt-1 downto 0);
          b:   in  std_logic_vector(wdt-1 downto 0);
          cin: in  std_logic;
          sum: out std_logic_vector(wdt-1 downto 0);
          cout:out std_logic;
          sa:  out integer);
  end component;
  component evCAorZeroMux is
    generic (wdt: integer);
    port (a:   in  std_logic_vector(wdt-1 downto 0);
          sel: in  std_logic;
          dout: out std_logic_vector(wdt-1 downto 0);
          sa:  out integer);
  end component;
  component evcCounter is
    generic (wdt: integer);
    port (rst:  in  std_logic;
          clk:  in  std_logic;
          dout: out std_logic_vector(wdt-1 downto 0);
          sa:   out integer);
  end component;
  
  constant counter_width: integer:= 5;
  signal cycle: std_logic_vector(counter_width downto 0);
  signal mx1in, bregin, bregout, hregin, hregout: std_logic_vector(wdt-1 downto 0);
  signal adderout, adderout_shifted, adderin2: std_logic_vector(wdt-1 downto 0);
  signal cout, low4bits, is32, rdy:std_logic;

  signal in_sa1, in_sa2, in_sa3, in_sa4, in_sa5, in_sa6, in_sa7, in_sa8, in_sa9, in_sa10 :integer;
begin
  mx1in <=adderout(0)&bregout(wdt-1 downto 1);
  mx1: 	evCMux2t1 	GENERIC MAP (wdt) PORT MAP(b, mx1in, rst, bregin, in_sa1);
  breg: evcRegister GENERIC MAP (wdt) PORT MAP(bregin, clk, bregout, 	in_sa2);
  
  adderout_shifted <= cout&adderout(wdt-1 downto 1);
  mx2: 	evCAorZeroMux GENERIC MAP (wdt) PORT MAP(adderout_shifted, rst, hregin, in_sa3);
  hreg: evcRegister 	GENERIC MAP (wdt) PORT MAP(hregin, clk, hregout, 					in_sa4);
  
  mx3: 		evCAorZeroMux GENERIC MAP (wdt) PORT MAP(a, bregout(0), adderin2, 								in_sa5);
  adder: 	evcRCAdder 	GENERIC MAP (wdt) PORT MAP(hregout, adderin2, '0', adderout, cout, 	in_sa6);
  cntr: 	evcCounter 	GENERIC MAP (counter_width+1) 	PORT MAP(rst, clk, cycle, 					in_sa7);
  
  nr1: evcNOR4 PORT MAP(cycle(0), cycle(1), cycle(2), cycle(3), low4bits, in_sa8);
  nnd: evcNAND2 PORT MAP(low4bits, cycle(5), is32, in_sa9);
  nr2: evcNOR2 PORT MAP(is32, cycle(4), rdy, in_sa10);
  
  ready <= rdy;
  res <= hregout&bregout;-- when rdy='1';
  
  sa <= in_sa1 + in_sa2 + in_sa3 + in_sa4 + in_sa5 + in_sa6 + in_sa7 + in_sa8 + in_sa9 + in_sa10;
end;
---------------------------------------------------------------

