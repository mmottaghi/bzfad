library IEEE;
use IEEE.std_logic_1164.all;
entity evNMOS is
  port (src: in  std_logic;
        gat: in  std_logic;
        drn: out std_logic
        );
end;
-----
architecture only of evNMOS is
begin
  drn <= src when gat='1'
         else 'Z';
end;
---------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
entity evPMOS is
  port (src: in  std_logic;
        gat: in  std_logic;
        drn: out std_logic
        );
end;
-----
architecture only of evPMOS is
begin
  drn <= src when gat='0'
         else 'Z';
end;
---------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
entity evCINV is
  port (a: 	in  std_logic;
        a_not: 	out std_logic
        );
end;
-----
architecture only of evCINV is
begin
  a_not <= not a;
end;
---------------------------------------------------------------
