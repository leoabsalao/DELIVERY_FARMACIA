inherited fRotaPedidos: TfRotaPedidos
  Caption = 'Rota dos Pedidos'
  ClientHeight = 502
  ClientWidth = 604
  OnCreate = FormCreate
  ExplicitWidth = 616
  ExplicitHeight = 540
  TextHeight = 16
  inherited pnlTopoPrincipal: TPanel
    Width = 604
    ExplicitWidth = 600
    inherited Label1: TLabel
      Width = 385
      Caption = 'PEDIDOS PARA ENTREGA'
      ExplicitWidth = 385
    end
    inherited Label2: TLabel
      Width = 323
      Caption = 'Gerando as Rotas dos pedidos que sair'#227'o para entrega.'
      ExplicitWidth = 323
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 60
    Width = 604
    Height = 36
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitWidth = 600
    DesignSize = (
      604
      36)
    object btnSalvar: TButton
      Left = 403
      Top = 4
      Width = 104
      Height = 29
      Anchors = [akTop, akRight]
      Caption = 'Preparar Entrega'
      TabOrder = 0
      OnClick = btnSalvarClick
      ExplicitLeft = 399
    end
    object btnFechar: TButton
      Left = 508
      Top = 4
      Width = 83
      Height = 29
      Anchors = [akTop, akRight]
      Caption = 'Sair'
      TabOrder = 1
      OnClick = btnFecharClick
      ExplicitLeft = 504
    end
  end
  object Panel1: TPanel
    Left = 5
    Top = 99
    Width = 589
    Height = 399
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
    ExplicitWidth = 585
    ExplicitHeight = 398
    DesignSize = (
      589
      399)
    object Label3: TLabel
      Left = 11
      Top = 15
      Width = 45
      Height = 16
      Caption = 'N'#186' Rota:'
    end
    object Label4: TLabel
      Left = 192
      Top = 15
      Width = 64
      Height = 16
      Caption = 'Entregador:'
    end
    object Label5: TLabel
      Left = 9
      Top = 308
      Width = 187
      Height = 16
      Caption = 'Ordem de prioridade dos pedidos:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -12
      Font.Name = 'Arial Unicode MS'
      Font.Style = [fsItalic]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 11
      Top = 324
      Width = 174
      Height = 16
      Caption = '1) MEDICAMENTOS: Sens'#237'veis;'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -12
      Font.Name = 'Arial Unicode MS'
      Font.Style = [fsItalic]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 10
      Top = 341
      Width = 188
      Height = 16
      Caption = '2) MEDICAMENTOS: Controlados;'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -12
      Font.Name = 'Arial Unicode MS'
      Font.Style = [fsItalic]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 9
      Top = 359
      Width = 196
      Height = 16
      Caption = '3) PRODUTOS GERAIS: Perec'#237'veis;'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -12
      Font.Name = 'Arial Unicode MS'
      Font.Style = [fsItalic]
      ParentFont = False
    end
    object Label9: TLabel
      Left = 9
      Top = 376
      Width = 344
      Height = 16
      Caption = '4) DEMAIS PRODUTOS: Ordem crescente por data de entrada.'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -12
      Font.Name = 'Arial Unicode MS'
      Font.Style = [fsItalic]
      ParentFont = False
    end
    object edtNumRota: TEdit
      Left = 62
      Top = 7
      Width = 121
      Height = 24
      Color = clGray
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Arial Unicode MS'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object cbEntregador: TDBLookupComboBox
      Left = 261
      Top = 7
      Width = 324
      Height = 24
      KeyField = 'CODIGO'
      ListField = 'NOME'
      ListSource = DMConex.DsEntregador
      TabOrder = 1
    end
    object GroupBox1: TGroupBox
      Left = 7
      Top = 44
      Width = 574
      Height = 260
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Pedidos em situa'#231#227'o ABERTA - POR ORDEM DE PRIORIDADE'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial Rounded MT Bold'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      ExplicitWidth = 570
      object dbGridRotaPedidos: TDBGrid
        Left = 2
        Top = 16
        Width = 570
        Height = 242
        Align = alClient
        DataSource = DsPedido
        TabOrder = 0
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Arial Rounded MT Bold'
        TitleFont.Style = []
      end
    end
  end
  object cdsPedido: TClientDataSet
    PersistDataPacket.Data = {
      490000009619E0BD01000000180000000200000000000300000049000A4E554D
      5F50454449444F040001000000000007434C49454E5445010049000000010005
      57494454480200020014000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'NUM_PEDIDO'
        DataType = ftInteger
      end
      item
        Name = 'CLIENTE'
        DataType = ftString
        Size = 20
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 77
    Top = 227
    object cdsPedidoNUM_PEDIDO: TIntegerField
      Alignment = taCenter
      DisplayLabel = 'N'#186' PEDIDO'
      FieldName = 'NUM_PEDIDO'
    end
    object cdsPedidoCLIENTE: TStringField
      Alignment = taCenter
      DisplayWidth = 60
      FieldName = 'CLIENTE'
    end
  end
  object DsPedido: TDataSource
    DataSet = cdsPedido
    Left = 149
    Top = 243
  end
end
