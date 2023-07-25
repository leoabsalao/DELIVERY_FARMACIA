inherited fVerificaPedido: TfVerificaPedido
  Caption = 'Status do Pedido'
  ClientHeight = 428
  ClientWidth = 600
  OnCreate = FormCreate
  ExplicitWidth = 612
  ExplicitHeight = 466
  TextHeight = 16
  inherited pnlTopoPrincipal: TPanel
    Width = 600
    ExplicitWidth = 596
    inherited Label1: TLabel
      Width = 254
      Caption = 'Status do Pedido'
      ExplicitWidth = 254
    end
    inherited Label2: TLabel
      Width = 317
      Caption = 'Verifica o andamento em que se encontra os pedidos .'
      ExplicitWidth = 317
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 60
    Width = 600
    Height = 46
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitWidth = 596
    DesignSize = (
      600
      46)
    object Label14: TLabel
      Left = 6
      Top = 2
      Width = 123
      Height = 16
      Caption = 'Pesquisar N'#186' PEDIDO:'
    end
    object btnSalvar: TButton
      Left = 422
      Top = 11
      Width = 87
      Height = 31
      Anchors = [akTop, akRight]
      Caption = 'Salvar'
      TabOrder = 0
      OnClick = btnSalvarClick
    end
    object btnFechar: TButton
      Left = 510
      Top = 11
      Width = 83
      Height = 31
      Anchors = [akTop, akRight]
      Caption = 'Sair'
      TabOrder = 1
      OnClick = btnFecharClick
      ExplicitLeft = 506
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
      TabOrder = 2
      Text = '0'
    end
    object btnPesqPedido: TButton
      Left = 139
      Top = 18
      Width = 99
      Height = 24
      Caption = 'Pesquisar'
      TabOrder = 3
    end
  end
  object Panel1: TPanel
    Left = 3
    Top = 108
    Width = 589
    Height = 239
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 2
    ExplicitWidth = 585
    object GridStatus: TDBGrid
      Left = 1
      Top = 1
      Width = 587
      Height = 237
      Hint = 'Duplo click no Grid para selecionar o N'#186' do Pedido'
      Align = alClient
      DataSource = DsStatusPedido
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial Rounded MT Bold'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ParentFont = False
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 0
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Arial Rounded MT Bold'
      TitleFont.Style = []
      OnDblClick = GridStatusDblClick
    end
  end
  object Panel3: TPanel
    Left = 5
    Top = 352
    Width = 587
    Height = 73
    Hint = 'Verifica o Status da Entrega'
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 3
    ExplicitHeight = 146
    object Label3: TLabel
      Left = 12
      Top = 16
      Width = 58
      Height = 16
      Caption = 'N'#186' Pedido:'
    end
    object Label4: TLabel
      Left = 216
      Top = 16
      Width = 113
      Height = 16
      Caption = 'Mudar o Status para:'
    end
    object Label5: TLabel
      Left = 12
      Top = 49
      Width = 333
      Height = 16
      Caption = 'Duplo click no Grid para selecionar o N'#186' do Pedido'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -12
      Font.Name = 'Arial Unicode MS'
      Font.Style = [fsItalic]
      ParentFont = False
    end
    object edtNumPedido: TEdit
      Left = 77
      Top = 8
      Width = 121
      Height = 24
      ReadOnly = True
      TabOrder = 0
    end
    object cbStatus: TComboBox
      Left = 335
      Top = 8
      Width = 242
      Height = 24
      Style = csDropDownList
      TabOrder = 1
      Items.Strings = (
        'PENDENTE'
        'EM ANDAMENTO'
        'ENTREGUE')
    end
  end
  object cdsStatusPedido: TClientDataSet
    PersistDataPacket.Data = {
      8F0000009619E0BD0100000018000000050000000000030000008F00084E554D
      5F524F544104000100000000000A4E554D5F50454449444F0400010000000000
      0E434F445F454E5452454741444F5204000100000000000A454E545245474144
      4F52010049000000010005574944544802000200500006535441545553010049
      00000001000557494454480200020019000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 451
    Top = 196
    object cdsStatusPedidoSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 25
    end
    object cdsStatusPedidoNUM_PEDIDO: TIntegerField
      DisplayLabel = 'N'#186' PEDIDO'
      FieldName = 'NUM_PEDIDO'
    end
    object cdsStatusPedidoENTREGADOR: TStringField
      FieldName = 'ENTREGADOR'
      Size = 80
    end
    object cdsStatusPedidoCOD_ENTREGADOR: TIntegerField
      FieldName = 'COD_ENTREGADOR'
    end
    object cdsStatusPedidoNUM_ROTA: TIntegerField
      DisplayLabel = 'N'#186' ROTA'
      FieldName = 'NUM_ROTA'
    end
  end
  object DsStatusPedido: TDataSource
    DataSet = cdsStatusPedido
    Left = 411
    Top = 252
  end
end
