PROGRAM Stat(INPUT, OUTPUT);
VAR
  N, D, MaxInteger, Min, Max, Ave, Sum, Count: INTEGER;
  OverFlow: BOOLEAN;
PROCEDURE ReadDigit(VAR F: TEXT; VAR D: INTEGER);
VAR
  Ch: CHAR;
BEGIN {ReadDigit}
  D := -1;
  IF NOT EOLN(F)
  THEN
    READ(Ch);
  IF Ch = '0' THEN D := 0 ELSE
  IF Ch = '1' THEN D := 1 ELSE
  IF Ch = '2' THEN D := 2 ELSE
  IF Ch = '3' THEN D := 3 ELSE
  IF Ch = '4' THEN D := 4 ELSE
  IF Ch = '5' THEN D := 5 ELSE
  IF Ch = '6' THEN D := 6 ELSE
  IF Ch = '7' THEN D := 7 ELSE
  IF Ch = '8' THEN D := 8 ELSE
  IF Ch = '9' THEN D := 9
END; {ReadDigit}
PROCEDURE ReadNumber(VAR F: TEXT; VAR N: INTEGER); 
BEGIN{ReadNumber}
  N := 0;
  ReadDigit(INPUT, D);
  WHILE ((D <> -1) AND (N <> -1))
  DO
    BEGIN
      IF (D  <= (MaxInteger - N * 10)) 
      THEN
        N := N * 10 + D 
      ELSE
        N := -1;  
      ReadDigit(INPUT, D)
    END
END;{ReadNumber}
BEGIN {Stat}
  MaxInteger := 32767;
  Min := 32767;
  Max := 0;
  OverFlow := FALSE;
  WHILE ((NOT EOLN) AND (OverFlow = FALSE))
  DO
    BEGIN
      ReadNumber(INPUT, N);
      IF (N  <= (MaxInteger - Sum)) AND (N <> -1)
      THEN
        BEGIN
          Sum := Sum + N;
          Count := Count + 1;
          IF N < Min
          THEN
            Min := N;
          IF N > Max
          THEN
            Max := N;
        END
      ELSE
        OverFlow := TRUE
    END;
  IF (OverFlow = FALSE) 
  THEN
    BEGIN
      Ave := (Sum * 100) DIV Count;
      WRITELN('Min: ', Min);
      WRITELN('Max: ', Max);
      WRITELN('Average: ', Ave DIV 100, '.', Ave MOD 100)
    END
  ELSE
    WRITELN('OVERFLOW ERROR')
END. {Stat}











