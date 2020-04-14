PROGRAM AverageScore(INPUT, OUTPUT);
CONST
  NumberOfScores = 4;
  ClassSize = 4;
TYPE
  Score = 0 .. 100;
VAR
  WhichScore: 1 .. NumberOfScores;
  Student: 1 .. ClassSize;
  NextScore: Score;
  Ave, TotalScore, ClassTotal: INTEGER;
  Error: BOOLEAN;
BEGIN {AverageScore}
  Error := FALSE;
  ClassTotal := 0;
  WRITELN('Enter students scores:');
  Student := 1;
  WHILE (Student <= ClassSize) AND (Error = FALSE)
  DO 
    BEGIN
      TotalScore := 0;
      WhichScore := 1;
      WHILE (WhichScore <= NumberOfScores) AND (Error = FALSE)
      DO
        BEGIN
          IF NOT EOLN
          THEN
            READ(NextScore)
          ELSE
            IF WhichScore <= NumberOfScores
            THEN 
              Error := TRUE;
          TotalScore := TotalScore + NextScore;
          WhichScore := WhichScore + 1
        END;
      READLN;
      IF (Error = FALSE)
      THEN
        BEGIN
          TotalScore := TotalScore * 10;
          Ave := TotalScore DIV NumberOfScores;
          WRITE('Student average: ');
          IF Ave MOD 10 >= 5
          THEN
            WRITELN(Ave DIV 10 + 1)
          ELSE
            WRITELN(Ave DIV 10);
          ClassTotal := ClassTotal + TotalScore;
          Student := Student + 1
        END
    END;
  IF (Error = FALSE)
  THEN
    BEGIN
      WRITELN;
      WRITE('Class average: ');
      ClassTotal := ClassTotal DIV (ClassSize * NumberOfScores);
      WRITELN(ClassTotal DIV 10, '.', ClassTotal MOD 10:1) 
    END
  ELSE
    WRITELN('INPUT ERROR')
END.{AverageScore}
