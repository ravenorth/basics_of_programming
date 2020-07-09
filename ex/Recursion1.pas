PROGRAM RunReverse(INPUT, OUTPUT);
PROCEDURE Reverse(VAR FileIn, FileOut: TEXT);
VAR
  Ch: CHAR;
BEGIN {Reverse}
  IF NOT EOLN(FileIn)
  THEN
    BEGIN
      READ(FileIn, Ch);
      Reverse(FileIn, FileOut);
      WRITE(FileOut, Ch)
    END
END; {Reverse}
BEGIN {RunReverse}
  Reverse(INPUT, OUTPUT);
  WRITELN(OUTPUT)
END. {RunReverse}
