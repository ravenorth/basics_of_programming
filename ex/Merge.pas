PROGRAM RunMerge(INPUT, OUTPUT);
VAR
  F1, F2: TEXT;
  
PROCEDURE Merge(VAR F1, F2, FOut: TEXT);
VAR
  Ch1, Ch2: CHAR;
  F1End, F2End: BOOLEAN;
BEGIN {Merge}
  RESET(F1);
  RESET(F2);
  REWRITE(FOut);
  F1End := FALSE;
  F2End := FALSE;
  IF NOT EOLN(F1)
  THEN
    READ(F1, Ch1)
  ELSE
    F1End := TRUE;
  IF NOT EOLN(F2)
  THEN
    READ(F2, Ch2)
  ELSE
    F2End := TRUE;
  WHILE (NOT F1End) AND (NOT F2End)
  DO
    IF Ch1 < Ch2
    THEN
      BEGIN 
        WRITE(FOut, Ch1);
        IF NOT EOLN(F1)
        THEN
          READ(F1, Ch1)
        ELSE
          F1End := TRUE
      END
    ELSE
      BEGIN
        WRITE(FOut, Ch2);
        IF NOT EOLN(F2)
        THEN
          READ(F2, Ch2)
        ELSE
          F2End := TRUE
    END;
  IF (F1End) AND (NOT F2End)
  THEN
    BEGIN
      WRITE(FOut, Ch2);
      WHILE NOT EOLN(F2)
      DO
        BEGIN
          READ(F2, Ch2);
          WRITE(FOut, Ch2)
        END
    END;
  IF (F2End) AND (NOT F1End)
  THEN
    BEGIN
      WRITE(FOut, Ch1);
      WHILE NOT EOLN(F1)
      DO
        BEGIN
          READ(F1, Ch1);
          WRITE(FOut, Ch1)
        END
    END;
  WRITELN(FOut)
END; {Merge}

BEGIN {RunMerge}
  ASSIGN(F1, 'f1.txt');
  ASSIGN(F2, 'f2.txt');
  Merge(F1, F2, OUTPUT);
  CLOSE(F1);
  CLOSE(F2)  
END. {RunMerge}
 

