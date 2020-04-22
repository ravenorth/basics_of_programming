PROGRAM Prime(INPUT, OUTPUT);
CONST
  MinSieve = 2;
  MaxSieve = 100;
VAR  
  Sieve: SET OF MinSieve .. MaxSieve;
  MinNow, MaxNow, CheckNumber: MinSieve .. MaxSieve;
BEGIN {Prime}
  MinNow := MinSieve;
  MaxNow := MaxSieve;
  Sieve := [MinSieve .. MaxSieve]; 
  WRITE('Ïðîñòûå ÷èñëà â äèàïàçîíå äî ', MaxSieve, ': ', MinSieve, ' ');
  WHILE (MinNow < MaxNow)
  DO
    BEGIN
      CheckNumber := MinNow;
      WHILE CheckNumber <= MaxNow
      DO
        BEGIN 
          IF (CheckNumber MOD MinNow = 0)
          THEN
            Sieve := Sieve - [CheckNumber]; 
          CheckNumber := CheckNumber + 1 
        END;
      WHILE NOT (MaxNow IN Sieve)
      DO
        MaxNow := MaxNow - 1;
      WHILE NOT (MinNow IN Sieve)
      DO
        MinNow := MinNow + 1;
      WRITE(MinNow, ' ')
    END;
  WRITELN
END.{Prime}
