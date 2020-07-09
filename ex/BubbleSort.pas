PROGRAM BubbleSort(INPUT, OUTPUT);
{��������� ������ ������ INPUT � OUTPUT}
VAR
  Sorted, Ch, Ch1, Ch2: CHAR;
  F1, F2: TEXT;
PROCEDURE CopyText(VAR CopyTo, CopyFrom: TEXT);
{ �������� �� CopyFrom � CopyTo }
BEGIN { CopyText}
  REWRITE(CopyTo);
  RESET(CopyFrom);
  WHILE NOT EOLN(CopyFrom)
  DO
    BEGIN
      READ(CopyFrom, Ch);
      WRITE(CopyTo, Ch)
    END;
  WRITELN(CopyTo)
END; { CopyText}
PROCEDURE CompareTwo(VAR Ch1, Ch2, Sorted: CHAR);
{ �������   min(Ch1,Ch2) �  F2, ��������� ��������������� ������� }
BEGIN { CompareTwo}
  IF Ch1 <= Ch2
  THEN
    BEGIN
      WRITE(F2, Ch1);
      Ch1 := Ch2
    END
  ELSE
    BEGIN
      WRITE(F2, Ch2);
      Sorted := 'N'
    END
END; { CompareTwo}
BEGIN {BubbleSort}
  CopyText(F1, INPUT);
  Sorted := 'N';
  WHILE Sorted = 'N'
  DO
    BEGIN
      { �������� F1 � F2,�������� �����������������
       � ����������� ������ �������� ������� �� �������}
      Sorted := 'Y';
      RESET(F1);
      REWRITE(F2);
      IF NOT EOLN(F1)
      THEN
        BEGIN
          READ(F1, Ch1);             
          WHILE NOT EOLN(F1)
          DO { �� ������� ���� ��� ������� �������� ��� Ch1,Ch2 }
            BEGIN
              READ(F1, Ch2);         
               CompareTwo(Ch1, Ch2, Sorted);
            END;
          WRITELN(F2, Ch1) { ������� ��������� ������ � F2 }
        END;
      CopyText(F1, F2)      
    END;
  CopyText(OUTPUT, F1)
END. {BubbleSort}
