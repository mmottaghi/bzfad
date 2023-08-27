ENTITY actAND2 IS
  GENERIC (dly :TIME:=0 ns);
  PORT (a:        IN BIT;
        b:        IN BIT;
        ab:       OUT BIT;
        activity: OUT INTEGER;
        shorts:   OUT INTEGER);
END;
--=*=--
ARCHITECTURE only OF actAND2 IS
  SIGNAL toggles : INTEGER :=0;
BEGIN
  ab <= a AND b AD:/Mes courses d'universite/Low Power/Paper/VHDL/LP-Multiplier/event_counter.vhdFTER dly;
  toggles <= toggles+2 WHEN (a'EVENT XOR b'EVENT)
        ELSE toggles+4 WHEN (a'EVENT AND b'EVENT)
        ELSE toggles;
  activity <= toggles;
END;
--------------------------------------------------------------------------------------------------------
ENTITY actOR2 IS
  GENERIC (dly :TIME:=0 ns);
  PORT (a:        IN BIT;
        b:        IN BIT;
        ab:       OUT BIT;
        activity: OUT INTEGER;
        shorts:   OUT INTEGER);
END;
--=*=--
ARCHITECTURE only OF actOR2 IS
  SIGNAL toggles : INTEGER :=0;
BEGIN
  ab <= a OR b AFTER dly;
  toggles <= toggles+2 WHEN (a'EVENT XOR b'EVENT)
        ELSE toggles+4 WHEN (a'EVENT AND b'EVENT)
        ELSE toggles;
  activity <= toggles;
END;
--------------------------------------------------------------------------------------------------------
ENTITY actNAND2 IS
  GENERIC (dly :TIME:=0 ns);
  PORT (a:        IN BIT;
        b:        IN BIT;
        ab:       OUT BIT;
        activity: OUT INTEGER;
        shorts:   OUT INTEGER);
END;
--=*=--
ARCHITECTURE only OF actNAND2 IS
  SIGNAL toggles : INTEGER :=0;
BEGIN
  ab <= a NAND b AFTER dly;
  toggles <= toggles+2 WHEN (a'EVENT XOR b'EVENT)
        ELSE toggles+4 WHEN (a'EVENT AND b'EVENT)
        ELSE toggles;
  activity <= toggles;
END;
--------------------------------------------------------------------------------------------------------
ENTITY actNOR2 IS
  GENERIC (dly :TIME:=0 ns);
  PORT (a:        IN BIT;
        b:        IN BIT;
        ab:       OUT BIT;
        activity: OUT INTEGER;
        shorts:   OUT INTEGER);
END;
--=*=--
ARCHITECTURE only OF actNOR2 IS
  SIGNAL toggles, directs : INTEGER :=0;
BEGIN
  ab <= a NOR b AFTER dly;
  toggles <= toggles+2 WHEN (a'EVENT XOR b'EVENT)
        ELSE toggles+4 WHEN (a'EVENT AND b'EVENT)
        ELSE toggles;
  directs <= directs + 1 WHEN (a'EVENT AND b='0')
                            OR (b'EVENT AND a='0') 
                            OR (a'EVENT AND b'EVENT) 
           ELSE directs;           
  activity <= toggles;
  shorts   <= directs;
END;
--------------------------------------------------------------------------------------------------------
ENTITY actINV IS
  GENERIC (dly :TIME:=0 ns);
  PORT (a:        IN BIT;
        anot:     OUT BIT;
        activity: OUT INTEGER;
        shorts:   OUT INTEGER);
END;
--=*=--
ARCHITECTURE only OF actINV IS
  SIGNAL toggles : INTEGER :=0;
BEGIN
  anot <= NOT a AFTER dly;
  toggles <= toggles+2 WHEN a'EVENT
        ELSE toggles;
  activity <= toggles;
END;
--------------------------------------------------------------------------------------------------------
ENTITY actXOR2 IS
  GENERIC (dly :TIME:=0 ns);
  PORT (a:        IN BIT;
        b:        IN BIT;
        axb:      OUT BIT;
        activity: OUT INTEGER;
        shorts:   OUT INTEGER);
END;
--=*=--
ARCHITECTURE only OF actXOR2 IS
  COMPONENT actNAND2
    GENERIC (dly :TIME:=0 ns);
    PORT (a:        IN BIT;
          b:        IN BIT;
          ab:       OUT BIT;
          activity: OUT INTEGER;
          shorts:   OUT INTEGER);
  END COMPONENT;
  COMPONENT actNOR2
    GENERIC (dly :TIME:=0 ns);
    PORT (a:        IN BIT;
          b:        IN BIT;
          ab:       OUT BIT;
          activity: OUT INTEGER;
          shorts:   OUT INTEGER);
  END COMPONENT;
  COMPONENT actINV
    GENERIC (dly :TIME:=0 ns);
    PORT (a:        IN BIT;
          anot:     OUT BIT;
          activity: OUT INTEGER;
          shorts:   OUT INTEGER);
  END COMPONENT;

  SIGNAL toggles, directs: INTEGER :=0;
  SIGNAL act1, act2, act3, act4 : INTEGER :=0;
  SIGNAL sht1, sht2, sht3, sht4: INTEGER :=0;
  SIGNAL a_b, anb, ab :BIT;
BEGIN
  and1: actNAND2 PORT MAP(a,   b,   a_b, act1, sht1);
  nor1: actNOR2  PORT MAP(a,   b,   anb, act2, sht2);
  nor2: actNOR2  PORT MAP(ab,  anb, axb, act3, sht3);
  inv1: actINV   PORT MAP(a_b, ab,  act4, sht4);
  toggles <= act1 + act2 + act3 + act4;
  directs <= sht1 + sht2 + sht3 + sht4;
  activity <= toggles;
  shorts <= directs;
END;
--------------------------------------------------------------------------------------------------------
ENTITY actOR3 IS
  GENERIC (dly :TIME:=0 ns);
  PORT (a:        IN BIT;
        b:        IN BIT;
        c:        IN BIT;
        abc:      OUT BIT;
        activity: OUT INTEGER;
        shorts:   OUT INTEGER);
END;
--=*=--
ARCHITECTURE only OF actOR3 IS
  SIGNAL toggles : INTEGER :=0;
BEGIN
  abc <= a OR b OR c AFTER dly;
  activity <= toggles;

  PROCESS (a, b, c)
    VARIABLE new_toggles:integer;
  BEGIN
    new_toggles:=0;
    IF (a'EVENT) THEN
      new_toggles := new_toggles + 2;
    END IF;
    IF (b'EVENT) THEN
      new_toggles := new_toggles + 2;
    END IF;
    IF (c'EVENT) THEN
      new_toggles := new_toggles + 2;
    END IF;
    toggles <= toggles+new_toggles;
  END PROCESS;
END;
--------------------------------------------------------------------------------------------------------
ENTITY FullAdder IS
  PORT (a:        IN BIT;
        b:        IN BIT;
        cin:      IN BIT;
        sum:      OUT BIT;
        cout:     OUT BIT;
        activity: OUT INTEGER;
        shorts:   OUT INTEGER);
END;
--=*=--
ARCHITECTURE only OF FullAdder IS
  COMPONENT actAND2
    GENERIC (dly :TIME:=0 ns);
    PORT (a:        IN BIT;
          b:        IN BIT;
          ab:       OUT BIT;
          activity: OUT INTEGER;
          shorts:   OUT INTEGER);
  END COMPONENT;
  COMPONENT actXOR2
    GENERIC (dly :TIME:=0 ns);
    PORT (a:        IN BIT;
          b:        IN BIT;
          axb:      OUT BIT;
          activity: OUT INTEGER;
          shorts:   OUT INTEGER);
  END COMPONENT;
  COMPONENT actOR3
    GENERIC (dly :TIME:=0 ns);
    PORT (a:        IN BIT;
          b:        IN BIT;
          c:        IN BIT;
          abc:      OUT BIT;
          activity: OUT INTEGER;
          shorts:   OUT INTEGER);
  END COMPONENT;

  SIGNAL ab, ac, bc, axb:BIT;
  SIGNAL act1, act2, act3, act4, act5, act6: Integer:=0;
  SIGNAL sht1, sht2, sht3, sht4, sht5, sht6: Integer:=0;
  SIGNAL toggles, directs : INTEGER:=0;
BEGIN
  and1: actAND2 PORT MAP(a,   b,    ab,  act1, sht1);
  and2: actAND2 PORT MAP(a,   cin,  ac,  act2, sht2);
  and3: actAND2 PORT MAP(b,   cin,  bc,  act3, sht3);
  or1:  actOR3  PORT MAP(ab,  ac,   bc,  cout, act4, sht4);
  xor1: actXOR2 PORT MAP(a,   b,    axb, act5, sht5);
  xor2: actXOR2 PORT MAP(axb, cin,  sum, act6, sht6);
  toggles <= act1 + act2 + act3 + act4 + act5 + act6;
  directs <= sht1 + sht2 + sht3 + sht4 + sht5 + sht6;
  activity <= toggles;
  shorts <= directs;
END;
--------------------------------------------------------------------------------------------------------
ENTITY AddingLink IS
  PORT (a:      IN  INTEGER;
        b:      IN  INTEGER;
        aplusb: OUT INTEGER);
END;
--=*=--
ARCHITECTURE only OF AddingLink IS
BEGIN
  aplusb <= a + b;
END;
--------------------------------------------------------------------------------------------------------
ENTITY RCAdder IS
  GENERIC (width : INTEGER);
  PORT (a:        IN bit_vector(width-1 downto 0);
        b:        IN bit_vector(width-1 downto 0);
        cin:      IN BIT;
        sum:      OUT bit_vector(width-1 downto 0);
        cout:     OUT BIT;
        activity: OUT INTEGER;
        shorts:   OUT INTEGER);
END;
--=*=--
ARCHITECTURE only OF RCAdder IS
  COMPONENT FullAdder
    PORT (a:        IN BIT;
          b:        IN BIT;
          cin:      IN BIT;
          sum:      OUT BIT;
          cout:     OUT BIT;
          activity: OUT INTEGER;
          shorts:   OUT INTEGER);
  END COMPONENT;
  COMPONENT AddingLink
    PORT (a:      IN  INTEGER;
          b:      IN  INTEGER;
          aplusb: OUT INTEGER);
  END COMPONENT;

  TYPE int_vector IS ARRAY(NATURAL RANGE <>) OF INTEGER;
  SIGNAL act1, act2, act3, act4, act5, act6: Integer:=0;
  SIGNAL sht1, sht2, sht3, sht4, sht5, sht6: Integer:=0;
  SIGNAL c:bit_vector(width downto 0);
  SIGNAL act, act_link, dkt, dkt_link :int_vector(width downto 0);
BEGIN
  c(0) <= cin;
  cout <= c(width);
  act_link(0) <= 0;
  dkt_link(0) <= 0;

adder_chain:
  FOR i IN 0 to WIDTH-1 GENERATE
    addr:  FullAdder  PORT MAP(a(i), b(i), c(i), sum(i), c(i+1), act(i), dkt(i));
    act_plus: AddingLink PORT MAP(act(i), act_link(i), act_link(i+1));
    dkt_plus: AddingLink PORT MAP(dkt(i), dkt_link(i), dkt_link(i+1));
  END GENERATE;
  activity <= act_link(width);
  shorts   <= dkt_link(width);
END;
--------------------------------------------------------------------------------------------------------
ENTITY tst IS
END;
--=*=--
ARCHITECTURE only OF tst IS
  COMPONENT RCAdder
    GENERIC (width : INTEGER);
    PORT (a:        IN bit_vector(width-1 downto 0);
          b:        IN bit_vector(width-1 downto 0);
          cin:      IN BIT;
          sum:      OUT bit_vector(width-1 downto 0);
          cout:     OUT BIT;
          activity: OUT INTEGER;
          shorts:   OUT INTEGER);
  END COMPONENT;
  COMPONENT actNOR2 
    GENERIC (dly :TIME:=0 ns);
    PORT (a:        IN BIT;
          b:        IN BIT;
          ab:       OUT BIT;
          activity: OUT INTEGER;
          shorts:   OUT INTEGER);
  END COMPONENT;

--  SIGNAL a, b, c, d, e, oor:BIT := '0';
--  SIGNAL act1, act2, act3, act_total: INTEGER :=0;
  SIGNAL c:BIT := '0';
  SIGNAL act1, act2: INTEGER :=0;
  SIGNAL inp1, inp2, sum: bit_vector(15 downto 0):=x"0000";
BEGIN
  --and2: actAND PORT MAP(a, c, e, act2);
  --or1:  actOR  PORT MAP(d, e, oor, act3);
  --act_total <= act1 + act2 + act3;
  --addr: FullAdder PORT MAP(inp(0), inp(1), inp(2), e, c, act1, act2);
  inp1 <= x"1010" after 50 ns, x"0121" after 100 ns,
          x"3100" after 150 ns, x"2401" after 200 ns,
          x"0510" after 250 ns, x"2060" after 300 ns,
          x"0071" after 350 ns, x"3010" after 400 ns;
  inp2 <= x"0420" after 50 ns, x"3201" after 100 ns,
          x"3503" after 150 ns, x"1070" after 200 ns,
          x"3044" after 250 ns, x"0136" after 300 ns,
          x"0312" after 350 ns, x"0413" after 400 ns;
--  rc_addr: RCAdder GENERIC MAP(16) PORT MAP(inp1, inp2, '0', sum, c, act1, act2);
  rxd:     actNOR2 PORT MAP(inp1(0), inp2(1), c, act1, act2);
END;
--------------------------------------------------------------------------------------------------------