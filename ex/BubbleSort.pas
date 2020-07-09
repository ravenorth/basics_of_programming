PROGRAM BubbleSort(INPUT, OUTPUT);
{Сортируем первую строку INPUT в OUTPUT}
VAR
  Sorted, Ch, Ch1, Ch2: CHAR;
  F1, F2: TEXT;
PROCEDURE CopyText(VAR CopyTo, CopyFrom: TEXT);
{ Копируем из CopyFrom в CopyTo }
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
{ Выводим   min(Ch1,Ch2) в  F2, записывая отсортированные символы }
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
      { Копируем F1 в F2,проверяя отсортированность
       и переставляя первые соседние символы по порядку}
      Sorted := 'Y';
      RESET(F1);
      REWRITE(F2);
      IF NOT EOLN(F1)
      THEN
        BEGIN
          READ(F1, Ch1);             
          WHILE NOT EOLN(F1)
          DO { По крайней мере два символа остается для Ch1,Ch2 }
            BEGIN
              READ(F1, Ch2);         
               CompareTwo(Ch1, Ch2, Sorted);
            END;
          WRITELN(F2, Ch1) { Выводим последний символ в F2 }
        END;
      CopyText(F1, F2)      
    END;
  CopyText(OUTPUT, F1)
END. {BubbleSort}
