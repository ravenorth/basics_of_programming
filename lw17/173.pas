PROGRAM Stat(INPUT, OUTPUT);
CONST
  MaxInteger = 32767;
VAR
  Number, Digit, Min, Max, Average, Sum, Count: INTEGER;
  OverFlow: BOOLEAN;

PROCEDURE ReadDigit(VAR FIn: TEXT; VAR Digit: INTEGER);
VAR
  Ch: CHAR;
BEGIN {ReadDigit}
  Digit := -1;
  IF NOT EOLN
  THEN
    READ(Ch);
  IF Ch = '0' THEN Digit := 0 ELSE
  IF Ch = '1' THEN Digit := 1 ELSE
  IF Ch = '2' THEN Digit := 2 ELSE
  IF Ch = '3' THEN Digit := 3 ELSE
  IF Ch = '4' THEN Digit := 4 ELSE
  IF Ch = '5' THEN Digit := 5 ELSE
  IF Ch = '6' THEN Digit := 6 ELSE
  IF Ch = '7' THEN Digit := 7 ELSE
  IF Ch = '8' THEN Digit := 8 ELSE
  IF Ch = '9' THEN Digit := 9
END; {ReadDigit}

PROCEDURE ReadNumber(VAR FIn: TEXT; VAR Number: INTEGER); 
BEGIN{ReadNumber}
  Number := 0;
  ReadDigit(INPUT, Digit);
  WHILE (Digit <> -1) AND (Number <> -1) 
  DO
    BEGIN
      IF (Digit  <= (MaxInteger - Number * 10)) 
      THEN
        Number := Number * 10 + Digit 
      ELSE
        Number := -1;  
      ReadDigit(INPUT, Digit)
    END
END;{ReadNumber}

BEGIN {Stat}
  Min := 32767;
  Max := 0;
  OverFlow := FALSE;
  WHILE (NOT EOLN) AND (NOT OverFlow)
  DO
    BEGIN
      ReadNumber(INPUT, Number);
      IF (Number  <= (MaxInteger - Sum)) AND (Number <> -1)
      THEN
        BEGIN
          Sum := Sum + Number;
          Count := Count + 1;
          IF Number < Min
          THEN
            Min := Number;
          IF Number > Max
          THEN
            Max := Number
        END
      ELSE
        OverFlow := TRUE
    END;
  IF (NOT OverFlow) 
  THEN
    BEGIN
      Average := (Sum * 100) DIV Count;
      WRITELN('Min: ', Min);
      WRITELN('Max: ', Max);
      WRITELN('Average: ', Average DIV 100, '.', Average MOD 100)
    END
  ELSE
    WRITELN('OVERFLOW ERROR')
END. {Stat}
