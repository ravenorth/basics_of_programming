PROGRAM RunReadNumber(INPUT, OUTPUT);
VAR
  N, D: INTEGER;
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
VAR
  Max: INTEGER;  
BEGIN{ReadNumber}
  Max := 32767;
  N := 0;
  ReadDigit(INPUT, D);
  WHILE ((D <> -1) AND (N <> -1))
  DO
    BEGIN
      IF ((D  <= (Max - N * 10)) AND (D <> -1))
      THEN
        N := N * 10 + D 
      ELSE
        N := -1;  
      ReadDigit(INPUT, D)
    END
END;{ReadNumber}
BEGIN {RunReadNumber}
  ReadNumber(INPUT, N);
  WRITELN(N)
END. {RunReadNumber}
