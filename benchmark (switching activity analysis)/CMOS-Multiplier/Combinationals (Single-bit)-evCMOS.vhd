---------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
entity evXOR2 is
  port (a: 	in  std_logic;
        b: 	in  std_logic;
        aXORb: 	out std_logic;
        sa:  out integer);
end;
-----
architecture only of evXOR2 is
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
  
  signal abn, ban, a_not, b_not: std_logic;
  signal in_sa1: integer:=0;
  signal in_sa2: integer:=0;
  signal in_sa3: integer:=0;
  signal in_sa4: integer:=0;
  signal in_sa5: integer:=0;
begin
  inv1: evCINV PORT MAP(a, a_not, in_sa1);
  inv2: evCINV PORT MAP(b, b_not, in_sa2);

  nand1: evcNAND2 port map (a, b_not, abn, in_sa3);
  nand2: evcNAND2 port map (b, a_not, ban, in_sa4);
  nand3:  evcNAND2 port map (abn, ban, aXORb, in_sa5);

  sa <= in_sa1 + in_sa2 + in_sa3 + in_sa4 + in_sa5;
end;
---------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
entity evcFullAdder is
  port (a: 	in  std_logic;
        b: 	in  std_logic;
        cin: 	in  std_logic;
        sum: 	out std_logic;
        cout: 	out std_logic;
        sa:  out integer);
end;
-----
architecture only of evcFullAdder is
  component evcNAND2 is 
    port (a:  in  std_logic;
          b:  in  std_logic;
          ab: out std_logic;
          sa: out integer);
  end component;
  component evcNAND3 is 
    port (a:  in  std_logic;
          b:  in  std_logic;
          c:  in  std_logic;
          abc: out std_logic;
          sa: out integer);
  end component;
  component evXOR2 is
    port (a: 	 in  std_logic;
          b: 	 in  std_logic;
          aXORb: out std_logic;
          sa:    out integer);
  end component;
  
  signal abn, acn, bcn, axb: std_logic;
  signal in_sa1, in_sa2, in_sa3, in_sa4, in_sa5, in_sa6:integer:=0;
begin
  nand1: evcNAND2 port map (a, b, abn, in_sa1);
  nand2: evcNAND2 port map (a, cin, acn, in_sa2);
  nand3: evcNAND2 port map (b, cin, bcn, in_sa3);
  nand4: evcNAND3 port map (abn, acn, bcn, cout, in_sa4);

  xor1: evXOR2 port map (a, b, axb, in_sa5);
  xor2: evXOR2 port map (cin, axb, sum, in_sa6);
  
  sa <= in_sa1 + in_sa2 + in_sa3 + in_sa4 + in_sa5 + in_sa6;
end;
---------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
entity evcMuxCell2t1 is
  port (a: 	in  std_logic;
        b: 	in  std_logic;
        sel: 	in  std_logic;
        dout: 	out std_logic;
        sa:  out integer);
end;
-----
architecture only of evcMuxCell2t1 is
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
  
  signal ga, gb, sel_not: std_logic;
  signal in_sa1: integer:=0;
  signal in_sa2: integer:=0;
  signal in_sa3: integer:=0;
  signal in_sa4: integer:=0;
begin
  inv1: 	evCINV 		PORT MAP	(sel, sel_not, 		in_sa1);
  nand1: 	evcNAND2 	port map 	(a, sel_not, ga, 	in_sa2);
  nand2: 	evcNAND2	port map 	(b, sel, gb, 			in_sa3);
  nand3:  evcNAND2 	port map 	(ga, gb, dout, 		in_sa4);

  sa <= in_sa1 + in_sa2 + in_sa3 + in_sa4;
end;
---------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
entity evcMSFlipFlop is
  port (din: 	in  std_logic;
        clk: 	in  std_logic;
        dout: 	out std_logic;
        sa:  out integer);
end;
-----
architecture only of evcMSFlipFlop is
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
  component evCINV is
    port (a: 	in  std_logic;
          a_not: 	out std_logic;
          sa:  out integer);
  end component;
  
  signal dinn, gdin, gdinn, mstrq, mstrqn, slvdin, slvdinn, slvq, slvqn: std_logic;
  signal dn: std_logic;
  signal in_sa1, in_sa2, in_sa3, in_sa4, in_sa5, in_sa6, in_sa7, in_sa8, in_sa9: integer:=0;
begin
  inv1:  evCINV 		PORT MAP	(din, dinn, 		in_sa1);
  
  nor1:  evcNOR2 	port map 	(din, clk, gdin, 	in_sa2);
  nor2:  evcNOR2 	port map 	(dinn, clk, gdinn, 	in_sa3);
  nor3:  evcNOR2 	port map 	(gdin, mstrqn, mstrq, 	in_sa4);
  nor4:  evcNOR2 	port map 	(gdinn, mstrq, mstrqn, 	in_sa5);

  nand1: evcNAND2 	port map 	(mstrq, clk, slvdin, 	in_sa6);
  nand2: evcNAND2	port map 	(mstrqn, clk, slvdinn,	in_sa7);
  nand3: evcNAND2 	port map 	(slvdin, slvqn, slvq, 	in_sa8);
  nand4: evcNAND2 	port map 	(slvdinn, slvq, slvqn,	in_sa9);

  dout <= slvq;
  sa <= in_sa1 + in_sa2 + in_sa3 
        + in_sa4 + in_sa5 + in_sa6
        + in_sa7 + in_sa8 + in_sa9;
end;
---------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
entity evcMSTFlipFlop is
  port (rst: 	in  std_logic;
        tgl: 	in  std_logic;
        dout: 	out std_logic;
        sa:  out integer);
end;
-----
architecture only of evcMSTFlipFlop is
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
  component evcNAND3 is
    port (a: 	in  std_logic;
          b: 	in  std_logic;
          c: 	in  std_logic;
          abc: 	out std_logic;
          sa:  out integer);
  end component;
  component evCINV is
    port (a: 	in  std_logic;
          a_not: 	out std_logic;
          sa:  out integer);
  end component;
  
  signal gdin, gdinn, mstrq, mstrqn, slvdin, slvdinn, slvq, slvqn: std_logic;
  signal in_sa2, in_sa3, in_sa4, in_sa5, in_sa6, in_sa7, in_sa8, in_sa9: integer:=0;
begin
  
  nor1:  evcNAND2 	port map 	(slvqn, tgl, gdin, 		in_sa2);
  nor2:  evcNAND2 	port map 	(slvq, tgl, gdinn, 		in_sa3);
  nor3:  evcNAND2 	port map 	(gdin, mstrqn, mstrq,		in_sa4);
  nor4:  evcNAND3 	port map 	(gdinn, mstrq, rst, mstrqn,	in_sa5);

  nand1: evcNOR2 	port map 	(mstrq, tgl, slvdin, 		in_sa6);
  nand2: evcNOR2	port map 	(mstrqn, tgl, slvdinn,		in_sa7);
  nand3: evcNOR2 	port map 	(slvdin, slvqn, slvq, 		in_sa8);
  nand4: evcNOR2 	port map 	(slvdinn, slvq, slvqn,		in_sa9);

  dout <= slvq;
  sa <= in_sa2 + in_sa3 
        + in_sa4 + in_sa5 + in_sa6
        + in_sa7 + in_sa8 + in_sa9;
end;
