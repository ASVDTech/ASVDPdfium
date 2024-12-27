unit ASVDPdfiumDemo.View.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ASVDPdfium, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TFPrincipal = class(TForm)
    ASVDPdfium: TASVDPdfium;
    pnlTopo: TPanel;
    mmLog: TMemo;
    btnQuebrarPDFEmBitmap: TButton;
    btnConverter: TButton;
    btnGetAllTextPDF: TButton;
    OpenDialog: TOpenDialog;
    procedure btnQuebrarPDFEmBitmapClick(Sender: TObject);
    procedure btnGetAllTextPDFClick(Sender: TObject);
    procedure btnConverterClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPrincipal: TFPrincipal;

implementation

{$R *.dfm}

procedure TFPrincipal.btnConverterClick(Sender: TObject);
begin
  if OpenDialog.Execute then
  begin
    ASVDPdfium.ConverterESalvarPDF(2, OpenDialog.FileName, 'teste.pdf');
  end;
end;

procedure TFPrincipal.btnGetAllTextPDFClick(Sender: TObject);
begin
  mmLog.Lines.Clear;
  if OpenDialog.Execute then
  begin
    mmLog.Lines.Add(ASVDPdfium.GetAllTextPDF(OpenDialog.FileName));
  end;
end;

procedure TFPrincipal.btnQuebrarPDFEmBitmapClick(Sender: TObject);
var
  lListaPDF: TArray<TBitmap>;
  lI: Integer;
begin
  if OpenDialog.Execute then
  begin
    lListaPDF := ASVDPdfium.QuebrarPDFEmBitmap(OpenDialog.FileName);
    for lI := 0 to High(lListaPDF) do
    begin
      lListaPDF[lI].SaveToFile('Pdf' + lI.ToString + '.bmp');
    end;
  end;
end;

end.
