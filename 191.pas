PROGRAM Prime(INPUT, OUTPUT);
VAR  
  Sieve: SET OF 2 .. 100;
  Min, Max, N: 2 .. 100;
BEGIN {Prime}
  Min := 2;
  Max := 100;
  Sieve := [Min .. Max]; 
  WRITE('������� ����� � ��������� �� ', Max, ': ', Min, ' ');
  WHILE (Min < Max)
  DO
    BEGIN
      N := Min;
      WHILE N <= Max
      DO
        BEGIN 
          IF (N MOD Min = 0)
          THEN
            Sieve := Sieve - [N]; 
          N := N + 1 
        END;
      WHILE NOT (Max IN Sieve)
      DO
        Max := Max - 1;
      WHILE NOT (Min IN Sieve)
      DO
        Min := Min + 1;
      WRITE(Min, ' ')
    END;
  WRITELN
END.{Prime}
