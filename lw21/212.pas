PROGRAM Encryption(INPUT, OUTPUT);
CONST
  MaxLength = 20; 
  ValidSymbols = ['A' .. 'Z', ' ']; 
TYPE 
  Str = ARRAY [1 .. MaxLength] OF ' ' .. 'Z';
  Cipher = ARRAY [' ' .. 'Z'] OF CHAR;
  LengthType = 0 .. MaxLength;
VAR
  Msg: Str;
  Code: Cipher;
  Length: LengthType;
  Error: BOOLEAN;
  CipherFile: TEXT;
 
PROCEDURE Initialize(VAR Code: Cipher; VAR FIn: TEXT; VAR Error: BOOLEAN);
VAR
  Value: CHAR;
  Values: SET OF CHAR;
BEGIN {Initialize} 
  Values := [];
  WHILE (NOT EOF(FIn)) AND (NOT Error)
  DO 
    BEGIN
      IF (NOT EOLN(FIn))
      THEN
        BEGIN
          READ(FIn, Value);
          Values := Values + [Value];
          IF (NOT EOLN(FIn))
          THEN
            READ(FIn, Code[Value])
          ELSE
            Error := TRUE
        END
      ELSE
        Error := TRUE;
      READLN(FIn);    
    END;
  IF Values <> ValidSymbols
  THEN
    Error := TRUE;
END;  {Initialize}
 
PROCEDURE Encode(MsgStr: Str; Length: LengthType);
VAR
  I: LengthType;
BEGIN {Encode}
  FOR I := 1 TO Length
  DO
    IF MsgStr[I] IN ValidSymbols
    THEN
      WRITE(Code[MsgStr[I]])
    ELSE
      WRITE(MsgStr[I]);
  WRITELN
END;  {Encode}
 
BEGIN {Encryption}
  Error := FALSE;
  ASSIGN(CipherFile, 'cipher.txt');
  RESET(CipherFile);
  Initialize(Code, CipherFile, Error);
  CLOSE(CipherFile);
  IF NOT Error
  THEN
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
  ELSE
    WRITELN('CIPHER FILE ERROR')
END.  {Encryption}
