PROGRAM Encryption(INPUT, OUTPUT);
CONST
  MaxLength = 20; 
  ValidSymbols = [' ', 'A' .. 'Z'];
TYPE 
  Str = ARRAY [1 .. MaxLength] OF ' ' .. 'Z';
  Cipher = ARRAY [' ' .. 'Z'] OF CHAR;
  LengthType = 0 .. MaxLength;
VAR
  Msg: Str;
  Code: Cipher;
  Length: LengthType;
 
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
 
PROCEDURE Encode(S: Str; Length: LengthType);
VAR
  I: LengthType;
BEGIN {Encode}
  FOR I := 1 TO Length
  DO
    IF S[I] IN ValidSymbols
    THEN
      WRITE(Code[S[I]])
    ELSE
      WRITE(S[I]);
  WRITELN
END;  {Encode}
 
BEGIN {Encryption}
  Initialize(Code);
  WHILE NOT EOF
  DO
    BEGIN
      Length := 0;
      WHILE (NOT EOLN) AND (Length < MaxLength)
      DO
        BEGIN
          Length := Length + 1;
          READ(Msg[Length])
        END;
      READLN;
      Encode(Msg, Length)
    END
END.  {Encryption}
