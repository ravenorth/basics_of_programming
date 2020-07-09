PROGRAM RunRCopy(INPUT, OUTPUT);
PROCEDURE RCopy(VAR FileIn, FileOut: TEXT);
VAR
  Ch: CHAR;
BEGIN {RCopy}
  IF NOT EOLN(FileIn)
  THEN
    BEGIN
      READ(FileIn, Ch);
      WRITE(FileOut, Ch);
      RCopy(FileIn, FileOut)
    END
END; {RCopy}
BEGIN {RunRCopy}
  RCopy(INPUT, OUTPUT);
  WRITELN(OUTPUT)
END. {RunRCopy}
