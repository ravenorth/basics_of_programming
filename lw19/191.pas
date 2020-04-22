PROGRAM Prime(INPUT, OUTPUT);
CONST
  SieveMin = 2;
  SieveMax = 100;
VAR  
  Sieve: SET OF SieveMin .. SieveMax;
  NewMin, NewMax, CheckNumber: SieveMin .. SieveMax;
BEGIN {Prime}
  NewMin := SieveMin;
  NewMax := SieveMax;
  Sieve := [SieveMin .. SieveMax]; 
  WRITE('Prime numbers in the range up to ', SieveMax, ': ', SieveMin, ' ');
  WHILE (NewMin < NewMax)
  DO
    BEGIN
      CheckNumber := NewMin;
      WHILE CheckNumber <= NewMax
      DO
        BEGIN 
          IF (CheckNumber MOD NewMin = 0)
          THEN
            Sieve := Sieve - [CheckNumber]; 
          CheckNumber := CheckNumber + 1 
        END;
      WHILE NOT (NewMax IN Sieve)
      DO
        NewMax := NewMax - 1;
      WHILE NOT (NewMin IN Sieve)
      DO
        NewMin := NewMin + 1;
      WRITE(NewMin, ' ')
    END;
  WRITELN
END.{Prime}
