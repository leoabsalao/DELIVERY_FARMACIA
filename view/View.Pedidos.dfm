inherited fPedidos: TfPedidos
  BorderStyle = bsSingle
  Caption = 'Realizar PEDIDOS'
  ClientHeight = 502
  ClientWidth = 710
  OnCreate = FormCreate
  ExplicitWidth = 722
  ExplicitHeight = 540
  TextHeight = 16
  inherited pnlTopoPrincipal: TPanel
    Width = 710
    Height = 59
    ExplicitWidth = 706
    ExplicitHeight = 59
    inherited Label1: TLabel
      Width = 278
      Caption = 'REALIZAR PEDIDO'
      ExplicitWidth = 278
    end
    inherited Label2: TLabel
      Width = 248
      Caption = 'Nesta tela o atendente lan'#231'ar'#225' os pedidos.'
      ExplicitWidth = 248
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 105
    Width = 710
    Height = 254
    Align = alTop
    TabOrder = 1
    ExplicitWidth = 706
    DesignSize = (
      710
      254)
    object Label3: TLabel
      Left = 53
      Top = 15
      Width = 58
      Height = 16
      Caption = 'N'#186' Pedido:'
    end
    object Label4: TLabel
      Left = 69
      Top = 42
      Width = 42
      Height = 16
      Caption = 'Cliente:'
    end
    object Shape1: TShape
      Left = 16
      Top = 61
      Width = 684
      Height = 1
      Anchors = [akLeft, akTop, akRight]
      Brush.Color = clSilver
      Pen.Color = clSilver
      ExplicitWidth = 674
    end
    object Label5: TLabel
      Left = 86
      Top = 77
      Width = 28
      Height = 16
      Caption = 'CEP:'
    end
    object Label6: TLabel
      Left = 87
      Top = 104
      Width = 26
      Height = 16
      Caption = 'Rua:'
    end
    object Label7: TLabel
      Left = 63
      Top = 131
      Width = 48
      Height = 16
      Caption = 'N'#250'mero:'
    end
    object Label8: TLabel
      Left = 255
      Top = 131
      Width = 36
      Height = 16
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Bairro:'
    end
    object Label9: TLabel
      Left = 70
      Top = 155
      Width = 43
      Height = 16
      Caption = 'Cidade:'
    end
    object Label10: TLabel
      Left = 343
      Top = 158
      Width = 27
      Height = 16
      Caption = 'Pa'#237's:'
    end
    object Shape2: TShape
      Left = 16
      Top = 183
      Width = 683
      Height = -1
      Anchors = [akLeft, akTop, akRight]
      Brush.Color = clSilver
      Pen.Color = clSilver
      ExplicitWidth = 673
    end
    object Label11: TLabel
      Left = 35
      Top = 198
      Width = 73
      Height = 16
      Caption = 'N'#186' Ref. Prod.:'
    end
    object Label12: TLabel
      Left = 481
      Top = 198
      Width = 36
      Height = 16
      Anchors = [akTop, akRight]
      Caption = 'Quant:'
    end
    object Label13: TLabel
      Left = 41
      Top = 225
      Width = 69
      Height = 16
      Caption = 'Observa'#231#227'o:'
    end
    object edtNumPedido: TEdit
      Left = 119
      Top = 6
      Width = 128
      Height = 24
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = 'Arial Unicode MS'
      Font.Style = []
      NumbersOnly = True
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      Text = '0'
    end
    object cbCliente: TDBLookupComboBox
      Left = 119
      Top = 34
      Width = 581
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      KeyField = 'Codigo'
      ListField = 'Nome'
      ListSource = DMConex.DsCliente
      TabOrder = 1
      ExplicitWidth = 577
    end
    object edtCEP: TMaskEdit
      Left = 119
      Top = 69
      Width = 128
      Height = 24
      EditMask = '99.999-999;1;_'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial Unicode MS'
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      TabOrder = 2
      Text = '  .   -   '
    end
    object edtRua: TEdit
      Left = 119
      Top = 96
      Width = 581
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 3
      ExplicitWidth = 577
    end
    object edtNumero: TEdit
      Left = 119
      Top = 123
      Width = 128
      Height = 24
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial Unicode MS'
      Font.Style = []
      NumbersOnly = True
      ParentFont = False
      TabOrder = 4
    end
    object edtBairro: TEdit
      Left = 299
      Top = 123
      Width = 401
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 5
      ExplicitWidth = 397
    end
    object edtCidade: TEdit
      Left = 120
      Top = 150
      Width = 217
      Height = 24
      TabOrder = 6
    end
    object edtPais: TEdit
      Left = 376
      Top = 150
      Width = 324
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 7
      ExplicitWidth = 320
    end
    object btnBuscarCEP: TButton
      Left = 251
      Top = 67
      Width = 77
      Height = 25
      Caption = 'Buscar'
      TabOrder = 8
      OnClick = btnBuscarCEPClick
    end
    object edtNumRefProd: TEdit
      Left = 119
      Top = 190
      Width = 128
      Height = 24
      CharCase = ecUpperCase
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial Unicode MS'
      Font.Style = []
      MaxLength = 15
      ParentFont = False
      TabOrder = 9
      OnExit = edtNumRefProdExit
    end
    object edtProduto: TEdit
      Left = 249
      Top = 190
      Width = 225
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      Font.Charset = ANSI_CHARSET
      Font.Color = clBtnShadow
      Font.Height = -13
      Font.Name = 'Corbel'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 10
      ExplicitWidth = 221
    end
    object btnIncluirProduto: TButton
      Left = 625
      Top = 188
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Incluir'
      TabOrder = 12
      OnClick = btnIncluirProdutoClick
      ExplicitLeft = 621
    end
    object edtQuant: TEdit
      Left = 528
      Top = 190
      Width = 92
      Height = 24
      Anchors = [akTop, akRight]
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = '@Arial Unicode MS'
      Font.Style = []
      NumbersOnly = True
      ParentFont = False
      TabOrder = 11
      ExplicitLeft = 524
    end
    object edtObs: TEdit
      Left = 119
      Top = 217
      Width = 581
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 13
      ExplicitWidth = 577
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 59
    Width = 710
    Height = 46
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    ExplicitWidth = 706
    DesignSize = (
      710
      46)
    object Label14: TLabel
      Left = 6
      Top = 2
      Width = 123
      Height = 16
      Caption = 'Pesquisar N'#186' PEDIDO:'
    end
    object btnNovo: TButton
      Left = 356
      Top = 11
      Width = 83
      Height = 31
      Anchors = [akTop, akRight]
      Caption = 'Gerar Novo'
      TabOrder = 0
      OnClick = btnNovoClick
      ExplicitLeft = 352
    end
    object Salvar: TButton
      Left = 441
      Top = 11
      Width = 87
      Height = 31
      Anchors = [akTop, akRight]
      Caption = 'Salvar'
      TabOrder = 1
      OnClick = SalvarClick
      ExplicitLeft = 437
    end
    object btnLimparDados: TButton
      Left = 530
      Top = 11
      Width = 92
      Height = 31
      Anchors = [akTop, akRight]
      Caption = 'Limpar'
      TabOrder = 2
      OnClick = btnLimparDadosClick
      ExplicitLeft = 526
    end
    object btnFechar: TButton
      Left = 624
      Top = 11
      Width = 83
      Height = 31
      Anchors = [akTop, akRight]
      Caption = 'Sair'
      TabOrder = 3
      OnClick = btnFecharClick
      ExplicitLeft = 620
    end
    object edtPesquisa: TEdit
      Left = 8
      Top = 18
      Width = 125
      Height = 24
      Alignment = taCenter
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial Unicode MS'
      Font.Style = []
      NumbersOnly = True
      ParentFont = False
      TabOrder = 4
      Text = '0'
    end
    object btnPesqPedido: TButton
      Left = 139
      Top = 18
      Width = 99
      Height = 24
      Caption = 'Pesquisar'
      TabOrder = 5
      OnClick = btnPesqPedidoClick
    end
  end
  object dbGridProduto: TDBGrid
    Left = 0
    Top = 359
    Width = 710
    Height = 121
    Align = alClient
    Color = clCream
    DataSource = dsProdutoSelecionado
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial Rounded MT Bold'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 3
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'Arial Rounded MT Bold'
    TitleFont.Style = []
    OnKeyDown = dbGridProdutoKeyDown
  end
  object Panel3: TPanel
    Left = 0
    Top = 480
    Width = 710
    Height = 22
    Align = alBottom
    TabOrder = 4
    ExplicitTop = 479
    ExplicitWidth = 706
    object Label15: TLabel
      Left = 8
      Top = 4
      Width = 339
      Height = 15
      Caption = 'Para APAGAR um registro de Produtos, digita a tecla (DEL).'
      Color = clNone
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'Corbel'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
  end
  object cdsProdutoSelecionado: TClientDataSet
    PersistDataPacket.Data = {
      6E0000009619E0BD0100000018000000040000000000030000006E0006436F64
      69676F0400010000000000064E756D5265660100490000000100055749445448
      020002000A000750726F6475746F010049000000010005574944544802000200
      3200055175616E7404000100000000000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'Codigo'
        DataType = ftInteger
      end
      item
        Name = 'NumRef'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'Produto'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Quant'
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 427
    Top = 7
    object cdsProdutoSelecionadoCodigo: TIntegerField
      DisplayLabel = 'Cod Produto'
      FieldName = 'Codigo'
    end
    object cdsProdutoSelecionadoNumRef: TStringField
      DisplayLabel = 'N'#186' Refer'#234'ncia'
      FieldName = 'NumRef'
      Size = 10
    end
    object cdsProdutoSelecionadoProduto: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'Produto'
      Size = 50
    end
    object cdsProdutoSelecionadoQuant: TIntegerField
      DisplayLabel = 'Quantidade'
      FieldName = 'Quant'
    end
  end
  object dsProdutoSelecionado: TDataSource
    DataSet = cdsProdutoSelecionado
    Left = 315
    Top = 15
  end
end
