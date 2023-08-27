library IEEE;
use IEEE.std_logic_1164.all;
entity evNMOS is
  port (src: in  std_logic;
        gat: in  std_logic;
        drn: out std_logic;
        sa:  out integer);
end;
-----
architecture only of evNMOS is
  signal in_sa: integer:=0;
begin
  in_sa <= in_sa+1 when gat'event and (gat='1' or gat='0') else in_sa;
  drn <= src when gat='1'
         else 'Z';
  sa <= in_sa;
end;
---------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
entity evPMOS is
  port (src: in  std_logic;
        gat: in  std_logic;
        drn: out std_logic;
        sa:  out integer);
end;
-----
architecture only of evPMOS is
  signal in_sa: integer:=0;
begin
  in_sa <= in_sa+2 when gat'event and (gat='1' or gat='0') else in_sa;
  drn <= src when gat='0'
         else 'Z';
  sa <= in_sa;
end;
---------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
entity evCINV is
  port (a: 	in  std_logic;
        a_not: 	out std_logic;
        sa:  out integer);
end;
-----
architecture only of evCINV is
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
    return res;
  END;
  signal int_out: resolver std_logic;
  signal in_sa1: integer:=0;
  signal in_sa2: integer:=0;
begin
  nms: evNMOS PORT MAP('0', a, int_out, in_sa1);
  pms: evPMOS PORT MAP('1', a, int_out, in_sa2);
  a_not <= int_out;
  sa <= in_sa1 + in_sa2;
end;
---------------------------------------------------------------
