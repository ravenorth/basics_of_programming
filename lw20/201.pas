PROGRAM XPrint(INPUT, OUTPUT);
CONST
  MatrixRowSize = 5;
VAR  
  Ch: CHAR;
  
PROCEDURE PrintMatrix(VAR FOut: TEXT; Ch: CHAR);
VAR
  Matrix: SET OF 1 .. 25;
  I, J: INTEGER;
BEGIN {PrintMatrix}  
  CASE Ch OF 
    'A': Matrix := [3, 7, 9, 11 .. 16, 20, 21, 25];
    'B': Matrix := [1 .. 4, 6, 10 .. 14, 16, 20 .. 24];
    'C': Matrix := [2 .. 6, 11, 16, 22 .. 25];
    'D': Matrix := [1 .. 4, 6, 10, 11, 15, 16, 20 .. 24];
    'E': Matrix := [1 .. 6, 11 .. 16, 21 .. 25];
    'F': Matrix := [1 .. 6, 11 .. 16, 21]                                                               
    ELSE Matrix := []
  END;
  IF (Matrix <> [])
  THEN
    FOR I := 0 TO (MatrixRowSize - 1)
    DO
      BEGIN                       
        FOR J := (1 + MatrixRowSize * I) TO (MatrixRowSize + MatrixRowSize * I)
        DO
          IF J IN Matrix
          THEN
            WRITE(FOut, 'X')
          ELSE
            WRITE(FOut, ' ');
        WRITELN(FOut)  
      END
  ELSE
     WRITE(FOut, 'INVALID SYMBOL');
  WRITELN(FOut)
END;{PrintMatrix}

BEGIN {XPrint}
  WRITE('ENTER SYMBOL: ');
  IF NOT EOLN
  THEN
    BEGIN
      READ(Ch);
      PrintMatrix(OUTPUT, Ch)
     END
  ELSE
    WRITELN('NO SYMBOL')  
END.{XPrint}
