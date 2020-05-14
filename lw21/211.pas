PROGRAM Encryption(INPUT, OUTPUT);
CONST
  MaxLength = 20; 
  ValidSymbols = [' ', 'A' .. 'Z'];
TYPE 
  Str = ARRAY [1 .. MaxLength] OF ' ' .. 'Z';
  Cipher = ARRAY [' ' .. 'Z'] OF CHAR;
VAR
  Msg: Str;
  Code: Cipher;
  I: 1 .. MaxLength;
 
PROCEDURE Initialize(VAR Code: Cipher);
BEGIN {Initialize}
  Code['A'] := 'Z';
  Code['B'] := 'Y';
  Code['C'] := 'X';
  Code['D'] := '#';
  Code['E'] := 'V';
  Code['F'] := 'U';
  Code['G'] := 'T';
  Code['H'] := 'S';
  Code['I'] := 'I';
  Code['J'] := 'Q';
  Code['K'] := 'P';
  Code['L'] := '!';
  Code['M'] := 'N';
  Code['N'] := 'M';
  Code['O'] := '2';
  Code['P'] := 'K';
  Code['Q'] := '$';
  Code['R'] := 'D';
  Code['S'] := 'H';
  Code['T'] := '*';
  Code['U'] := 'F';
  Code['V'] := 'E';
  Code['W'] := 'T';
  Code['X'] := 'C';
  Code['Y'] := 'B';
  Code['Z'] := 'A';
  Code[' '] := '&'
END;  {Initialize}
 
PROCEDURE Encode(VAR S: Str);
VAR
  Index: 1 .. MaxLength;
BEGIN {Encode}
  FOR Index := 1 TO MaxLength
  DO
    IF S[Index] IN ValidSymbols
    THEN
      WRITE(Code[S[Index]])
    ELSE
      WRITE(S[Index]);
  WRITELN
END;  {Encode}
 
BEGIN {Encryption}
  Initialize(Code);
  WHILE NOT EOF
  DO
    BEGIN
      I := 1;
      WHILE (NOT EOLN) AND (I <= MaxLength)
      DO
        BEGIN
          READ(Msg[I]);
          I := I + 1
        END;
      READLN;
      Encode(Msg)
    END
END.  {Encryption}
