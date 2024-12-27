object FPrincipal: TFPrincipal
  Left = 0
  Top = 0
  Caption = 'ASVDPdfiumDemo'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object pnlTopo: TPanel
    Left = 0
    Top = 0
    Width = 624
    Height = 113
    Align = alTop
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    object btnQuebrarPDFEmBitmap: TButton
      Left = 32
      Top = 16
      Width = 169
      Height = 25
      Caption = 'Quebrar PDF Em Bitmap'
      TabOrder = 0
      OnClick = btnQuebrarPDFEmBitmapClick
    end
    object btnConverter: TButton
      Left = 32
      Top = 47
      Width = 169
      Height = 25
      Caption = 'Converter e Salvar PDF'
      TabOrder = 1
      OnClick = btnConverterClick
    end
    object btnGetAllTextPDF: TButton
      Left = 207
      Top = 16
      Width = 169
      Height = 25
      Caption = 'Buscar Texto PDF'
      TabOrder = 2
      OnClick = btnGetAllTextPDFClick
    end
  end
  object mmLog: TMemo
    Left = 0
    Top = 113
    Width = 624
    Height = 328
    Align = alClient
    Color = clBlack
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clLime
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    ExplicitLeft = 232
    ExplicitTop = 200
    ExplicitWidth = 185
    ExplicitHeight = 89
  end
  object ASVDPdfium: TASVDPdfium
    PathDLL = 'D:\ASVD\Componentes\ASVDPalete\ASVDPdfium\bin\x86\'
    Left = 456
    Top = 104
  end
  object OpenDialog: TOpenDialog
    Left = 304
    Top = 224
  end
end
