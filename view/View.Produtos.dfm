inherited fProdutos: TfProdutos
  Caption = 'Cadastro de Produtos'
  ClientHeight = 474
  ClientWidth = 662
  OnCreate = FormCreate
  ExplicitWidth = 674
  ExplicitHeight = 512
  TextHeight = 15
  inherited pnlTopoPrincipal: TPanel
    Width = 662
    ExplicitWidth = 658
    inherited Label1: TLabel
      Width = 172
      Caption = 'PRODUTOS'
      ExplicitWidth = 172
    end
    inherited Label2: TLabel
      Width = 189
      Caption = 'Lan'#231'ando os diversos produtos .'
      ExplicitWidth = 189
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 60
    Width = 662
    Height = 53
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object Label14: TLabel
      Left = 12
      Top = 6
      Width = 193
      Height = 15
      Caption = 'Pesquisar DESCRI'#199#195'O PRODUTO'
    end
    object edtPesquisaProduto: TEdit
      Left = 11
      Top = 23
      Width = 529
      Height = 24
      CharCase = ecUpperCase
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial Unicode MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnChange = edtPesquisaProdutoChange
    end
    object btnNovoProduto: TButton
      Left = 550
      Top = 17
      Width = 99
      Height = 30
      Caption = 'Novo Produto'
      TabOrder = 1
      OnClick = btnNovoProdutoClick
    end
  end
  object dbGrid_Produto: TDBGrid
    Left = 0
    Top = 113
    Width = 662
    Height = 361
    Align = alClient
    Color = clCream
    DataSource = DMConex.DsProduto
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial Unicode MS'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'Consolas'
    TitleFont.Style = [fsBold]
    StyleName = 'Windows'
    OnKeyDown = dbGrid_ProdutoKeyDown
  end
end
