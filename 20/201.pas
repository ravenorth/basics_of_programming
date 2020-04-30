PROGRAM XPrintRun(INPUT, OUTPUT);
CONST
  ValidSymbols = ['A' .. 'F'];
VAR  
  Ch: CHAR;
  
PROCEDURE XPrint(Ch: CHAR);
VAR
  Matrix: SET OF 1 .. 25;
  I, J: INTEGER;
BEGIN {XPrint}  
  Matrix := [];
  CASE Ch OF 
    'A': Matrix := [3, 7, 9, 11 .. 16, 20, 21, 25];
    'B': Matrix := [1 .. 4, 6, 10 .. 14, 16, 20 .. 24];
    'C': Matrix := [2 .. 6, 11, 16, 22 .. 25];
    'D': Matrix := [1 .. 4, 6, 10, 11, 15, 16, 20 .. 24];
    'E': Matrix := [1 .. 6, 11 .. 16, 21 .. 25];
    'F': Matrix := [1 .. 6, 11 .. 16, 21]
    ELSE WRITE('INVALID SYMBOL') 
  END;
  IF (Matrix <> [])
  THEN
    FOR I := 0 TO 4
    DO
      BEGIN                       
        FOR J := (1 + 5 * I) TO (5 + 5 * I)
        DO
          IF J IN Matrix
          THEN
            WRITE('X')
          ELSE
            WRITE(' ');
        WRITELN  
      END;
  WRITELN
END;{XPrint}

BEGIN {XPrintRun}
  WRITE('ENTER SYMBOL: ');
  IF NOT EOLN
  THEN
    BEGIN
      READ(Ch);
      XPrint(Ch)
     END
  ELSE
    WRITELN('NO SYMBOL')  
END.{XPrintRun}
