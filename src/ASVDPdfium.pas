unit ASVDPdfium;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  PdfiumCore,
  PdfiumLib;

type
  TASVDPdfium = class(TComponent)
  strict private
    { Private declarations }
    FPathDLL: string;
  strict protected
    { Protected declarations }
    function GetPathDLL: string;
    procedure SetPathDLL(const pValor: string);
  public
    { Public declarations }
    function GetAllTextPDF(const pArquivo: string): string;
    function QuebrarPDFEmBitmap(const pArquivo: string): TArray<TBitmap>;
    procedure ConverterESalvarPDF(const pRange: Integer; const pRotaArquivo: string; const pRota: string);
  published
    { Published declarations }
    property PathDLL: string read GetPathDLL write SetPathDLL;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('ASVD', [TASVDPdfium]);
end;

{ TASVDPdfium }

procedure TASVDPdfium.ConverterESalvarPDF(const pRange: Integer; const pRotaArquivo, pRota: string);
var
  lPDFDocument: TPdfDocument;
  lSinglePagePDF: TPdfDocument;
begin
  lPDFDocument := TPdfDocument.Create;
  try
    lPDFDocument.LoadFromFile(pRotaArquivo);
    lSinglePagePDF := TPdfDocument.Create;
    try
      lSinglePagePDF.NewDocument;
      lSinglePagePDF.ImportPages(lPDFDocument, pRange.ToString + '-' + pRange.ToString);

      lSinglePagePDF.SaveToFile(pRota);
    finally
      lSinglePagePDF.Free;
    end;
  finally
    lPDFDocument.Free;
  end;
end;

function TASVDPdfium.GetAllTextPDF(const pArquivo: string): string;
var
  lPDFDoc: TPdfDocument;
begin
  lPDFDoc := TPdfDocument.Create;
  try
    lPDFDoc.LoadFromFile(pArquivo);
    Result := lPDFDoc.Pages[0].ReadAllTextPage;
  finally
    lPDFDoc.Free;
  end;
end;

function TASVDPdfium.GetPathDLL: string;
begin
  Result := FPathDLL;
end;

function TASVDPdfium.QuebrarPDFEmBitmap(const pArquivo: string): TArray<TBitmap>;
var
  lPDFDoc: TPdfDocument;
  lPage: TPdfPage;
  lPDFBitmap: TPdfBitmap;
  lI: Integer;
  lWidth: Integer;
  lHeight: Integer;
  lStandardBitmap: TBitmap;
  lPixelData: PByte;
  lJ, lY: Integer;
begin
  lPDFDoc := TPdfDocument.Create;
  try
    lPDFDoc.LoadFromFile(pArquivo);
    SetLength(Result, lPDFDoc.PageCount);
    for lI := 0 to lPDFDoc.PageCount - 1 do
    begin
      lPage := lPDFDoc.Pages[lI];
      lWidth := Round(lPage.Width);
      lHeight := Round(lPage.Height);
      lPDFBitmap := TPdfBitmap.Create(lWidth, lHeight, bfBGRA);
      try
        lPage.Draw(lPDFBitmap, 400, 400, lWidth, lHeight);
        lStandardBitmap := TBitmap.Create;
        lStandardBitmap.Width := lPDFBitmap.Width;
        lStandardBitmap.Height := lPDFBitmap.Height;
        lStandardBitmap.PixelFormat := pf32bit;

        lPixelData := lPDFBitmap.GetBuffer;

        for lY := 0 to lPDFBitmap.Height - 1 do
        begin
          for lJ := 0 to lPDFBitmap.Width - 1 do
          begin
            lStandardBitmap.Canvas.Pixels[lJ, lY] := RGB(
              lPixelData[lY * lPDFBitmap.BytesPerScanLine + lJ * 4 + 2],
              lPixelData[lY * lPDFBitmap.BytesPerScanLine + lJ * 4 + 1],
              lPixelData[lY * lPDFBitmap.BytesPerScanLine + lJ * 4]
            );
          end;
        end;

        Result[lI] := lStandardBitmap;
      finally
        lPDFBitmap.Free;
      end;
    end;
  finally
    lPDFDoc.Free;
  end;
end;

procedure TASVDPdfium.SetPathDLL(const pValor: string);
begin
  FPathDLL := pValor;
  PDFiumDllDir := FPathDLL;
end;

end.
