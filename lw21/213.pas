PROGRAM Decryption(INPUT, OUTPUT);
CONST
  MaxLength = 20; 
  ValidSymbols = [' ', 'A' .. 'Z']; 
TYPE 
  Str = ARRAY [1 .. MaxLength] OF ' ' .. 'Z';
  Cipher = ARRAY [' ' .. 'Z'] OF CHAR;
  LengthType = 0 .. MaxLength;
  SetType = SET OF CHAR;
VAR
  Msg: Str;
  Code: Cipher;
  Length: LengthType;
  Error: BOOLEAN;
  CipherFile: TEXT;
  CipherSymbols: SetType;
 
PROCEDURE Initialize(VAR Code: Cipher; VAR FIn: TEXT; VAR Error: BOOLEAN; VAR CipherSymbols: SetType);
VAR
  CipherValue, TrueValue: CHAR;
  TrueValues: SetType;
BEGIN {Initialize}
  Error := FALSE;
  TrueValues := [];
  WHILE (NOT EOF(FIn)) AND (NOT Error)
  DO 
    BEGIN
      IF (NOT EOLN(FIn))
      THEN
        BEGIN
          READ(FIn, TrueValue);
          TrueValues := TrueValues + [TrueValue];
          IF (NOT EOLN(FIn))
          THEN
            BEGIN
              READ(FIn, CipherValue);
              CipherSymbols := CipherSymbols + [CipherValue];
              Code[CipherValue] := TrueValue
            END
          ELSE
            Error := TRUE
        END
      ELSE
        Error := TRUE;
      READLN(FIn);
    END;
  IF TrueValues <> ValidSymbols
  THEN
    Error := TRUE
END; {Initialize}
 
PROCEDURE Decode(MsgStr: Str; Length: LengthType; CipherSymbols: SetType);
VAR
  I: LengthType;
BEGIN {Decode}
  FOR I := 1 TO Length
  DO
    IF MsgStr[I] IN CipherSymbols
    THEN
      WRITE(Code[MsgStr[I]])
    ELSE
      WRITE(MsgStr[I]);
  WRITELN
END;  {Decode}
 
BEGIN {Decryption}
  Error := FALSE;
  CipherSymbols := [];
  ASSIGN(CipherFile, 'cipher.txt');
  RESET(CipherFile);
  Initialize(Code, CipherFile, Error, CipherSymbols);
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
        Decode(Msg, Length, CipherSymbols)
      END
  ELSE
    WRITELN('CIPHER FILE ERROR')
END.  {Decryption}
