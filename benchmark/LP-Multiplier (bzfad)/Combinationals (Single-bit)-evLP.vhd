library IEEE;
use IEEE.std_logic_1164.all;
entity evMS_Rstbl_FlipFlop is
  port (din: 	in  std_logic;
        clock:  in  std_logic;
        reset_n:in  std_logic;
        dout: 	out std_logic;
        dout_n:	out std_logic;
        sa:  out integer);
end;
-----
architecture only of evMS_Rstbl_FlipFlop is
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
  component evCINV is
    port (a: 	 in  std_logic;
          a_not: Out std_logic;
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
  signal mstr_gated_din, slv_dout_n, slv_gated_din: resolver std_logic;
  signal dly_din_1dlta, dly_din_2dlta, dly_din_3dlta, slv_gated_din_1dlta : std_logic;
  signal inv_n_gate, mstr_dout, slav_dout, mstr_dout_n: std_logic;
  signal in_sa1, in_sa2, in_sa3, in_sa4, in_sa5, in_sa6, in_sa7, in_sa8, in_sa9, in_sa10, in_sa11: integer:=0;
begin
  dly_din_1dlta <= din;
  dly_din_2dlta <= dly_din_1dlta;
  dly_din_3dlta <= dly_din_2dlta;
  
  mstr_p_loop: evPMOS PORT MAP(dly_din_3dlta, clock, mstr_gated_din, in_sa1);
  mstr_n_loop: evNMOS PORT MAP(mstr_dout, clock, mstr_gated_din, in_sa2);

  mstr_rev_inv: evCINV PORT MAP(mstr_gated_din, mstr_dout_n, in_sa3);
  mstr_fwd_inv: evCINV PORT MAP(mstr_dout_n, mstr_dout, in_sa4);

  slav_n_loop: evNMOS PORT MAP(mstr_dout, clock, slv_gated_din, in_sa5);
  slav_p_loop: evPMOS PORT MAP(slav_dout, clock, slv_gated_din, in_sa6);

  slav_n_rst: evNMOS PORT MAP(slv_gated_din, reset_n, inv_n_gate, in_sa7);
  slav_p_rst: evPMOS PORT MAP('1', reset_n, slv_dout_n, in_sa8);

  slv_gated_din_1dlta <= slv_gated_din;
  slav_n_inv: evNMOS PORT MAP('0', inv_n_gate, slv_dout_n, in_sa9);
  slav_p_inv: evPMOS PORT MAP('1', slv_gated_din_1dlta, slv_dout_n, in_sa10);

  slav_fwd_inv: evCINV PORT MAP(slv_dout_n, slav_dout, in_sa11);

  dout   <= slav_dout;
  dout_n <= slv_dout_n;
  sa <= in_sa1 + in_sa2 + in_sa3 + in_sa4 + in_sa5 + in_sa6 + in_sa7 + in_sa8 + in_sa9 + in_sa10 + in_sa11;
end;
---------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
entity evMS_R_GClk_FlipFlop is
  port (din: 	in  std_logic;
        din_n: 	in  std_logic;
        clock:  in  std_logic;
        reset_n:in  std_logic;
        dout: 	out std_logic;
        dout_n:	out std_logic;
        sa:  out integer);
end;
-----
architecture only of evMS_R_GClk_FlipFlop is
  component evMS_Rstbl_FlipFlop is
    port (din: 	in  std_logic;
          clock:  in  std_logic;
          reset_n:in  std_logic;
          dout: 	out std_logic;
          dout_n:	out std_logic;
          sa:  out integer);
  end component;
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
  signal gated_clock: resolver std_logic;
  signal gated_gnd, int_dout, int_dout_n: std_logic;
  signal in_sa1: integer:=0;
  signal in_sa2: integer:=0;
  signal in_sa3: integer:=0;
  signal in_sa4: integer:=0;
  signal in_sa5: integer:=0;
begin
  ff: evMS_Rstbl_FlipFlop PORT MAP(din, gated_clock, reset_n, int_dout, int_dout_n, in_sa1);
  
  clk_gate_this: evPMOS PORT MAP(clock, int_dout_n, gated_clock, in_sa2);
  clk_gate_prev: evPMOS PORT MAP(clock, din_n, gated_clock, in_sa3); -- 

  clk_gate_gnd2: evNMOS PORT MAP(gated_gnd, int_dout_n, gated_clock, in_sa4);
  clk_gate_gnd1: evNMOS PORT MAP('0', din_n, gated_gnd, in_sa5);--'0'

  dout   <= int_dout;
  dout_n <= int_dout_n;
  sa <= in_sa1 + in_sa2 + in_sa3 + in_sa4 + in_sa5;
end;
---------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
entity evMS_Prstbl_FlipFlop is
  port (din: 	in  std_logic;
        clock:  in  std_logic;
        reset_n:in  std_logic;
        dout: 	out std_logic;
        dout_n: out std_logic;
        sa:  out integer);
end;
-----
architecture only of evMS_Prstbl_FlipFlop is
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
  component evCINV is
    port (a: 	in  std_logic;
          a_not: 	out std_logic;
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
  signal mstr_gated_din, slv_gated_din: resolver std_logic;
  signal inv_p_gate, mstr_dout, slav_dout, slv_dout_n, mstr_dout_n: std_logic;
  signal dly_din_1dlta, dly_din_2dlta, dly_din_3dlta, slv_gated_din_1dlta : std_logic;
  signal in_sa1: integer:=0;
  signal in_sa2: integer:=0;
  signal in_sa3: integer:=0;
  signal in_sa4: integer:=0;
  signal in_sa5: integer:=0;
  signal in_sa6: integer:=0;
  signal in_sa7: integer:=0;
  signal in_sa8: integer:=0;
  signal in_sa9: integer:=0;
  signal in_sa10: integer:=0;
  signal in_sa11: integer:=0;
begin
  dly_din_1dlta <= din;
  dly_din_2dlta <= dly_din_1dlta;
  dly_din_3dlta <= dly_din_2dlta;

  mstr_p_loop: evPMOS PORT MAP(dly_din_3dlta, clock, mstr_gated_din, in_sa1);
  mstr_n_loop: evNMOS PORT MAP(mstr_dout, clock, mstr_gated_din, in_sa2);

  mstr_rev_inv: evCINV PORT MAP(mstr_gated_din, mstr_dout_n, in_sa3);
  mstr_fwd_inv: evCINV PORT MAP(mstr_dout_n, mstr_dout, in_sa4);

  slav_n_loop: evNMOS PORT MAP(mstr_dout, clock, slv_gated_din, in_sa5);
  slav_p_loop: evPMOS PORT MAP(slav_dout, clock, slv_gated_din, in_sa6);

  slav_n_rst: evNMOS PORT MAP(slv_gated_din, reset_n, inv_p_gate, in_sa7);
  slav_p_rst: evPMOS PORT MAP('0', reset_n, slv_dout_n, in_sa8);

  slv_gated_din_1dlta <= slv_gated_din;
  slav_n_inv: evNMOS PORT MAP('0', slv_gated_din_1dlta, slv_dout_n, in_sa9);
  slav_p_inv: evPMOS PORT MAP('1', inv_p_gate, slv_dout_n, in_sa10);

  slav_fwd_inv: evCINV PORT MAP(slv_dout_n, slav_dout, in_sa11);

  dout   <= slav_dout;
  dout_n <= slv_dout_n;
  sa <= in_sa1 + in_sa2 + in_sa3 + in_sa4 + in_sa5 + in_sa6 + in_sa7 + in_sa8 + in_sa9 + in_sa10 + in_sa11;
end;
---------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
entity evMS_Pr_GClk_FlipFlop is
  port (din: 	in  std_logic;
        din_n: 	in  std_logic;
        clock:  in  std_logic;
        reset_n:in  std_logic;
        dout: 	out std_logic;
        dout_n:	out std_logic;
        sa:  out integer);
end;
-----
architecture only of evMS_Pr_GClk_FlipFlop is
  component evMS_Prstbl_FlipFlop is
    port (din: 	in  std_logic;
          clock:  in  std_logic;
          reset_n:in  std_logic;
          dout: 	out std_logic;
          dout_n:	out std_logic;
          sa:  out integer);
  end component;
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
  signal gated_clock: resolver std_logic;
  signal gated_gnd, int_dout, int_dout_n: std_logic;
  signal in_sa1: integer:=0;
  signal in_sa2: integer:=0;
  signal in_sa3: integer:=0;
  signal in_sa4: integer:=0;
  signal in_sa5: integer:=0;
  signal in_sa6: integer:=0;
begin
  ff: evMS_Prstbl_FlipFlop PORT MAP(din, gated_clock, reset_n, int_dout, int_dout_n, in_sa1);
  
  clk_gatep_this: evPMOS PORT MAP(clock, int_dout_n, gated_clock, in_sa2);
  clk_gatep_prev: evPMOS PORT MAP(clock, din_n, gated_clock, in_sa3);

  clk_gaten_gnd2: evNMOS PORT MAP(gated_gnd, int_dout_n, gated_clock, in_sa4);
  clk_gaten_gnd1: evNMOS PORT MAP('0', din_n, gated_gnd, in_sa5);
  
--  clk_gatep_rst: evPMOS PORT MAP('0', reset_n, gated_clock, in_sa6);

  dout   <= int_dout;
  dout_n <= int_dout_n;
  sa <= in_sa1 + in_sa2 + in_sa3 + in_sa4 + in_sa5 + in_sa6;
end;
-------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
entity evMUX2_1 is
  port (inp1: 	in  std_logic;
        inp2: 	in  std_logic;
        sel: 	in  std_logic;
        mx_out:	out std_logic;
        sa:  out integer);
end;
-----
architecture only of evMUX2_1 is
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
  pms: evPMOS PORT MAP(inp1, sel, int_out, in_sa1);
  nms: evNMOS PORT MAP(inp2, sel, int_out, in_sa2);
  mx_out <= int_out;
  sa <= in_sa1 + in_sa2;
end;
---------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
entity evLPFA is
  port (a: 	in  std_logic;
  	b: 	in  std_logic;
  	cin: 	in  std_logic;
        sum: 	out std_logic;
        cout: 	out std_logic;
        sa:  out integer);
end;
-----
architecture only of evLPFA is
  component evCINV is
    port (a: 	in  std_logic;
          a_not: 	out std_logic;
          sa:  out integer);
  end component;
  component evMUX2_1 is
    port (inp1:   in  std_logic;
          inp2:   in  std_logic;
          sel: 	  in  std_logic;
          mx_out: out std_logic;
          sa:     out integer);
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
  signal a_not, a_xnor_b, a_xor_b, int_sum, int_cout: std_logic;
  signal in_sa1, in_sa2, in_sa3, in_sa4, in_sa5, in_sa6, in_sa7, in_sa8: integer:=0;
begin
  inv: evCINV PORT MAP(a, a_not, in_sa1);
    
  mx1: evMUX2_1 PORT MAP(a, a_not, b, a_xor_b, in_sa2);
  mx2: evMUX2_1 PORT MAP(a_not, a, b, a_xnor_b, in_sa3);
  
  mx3: evMUX2_1 PORT MAP(a_xor_b, a_xnor_b, cin, int_sum, in_sa4);
  mx4: evMUX2_1 PORT MAP(b, cin, a_xor_b, int_cout, in_sa5);

  sum <= int_sum;
  cout <= int_cout;
  sa <= in_sa1 + in_sa2 + in_sa3 + in_sa4 + in_sa5;
end;
---------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
entity evClockGator_RngCntr is
  generic (resetable: boolean := true);
  port (line7: 	in  std_logic;
  		line16:	in  std_logic;
  		clk_in:	in  std_logic;
  		rst:	in  std_logic;
        clk_ot:	out std_logic;
        sa:  out integer);
end;
-----
architecture only of evClockGator_RngCntr is
  component evMUX2_1 is
    port (inp1:   in  std_logic;
          inp2:   in  std_logic;
          sel: 	  in  std_logic;
          mx_out: out std_logic;
          sa:     out integer);
  end component;
  component evRst_Latch_cell is
    port (din: 	in  std_logic;
          unlock: in  std_logic;
          reset_n: in  std_logic;
          dout: 	out std_logic;
          sa:  out integer);
  end component; 
  component evPrst_Latch_cell is
    port (din: 	in  std_logic;
          unlock: in  std_logic;
          reset_n: in  std_logic;
          dout: 	out std_logic;
          sa:  out integer);
  end component; 
  
  signal raw_clk_ot, clock_allowed, sel_lin: std_logic;
  signal in_sa1, in_sa2, in_sa3, in_sa4: integer:=0;
begin
  line_selector: 	evMUX2_1 PORT MAP(line7, line16, clock_allowed, sel_lin, in_sa1);
  
resetable_latch:
  if (resetable=true) generate
    rlatch: evRst_Latch_cell PORT MAP (line7, sel_lin, rst, clock_allowed, in_sa4);
  end generate;
  
presetable_latch:
  if (resetable=false) generate
    prlatch: evPrst_Latch_cell PORT MAP (line7, sel_lin, rst, clock_allowed, in_sa4);
  end generate;
  
  clock_or_zero:	evMUX2_1 PORT MAP('0', clk_in, clock_allowed, raw_clk_ot, in_sa2);
  first_step_omitter:	evMUX2_1 PORT MAP(raw_clk_ot, '0', line7, clk_ot, in_sa3);

  sa <= in_sa1 + in_sa2 + in_sa3 + in_sa4;
end;
---------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
entity evLatch_cell is
  port (din: 	in  std_logic;
        unlock: in  std_logic;
        dout: 	out std_logic;
        sa:  out integer);
end;
-----
architecture only of evLatch_cell is
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
  component evCINV is
    port (a: 	in  std_logic;
          a_not: 	out std_logic;
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
  signal d_not, d_duplicate: std_logic;
  signal in_sa1: integer:=0;
  signal in_sa2: integer:=0;
  signal in_sa3: integer:=0;
  signal in_sa4: integer:=0;
begin
  nms: evNMOS PORT MAP(din, unlock, int_out, in_sa1);
  pms: evPMOS PORT MAP(d_duplicate, unlock, int_out, in_sa2);

  inv1: evCINV PORT MAP(int_out, d_not, in_sa3);
  inv2: evCINV PORT MAP(d_not, d_duplicate, in_sa4);

  dout <= int_out;
  sa <= in_sa1 + in_sa2 + in_sa3 + in_sa4;
end;
---------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
entity evNLatch_cell is
  port (din: 	in  std_logic;
        unlock_n: in  std_logic;
        dout: 	out std_logic;
        sa:  out integer);
end;
-----
architecture only of evNLatch_cell is
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
  component evCINV is
    port (a: 	in  std_logic;
          a_not: 	out std_logic;
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
  signal d_not, d_duplicate: std_logic;
  signal in_sa1: integer:=0;
  signal in_sa2: integer:=0;
  signal in_sa3: integer:=0;
  signal in_sa4: integer:=0;
begin
  nms: evPMOS PORT MAP(din, unlock_n, int_out, in_sa1);
  pms: evNMOS PORT MAP(d_duplicate, unlock_n, int_out, in_sa2);

  inv1: evCINV PORT MAP(int_out, d_not, in_sa3);
  inv2: evCINV PORT MAP(d_not, d_duplicate, in_sa4);

  dout <= int_out;
  sa <= in_sa1 + in_sa2 + in_sa3 + in_sa4;
end;
---------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
entity evRst_Latch_cell is
  port (din: 	in  std_logic;
        unlock: in  std_logic;
        reset_n: in  std_logic;
        dout: 	out std_logic;
        sa:  out integer);
end;
-----
architecture only of evRst_Latch_cell is
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
  component evCINV is
    port (a: 	in  std_logic;
          a_not: 	out std_logic;
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
  signal dout_n, gated_din: resolver std_logic;
  signal int_dout, inv_n_gate, gated_din_1dlta: std_logic;
  signal in_sa1, in_sa2, in_sa3, in_sa4: integer:=0;
  signal in_sa5, in_sa6, in_sa7: integer:=0;
begin
  inp_gate: evNMOS PORT MAP(din, unlock, gated_din, in_sa1);
  p_loop:   evPMOS PORT MAP(int_dout, unlock, gated_din, in_sa2);

  n_rst: evNMOS PORT MAP(gated_din, reset_n, inv_n_gate, in_sa3);
  p_rst: evPMOS PORT MAP('1', reset_n, dout_n, in_sa4);

  gated_din_1dlta <= gated_din;
  n_inv: evNMOS PORT MAP('0', inv_n_gate, dout_n, in_sa5);
  p_inv: evPMOS PORT MAP('1', gated_din_1dlta, dout_n, in_sa6);

  fwd_inv: evCINV PORT MAP(dout_n, int_dout, in_sa7);

  dout <= int_dout;
  sa <= in_sa1 + in_sa2 + in_sa3 + in_sa4+ in_sa5 + in_sa6 + in_sa7;
end;
---------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
entity evPrst_Latch_cell is
  port (din: 	in  std_logic;
        unlock: in  std_logic;
        reset_n: in  std_logic;
        dout: 	out std_logic;
        sa:  out integer);
end;
-----
architecture only of evPrst_Latch_cell is
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
  component evCINV is
    port (a: 	in  std_logic;
          a_not: 	out std_logic;
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
  signal dout_n, gated_din: resolver std_logic;
  signal int_dout, inv_p_gate, gated_din_1dlta: std_logic;
  signal in_sa1, in_sa2, in_sa3, in_sa4: integer:=0;
  signal in_sa5, in_sa6, in_sa7: integer:=0;
begin
  inp_gate: evNMOS PORT MAP(din, unlock, gated_din, in_sa1);
  p_loop:   evPMOS PORT MAP(int_dout, unlock, gated_din, in_sa2);

  n_rst: evNMOS PORT MAP(gated_din, reset_n, inv_p_gate, in_sa3);
  p_rst: evPMOS PORT MAP('0', reset_n, dout_n, in_sa4);

  gated_din_1dlta <= gated_din;
  n_inv: evNMOS PORT MAP('0', gated_din_1dlta, dout_n, in_sa5);
  p_inv: evPMOS PORT MAP('1', inv_p_gate, dout_n, in_sa6);

  fwd_inv: evCINV PORT MAP(dout_n, int_dout, in_sa7);

  dout <= int_dout;
  sa <= in_sa1 + in_sa2 + in_sa3 + in_sa4+ in_sa5 + in_sa6 + in_sa7;
end;
