PROGRAM RunLexico(INPUT, OUTPUT);
VAR
  Result, Ch: CHAR;
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
PROCEDURE Lexico(VAR Word1, Word2: TEXT; VAR Result: CHAR);
{Result 0, 1, 2 ���� ������������������ ������� F1 =, <, > ��� F2       
��������������. ����������� ���������, ��������������� F1 � F2,
������ ���� ����������}
VAR
  Ch1, Ch2: CHAR;
BEGIN {Lexico}
  RESET(Word1);
  RESET(Word2);
  Result := '0';
  WHILE (NOT EOLN(Word1) AND NOT EOLN(Word2)) AND (Result = '0')
  DO
    BEGIN
      READ(Word1, Ch1);
      READ(Word2, Ch2);
      IF (Ch1 < Ch2) OR ((EOLN(Word1)) AND NOT EOLN(Word2))
      THEN {Ch1 < Ch2 ��� Word1 ������ Word2}
        Result := '1'
      ELSE
        IF (Ch1 > Ch2) OR ((EOLN(Word2)) AND NOT EOLN(Word1))
        THEN {Ch1 > Ch2 ��� Word2 ������ Word1}
          Result := '2'
    END {WHILE}
END; {Lexico}
BEGIN
  CopyText(F1, INPUT);
  CopyText(F2, INPUT);
  Lexico(F1, F2, Result);
  WRITELN(Result)
END.
 

