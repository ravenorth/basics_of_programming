PROGRAM ReverseCount3(INPUT, OUTPUT);
USES
  Count3;
VAR
  Ch1, Ch2, Ch3: CHAR;
BEGIN
  Start;
  IF NOT EOLN
  THEN
    READ(Ch2);
  IF NOT EOLN
  THEN
    READ(Ch3);
  WHILE NOT EOLN
  DO
    BEGIN
      Ch1 := Ch2;
      Ch2 := Ch3;
      READ(Ch3);
      IF((Ch1 < Ch2) AND (Ch2 > Ch3)) OR ((Ch1 > Ch2) AND (Ch2 < Ch3))
      THEN
        Bump
    END;
  Value(Ch1, Ch2, Ch3);
  WRITELN('Количество реверсов: ', Ch1, Ch2, Ch3)
END.
