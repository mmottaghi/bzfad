library IEEE;
use IEEE.std_logic_1164.all;
entity evcNAND2 is
  port (a: 	in  std_logic;
        b: 	in  std_logic;
        ab: 	out std_logic;
        sa:  out integer);
end;
-----
architecture only of evcNAND2 is
  component evNMOS is
    port (src: in  std_logic;
          gat: in  std_logic;
          drn: out std_logic;
          sa:  out integer);
  end component;
  component evPMOS is
    port (src: in  std_logic;
          gat: in  std_logic;
          drn: out std_logic;
          sa:  out integer);
  end component;
  
  TYPE stdlogic_table IS ARRAY (std_ulogic, std_ulogic) OF std_ulogic;
  CONSTANT resolution_table : stdlogic_table := (
 ------------------------------------------------------------
 --|  U    X    0    1    Z    W    L    H    -         |   |  
 ------------------------------------------------------------
   ( 'U', 'U', 'U', 'U', 'U', 'U', 'U', 'U', 'U' ),  -- | U |
   ( 'U', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X' ),  -- | X |
   ( 'U', 'X', '0', 'X', '0', '0', '0', '0', 'X' ),  -- | 0 |
   ( 'U', 'X', 'X', '1', '1', '1', '1', '1', 'X' ),  -- | 1 |
   ( 'U', 'X', '0', '1', 'Z', 'W', 'L', 'H', 'X' ),  -- | Z |
   ( 'U', 'X', '0', '1', 'W', 'W', 'W', 'W', 'X' ),  -- | W |
   ( 'U', 'X', '0', '1', 'L', 'W', 'L', 'W', 'X' ),  -- | L |
   ( 'U', 'X', '0', '1', 'H', 'W', 'W', 'H', 'X' ),  -- | H |
   ( 'U', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X' )); -- | - |  
  FUNCTION resolver(drivers: std_logic_vector) RETURN std_logic IS
    VARIABLE res :std_logic := 'Z';
  BEGIN
    res := resolution_table(drivers(0), drivers(1)); 
    res := resolution_table(res, drivers(2)); 
    return res;
  END;
  signal int_out: resolver std_logic;
  signal gated_gnd, gated_vdd: std_logic;
  signal in_sa1: integer:=0;
  signal in_sa2: integer:=0;
  signal in_sa3: integer:=0;
  signal in_sa4: integer:=0;
begin
  pms1: evPMOS PORT MAP('1', a, int_out, in_sa1);
  pms2: evPMOS PORT MAP('1', b, int_out, in_sa2);
  nms1: evNMOS PORT MAP(gated_gnd, b, int_out, in_sa3);
  nms2: evNMOS PORT MAP('0', a, gated_gnd, in_sa4);
  ab <= int_out;
  sa <= in_sa1 + in_sa2 + in_sa3 + in_sa4;
end;
---------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
entity evcNAND3 is
  port (a: 	in  std_logic;
        b: 	in  std_logic;
        c: 	in  std_logic;
        abc: 	out std_logic;
        sa:  out integer);
end;
-----
architecture only of evcNAND3 is
  component evNMOS is
    port (src: in  std_logic;
          gat: in  std_logic;
          drn: out std_logic;
          sa:  out integer);
  end component;
  component evPMOS is
    port (src: in  std_logic;
          gat: in  std_logic;
          drn: out std_logic;
          sa:  out integer);
  end component;
  
  TYPE stdlogic_table IS ARRAY (std_ulogic, std_ulogic) OF std_ulogic;
  CONSTANT resolution_table : stdlogic_table := (
 ------------------------------------------------------------
 --|  U    X    0    1    Z    W    L    H    -         |   |  
 ------------------------------------------------------------
   ( 'U', 'U', 'U', 'U', 'U', 'U', 'U', 'U', 'U' ),  -- | U |
   ( 'U', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X' ),  -- | X |
   ( 'U', 'X', '0', 'X', '0', '0', '0', '0', 'X' ),  -- | 0 |
   ( 'U', 'X', 'X', '1', '1', '1', '1', '1', 'X' ),  -- | 1 |
   ( 'U', 'X', '0', '1', 'Z', 'W', 'L', 'H', 'X' ),  -- | Z |
   ( 'U', 'X', '0', '1', 'W', 'W', 'W', 'W', 'X' ),  -- | W |
   ( 'U', 'X', '0', '1', 'L', 'W', 'L', 'W', 'X' ),  -- | L |
   ( 'U', 'X', '0', '1', 'H', 'W', 'W', 'H', 'X' ),  -- | H |
   ( 'U', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X' )); -- | - |  
  FUNCTION resolver(drivers: std_logic_vector) RETURN std_logic IS
    VARIABLE res :std_logic := 'Z';
  BEGIN
    res := 'Z';
    for i in drivers'range loop
      res := resolution_table(res, drivers(i)); 
    end loop;
    return res;
  END;
  signal int_out: resolver std_logic;
  signal gated_gnd1, gated_gnd2: std_logic;
  signal in_sa1, in_sa2, in_sa3, in_sa4, in_sa5, in_sa6: integer:=0;
begin
  pms1: evPMOS PORT MAP('1', a, int_out, in_sa1);
  pms2: evPMOS PORT MAP('1', b, int_out, in_sa2);
  pms3: evPMOS PORT MAP('1', c, int_out, in_sa3);
  nms1: evNMOS PORT MAP(gated_gnd2, c, int_out, in_sa4);
  nms2: evNMOS PORT MAP(gated_gnd1, b, gated_gnd2, in_sa5);
  nms3: evNMOS PORT MAP('0', a, gated_gnd1, in_sa6);
  abc <= int_out;
  sa <= in_sa1 + in_sa2 + in_sa3 + in_sa4 + in_sa5 + in_sa6;
end;
---------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
entity evcNOR3 is
  port (a: 	in  std_logic;
        b: 	in  std_logic;
        c: 	in  std_logic;
        abc: 	out std_logic;
        sa:  out integer);
end;
-----
architecture only of evcNOR3 is
  component evNMOS is
    port (src: in  std_logic;
          gat: in  std_logic;
          drn: out std_logic;
          sa:  out integer);
  end component;
  component evPMOS is
    port (src: in  std_logic;
          gat: in  std_logic;
          drn: out std_logic;
          sa:  out integer);
  end component;
  
  TYPE stdlogic_table IS ARRAY (std_ulogic, std_ulogic) OF std_ulogic;
  CONSTANT resolution_table : stdlogic_table := (
 ------------------------------------------------------------
 --|  U    X    0    1    Z    W    L    H    -         |   |  
 ------------------------------------------------------------
   ( 'U', 'U', 'U', 'U', 'U', 'U', 'U', 'U', 'U' ),  -- | U |
   ( 'U', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X' ),  -- | X |
   ( 'U', 'X', '0', 'X', '0', '0', '0', '0', 'X' ),  -- | 0 |
   ( 'U', 'X', 'X', '1', '1', '1', '1', '1', 'X' ),  -- | 1 |
   ( 'U', 'X', '0', '1', 'Z', 'W', 'L', 'H', 'X' ),  -- | Z |
   ( 'U', 'X', '0', '1', 'W', 'W', 'W', 'W', 'X' ),  -- | W |
   ( 'U', 'X', '0', '1', 'L', 'W', 'L', 'W', 'X' ),  -- | L |
   ( 'U', 'X', '0', '1', 'H', 'W', 'W', 'H', 'X' ),  -- | H |
   ( 'U', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X' )); -- | - |  
  FUNCTION resolver(drivers: std_logic_vector) RETURN std_logic IS
    VARIABLE res :std_logic := 'Z';
  BEGIN
    res := 'Z';
    for i in drivers'range loop
      res := resolution_table(res, drivers(i)); 
    end loop;
    return res;
  END;
signal int_out: resolver std_logic;
  signal gated_vdd1, gated_vdd2: std_logic;
  signal in_sa1: integer:=0;
  signal in_sa2: integer:=0;
  signal in_sa3: integer:=0;
  signal in_sa4: integer:=0;
  signal in_sa5: integer:=0;
  signal in_sa6: integer:=0;
begin
  pms1: evPMOS PORT MAP('1', a, gated_vdd1, in_sa1);
  pms2: evPMOS PORT MAP(gated_vdd1, b, gated_vdd2, in_sa2);
  pms3: evPMOS PORT MAP(gated_vdd2, c, int_out, in_sa3);
  nms1: evNMOS PORT MAP('0', a, int_out, in_sa4);
  nms2: evNMOS PORT MAP('0', b, int_out, in_sa5);
  nms3: evNMOS PORT MAP('0', c, int_out, in_sa6);
  abc <= int_out;
  sa <= in_sa1 + in_sa2 + in_sa3 + in_sa4 + in_sa5 + in_sa6;
end;
---------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
entity evcNOR4 is
  port (a: 	in  std_logic;
        b: 	in  std_logic;
        c: 	in  std_logic;
        d: 	in  std_logic;
        abcd: 	out std_logic;
        sa:  out integer);
end;
-----
architecture only of evcNOR4 is
  component evNMOS is
    port (src: in  std_logic;
          gat: in  std_logic;
          drn: out std_logic;
          sa:  out integer);
  end component;
  component evPMOS is
    port (src: in  std_logic;
          gat: in  std_logic;
          drn: out std_logic;
          sa:  out integer);
  end component;
  
  TYPE stdlogic_table IS ARRAY (std_ulogic, std_ulogic) OF std_ulogic;
  CONSTANT resolution_table : stdlogic_table := (
 ------------------------------------------------------------
 --|  U    X    0    1    Z    W    L    H    -         |   |  
 ------------------------------------------------------------
   ( 'U', 'U', 'U', 'U', 'U', 'U', 'U', 'U', 'U' ),  -- | U |
   ( 'U', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X' ),  -- | X |
   ( 'U', 'X', '0', 'X', '0', '0', '0', '0', 'X' ),  -- | 0 |
   ( 'U', 'X', 'X', '1', '1', '1', '1', '1', 'X' ),  -- | 1 |
   ( 'U', 'X', '0', '1', 'Z', 'W', 'L', 'H', 'X' ),  -- | Z |
   ( 'U', 'X', '0', '1', 'W', 'W', 'W', 'W', 'X' ),  -- | W |
   ( 'U', 'X', '0', '1', 'L', 'W', 'L', 'W', 'X' ),  -- | L |
   ( 'U', 'X', '0', '1', 'H', 'W', 'W', 'H', 'X' ),  -- | H |
   ( 'U', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X' )); -- | - |  
  FUNCTION resolver(drivers: std_logic_vector) RETURN std_logic IS
    VARIABLE res :std_logic := 'Z';
  BEGIN
    res := 'Z';
    for i in drivers'range loop
      res := resolution_table(res, drivers(i)); 
    end loop;
    return res;
  END;
signal int_out: resolver std_logic;
  signal gated_vdd1, gated_vdd2, gated_vdd3: std_logic;
  signal in_sa1, in_sa2, in_sa3, in_sa4, in_sa5, in_sa6, in_sa7, in_sa8 : integer:=0;
begin
  pms1: evPMOS PORT MAP('1', a, gated_vdd1, in_sa1);
  pms2: evPMOS PORT MAP(gated_vdd1, b, gated_vdd2, in_sa2);
  pms3: evPMOS PORT MAP(gated_vdd2, c, gated_vdd3, in_sa3);
  pms4: evPMOS PORT MAP(gated_vdd3, d, int_out, in_sa4);
  nms1: evNMOS PORT MAP('0', a, int_out, in_sa5);
  nms2: evNMOS PORT MAP('0', b, int_out, in_sa6);
  nms3: evNMOS PORT MAP('0', c, int_out, in_sa7);
  nms4: evNMOS PORT MAP('0', d, int_out, in_sa8);
  abcd <= int_out;
  sa <= in_sa1 + in_sa2 + in_sa3 + in_sa4 + in_sa5 + in_sa6 + in_sa7 + in_sa8;
end;
---------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
entity evcNOR2 is
  port (a: 	in  std_logic;
        b: 	in  std_logic;
        ab: 	out std_logic;
        sa:  out integer);
end;
-----
architecture only of evcNOR2 is
  component evNMOS is
    port (src: in  std_logic;
          gat: in  std_logic;
          drn: out std_logic;
          sa:  out integer);
  end component;
  component evPMOS is
    port (src: in  std_logic;
          gat: in  std_logic;
          drn: out std_logic;
          sa:  out integer);
  end component;
  
  TYPE stdlogic_table IS ARRAY (std_ulogic, std_ulogic) OF std_ulogic;
  CONSTANT resolution_table : stdlogic_table := (
 ------------------------------------------------------------
 --|  U    X    0    1    Z    W    L    H    -         |   |  
 ------------------------------------------------------------
   ( 'U', 'U', 'U', 'U', 'U', 'U', 'U', 'U', 'U' ),  -- | U |
   ( 'U', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X' ),  -- | X |
   ( 'U', 'X', '0', 'X', '0', '0', '0', '0', 'X' ),  -- | 0 |
   ( 'U', 'X', 'X', '1', '1', '1', '1', '1', 'X' ),  -- | 1 |
   ( 'U', 'X', '0', '1', 'Z', 'W', 'L', 'H', 'X' ),  -- | Z |
   ( 'U', 'X', '0', '1', 'W', 'W', 'W', 'W', 'X' ),  -- | W |
   ( 'U', 'X', '0', '1', 'L', 'W', 'L', 'W', 'X' ),  -- | L |
   ( 'U', 'X', '0', '1', 'H', 'W', 'W', 'H', 'X' ),  -- | H |
   ( 'U', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X' )); -- | - |  
  FUNCTION resolver(drivers: std_logic_vector) RETURN std_logic IS
    VARIABLE res :std_logic := 'Z';
  BEGIN
    res := resolution_table(drivers(0), drivers(1)); 
    res := resolution_table(res, drivers(2)); 
    return res;
  END;
  signal int_out: resolver std_logic;
  signal gated_vdd: std_logic;
  signal in_sa1: integer:=0;
  signal in_sa2: integer:=0;
  signal in_sa3: integer:=0;
  signal in_sa4: integer:=0;
begin
  pms1: evPMOS PORT MAP('1', a, gated_vdd, in_sa4);
  pms2: evPMOS PORT MAP(gated_vdd, b, int_out, in_sa3);
  nms1: evNMOS PORT MAP('0', a, int_out, in_sa1);
  nms2: evNMOS PORT MAP('0', b, int_out, in_sa2);
  ab <= int_out;
  sa <= in_sa1 + in_sa2 + in_sa3 + in_sa4;
end;
