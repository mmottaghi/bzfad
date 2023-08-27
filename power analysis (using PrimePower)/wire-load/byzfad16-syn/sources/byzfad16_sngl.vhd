library IEEE;
use IEEE.std_logic_1164.all;
entity evMS_FlipFlop is
  port (din: 	in  std_logic;
        clock:  in  std_logic;
        dout: 	out std_logic
        --;dout_n:	out std_logic
        );
end;
-----
architecture only of evMS_FlipFlop is
begin
DFF_PROCESS: process (clock)
     begin
           if (clock'event and clock = '1') then
                dout <= din;
           end if;
     end process;
end;
---------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
entity evMS_Rstbl_FlipFlop is
  port (din: 	in  std_logic;
        clock:  in  std_logic;
        reset_n:in  std_logic;
        dout: 	out std_logic
        --;dout_n:	out std_logic
        );
end;
-----
architecture only of evMS_Rstbl_FlipFlop is
begin
DFF_PROCESS: process (clock, reset_n)
     begin
           if (reset_n = '0') then

                dout <= '0';

           elsif (clock'event and clock = '1') then

                dout <= din;

           end if;
     end process;
end;
---------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
entity evMS_Prstbl_FlipFlop is
  port (din: 	in  std_logic;
        clock:  in  std_logic;
        reset_n:in  std_logic;
        dout: 	out std_logic
        --;dout_n: out std_logic
        );
end;
-----
architecture only of evMS_Prstbl_FlipFlop is
begin
DFF_PROCESS: process (clock, reset_n)

     begin
           if (reset_n = '0') then

                dout <= '1';

           elsif (clock'event and clock = '1') then

                dout <= din;

           end if;

     end process;
end;
-------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
entity evMUX2_1 is
  port (inp1: 	in  std_logic;
        inp2: 	in  std_logic;
        sel: 	in  std_logic;
        mx_out:	out std_logic
        );
end;
-----
architecture only of evMUX2_1 is
begin
mux : process (inp1, inp2, sel) is
	begin
		case sel is
			when '0' =>
				mx_out <= inp1;
			when '1' =>
				mx_out <= inp2;
			when others  =>
				mx_out <= 'Z';
		end case;
	end process;
end;
---------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
entity evLPFA is
  port (a: 	in  std_logic;
  	b: 	in  std_logic;
  	cin: 	in  std_logic;
        sum: 	out std_logic;
        cout: 	out std_logic
        );
end;
-----
architecture only of evLPFA is
  component evCINV is
    port (a: 	in  std_logic;
          a_not: 	out std_logic
          );
  end component;
  component evMUX2_1 is
    port (inp1:   in  std_logic;
          inp2:   in  std_logic;
          sel: 	  in  std_logic;
          mx_out: out std_logic
          );
  end component;
  
  signal a_not, a_xnor_b, a_xor_b, int_sum, int_cout: std_logic;
begin
  inv: evCINV PORT MAP(a, a_not);
    
  mx1: evMUX2_1 PORT MAP(a, a_not, b, a_xor_b);
  mx2: evMUX2_1 PORT MAP(a_not, a, b, a_xnor_b);
  
  mx3: evMUX2_1 PORT MAP(a_xor_b, a_xnor_b, cin, int_sum);
  mx4: evMUX2_1 PORT MAP(b, cin, a_xor_b, int_cout);

  sum <= int_sum;
  cout <= int_cout;
end;
---------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
entity evClockGator_RngCntrR is
  port (	entr: 	in  std_logic;
  		leave:	in  std_logic;
  		clk_in_n:	in  std_logic;
  		rst:	in  std_logic;
        	clk_ot:	out std_logic
        );
end;
-----
architecture only of evClockGator_RngCntrR is
  component evMUX2_1 is
    port (inp1:   in  std_logic;
          inp2:   in  std_logic;
          sel: 	  in  std_logic;
          mx_out: out std_logic
          );
  end component;
  component evRst_Latch_cell is
    port (din: 	in  std_logic;
          unlock: in  std_logic;
          reset_n: in  std_logic;
          dout: 	out std_logic
          );
  end component; 
  
  signal clock_allowed, sel_lin: std_logic;
begin
  line_selector: 	evMUX2_1 PORT MAP(entr, leave, clock_allowed, sel_lin);
  
  rlatch: evRst_Latch_cell PORT MAP (entr, sel_lin, rst, clock_allowed);
  
  clk_ot <= clock_allowed NAND clk_in_n;
end;
---------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
entity evClockGator_RngCntrP is
  port (	entr: 	in  std_logic;
  		leave:	in  std_logic;
  		clk_in_n:	in  std_logic;
  		rst:	in  std_logic;
        	clk_ot:	out std_logic
        );
end;
-----
architecture only of evClockGator_RngCntrP is
  component evMUX2_1 is
    port (inp1:   in  std_logic;
          inp2:   in  std_logic;
          sel: 	  in  std_logic;
          mx_out: out std_logic
          );
  end component;
  component evPrst_Latch_cell is
    port (din: 	in  std_logic;
          unlock: in  std_logic;
          reset_n: in  std_logic;
          dout: 	out std_logic
          );
  end component; 
  
  signal clock_allowed, sel_lin: std_logic;
begin
  line_selector: 	evMUX2_1 PORT MAP(entr, leave, clock_allowed, sel_lin);
  
  prlatch: evPrst_Latch_cell PORT MAP (entr, sel_lin, rst, clock_allowed);
  
  clk_ot <= clock_allowed NAND clk_in_n;
end;
---------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
entity evLatch_cell is
  port (din: 	in  std_logic;
        unlock: in  std_logic;
        dout: 	out std_logic
        );
end;
-----
architecture only of evLatch_cell is
begin
	Latch_Data: process(unlock, din)
	begin
		if (unlock = '1') then
			dout <= din;
		end if; 
	end process;
end;
---------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
entity evNLatch_cell is
  port (din: 	in  std_logic;
        unlock_n: in  std_logic;
        dout: 	out std_logic
        );
end;
-----
architecture only of evNLatch_cell is
begin
	Latch_Data: process(unlock_n, din)
		begin
		if (unlock_n = '0') then
			dout <= din;
		end if; 
	end process;
end;
---------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
entity evRst_Latch_cell is
  port (din: 	in  std_logic;
        unlock: in  std_logic;
        reset_n: in  std_logic;
        dout: 	out std_logic
        );
end;
-----
architecture only of evRst_Latch_cell is
begin
	Latch_Data: process(unlock, din, reset_n)
	begin
		if (reset_n = '0') then
			dout <= '0';
		elsif (unlock = '1') then
			dout <= din;
		end if; 
	end process;
end;
---------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
entity evRst_NLatch_cell is
  port (din: 	in  std_logic;
        unlock_n: in  std_logic;
        reset_n: in  std_logic;
        dout: 	out std_logic
        );
end;
-----
architecture only of evRst_NLatch_cell is
begin
	Latch_Data: process(unlock_n, din, reset_n)
	begin
		if (reset_n = '0') then
			dout <= '0';
		elsif (unlock_n = '0') then
			dout <= din;
		end if; 
	end process;
end;
---------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
entity evPrst_Latch_cell is
  port (din: 	in  std_logic;
        unlock: in  std_logic;
        reset_n: in  std_logic;
        dout: 	out std_logic
        );
end;
-----
architecture only of evPrst_Latch_cell is
begin
	Latch_Data: process(unlock, din, reset_n)
	begin
		if (reset_n = '0') then
			dout <= '1';
		elsif (unlock = '1') then
			dout <= din;
		end if; 
	end process;
end;
---------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
entity evPrst_NLatch_cell is
  port (din: 	in  std_logic;
        unlock_n: in  std_logic;
        reset_n: in  std_logic;
        dout: 	out std_logic
        );
end;
-----
architecture only of evPrst_NLatch_cell is
begin
	Latch_Data: process(unlock_n, din, reset_n)
	begin
		if (reset_n = '0') then
			dout <= '1';
		elsif (unlock_n = '0') then
			dout <= din;
		end if; 
	end process;
end;
---------------------------------------------------------------
--library IEEE;
--use IEEE.std_logic_1164.all;
--entity evMS_R_GClk_FlipFlop is
--  port (din: 	in  std_logic;
--        din_n: 	in  std_logic;
--        clock:  in  std_logic;
--        reset_n:in  std_logic;
--        dout: 	out std_logic;
--        dout_n:	out std_logic
--        );
--end;
-------
--architecture only of evMS_R_GClk_FlipFlop is
--  component evMS_Rstbl_FlipFlop is
--    port (din: 	in  std_logic;
--          clock:  in  std_logic;
--          reset_n:in  std_logic;
--          dout: 	out std_logic
--          --;dout_n:	out std_logic
--          );
--  end component;
--  component evNMOS is
--    port (src: in  std_logic;
--          gat: in  std_logic;
--          drn: out std_logic
--          );
--  end component;
--  component evPMOS is
--    port (src: in  std_logic;
--          gat: in  std_logic;
--          drn: out std_logic
--          );
--  end component;
--  
--  signal gated_clock: std_logic;
--  signal GND, gated_gnd, int_dout, int_dout_n: std_logic;
--begin
--  GND <= '0';
--  ff: evMS_Rstbl_FlipFlop PORT MAP(din, gated_clock, reset_n, int_dout, int_dout_n);
--  
--  clk_gate_this: evPMOS PORT MAP(clock, int_dout_n, gated_clock);
--  clk_gate_prev: evPMOS PORT MAP(clock, din_n, gated_clock); -- 
--
--  clk_gate_gnd2: evNMOS PORT MAP(gated_gnd, int_dout_n, gated_clock);
--  clk_gate_gnd1: evNMOS PORT MAP(GND, din_n, gated_gnd);
--
--  dout   <= int_dout;
--  dout_n <= int_dout_n;
--end;
---------------------------------------------------------------
--library IEEE;
--use IEEE.std_logic_1164.all;
--entity evMS_Pr_GClk_FlipFlop is
--  port (din: 	in  std_logic;
--        din_n: 	in  std_logic;
--        clock:  in  std_logic;
--        reset_n:in  std_logic;
--        dout: 	out std_logic;
--        dout_n:	out std_logic
--        );
--end;
-------
--architecture only of evMS_Pr_GClk_FlipFlop is
--  component evMS_Prstbl_FlipFlop is
--    port (din: 	in  std_logic;
--          clock:  in  std_logic;
--          reset_n:in  std_logic;
--          dout: 	out std_logic
--          --;dout_n:	out std_logic
--          );
--  end component;
--  component evNMOS is
--    port (src: in  std_logic;
--          gat: in  std_logic;
--          drn: out std_logic
--          );
--  end component;
--  component evPMOS is
--    port (src: in  std_logic;
--          gat: in  std_logic;
--          drn: out std_logic
--          );
--  end component;
--  
--  signal gated_clock: std_logic;
--  signal GND, gated_gnd, int_dout, int_dout_n: std_logic;
--begin
--  GND <= '0';
--  ff: evMS_Prstbl_FlipFlop PORT MAP(din, gated_clock, reset_n, int_dout, int_dout_n);
--  
--  clk_gatep_this: evPMOS PORT MAP(clock, int_dout_n, gated_clock);
--  clk_gatep_prev: evPMOS PORT MAP(clock, din_n, gated_clock);
--
--  clk_gaten_gnd2: evNMOS PORT MAP(gated_gnd, int_dout_n, gated_clock);
--  clk_gaten_gnd1: evNMOS PORT MAP(GND, din_n, gated_gnd);
--  
----  clk_gatep_rst: evPMOS PORT MAP('0', reset_n, gated_clock);
--
--  dout   <= int_dout;
--  dout_n <= int_dout_n;
--end;
