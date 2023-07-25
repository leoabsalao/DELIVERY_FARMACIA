inherited fProdutoCadastro: TfProdutoCadastro
  Caption = 'Cadastrando Produto'
  ClientHeight = 348
  ClientWidth = 634
  OnCreate = FormCreate
  ExplicitWidth = 646
  ExplicitHeight = 386
  TextHeight = 15
  inherited pnlTopoPrincipal: TPanel
    Width = 634
    Visible = False
    ExplicitWidth = 630
  end
  object Panel2: TPanel
    Left = 0
    Top = 60
    Width = 634
    Height = 38
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      634
      38)
    object btnSalvar: TButton
      Left = 371
      Top = 3
      Width = 86
      Height = 31
      Anchors = [akTop, akRight]
      Caption = 'Salvar'
      TabOrder = 0
      OnClick = btnSalvarClick
    end
    object btnFechar: TButton
      Left = 547
      Top = 3
      Width = 83
      Height = 31
      Anchors = [akTop, akRight]
      Caption = 'Sair'
      TabOrder = 1
      OnClick = btnFecharClick
    end
    object btnLimparCampos: TButton
      Left = 459
      Top = 3
      Width = 86
      Height = 31
      Anchors = [akTop, akRight]
      Caption = 'Limpar'
      TabOrder = 2
      OnClick = btnLimparCamposClick
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 98
    Width = 634
    Height = 250
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    ExplicitHeight = 319
    object Panel1: TPanel
      Left = 0
      Top = 0
      Width = 634
      Height = 250
      Align = alClient
      TabOrder = 0
      ExplicitLeft = 7
      ExplicitTop = 2
      ExplicitWidth = 621
      ExplicitHeight = 305
      DesignSize = (
        634
        250)
      object Label3: TLabel
        Left = 13
        Top = 35
        Width = 77
        Height = 15
        Caption = 'Tipo Produto:'
      end
      object Label4: TLabel
        Left = 27
        Top = 63
        Width = 65
        Height = 15
        Caption = 'Descri'#231#227'o:'
      end
      object Label5: TLabel
        Left = 32
        Top = 89
        Width = 56
        Height = 15
        Caption = 'N'#186' Refer.:'
      end
      object Label6: TLabel
        Left = 221
        Top = 89
        Width = 71
        Height = 15
        Caption = 'Quantidade:'
      end
      object Label7: TLabel
        Left = 422
        Top = 89
        Width = 83
        Height = 15
        Caption = 'Data Validade:'
      end
      object Label8: TLabel
        Left = 32
        Top = 126
        Width = 108
        Height = 15
        Caption = 'Prescri'#231#227'o M'#233'dica:'
      end
      object Label9: TLabel
        Left = 32
        Top = 181
        Width = 148
        Height = 15
        Caption = 'Cuidado Armazenamento:'
      end
      object Label10: TLabel
        Left = 522
        Top = 104
        Width = 72
        Height = 15
        Caption = 'aaaa/mm/dd'
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'Corbel'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object cbTipoProduto: TDBLookupComboBox
        Left = 96
        Top = 27
        Width = 215
        Height = 23
        KeyField = 'CODIGO'
        ListField = 'DESCRICAO'
        ListSource = DMConex.DsTipoProduto
        TabOrder = 0
        OnClick = cbTipoProdutoClick
      end
      object edtProduto: TEdit
        Left = 96
        Top = 55
        Width = 526
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        ExplicitWidth = 511
      end
      object edtNumRef: TEdit
        Left = 96
        Top = 81
        Width = 118
        Height = 24
        CharCase = ecUpperCase
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = '@Arial Unicode MS'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object edtQuantidade: TEdit
        Left = 297
        Top = 81
        Width = 118
        Height = 24
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = '@Arial Unicode MS'
        Font.Style = []
        NumbersOnly = True
        ParentFont = False
        TabOrder = 3
      end
      object edtDataValidade: TMaskEdit
        Left = 511
        Top = 81
        Width = 110
        Height = 24
        EditMask = '9999/99/99;1;_'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = '@Arial Unicode MS'
        Font.Style = []
        MaxLength = 10
        ParentFont = False
        TabOrder = 4
        Text = '    /  /  '
      end
      object rgTipoMedicamento: TRadioGroup
        Left = 319
        Top = 9
        Width = 302
        Height = 41
        Caption = 'Tipo Medicamento'
        Columns = 3
        DoubleBuffered = False
        Items.Strings = (
          'Comum  '
          'Controlado  '
          'Sens'#237'vel')
        ParentDoubleBuffered = False
        TabOrder = 5
        Visible = False
        OnClick = rgTipoMedicamentoClick
      end
      object edtPrescricaoMedica: TEdit
        Left = 32
        Top = 145
        Width = 589
        Height = 23
        TabOrder = 6
        Visible = False
      end
      object edtCuidadoArmaz: TEdit
        Left = 32
        Top = 199
        Width = 589
        Height = 23
        TabOrder = 7
        Visible = False
      end
    end
  end
end
