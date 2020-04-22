PROGRAM AverageScore(INPUT, OUTPUT);
CONST
  NumberOfScores = 4;
  ClassSize = 4;
VAR
  WhichScore: 1 .. NumberOfScores;
  Student: 1 .. ClassSize;
  NextScore, Ave, TotalScore, ClassTotal: INTEGER;
  Error: BOOLEAN;  
  
PROCEDURE ReadName(VAR FIn: TEXT; VAR FOut: TEXT);
VAR
  Ch: CHAR;
BEGIN{ReadName}
  IF NOT EOLN(FIn)
  THEN
    READ(FIn, Ch); 
  WHILE ((NOT EOLN) AND (((Ch <= 'Z') AND (Ch >= 'A')) OR ((Ch <= 'z') AND (Ch >= 'a'))))
  DO
    BEGIN
      WRITE(FOut, Ch);
      READ(FIn, Ch) 
    END;
  WRITE(FOut, ': ')
END;{ReadName}

BEGIN {AverageScore}
  Error := FALSE;
  ClassTotal := 0;
  WRITELN('Enter students scores:');
  Student := 1;
  WHILE (Student <= ClassSize) AND (NOT Error)
  DO 
    BEGIN
      TotalScore := 0;
      WhichScore := 1;
      ReadName(INPUT, OUTPUT);
      WHILE (WhichScore <= NumberOfScores) AND (NOT Error)
      DO
        BEGIN
          IF NOT EOLN
          THEN
            BEGIN
              READ(NextScore);
              IF (NextScore > 100) OR (NextScore < 0)
              THEN
                Error := TRUE;
            END
          ELSE
            Error := TRUE;
          TotalScore := TotalScore + NextScore; 
          WhichScore := WhichScore + 1
        END;
      READLN;
      IF (NOT Error)
      THEN
        BEGIN
          TotalScore := TotalScore * 10;
          Ave := TotalScore DIV NumberOfScores;
          IF Ave MOD 10 >= 5
          THEN
            WRITELN(Ave DIV 10 + 1)
          ELSE
            WRITELN(Ave DIV 10);
          ClassTotal := ClassTotal + TotalScore;
          Student := Student + 1
        END
    END;
  WRITELN;
  IF (NOT Error)
  THEN
    BEGIN
      WRITE('Class average: ');
      ClassTotal := ClassTotal DIV (ClassSize * NumberOfScores);
      WRITELN(ClassTotal DIV 10, '.', ClassTotal MOD 10:1) 
    END
  ELSE
    WRITELN('INPUT ERROR')
END.{AverageScore}
