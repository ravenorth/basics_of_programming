PROGRAM Encryption(INPUT, OUTPUT);
CONST
  MaxLength = 20; 
  ValidSymbols = [' ', 'A' .. 'Z'];
  CodeLength = 27;  
TYPE 
  Str = ARRAY [1 .. MaxLength] OF ' ' .. 'Z';
  Cipher = ARRAY [' ' .. 'Z'] OF CHAR;
VAR
  Msg: Str;
  Code: Cipher;
  I: 1 .. MaxLength;
  Error: BOOLEAN;
  CipherFile: TEXT;
 
PROCEDURE Initialize(VAR Code: Cipher; VAR FIn: TEXT);
VAR
  Value: CHAR;
  Count: INTEGER;
BEGIN {Initialize}
  Error := FALSE;
  Count := 0;
  WHILE (NOT EOLN(FIn)) AND (NOT Error)
  DO 
    BEGIN
      READ(FIn, Value);
      IF (Value IN ValidSymbols) AND (NOT EOLN(FIn))
      THEN
        READ(FIn, Code[Value])
      ELSE
        Error := TRUE;
      Count := Count + 1;
    END;
  IF Count <> CodeLength
  THEN
    Error := TRUE;
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
  ASSIGN(CipherFile, 'cipher.txt');
  RESET(CipherFile);
  Initialize(Code, CipherFile);
  CLOSE(CipherFile);
  IF NOT Error
  THEN
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
  ELSE
    WRITELN('CIPHER FILE ERROR')
END.  {Encryption}
