PROGRAM RunReadDigit(INPUT, OUTPUT);
VAR
  D: INTEGER;
PROCEDURE ReadDigit(VAR F: TEXT; VAR D: INTEGER);
VAR
  Ch: CHAR;
  EndLine: BOOLEAN;
BEGIN {ReadDigit}
  D := -1;
  EndLine := EOLN(F);
  IF NOT EndLine
  THEN
    READ(Ch);
  IF ((Ch <= '9') AND (Ch >= '0'))
  THEN
    D := 0; 
  WHILE ((NOT EndLine) AND ((Ch <= '9') AND (Ch >= '0')))
  DO
    BEGIN 
      EndLine := EOLN(F);
      IF Ch = '1' THEN D := D + 1 ELSE
      IF Ch = '2' THEN D := D + 2 ELSE
      IF Ch = '3' THEN D := D + 3 ELSE
      IF Ch = '4' THEN D := D + 4 ELSE
      IF Ch = '5' THEN D := D + 5 ELSE
      IF Ch = '6' THEN D := D + 6 ELSE
      IF Ch = '7' THEN D := D + 7 ELSE
      IF Ch = '8' THEN D := D + 8 ELSE
      IF Ch = '9' THEN D := D + 9;
      IF NOT EndLine
      THEN
        READ(Ch)  
    END
END; {ReadDigit}
BEGIN {RunReadDigit}
  ReadDigit(INPUT, D);
  WRITELN(D)
END. {RunReadDigit}
