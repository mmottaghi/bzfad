library IEEE;
use IEEE.std_logic_1164.all;
entity evRingCounter is
  generic (wdt: integer);
  port (reset_n: in  std_logic;
        clock:   in  std_logic;
        dout:out std_logic_vector(wdt-1 downto 0)
        );
end;
-----
architecture only of evRingCounter is
  component evMS_Rstbl_FlipFlop is
    port (din: 	  in  std_logic;
          clock:  in  std_logic;
          reset_n:in  std_logic;
          dout:   out std_logic
          --;dout_n:   out std_logic
          );
  end component;
  component evMS_Prstbl_FlipFlop is
    port (din: 	  in  std_logic;
          clock:  in  std_logic;
          reset_n:in  std_logic;
          dout:   out std_logic;
          dout_n:   out std_logic
          );
  end component;
  
  signal bits: std_logic_vector(wdt-1 downto 0);

begin
  first_ff: evMS_Prstbl_FlipFlop PORT MAP(bits(wdt-1), clock, reset_n, bits(0));-- ,  OPEN);
  dout(0) <= bits(0);

latch_link:
  for i in 1 to wdt-1 generate
    ff: evMS_Rstbl_FlipFlop PORT MAP(bits(i-1), clock, reset_n, bits(i));-- ,  OPEN);
    dout(i) <= bits(i);
  end generate;
end;
---------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
entity evRingCounter_GtdClk is -- ring counter with gated clock
  generic (wdt : integer; 
           block_size : integer );
  port (reset_n: in  std_logic;
        clock_n:   in  std_logic;
        dout:out std_logic_vector(wdt-1 downto 0)
        );
end;
-----
architecture only of evRingCounter_GtdClk is
  component evMS_Rstbl_FlipFlop is
    port (din: 	  in  std_logic;
          clock:  in  std_logic;
          reset_n:in  std_logic;
          dout:   out std_logic
          --;dout_n:   out std_logic
          );
  end component;
  component evMS_Prstbl_FlipFlop is
    port (din: 	  in  std_logic;
          clock:  in  std_logic;
          reset_n:in  std_logic;
          dout:   out std_logic
          --;dout_n:   out std_logic
          );
  end component;
  component evClockGator_RngCntrR is
 	  port (	entr: 		in  std_logic;
			leave:		in  std_logic;
			clk_in_n:	in  std_logic;
			rst:		in  std_logic;
			clk_ot:		out std_logic
		);
  end component;
  component evClockGator_RngCntrP is
	  port (	entr: 		in  std_logic;
			leave:		in  std_logic;
			clk_in_n:	in  std_logic;
			rst:		in  std_logic;
			clk_ot:		out std_logic
		);
  end component;
  
  
  signal bits: std_logic_vector(wdt-1 downto 0);
  signal gated_clock: std_logic_vector(wdt / block_size downto 0);

begin
  first_gator: evClockGator_RngCntrP PORT MAP(bits(wdt-1), bits(block_size), clock_n, reset_n, gated_clock(0));
  
gtr_loop:
  for i in 1 to wdt / block_size generate
valid:
    if (i/=wdt/block_size) or (wdt mod block_size /= 0) generate
last:
      if ((i+1)*block_size >= wdt) generate
        last_gator: evClockGator_RngCntrR PORT MAP(bits(i*block_size-1), bits(0), clock_n, reset_n, gated_clock(i));
      end generate;
intrmdt:
      if ((i+1)*block_size < wdt) generate
        gator: evClockGator_RngCntrR PORT MAP(bits(i*block_size-1), bits((i+1)*block_size), clock_n, reset_n, gated_clock(i));
      end generate;
    end generate;
  end generate;

  first_ff: evMS_Prstbl_FlipFlop PORT MAP(bits(wdt-1), gated_clock(0), reset_n, bits(0));-- ,  OPEN);
  dout(0) <= bits(0);
  
latch:
  for i in 1 to wdt-1 generate
    ff: evMS_Rstbl_FlipFlop PORT MAP(bits(i-1), gated_clock(i/block_size), reset_n, bits(i));-- ,  OPEN);
    dout(i) <= bits(i);
  end generate;
end;
---------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
entity evInpDemuxLatch is
  generic (wdt: integer);
  port (din: in  std_logic;
        sel: in  std_logic_vector(wdt-1 downto 0);
        dout:out std_logic_vector(wdt-1 downto 0)
        );
end;
-----
architecture only of evInpDemuxLatch is
  component evLatch_cell is
    port (din: 	in  std_logic;
          unlock: in  std_logic;
          dout: 	out std_logic
          );
  end component;

begin
latch_chain:
  for i in 0 to wdt-1 generate
    latch: evLatch_cell PORT MAP(din, sel(i), dout(i));
  end generate;
end;
-------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
entity evNonEncodedMux is
  generic (wdt: integer);
  port (din: in  std_logic_vector(wdt-1 downto 0);
        sel: in  std_logic_vector(wdt-1 downto 0);
        dout:out std_logic
        );
end;
-----
architecture only of evNonEncodedMux is
  component evNMOS is
    port (src: in  std_logic;
          gat: in  std_logic;
          drn: out std_logic
          );
  end component;

  signal int_out: std_logic;

begin
latch_chain:
  for i in 0 to wdt-1 generate
    nms: evNMOS PORT MAP(din(i), sel(i), dout);
  end generate;
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
        cout:out std_logic
        );
end;
-----
architecture only of evlpRCAdder is
  component evLPFA is
    port (a: 	in  std_logic;
    	  b: 	in  std_logic;
    	  cin: 	in  std_logic;
          sum: 	out std_logic;
          cout:	out std_logic
          );
  end component;

  signal imsg: 	std_logic_vector(wdt downto 0);
begin
  imsg(0)  <= cin;
  cout     <= imsg(wdt);

fa_chain:
  for i in 0 to wdt-1 generate
    adder: evLPFA PORT MAP(a(i), b(i), imsg(i), sum(i), imsg(i+1));
  end generate;
  
end;
---------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
entity evlpMux2_1 is
  generic (wdt: integer);
  port (inp1: in  std_logic_vector(wdt-1 downto 0);
        inp2: in  std_logic_vector(wdt-1 downto 0);
        sel:  in  std_logic;
        mx_out:out std_logic_vector(wdt-1 downto 0)
        );
end;
-----
architecture only of evlpMux2_1 is
  component evMUX2_1 is
    port (inp1: 	in  std_logic;
          inp2: 	in  std_logic;
          sel: 	in  std_logic;
          mx_out:	out std_logic
          );
  end component;

begin
latch_chain:
  for i in 0 to wdt-1 generate
    mux: evMUX2_1 PORT MAP(inp1(i), inp2(i), sel, mx_out(i));
  end generate;
end;
---------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
entity evlpRegister is
  generic (wdt: integer);
  port (din: in  std_logic_vector(wdt-1 downto 0);
        clock: in  std_logic;
        reset_n:  in  std_logic;
        dout:out std_logic_vector(wdt-1 downto 0)
        );
end;
-----
architecture only of evlpRegister is
  component evMS_Rstbl_FlipFlop is
    port (din: 	in  std_logic;
          clock:  in  std_logic;
          reset_n:in  std_logic;
          dout: 	out std_logic
          --;dout_n:	out std_logic
          );
  end component;

begin
chain:
  for i in 0 to wdt-1 generate
    ff: evMS_Rstbl_FlipFlop PORT MAP(din(i), clock, reset_n, dout(i));-- ,  OPEN);
  end generate;
end;
---------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
entity evlpMultiplier16 is
  generic (wdt: integer:=16);
  port (a:  	in  std_logic_vector(wdt-1 downto 0);
        b: 	in  std_logic_vector(wdt-1 downto 0);
        rst:	in  std_logic;
        clk:	in  std_logic;
        clk_n:	in  std_logic;
        res:	out std_logic_vector(2*wdt-1 downto 0)
        );
end;
-----
architecture only of evlpMultiplier16 is
  component evlpRCAdder is
    generic (wdt: integer);
    port (a:   in  std_logic_vector(wdt-1 downto 0);
          b:   in  std_logic_vector(wdt-1 downto 0);
          cin: in  std_logic;
          sum: out std_logic_vector(wdt-1 downto 0);
          cout:out std_logic
          );
  end component;
  component evRingCounter_GtdClk is -- ring counter with gated clock
    generic (wdt : integer; 
             block_size : integer);
    port (reset_n: in  std_logic;
          clock_n:   in  std_logic;
          dout:out std_logic_vector(wdt-1 downto 0)
          );
  end component;
  component evNonEncodedMux is
    generic (wdt: integer);
    port (din: in  std_logic_vector(wdt-1 downto 0);
          sel: in  std_logic_vector(wdt-1 downto 0);
          dout:out std_logic
          );
  end component;
  component evMUX2_1 is
    port (inp1: 	in  std_logic;
          inp2: 	in  std_logic;
          sel: 	in  std_logic;
          mx_out:	out std_logic
          );
  end component;
  component evlpMux2_1 is
    generic (wdt: integer);
    port (inp1: in  std_logic_vector(wdt-1 downto 0);
          inp2: in  std_logic_vector(wdt-1 downto 0);
          sel:  in  std_logic;
          mx_out:out std_logic_vector(wdt-1 downto 0)
          );
  end component;
  component evInpDemuxLatch is
    generic (wdt: integer);
    port (din: in  std_logic;
          sel: in  std_logic_vector(wdt-1 downto 0);
          dout:out std_logic_vector(wdt-1 downto 0)
          );
  end component;
  component evlpRegister is
    generic (wdt: integer);
    port (din: in  std_logic_vector(wdt-1 downto 0);
          clock: in  std_logic;
          reset_n:  in  std_logic;
          dout:out std_logic_vector(wdt-1 downto 0)
          );
  end component;
  component evMS_FlipFlop is
    port (din: 	in  std_logic;
  	  clock:  in  std_logic;
 	  dout: 	out std_logic
	  --;dout_n:	out std_logic
	  );
  end component;
  
  signal adder_2nd_inp, adder_out, next_cycle_operand : std_logic_vector(wdt-1 downto 0);
  signal bypassed_operand, hot_bit_selector, low_res, shifted_b: std_logic_vector(wdt-1 downto 0);
  signal shifted_bypassed_operand, shifted_adder_out, this_cycle_result: std_logic_vector(wdt downto 0);
  signal cout, GND, bypreg_clk, fedreg_clk, data_source_selector, next_hot_B_bit, hot_B_bit: std_logic;
begin
  GND <= '0';
  adder: evlpRCAdder GENERIC MAP(wdt) PORT MAP(a, adder_2nd_inp, GND, adder_out, cout);
  
  shifted_b <= GND&b(wdt-1 downto 1);
  nxt_hot_bit_mux: evNonEncodedMux GENERIC MAP(wdt) PORT MAP(shifted_b, hot_bit_selector, next_hot_B_bit);
  
  bypreg_clk <= clk_n NOR  next_hot_B_bit;
  bypass_reg: evlpRegister GENERIC MAP(wdt) PORT MAP(next_cycle_operand, bypreg_clk, rst, bypassed_operand);

  fedreg_clk <= clk_n NAND next_hot_B_bit;
  feeder_reg: evlpRegister GENERIC MAP(wdt) PORT MAP(next_cycle_operand, fedreg_clk, rst, adder_2nd_inp);
  
  shifted_adder_out <= cout&adder_out;
  shifted_bypassed_operand <= GND&bypassed_operand;
  mux: evlpMux2_1 GENERIC MAP(wdt+1) PORT MAP(shifted_bypassed_operand, shifted_adder_out, data_source_selector, this_cycle_result);
  next_cycle_operand <= this_cycle_result(wdt downto 1);
  
  counter: evRingCounter_GtdClk GENERIC MAP(wdt, 4) PORT MAP(rst, clk_n, hot_bit_selector);
  low_res_latch: evInpDemuxLatch GENERIC MAP(wdt) PORT MAP(this_cycle_result(0), hot_bit_selector, low_res);
	
  src_sel_ff: evMS_FlipFlop  PORT MAP(next_hot_B_bit, clk_n, hot_B_bit);
  src_sel_mux:  evMUX2_1 PORT MAP(hot_B_bit, b(0), hot_bit_selector(0), data_source_selector);
  res <= next_cycle_operand & low_res;
end;