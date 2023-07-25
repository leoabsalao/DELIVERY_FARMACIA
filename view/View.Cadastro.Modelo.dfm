object fModeloCadastro: TfModeloCadastro
  Left = 0
  Top = 0
  Caption = 'fCadastro'
  ClientHeight = 362
  ClientWidth = 550
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Arial Unicode MS'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  Visible = True
  OnClose = FormClose
  TextHeight = 16
  object pnlTopoPrincipal: TPanel
    Left = 0
    Top = 0
    Width = 550
    Height = 60
    Align = alTop
    BevelOuter = bvSpace
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 546
    object Label1: TLabel
      Left = 6
      Top = -2
      Width = 259
      Height = 45
      Caption = 'Cadastro Modelo'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -32
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 8
      Top = 37
      Width = 154
      Height = 18
      Caption = 'Descri'#231#227'o dos titulo acima'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial Unicode MS'
      Font.Style = []
      ParentFont = False
    end
  end
end
