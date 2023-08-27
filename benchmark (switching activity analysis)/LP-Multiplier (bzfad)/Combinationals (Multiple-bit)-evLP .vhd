library IEEE;
use IEEE.std_logic_1164.all;
entity evRingCounter is
  generic (wdt: integer);
  port (reset_n: in  std_logic;
        clock:   in  std_logic;
        dout:out std_logic_vector(wdt-1 downto 0);
        sa:  out integer);
end;
-----
architecture only of evRingCounter is
  component evMS_Rstbl_FlipFlop is
    port (din: 	  in  std_logic;
          clock:  in  std_logic;
          reset_n:in  std_logic;
          dout:   out std_logic;
          dout_n:   out std_logic;
          sa:  out integer);
  end component;
  component evMS_Prstbl_FlipFlop is
    port (din: 	  in  std_logic;
          clock:  in  std_logic;
          reset_n:in  std_logic;
          dout:   out std_logic;
          dout_n:   out std_logic;
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
  
  type int_vec is array (natural range<>) of integer;
  signal ltc_sa, in_sa: int_vec(wdt downto 0);

  signal bits: std_logic_vector(wdt-1 downto 0);

begin
  first_latch: evMS_Prstbl_FlipFlop PORT MAP(bits(wdt-1), clock, reset_n, bits(0), OPEN, in_sa(1));
  dout(0) <= bits(0);

latch_link:
  for i in 1 to wdt-1 generate
    latch: evMS_Rstbl_FlipFlop PORT MAP(bits(i-1), clock, reset_n, bits(i), OPEN, ltc_sa(i));
    dout(i) <= bits(i);
    in_sa(i+1) <= in_sa(i) + ltc_sa(i);
  end generate;
  sa <= in_sa(wdt);
end;
---------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
entity evRingCounter_GtdClk is -- ring counter with gated clock
  generic (wdt : integer; 
           block_size : integer := 8);
  port (reset_n: in  std_logic;
        clock:   in  std_logic;
        dout:out std_logic_vector(wdt-1 downto 0);
        sa:  out integer);
end;
-----
architecture only of evRingCounter_GtdClk is
  component evMS_Rstbl_FlipFlop is
    port (din: 	  in  std_logic;
          clock:  in  std_logic;
          reset_n:in  std_logic;
          dout:   out std_logic;
          dout_n:   out std_logic;
          sa:  out integer);
  end component;
  component evMS_Prstbl_FlipFlop is
    port (din: 	  in  std_logic;
          clock:  in  std_logic;
          reset_n:in  std_logic;
          dout:   out std_logic;
          dout_n:   out std_logic;
          sa:  out integer);
  end component;
  component evClockGator_RngCntr is
    generic (resetable: boolean := true);
    port (line7: 	in  std_logic;
    	  line16:	in  std_logic;
   	  clk_in:	in  std_logic;
   	  rst:	    	in  std_logic;
          clk_ot:	out std_logic;
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
  
  type int_vec is array (natural range<>) of integer;
  signal ltc_sa, in_sa: int_vec(wdt downto 0);
  signal gtr_sa, gtr_sa_sum: int_vec(wdt / block_size downto 0):= (others=>0);

  signal bits: std_logic_vector(wdt-1 downto 0);
  signal gated_clock: std_logic_vector(wdt / block_size downto 0);

begin
  first_gator: evClockGator_RngCntr GENERIC MAP(false) PORT MAP(bits(wdt-1), bits(block_size), clock, reset_n, gated_clock(0), gtr_sa_sum(0));
  
gtr_loop:
  for i in 1 to wdt / block_size generate
valid:
    if (i/=wdt/block_size) or (wdt mod block_size /= 0) generate
last:
      if ((i+1)*block_size >= wdt) generate
        last_gator: evClockGator_RngCntr PORT MAP(bits(i*block_size-1), bits(0), clock, reset_n, gated_clock(i), gtr_sa(i));
      end generate;
intrmdt:
      if ((i+1)*block_size < wdt) generate
        gator: evClockGator_RngCntr PORT MAP(bits(i*block_size-1), bits((i+1)*block_size), clock, reset_n, gated_clock(i), gtr_sa(i));
      end generate;
    gtr_sa_sum (i) <= gtr_sa_sum(i-1) + gtr_sa(i);
    end generate;
invalid:
    if (i = wdt/block_size) and (wdt mod block_size = 0) generate
      gtr_sa_sum (i) <= gtr_sa_sum(i-1);
    end generate;
  end generate;

  first_latch: evMS_Prstbl_FlipFlop PORT MAP(bits(wdt-1), gated_clock(0), reset_n, bits(0), OPEN, in_sa(1));
  dout(0) <= bits(0);
  
latch:
  for i in 1 to wdt-1 generate
    cell: evMS_Rstbl_FlipFlop PORT MAP(bits(i-1), gated_clock(i/block_size), reset_n, bits(i), OPEN, ltc_sa(i));
    dout(i) <= bits(i);
    in_sa(i+1) <= in_sa(i) + ltc_sa(i);
  end generate;
  sa <= in_sa(wdt) + gtr_sa_sum (wdt / block_size);
end;
---------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
entity evInpDemuxLatch is
  generic (wdt: integer);
  port (din: in  std_logic;
        sel: in  std_logic_vector(wdt-1 downto 0);
        dout:out std_logic_vector(wdt-1 downto 0);
        sa:  out integer);
end;
-----
architecture only of evInpDemuxLatch is
  component evLatch_cell is
    port (din: 	in  std_logic;
          unlock: in  std_logic;
          dout: 	out std_logic;
          sa:  out integer);
  end component;

  type int_vec is array (natural range<>) of integer;
  signal cel_sa: int_vec(wdt downto 0);
  signal in_sa: int_vec(wdt downto 0);
begin
  in_sa(0) <= 0;

latch_chain:
  for i in 0 to wdt-1 generate
    latch: evLatch_cell PORT MAP(din, sel(i), dout(i), cel_sa(i));
    in_sa(i+1) <= cel_sa(i) + in_sa(i);
  end generate;
  
  sa <= in_sa(wdt);
end;
-------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
entity evNonEncodedMux is
  generic (wdt: integer);
  port (din: in  std_logic_vector(wdt-1 downto 0);
        sel: in  std_logic_vector(wdt-1 downto 0);
        dout:out std_logic;
        sa:  out integer);
end;
-----
architecture only of evNonEncodedMux is
  component evNMOS is
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

  type int_vec is array (natural range<>) of integer;
  signal nms_sa: int_vec(wdt downto 0);
  signal in_sa: int_vec(wdt downto 0);
begin
  in_sa(0) <= 0;

latch_chain:
  for i in 0 to wdt-1 generate
    nms: evNMOS PORT MAP(din(i), sel(i), dout, nms_sa(i));
    in_sa(i+1) <= nms_sa(i) + in_sa(i);
  end generate;
  
  sa <= in_sa(wdt);
end;
-------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
entity evlpRCAdder is
  generic (wdt: integer);
  port (a:   in  std_logic_vector(wdt-1 downto 0);
        b:   in  std_logic_vector(wdt-1 downto 0);
        cin: in  std_logic;
        sum: out std_logic_vector(wdt-1 downto 0);
        cout:out std_logic;
        sa:  out integer);
end;
-----
architecture only of evlpRCAdder is
  component evLPFA is
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
    adder: evLPFA PORT MAP(a(i), b(i), imsg(i), sum(i), imsg(i+1), fa_sa(i));
    in_sa(i+1) <= fa_sa(i) + in_sa(i);
  end generate;
  
  sa <= in_sa(wdt);
end;
---------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
entity evlpMux2_1 is
  generic (wdt: integer);
  port (inp1: in  std_logic_vector(wdt-1 downto 0);
        inp2: in  std_logic_vector(wdt-1 downto 0);
        sel:  in  std_logic;
        mx_out:out std_logic_vector(wdt-1 downto 0);
        sa:  out integer);
end;
-----
architecture only of evlpMux2_1 is
  component evMUX2_1 is
    port (inp1: 	in  std_logic;
          inp2: 	in  std_logic;
          sel: 	in  std_logic;
          mx_out:	out std_logic;
          sa:  out integer);
  end component;

  type int_vec is array (natural range<>) of integer;
  signal cel_sa: int_vec(wdt downto 0);
  signal in_sa: int_vec(wdt downto 0);
begin
  in_sa(0) <= 0;

latch_chain:
  for i in 0 to wdt-1 generate
    mux: evMUX2_1 PORT MAP(inp1(i), inp2(i), sel, mx_out(i), cel_sa(i));
    in_sa(i+1) <= cel_sa(i) + in_sa(i);
  end generate;
  
  sa <= in_sa(wdt);
end;
---------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
entity evlpRegister is
  generic (wdt: integer);
  port (din: in  std_logic_vector(wdt-1 downto 0);
        clock: in  std_logic;
        reset_n:  in  std_logic;
        dout:out std_logic_vector(wdt-1 downto 0);
        sa:  out integer);
end;
-----
architecture only of evlpRegister is
  component evMS_Rstbl_FlipFlop is
    port (din: 	in  std_logic;
          clock:  in  std_logic;
          reset_n:in  std_logic;
          dout: 	out std_logic;
          dout_n:	out std_logic;
          sa:  out integer);
  end component;

  type int_vec is array (natural range<>) of integer;
  signal cel_sa: int_vec(wdt downto 0);
  signal in_sa: int_vec(wdt downto 0);
begin
  in_sa(0) <= 0;

latch_chain:
  for i in 0 to wdt-1 generate
    mux: evMS_Rstbl_FlipFlop PORT MAP(din(i), clock, reset_n, dout(i), OPEN, cel_sa(i));
    in_sa(i+1) <= cel_sa(i) + in_sa(i);
  end generate;
  
  sa <= in_sa(wdt);
end;
---------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
entity evlpMultiplier is
  generic (wdt: integer);
  port (a:  	in  std_logic_vector(wdt-1 downto 0);
        b: 	in  std_logic_vector(wdt-1 downto 0);
        rst:	in  std_logic;
        clk:	in  std_logic;
        res:	out std_logic_vector(2*wdt-1 downto 0);
        ready:	out  std_logic;
        sa:  	out integer);
end;
-----
architecture only of evlpMultiplier is
  component evlpRCAdder is
    generic (wdt: integer);
    port (a:   in  std_logic_vector(wdt-1 downto 0);
          b:   in  std_logic_vector(wdt-1 downto 0);
          cin: in  std_logic;
          sum: out std_logic_vector(wdt-1 downto 0);
          cout:out std_logic;
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
  component evNonEncodedMux is
    generic (wdt: integer);
    port (din: in  std_logic_vector(wdt-1 downto 0);
          sel: in  std_logic_vector(wdt-1 downto 0);
          dout:out std_logic;
          sa:  out integer);
  end component;
  component evMUX2_1 is
    port (inp1: 	in  std_logic;
          inp2: 	in  std_logic;
          sel: 	in  std_logic;
          mx_out:	out std_logic;
          sa:  out integer);
  end component;
  component evlpMux2_1 is
    generic (wdt: integer);
    port (inp1: in  std_logic_vector(wdt-1 downto 0);
          inp2: in  std_logic_vector(wdt-1 downto 0);
          sel:  in  std_logic;
          mx_out:out std_logic_vector(wdt-1 downto 0);
          sa:  out integer);
  end component;
  component evInpDemuxLatch is
    generic (wdt: integer);
    port (din: in  std_logic;
          sel: in  std_logic_vector(wdt-1 downto 0);
          dout:out std_logic_vector(wdt-1 downto 0);
          sa:  out integer);
  end component;
  component evlpRegister is
    generic (wdt: integer);
    port (din: in  std_logic_vector(wdt-1 downto 0);
          clock: in  std_logic;
          reset_n:  in  std_logic;
          dout:out std_logic_vector(wdt-1 downto 0);
          sa:  out integer);
  end component;
  component evNLatch_cell is
    port (din: 	in  std_logic;
          unlock_n: in  std_logic;
          dout: 	out std_logic;
          sa:  out integer);
  end component;
  
  signal adder_2nd_inp, adder_out, next_cycle_operand : std_logic_vector(wdt-1 downto 0);
  signal bypassed_operand, hot_bit, low_res, shifted_b: std_logic_vector(wdt-1 downto 0);
  signal shifted_bypassed_operand, shifted_adder_out, this_cycle_result: std_logic_vector(wdt downto 0);
  signal cout, bypreg_clk, fedreg_clk, data_source_selector, next_hot_bit, kept_x_next_hot_bit: std_logic;
  signal in_sa1, in_sa2, in_sa3, in_sa4, in_sa5, in_sa6, in_sa7 :integer;
  signal in_sa8, in_sa9, in_sa10, in_sa11:integer;
begin
  adder: evlpRCAdder GENERIC MAP(wdt) PORT MAP(a, adder_2nd_inp, '0', adder_out, cout, in_sa1);
  
  shifted_b <= '0'&b(wdt-1 downto 1);
  nxt_hot_bit_mux: evNonEncodedMux GENERIC MAP(wdt) PORT MAP(shifted_b, hot_bit, next_hot_bit, in_sa2);
  nxt_ht_keeper_latch: evNLatch_cell PORT MAP (next_hot_bit, clk, kept_x_next_hot_bit, in_sa11);
  fd_clk_mux: evMUX2_1 PORT MAP(clk, '0', kept_x_next_hot_bit, bypreg_clk, in_sa3);
  byp_clk_mux: evMUX2_1 PORT MAP('0', clk, kept_x_next_hot_bit, fedreg_clk, in_sa4);
  
  bypass_reg: evlpRegister GENERIC MAP(wdt) PORT MAP(next_cycle_operand, bypreg_clk, rst, bypassed_operand, in_sa5);
  feeder_reg: evlpRegister GENERIC MAP(wdt) PORT MAP(next_cycle_operand, fedreg_clk, rst, adder_2nd_inp, in_sa6);
  
  shifted_adder_out <= cout&adder_out;
  shifted_bypassed_operand <= '0'&bypassed_operand;
  mux: evlpMux2_1 GENERIC MAP(wdt+1) PORT MAP(shifted_bypassed_operand, shifted_adder_out, data_source_selector, this_cycle_result, in_sa7);
  next_cycle_operand <= this_cycle_result(wdt downto 1);
  
  counter: evRingCounter_GtdClk GENERIC MAP(wdt, 4) PORT MAP(rst, clk, hot_bit, in_sa8);
  b_bit_mux: evNonEncodedMux GENERIC MAP(wdt) PORT MAP(b, hot_bit, data_source_selector, in_sa9);
  low_res_latch: evInpDemuxLatch GENERIC MAP(wdt) PORT MAP(this_cycle_result(0), hot_bit, low_res, in_sa10);

  res <= next_cycle_operand & low_res;
  ready <= hot_bit(wdt-1) AND clk;
  sa <= in_sa1 + in_sa2 + in_sa3 + in_sa4 + in_sa5 + in_sa6 + in_sa7 + in_sa8 + in_sa9 + in_sa10 + in_sa11;
end;