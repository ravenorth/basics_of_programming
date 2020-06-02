PROGRAM XPrint(INPUT, OUTPUT);  
CONST
  MatrixRowSize = 5;
  MaxLength = 10;
  ValidSymbols = ['A' .. 'F'];
TYPE
  MatrixType = SET OF 1 .. 250;
  GlyphType = ARRAY ['A' .. 'F'] OF MatrixType;
VAR  
  Glyph: GlyphType;
  GlyphFile: TEXT;
  Length: INTEGER;

FUNCTION ReadGlyph(VAR FIn: TEXT): GlyphType;
VAR
  Ch: CHAR;
  MatrixElement, I: INTEGER;
  Matrix: MatrixType;
  Matrices: GlyphType;
BEGIN {ReadGlyph}
  WHILE NOT EOF(FIn)
  DO
    BEGIN
      READ(FIn, Ch);
      Matrix := [];
      WHILE NOT EOLN(FIn)
      DO
        BEGIN
          READ(FIn, MatrixElement);
          Matrix := Matrix + [MatrixElement]
        END;
      READLN(FIn);
      Matrices[Ch] := Matrix
    END;
  ReadGlyph := Matrices
END; {ReadGlyph}

FUNCTION StringToMatrix(VAR FIn: TEXT; Glyph: GlyphType): MatrixType;
VAR
  Ch: CHAR;
  I: INTEGER;
  Matrix: MatrixType;
BEGIN {StringToMatrix}
  Length := 0;
  Matrix := [];
  WHILE (NOT EOLN(FIn)) AND (Length < MaxLength)
  DO
    BEGIN
      READ(FIn, Ch);
      IF Ch IN ValidSymbols
      THEN
        FOR I := 1 TO (MatrixRowSize * MatrixRowSize)
        DO
          IF I IN Glyph[Ch]
          THEN
            Matrix := Matrix + [I + Length * MatrixRowSize * MatrixRowSize];
      Length := Length + 1  
    END;
  StringToMatrix := Matrix
END;{StringToMatrix}
  
PROCEDURE XPrint(VAR FOut: TEXT; Matrix: MatrixType);
VAR
  Count, I, J: INTEGER;
BEGIN {ReadMatrices}
  Count := 0;     
  FOR I := 1 TO (MatrixRowSize * Length)
  DO
    BEGIN
      FOR J := (1  + Count) TO (MatrixRowSize  + Count)
      DO
        BEGIN
          IF J IN Matrix
          THEN
            WRITE(FOut, 'X')
          ELSE
            WRITE(FOut, ' ')
        END;
      WRITELN(FOut);
      Count := Count + MatrixRowSize;
      IF (Count MOD (MatrixRowSize * MatrixRowSize)) = 0
      THEN
        WRITELN(FOut)
    END
END; {ReadMatrices}
  
BEGIN {XPrint}
  ASSIGN(GlyphFile, 'matrices.txt');
  RESET(GlyphFile);
  Glyph := ReadGlyph(GlyphFile);
  CLOSE(GlyphFile);
  WRITE('ENTER SYMBOLS: ');
  XPrint(OUTPUT, StringToMatrix(INPUT, Glyph)) 
END.{XPrint}
