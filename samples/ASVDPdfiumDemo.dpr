program ASVDPdfiumDemo;

uses
  Vcl.Forms,
  ASVDPdfiumDemo.View.Principal in 'ASVDPdfiumDemo.View.Principal.pas' {FPrincipal};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFPrincipal, FPrincipal);
  Application.Run;
end.
